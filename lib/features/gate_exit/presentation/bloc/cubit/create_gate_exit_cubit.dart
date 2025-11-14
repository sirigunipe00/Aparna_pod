import 'dart:io';

import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/gate_entry/model/gate_entry_lines_form.dart';
import 'package:aparna_pod/features/gate_exit/data/gate_exit_repo.dart';
import 'package:aparna_pod/features/gate_exit/model/gate_exit_form.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_gate_exit_cubit.freezed.dart';

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
class CreateGateExitCubit extends AppBaseCubit<CreateGateExitState> {
  CreateGateExitCubit(this.repo) : super(CreateGateExitState.initial());
  final GateExitRepo repo;

  void init(Object? extra) {
    shouldAskForConfirmation.value = false;
    if (extra is GateExitForm) {
      final parsedDate =
          DFU.toDateTime(extra.exitDate.valueOrEmpty, 'yyyy-MM-dd');
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
          exitDate: formattedStr,
        ),
      ));
    }
  }

  void onFieldValueChanged({
    String? plantName,
    String? exitdate,
    String? gateExitType,
    String? senderEmployeeName,
    String? senderEmail,
    String? senderEmpId,
    String? senderMblNo,
    String? gstin,
    String? customerReceiverName,
    String? customerReceiverAddress,
    String? poNumber,
    String? vehicleType,
    int? isEwayBill,
    String? challanNumber,
    String? vehicleNo,
    String? driverName,
    String? driverMobileNo,
    int? peopleCount,
    String? slipTokenNO,
    String? weighmentDate,
    double? weight,
    String? weighmentTime,
    String? ewayBill,
    File? licensePhoto,
    File? sealPhoto,
    File? vehiclePhoto,
    File? breathAnalyser,
    File? invoice,
    String? remarks,
    String? expectedReturnDate,
    double? totalAmount,
    String? exitTime,
  }) {
    shouldAskForConfirmation.value = true;
    final form = state.form;
    final vechPhoto = vehiclePhoto ?? form.vehiclePhotoImg;
    final drLicensePhoto = licensePhoto ?? form.licensePhotoImg;
    final sealPhoto1 = sealPhoto ?? form.sealPhotoImg;
    final breathAnalyser1 = breathAnalyser ?? form.breathAnalyserImg;
    final invoice1 = [...form.invoiceImg, invoice].nonNulls;

    final newForm = form.copyWith(
      poNumber: poNumber ?? form.poNumber,
      vehiclePhotoImg: vechPhoto,
      vehicleNumber: vehicleNo ?? form.vehicleNumber,
      driverName: driverName ?? form.driverName,
      driverMobileNumber: driverMobileNo ?? form.driverMobileNumber,
      customerReceiverName: customerReceiverName ?? form.customerReceiverName,
      exitDate: exitdate ?? form.exitDate,
      exitType: gateExitType ?? form.exitType,
      senderEmployeeName: senderEmployeeName ?? form.senderEmployeeName,
      senderEmail: senderEmail ?? form.senderEmail,
      senderEmployeeId: senderEmpId ?? form.senderEmployeeId,
      senderMobileNo: senderMblNo ?? form.senderMobileNo,
      gstin: gstin ?? form.gstin,
      customerReceiverAddress:
          customerReceiverAddress ?? form.customerReceiverAddress,
      peopleCount: peopleCount ?? form.peopleCount,
      vehicleType: vehicleType ?? form.vehicleType,
      challanNumber: challanNumber ?? form.challanNumber,
      isewayBill: isEwayBill ?? form.isewayBill,
      ewayBill: ewayBill ?? form.ewayBill,
      weightSlipNo: slipTokenNO ?? form.weightSlipNo,
      weighmentDate: weighmentDate ?? form.weighmentDate,
      plantName: plantName ?? form.plantName,
      weighmentTime: weighmentTime ?? form.weighmentTime,
      remarks: remarks ?? form.remarks,
      weight: weight ?? form.weight,
      breathAnalyserImg: breathAnalyser1,
      invoiceImg: invoice1.toList(),
      licensePhotoImg: drLicensePhoto,
      sealPhotoImg: sealPhoto1,
      expectedReturnDate: expectedReturnDate ?? form.expectedReturnDate,
      totalAmount: totalAmount ?? form.totalAmount,
      exitTime: exitTime ?? form.exitTime,
    );
    emitSafeState(state.copyWith(
      form: newForm,
      error: null,
    ));
  }

  void addLineItem({
    required String name,
    required String code,
    required String asset,
    required String qty,
    required String uom,
    // required bool isreturn,
    required String amt,
    String? description,
  }) {
    shouldAskForConfirmation.value = true;
    final item = GateEntryLinesForm(
      serialNumber: code,
      assetNumber: int.tryParse(asset),
      materialName: name,
      quantity: double.tryParse(qty),
      oums: uom,
      // isreturn: isreturn ? 1 : 0,
      amount: double.tryParse(amt),
    );
    final prevLines = [...state.lines];
    prevLines.add(item);
    //  final ttlAmt = (state.form.totalAmount ?? 0.0) + (item.amount ?? 0.0);
    // final updForm = state.form.copyWith(totalAmount: ttlAmt);
    emitSafeState(state.copyWith(lines: prevLines));
  }

  void addAllLines(List<GateEntryLinesForm> lines) {
    emitSafeState(state.copyWith(lines: lines));
  }
  void removeFile(int indx) {
    final invs = [...state.form.invoiceImg];
    invs.removeAt(indx);
    final form = state.form.copyWith(invoiceImg: invs);
    emitSafeState(state.copyWith(form: form));
  }

  void addInvUrls(List<String> urls) {
    final form = state.form.copyWith(addInvs: urls);
    emitSafeState(state.copyWith(form: form));
  }
   void removeLineAt(int index) {
    final lines = [...state.lines];
    final lineItem =  lines.elementAt(index);
    lines.removeAt(index);
    final deletedLines = [...state.form.deletedLines,lineItem.name].nonNulls;
    final totalAmt =  lines.fold(0.0, (previousValue, element) => previousValue+( element.amount ?? 0) );
    final form = state.form.copyWith(totalAmount:totalAmt ,deletedLines:deletedLines.toList());

    emit(state.copyWith(lines: lines, form:form ));
  }

  void processGateExit() {
    try {
      if (state.type == ActionType.edit) {
        return _createGateExit();
      } else if (state.type == ActionType.submit) {
        return _submitGateExit();
      }
    } on Exception catch (e, st) {
      $logger.error('[NewGateExitCubit]', e, st);

      emitSafeState(state.copyWith(error: Failure(error: e.toString())));
    }
  }

  void _createGateExit() async {
    final validation = _validate();

    if (validation.isSome()) {
      final msg = validation.getOrElse(() => throw Exception());
      return _emitError(msg);
    }

    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.createGateExit(state.form, state.lines);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        shouldAskForConfirmation.value = false;
        final docNo = r;
        const message = 'Gate Exit Created Successfully.';
        return emitSafeState(state.copyWith(
            form: state.form.copyWith(
              name: docNo, docstatus: 0,
              deletedLines: []),
            isLoading: false,
            type: ActionType.submit,
            isSuccess: true,
            successMsg: message));
      },
    );
  }

  void _submitGateExit() async {
    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.submitGateExit(state.form, state.lines);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        shouldAskForConfirmation.value = false;
        final form = state.form.copyWith(docstatus: 1,
        deletedLines: []);
        final updatedState = state.copyWith(
            isSuccess: true,
            successMsg: 'Gate Exit Submitted Succesfully',
            isLoading: false,
            form: form,
            type: ActionType.completed);
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
    } else if (form.exitType.doesNotHaveValue) {
      return optionOf(const Pair('Select Exit Type', 1));
    } else if (form.expectedReturnDate.doesNotHaveValue &&
        form.exitType == 'Gatepass Returnable') {
      return optionOf(const Pair('Select Expected Return Date', 27));
    }

    // else if (form.senderEmployeeName.doesNotHaveValue) {
    //   return optionOf(const Pair('Enter Sender Employee Name', 3));
    // }
    // else if (form.gstin.doesNotHaveValue) {
    //   return optionOf(const Pair('Enter GSTIN Number', 7));
    // }
    //  else if (!isValidGST(form.gstin!)) {
    //   return optionOf(const Pair(
    //       'Invalid GST Number. The entered GST number must be in the format: StateCode-PAN-AlphanumericDigit-Z-AlphanumericDigit.',
    //       12));
    // }
    // else if (form.poNumber.doesNotHaveValue) {
    //   return optionOf(const Pair('Enter PO Number.', 10));
    // }
     else if (form.vehicleType.doesNotHaveValue) {
      return optionOf(const Pair('Enter Vehicle Type.', 11));
    }
    if (form.isewayBill == 1) {
      if (form.ewayBill.doesNotHaveValue) {
        return optionOf(const Pair('Enter Eway Number', 12));
      }
    }
    if (form.vehicleNumber.doesNotHaveValue && form.vehicleType != 'By Hand') {
      return optionOf(const Pair('Enter Vehicle Number.', 13));
    } else if (form.driverName.doesNotHaveValue &&
        form.vehicleType != 'By Hand') {
      return optionOf(const Pair('Enter Driver Name.', 15));
    } else if (form.driverMobileNumber.doesNotHaveValue &&
        form.vehicleType != 'By Hand') {
      return optionOf(const Pair('Enter Driver Mobile Number.', 16));
    }
    else if (form.totalAmount.isNull ) {
      return optionOf(const Pair('Enter Total Amount', null));
    }
    // else if (form.weight == null && form.vehicleType != 'By Hand') {
    //   return optionOf(const Pair('Enter Weight in Kgs.', 19));
    // }
    // else if (form.weighmentDate.doesNotHaveValue && form.vehicleType != 'By Hand') {
    //   return optionOf(const Pair('Enter Weighment Date.', 20));
    // }
    //  else if (form.weighmentTime.doesNotHaveValue && form.vehicleType != 'By Hand') {
    //   return optionOf(const Pair('Enter Weighment Time.', 21));
    // }
    else if (form.sealPhotoImg == null && form.vehicleType != 'By Hand') {
      return optionOf(const Pair('Capture Seal Photo.', 23));
    } else if (form.vehiclePhotoImg == null && form.vehicleType != 'By Hand') {
      return optionOf(const Pair('Capture Vehicle Photo.', 24));
    } else if (form.breathAnalyserImg == null &&
        form.vehicleType != 'By Hand') {
      return optionOf(const Pair('Capture Breath Analyser Photo.', 25));
    } else if (form.invoiceImg.isEmpty) {
      return optionOf(const Pair('Capture Invoice Photo.', 26));
    }
    // else if (state.lines.isEmpty) {
    //   return optionOf(const Pair(
    //       'Add Atleast One GateExit Lineitem to Proceed Further', null));
    // }

    return const None();
  }

  // bool isValidGST(String gstNumber) {
  //   final RegExp gstRegex =
  //       RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$');
  //   return gstRegex.hasMatch(gstNumber);
  // }
}

@freezed
class CreateGateExitState with _$CreateGateExitState {
  const factory CreateGateExitState({
    required GateExitForm form,
    required bool isLoading,
    required bool isSuccess,
    required ActionType type,
    String? successMsg,
    Failure? error,
    required List<GateEntryLinesForm> lines,
  }) = _CreateGateExitState;

  factory CreateGateExitState.initial() {
    final exitDate = DFU.friendlyFormat(DFU.now());
    final createdtime = DFU.hhMMss(DFU.now());
    return CreateGateExitState(
      lines: [],
      form: GateExitForm(
        exitDate: exitDate,
        weighmentDate: exitDate,
        weighmentTime: createdtime,
        exitTime: createdtime,
        isewayBill: 1,
      ),
      isLoading: false,
      isSuccess: false,
      type: ActionType.edit,
    );
  }
}
