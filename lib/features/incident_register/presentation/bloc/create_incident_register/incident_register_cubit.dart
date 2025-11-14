import 'dart:io';

import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/incident_register/data/incident_register_repo.dart';
import 'package:aparna_pod/features/incident_register/model/incident_register_form.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'incident_register_cubit.freezed.dart';

enum IncidentRegisterView { create, edit, completed }

extension ActionType on IncidentRegisterView {
  String toName() {
    return switch (this) {
      IncidentRegisterView.create => 'Create',
      IncidentRegisterView.edit => 'Submit',
      IncidentRegisterView.completed => 'Submitted',
    };
  }
}

@injectable
class CreateIncidentRegisterCubit
    extends AppBaseCubit<CreateIncidentRegisterState> {
  CreateIncidentRegisterCubit(this.repo)
      : super(CreateIncidentRegisterState.initial());
  final IncidentRegistersRepo repo;

  void onValueChanged({
    String? date,
    String? time,
    String? incIvestigator,
    String? incPlantName,
    String? incidentType,
    String? aelAssInvolve,
    String? aelAssetInvolve,
    int? amount,
    String? firComplaint,
    String? employeeEmail,
    String? partyDetails,
    String? descr1,
    String? descr2,
    String? descr3,
    File? incPhoto,
    String? remarks,
  }) {
    shouldAskForConfirmation.value = true;
    final form = state.form;
    final incidentPhoto = incPhoto ?? form.incPhotoImg;

    final newForm = form.copyWith(
      amount: amount ?? form.amount,
      assetsInvolve: aelAssetInvolve ?? form.assetsInvolve,
      associatedInvol: aelAssInvolve ?? form.associatedInvol,
      complaint: firComplaint ?? form.complaint,
      date: date ?? form.date,
      desc1: descr1 ?? form.desc1,
      desc2: descr2 ?? form.desc2,
      desc3: descr3 ?? form.desc3,
      docStatus: form.docStatus,
      incPhotoImg: incidentPhoto,
      time: time ?? form.time,
      remarks: remarks ?? form.remarks,
      employeeEmail: employeeEmail ?? form.employeeEmail,
      incidentInvestigator: incIvestigator ?? form.incidentInvestigator,
      incidentPlantName: incPlantName ?? form.incidentPlantName,
      incidentType: incidentType ?? form.incidentType,
      otherPartyDetails: partyDetails ?? form.otherPartyDetails,
    );
    emitSafeState(state.copyWith(form: newForm));
  }

  void initDetails(Object? entry) {
    shouldAskForConfirmation.value = false;
    if (entry is IncidentRegisterForm) {
      final parsedDate = DFU.toDateTime(entry.date.valueOrEmpty, 'yyyy-MM-dd');
      final formattedStr = DFU.friendlyFormat(parsedDate);

      final status = entry.docStatus;

      final isSubmitted = StringUtils.equalsIgnoreCase(
          StringUtils.docStatus(status!), 'Submitted');
      final isCancelled = StringUtils.equalsIgnoreCase(
          StringUtils.docStatus(status).trim(), 'Cancelled');
      final mode = (isSubmitted || isCancelled)
          ? IncidentRegisterView.completed
          : IncidentRegisterView.edit;
      emitSafeState(state.copyWith(
        form: entry.copyWith(date: formattedStr),
        view: mode,
      ));
    }
    if (entry == null) return;
  }

  void save() async {
    final validation = _validate();
    return validation.fold(
      () async {
        emitSafeState(state.copyWith(isLoading: true, isSuccess: false));
        final nextMode = switch (state.view) {
          IncidentRegisterView.create => IncidentRegisterView.edit,
          IncidentRegisterView.edit ||
          IncidentRegisterView.completed => IncidentRegisterView.completed,
        };

        if (state.view == IncidentRegisterView.create) {
          final response = await repo.createIncentRegister(state.form);

          return response.fold(
            (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
            (r) {
              shouldAskForConfirmation.value = false;
              final docNo = r.second;
              emitSafeState(state.copyWith(
                isLoading: false,
                isSuccess: true,
                form: state.form.copyWith(name: docNo,docStatus: 0),
                successMsg: r.first,
                view: nextMode,
              ));
            },
          );
        } else {
          final response =
              await repo.submitIncidentRegister(state.form.name ?? '');

          return response.fold(
            (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
            (r) {
              shouldAskForConfirmation.value = false;
              emitSafeState(state.copyWith(
                isLoading: false,
                isSuccess: true,
                form: state.form.copyWith(docStatus: 1),
                successMsg: r,
                view: IncidentRegisterView.completed,
              ));
            },
          );
        }
      },
      _emitError,
    );
  }

  void _emitError(Pair<String,int?> error) {
    final failure = Failure(error: error.first, title: 'Missing Fields',status: error.second);
    emitSafeState(state.copyWith(error: failure, isLoading: false));
  }

  void errorHandled() {
    emitSafeState(state.copyWith(error: null, isLoading: false,isSuccess: false,successMsg: null));
  }

  Option<Pair<String, int?>> _validate() {
    final form = state.form;

    if (form.incidentInvestigator.doesNotHaveValue) {
      return optionOf(const Pair('Enter Incident Invesigator',2));
    } else if (form.incidentPlantName.doesNotHaveValue) {
      return optionOf(const Pair('Select Incident PlantName',3));
    } else if (form.incidentType.isNull) {
      return optionOf(const Pair('Select Type of Incident',4));
    } else if (form.associatedInvol.isNull) {
      return optionOf(const Pair('Select AEL Associated Involved',5));
    } else if (form.assetsInvolve.isNull) {
      return optionOf(const Pair('Select AEL Assets Involved',6));
    } else if (form.amount.isNull) {
      return optionOf(const Pair('Enter Amount.',7));
    } else if (form.complaint.isNull) {
      return optionOf(const Pair('Select FIR - Complaint',8));
    } else if (form.employeeEmail.isNull) {
      return optionOf(const Pair('Enter Notify Employee Email',9));
    } else if (form.incPhotoImg == null && form.photo == null) {
      return optionOf(const Pair('Attach Photographs of Incident',10));
    } 
    // else if (form.remarks.isNull) {
    //   return optionOf('Enter Remarks');
    // }
     else if (form.otherPartyDetails.isNull) {
      return optionOf(const Pair('Enter Details Of Other Party',11));
    } 
    // else if (form.desc1.isNull) {
    //   return optionOf('Enter Incident Description 1');
    // }
     else if (form.desc2.isNull) {
      return optionOf(const Pair('Enter Incident Description',12));
    } else if (form.desc3.isNull) {
      return optionOf(const Pair('Enter Action taken/Recommendation',13));
    }

    return const None();
  }
}

@freezed
class CreateIncidentRegisterState with _$CreateIncidentRegisterState {
  const factory CreateIncidentRegisterState({
    required IncidentRegisterForm form,
    required bool isLoading,
    required bool isSuccess,
    required IncidentRegisterView view,
    String? successMsg,
    Failure? error,
  }) = _CreateIncidentRegisterState;

  factory CreateIncidentRegisterState.initial() {
    final creationDate = DFU.friendlyFormat(DFU.now());
    final createdtime = DFU.hhMMss(DFU.now());

    return CreateIncidentRegisterState(
      form: IncidentRegisterForm(date: creationDate, time: createdtime),
      view: IncidentRegisterView.create,
      isLoading: false,
      isSuccess: false,
    );
  }
}
