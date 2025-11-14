import 'dart:io';

import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/outward_gate_pass/data/outward_repo.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/items_form.dart';
import 'package:aparna_pod/features/outward_gate_pass/model/outward_form.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_outward_cubit.freezed.dart';

enum ActionType { edit, submit, completed }

extension ActionTypeApi on ActionType {
  String toName() {
    return switch (this) {
      ActionType.edit => 'Create',
      ActionType.completed || ActionType.submit => 'Submit',
    };
  }
}

@injectable
class CreateOutwardCubit extends AppBaseCubit<CreateOutwardState> {
  CreateOutwardCubit(this.repo) : super(CreateOutwardState.initial());
  final OutwardRepo repo;

  void init(Object? extra) {
    shouldAskForConfirmation.value = false;
    if (extra is OutwardForm) {
      final parsedDate =
          DFU.toDateTime(extra.gatePassDate.valueOrEmpty, 'yyyy-MM-dd');
      final formattedStr = DFU.friendlyFormat(parsedDate);
      final status = StringUtils.docStatus(extra.docstatus!);

      final type = switch (status) {
        'Draft' => ActionType.submit,
        'Submitted' => ActionType.completed,
        String() => ActionType.edit,
      };

      emitSafeState(state.copyWith(
        type: type,
        form: extra.copyWith(
          gatePassDate: formattedStr,
        ),
      ));
    }
  }

  void onFieldValueChanged({
    String? plantName,
    String? gatePassDate,
    String? gatePassType,
    String? gatePassTime,
    String? authorisedBy,
    String? vehicleType,
    String? vehicleNumber,
    String? driverMobileNumber,
    String? remarks,
    String? outwardNo,
    String? outwardDate,
    int? ismanualvendor,
    String? vendorcustomer,
    String? vendorRecords,
    String? vendorCustomerManual,
    String? vendorAddress,
    File? gatePassPhoto,
    List<ItemsForm>? items,
  }) {
    shouldAskForConfirmation.value = true;
    final form = state.form;
    final outwardPhoto = gatePassPhoto ?? form.gatePassImg;

    final newForm = form.copyWith(
      gatePassImg: outwardPhoto,
      vehicleNumber: vehicleNumber ?? form.vehicleNumber,
      driverMobileNumber: driverMobileNumber ?? form.driverMobileNumber,
      gatePassDate: gatePassDate ?? form.gatePassDate,
      gatePassType: gatePassType ?? form.gatePassType,
      vehicleType: vehicleType ?? form.vehicleType,
      plantName: plantName ?? form.plantName,
      remarks: remarks ?? form.remarks,
      authorisedBy: authorisedBy ?? form.authorisedBy,
      gatePassTime: gatePassTime ?? form.gatePassTime,
      outwardDate: outwardDate ?? form.outwardDate,
      ismanualvendor: ismanualvendor ?? form.ismanualvendor,
      outwardNo: outwardNo ?? form.outwardNo,
      vendorcustomer: vendorcustomer ?? form.vendorcustomer,
      vendorAddress: vendorAddress ?? form.vendorAddress,
      vendorCustomerManual: vendorCustomerManual ?? form.vendorCustomerManual,
      vendorRecords: vendorRecords ?? form.vendorRecords,
      items: items ?? form.items,
    );
    emitSafeState(state.copyWith(
      form: newForm,
      lines: items ?? form.items,
      error: null,
    ));
  }

  void addLineItem({
    required String value,
    required String itemCode,
    required String expiryDate,
    required String qty,
    required String uom,
    required bool isManualItem,
    required String manualItemName,
    required String manualItemCode,
    required String? itemName,
  }) {
    shouldAskForConfirmation.value = true;
    final item = ItemsForm(
      manualItemName: manualItemName,
      expiryDate: expiryDate,
      manualItemCode: manualItemCode,
      itemCode: itemCode,
      itemName: itemName,
      quantity: double.tryParse(qty),
      uom: uom,
      isManualItem: isManualItem ? 1 : 0,
      value: double.tryParse(value),
    );
    final prevLines = [...state.lines];
    prevLines.add(item);

    emitSafeState(state.copyWith(lines: prevLines));
  }

  void addAllLines(List<ItemsForm> lines) {
    emitSafeState(state.copyWith(lines: lines));
  }

  void removeLineAt(int index) {
    if (index < 0 || index >= state.lines.length) {
      return;
    }

    final updatedLines = [...state.lines];

    final removedItem = updatedLines.removeAt(index);

    final updatedDeletedLines = [
      ...state.form.deletedLines,
      if (removedItem.name != null) removedItem.name!,
    ];

    final updatedForm = state.form.copyWith(
      deletedLines: updatedDeletedLines,
    );

    emitSafeState(
      state.copyWith(
        lines: updatedLines,
        form: updatedForm,
      ),
    );
  }

  void processOutwardGatePass() {
    try {
      if (state.type == ActionType.edit) {
        return _createOutwardGatePass();
      } else if (state.type == ActionType.submit) {
        return _submitOutward();
      }
    } on Exception catch (e, st) {
      $logger.error('[NewOutwardCubit]', e, st);

      emitSafeState(state.copyWith(error: Failure(error: e.toString())));
    }
  }

