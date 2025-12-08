import 'dart:io';
import 'package:aparna_pod/core/cubit/base/base_cubit.dart';
import 'package:aparna_pod/core/model/failure.dart';
import 'package:aparna_pod/core/model/pair.dart';
import 'package:aparna_pod/core/utils/typedefs.dart';
import 'package:aparna_pod/features/gate_entry/data/gate_entry_repo.dart';
import 'package:aparna_pod/features/gate_entry/model/pod_upload_form.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'gate_entry_cubit.freezed.dart';

enum GateEntryView { create, edit, completed }

extension ActionType on GateEntryView {
  String toName() {
    return switch (this) {
      GateEntryView.create => 'Create',
      GateEntryView.edit => 'Submit',
      GateEntryView.completed => 'Submitted',
    };
  }
}

@injectable
class CreateGateEntryCubit extends AppBaseCubit<CreateGateEntryState> {
  CreateGateEntryCubit(this.repo) : super(CreateGateEntryState.initial());
  final GateEntryRepo repo;

  void onValueChanged({
    List<File>? invoiceFiles,
    String? plantCode,
    String? invoiceNo,
    String? sapNo,
    String? invoiceDate,
    String? deliveryChallanNo,
    String? creation,
    int? docStatus,
    String? remarks,
  }) async {
    final form = state.form;

    print('invoiceNo ....:$invoiceNo');

    final newForm = form.copyWith(
      plantCode: plantCode ?? form.plantCode,
      invoiceNo: invoiceNo ?? form.invoiceNo, 
      sapNo: sapNo ?? form.sapNo,
      invoiceDate: invoiceDate ?? form.invoiceDate,
      deliveryChallanNo: deliveryChallanNo ?? form.deliveryChallanNo,

      creation: creation ?? form.creation,
      docStatus: docStatus ?? form.docStatus,
      remarks: remarks ?? form.remarks,

      // ✅ Replace the entire list
      invoiceFiles: invoiceFiles ?? form.invoiceFiles,
    );

    print('newForm.invoiceNo ....:${newForm.invoiceNo}');

    emitSafeState(state.copyWith(form: newForm));
  }

  // void onValueChanged({
  //   String? plantCode,
  //   String? invoiceNo,
  //   String? invoiceDate,
  //   String? filename,
  //   String? sapNo,

  //   List<File>? invoiceFiles,
  // }) async {
  //   shouldAskForConfirmation.value = true;
  //   final form = state.form;

  //   final newInvoiceFiles = List<File>.from(form.invoiceFiles ?? []);

  //   if (invoiceFiles != null && invoiceFiles.isNotEmpty) {
  //     newInvoiceFiles.addAll(invoiceFiles);
  //   }

  //   final newForm = form.copyWith(
  //     plantCode: plantCode ?? form.plantCode,
  //     invoiceNo: invoiceNo ?? form.invoiceNo,
  //     sapNo: sapNo ?? form.sapNo,
  //     invoiceDate: invoiceDate ?? form.invoiceDate,
  //     invoiceFiles: newInvoiceFiles,
  //   );

  //   emitSafeState(state.copyWith(form: newForm));
  // }

  void initDetails(Object? entry) {
    shouldAskForConfirmation.value = false;

    // New entry: keep initial state (create mode, isNew = true)
    if (entry == null) {
      emitSafeState(CreateGateEntryState.initial());
      return;
    }

    if (entry is PodUploadForm) {
      final updatedForm = state.form.copyWith(
        plantCode: entry.plantCode,
        sapNo: entry.sapNo,
        invoiceNo: entry.invoiceNo,
        invoiceDate: entry.invoiceDate,
        docStatus: entry.docStatus,
        deliveryChallanNo: entry.deliveryChallanNo,
        creation: entry.creation,
        remarks: entry.remarks,
        invoiceFiles: entry.invoiceFiles,
      );

      // For an existing entry, mark as not new and switch view to edit/completed
      final nextView = (entry.docStatus ?? 0) == 0
          ? GateEntryView.edit
          : GateEntryView.completed;

      emitSafeState(
        state.copyWith(
          form: updatedForm,
          isNew: false,
          view: nextView,
        ),
      );
    }
  }

  void save() async {
    final validation = _validate();
    return validation.fold(() async {
      emitSafeState(state.copyWith(isLoading: true, isSuccess: false));
      final nextMode = switch (state.view) {
        GateEntryView.create => GateEntryView.edit,
        GateEntryView.edit ||
        GateEntryView.completed =>
          GateEntryView.completed,
      };

      if (state.view == GateEntryView.create) {
        final response = await repo.createGateEntry(state.form);

        return response.fold(
          (l) => emitSafeState(
            state.copyWith(isLoading: false, error: l, isSuccess: false),
          ),
          (r) {
            shouldAskForConfirmation.value = false;
            final docstatus = r.second;
            emitSafeState(
              state.copyWith(
                isLoading: false,
                isSuccess: true,
                isNew: false,
                form: state.form.copyWith(name: docstatus),
                successMsg: r.first,
                view: nextMode,
              ),
            );
          },
        );
      }
    }, _emitError);
  }

  void _emitError(Pair<String, int?> error) {
    emitSafeState(state.copyWith(
      error: Failure(
          error: error.first, title: 'Missing Fields', status: error.second),
      isLoading: false,
    ));
  }

  void errorHandled() {
    emitSafeState(
      state.copyWith(
        error: null,
        isLoading: false,
        isSuccess: false,
        successMsg: null,
      ),
    );
  }

Option<Pair<String, int?>> _validate() {
  final form = state.form;


  if (form.invoiceFiles == null || form.invoiceFiles!.isEmpty) {
    return const Some(Pair('Please upload at least one document image', 0));
  }


  final isDeliveryChallan = form.deliveryChallanNo != null &&
                            form.deliveryChallanNo!.isNotEmpty;

  if (isDeliveryChallan) {

    if (form.deliveryChallanNo == null || form.deliveryChallanNo!.isEmpty) {
      return const Some(Pair('Delivery Challan No is required', 6));
    }

    if (form.invoiceDate == null || form.invoiceDate!.isEmpty) {
      return const Some(Pair('Invoice Date is required', 8));
    }

    if (form.plantCode == null || form.plantCode!.isEmpty) {
      return const Some(Pair('Plant Code is required', 6));
    }


    return const None();
  }

 
  if (form.invoiceNo == null || form.invoiceNo!.isEmpty) {
    return const Some(Pair('Invoice No is required', 7));
  }

  if (form.invoiceDate == null || form.invoiceDate!.isEmpty) {
    return const Some(Pair('Invoice Date is required', 8));
  }

  if (form.sapNo == null || form.sapNo!.isEmpty) {
    return const Some(Pair('SAP No is required', 8));
  }

  if (form.plantCode == null || form.plantCode!.isEmpty) {
    return const Some(Pair('Plant Code is required', 6));
  }

  // All Invoice validations pass
  return const None();
}

}

@freezed
class CreateGateEntryState with _$CreateGateEntryState {
  const factory CreateGateEntryState({
    required PodUploadForm form,
    required bool isLoading,
    required bool isSuccess,
    required GateEntryView view,
    String? successMsg,
    @Default(true) bool isNew,
    Failure? error,
  }) = _CreateGateEntryState;

  factory CreateGateEntryState.initial() {
    return const CreateGateEntryState(
      form: PodUploadForm(),
      view: GateEntryView.create,
      isLoading: false,
      isNew: true,
      isSuccess: false,
    );
  }
}