  void _createOutwardGatePass() async {
    final validation = _validate();

    if (validation.isSome()) {
      final msg = validation.getOrElse(() => throw Exception());
      return _emitError(msg);
    }

    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.createOutwardGatePass(state.form, state.lines);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        shouldAskForConfirmation.value = false;
        final docNo = r;
        const message = 'Outward Gate Pass Created Successfully.';
        return emitSafeState(state.copyWith(
            form: state.form.copyWith(
              name: docNo,
              docstatus: 0,
              deletedLines: [],
            ),
            isLoading: false,
            type: ActionType.submit,
            isSuccess: true,
            successMsg: message));
      },
    );
  }

  void _submitOutward() async {
    // if(state.form.items.isEmpty){
    //    _emitError(const Pair(
    //       'Add Atleast One Outward Gate Pass item to Proceed Further', null));
    //    return ;
    //   }
    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.submitOutwardGatePass(state.form, state.lines);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        shouldAskForConfirmation.value = false;
        final form = state.form.copyWith(
          docstatus: 1,
          deletedLines: [],
        );
        final updatedState = state.copyWith(
            isSuccess: true,
            successMsg: 'Outward Gate Pass Submitted Succesfully',
            isLoading: false,
            form: form,
            type: ActionType.completed);
        $logger.info("UPDATEDSTATE:$updatedState");
        return emitSafeState(updatedState);
      },
    );
  }

  void _emitError(Pair<String, int?> error) {
    final failure = Failure(
        error: error.first, title: 'Missing Fields', status: error.second);
    emitSafeState(state.copyWith(error: failure, isLoading: false));
  }

  void handled() => emitSafeState(
      state.copyWith(error: null, isSuccess: false, successMsg: null));
  Option<Pair<String, int?>> _validate() {

    final form = state.form;
    if (form.plantName.doesNotHaveValue) {
      return optionOf(const Pair('Select Plant Name', 0));
    } else if (form.gatePassType.doesNotHaveValue) {
      return optionOf(const Pair('Select Gate Pass Type', 1));
    } else if (form.gatePassDate.doesNotHaveValue) {
      return optionOf(const Pair('Select Gate Pass Date', 2));
    } else if (form.authorisedBy.doesNotHaveValue) {
      return optionOf(const Pair('Enter Authorised By', 4));
    } else if (form.vehicleType.doesNotHaveValue) {
      return optionOf(const Pair('Enter Vehicle Type.', 5));
    } else if (form.vehicleNumber.doesNotHaveValue &&
        form.vehicleType != 'By Hand') {
      return optionOf(const Pair('Enter Vehicle Number.', 6));
    } else if (form.driverMobileNumber.doesNotHaveValue &&
        form.vehicleType != 'By Hand') {
      return optionOf(const Pair('Enter Driver Mobile Number.', 7));
    } else if (form.outwardNo.doesNotHaveValue) {
      return optionOf(const Pair('Enter Outward Number', 8));
    } else if (form.gatePassType != 'Gatepass Non-Returnable' && form.outwardDate.doesNotHaveValue) {
      return optionOf(const Pair('Select Outward Date', 9));
    } else if (form.vendorCustomerManual.doesNotHaveValue &&
        form.ismanualvendor == 1) {
      return optionOf(const Pair('Enter Vendor/Customer Manual', 10));
    } else if (form.vendorAddress.doesNotHaveValue &&
        form.ismanualvendor == 1) {
      return optionOf(const Pair('Enter Vendor Address', 11));
    } else if (form.vendorcustomer.doesNotHaveValue &&
        form.ismanualvendor != 1) {
      return optionOf(const Pair('Select Vendor/Customer', 12));
    } else if (form.vendorRecords.doesNotHaveValue &&
        form.vendorcustomer == 'Supplier') {
      return optionOf(const Pair('Select Supplier Records', 13));
    } else if (form.vendorRecords.doesNotHaveValue &&
        form.vendorcustomer == 'Customer') {
      return optionOf(const Pair('Select Customer Records', 14));
    }
    // else if (form.gatePassImg == null) {
    //   return optionOf(const Pair('Capture Gate Pass Image', 15));
    // }
    else if (form.items.isEmpty) {
      return optionOf(const Pair(
          'Add Atleast One Outward Gate Pass item to Proceed Further', null));
    }

    return const None();
  }
}

@freezed
class CreateOutwardState with _$CreateOutwardState {
  const factory CreateOutwardState({
    required OutwardForm form,
    required bool isLoading,
    required bool isSuccess,
    required ActionType type,
    String? successMsg,
    Failure? error,
    required List<ItemsForm> lines,
  }) = _CreateOutwardState;

  factory CreateOutwardState.initial() {
    final exitDate = DFU.friendlyFormat(DFU.now());
    final createdtime = DFU.hhMMss(DFU.now());
    return CreateOutwardState(
      lines: [],
      form: OutwardForm(
          gatePassDate: exitDate,
          outwardDate: exitDate,
          gatePassTime: createdtime,
          items: [],
          itemLines: []),
      isLoading: false,
      isSuccess: false,
      type: ActionType.edit,
    );
  }
}
