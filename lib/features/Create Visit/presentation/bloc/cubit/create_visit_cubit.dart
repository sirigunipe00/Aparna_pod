import 'dart:io';
import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/Create%20Visit/data/create_visit_repo.dart';
import 'package:aparna_pod/features/Create%20Visit/model/create_visit_form.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_visit_cubit.freezed.dart';

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
class CreateVisitCubit extends AppBaseCubit<CreateVisitState> {
  CreateVisitCubit(this.repo) : super(CreateVisitState.initial());
  final CreateVisitRepo repo;

  void init(Object? extra) {
    shouldAskForConfirmation.value = false;
    if (extra is CreateVisitForm) {
      final parsedDate =
          DFU.toDateTime(extra.scheduledDate.valueOrEmpty, 'yyyy-MM-dd');
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
          scheduledDate: formattedStr,
        ),
      ));
    }
  }

  void onFieldValueChanged({
    String? scheduledDate,
    String? scheduledTime,
    int? multiVisit,
    String? passType,
    String? visiteeMobileNo,
    String? visiteeEmail,
    String? whomToMeet,
    String? visitorName,
    String? visitorCompanyName,
    String? visitorEmail,
    String? buildingName,
    String? visitorMobile,
    String? department,
    String? duration,
    String? laptopDetails,
    String? otherDetails,
    String? idNumber,
    File? facePhoto,
    File? idPhoto,
    String? plantName,
  }) {
    shouldAskForConfirmation.value = true;
    final form = state.form;
    final facePhoto1 = facePhoto ?? form.facePhotoImg;
    final idPhoto1 = idPhoto ?? form.idPhotoImg;

    final newForm = form.copyWith(
      scheduledDate: scheduledDate ?? form.scheduledDate,
      buildingName: buildingName ?? form.buildingName,
      department: department ?? form.department,
      duration: duration ?? form.duration,
      multiVisit: multiVisit ?? form.multiVisit,
      passType: passType ?? form.passType,
      scheduledTime: scheduledTime ?? form.scheduledTime,
      visiteeEmail: visiteeEmail ?? form.visiteeEmail,
      visiteeMobileNo: visiteeMobileNo ?? form.visiteeMobileNo,
      visitorCompanyName: visitorCompanyName ?? form.visitorCompanyName,
      visitorEmail: visitorEmail ?? form.visitorEmail,
      visitorMobile: visitorMobile ?? form.visitorMobile,
      visitorName: visitorName ?? form.visitorName,
      whomToMeet: whomToMeet ?? form.whomToMeet,
      laptopDetails: laptopDetails ?? form.laptopDetails,
      facePhotoImg: facePhoto1,
      idPhotoImg: idPhoto1,
      idNumber: idNumber ?? form.idNumber,
      otherDetails: otherDetails ?? form.otherDetails,
      plantName: plantName ?? form.plantName,
    );
    emitSafeState(state.copyWith(
      form: newForm,
      error: null,
    ));
  }

  void processCreateVisit() {
    try {
      emit(state.copyWith(isLoading: true));
      if (state.type == ActionType.edit) {
        return _createVisit();
      } else if (state.type == ActionType.submit) {
        return _submitVisit();
      }
    } on Exception catch (e, st) {
      $logger.error('[New Create Visit Cubit]', e, st);
      _emitError(e.toString());
    }
  }

  void _createVisit() async {
    final validation = _validate();

    if (validation.isSome()) {
      final msg = validation.getOrElse(() => throw Exception());
      return _emitError(msg);
    }

    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.createVisit(state.form);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        shouldAskForConfirmation.value = false;
        final docNo = r.second;
        const message = 'Create Visit Created Successfully.';
        return emitSafeState(state.copyWith(
            form: state.form.copyWith(name: docNo, docstatus: 0),
            isLoading: false,
            type: ActionType.submit,
            isSuccess: true,
            successMsg: message));
      },
    );
  }

  void _submitVisit() async {
    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.submitVisitor(state.form.name.valueOrEmpty);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        shouldAskForConfirmation.value = false;
        final form = state.form.copyWith(docstatus: 1);
        final updatedState = state.copyWith(
            isSuccess: true,
            successMsg: 'Create Visit Submitted Succesfully',
            isLoading: false,
            form: form,
            type: ActionType.completed);
        return emitSafeState(updatedState);
      },
    );
  }

  // void _sendforApproval() async {
  //   emitSafeState(state.copyWith(isLoading: true));

  //   final docName = state.form.name.valueOrEmpty;

  //   if (docName.isEmpty) {
  //     emitSafeState(state.copyWith(
  //       isLoading: false,
  //     ));
  //     return;
  //   }

  //   final action = state.form.approvalAction(true);
  //   if (action.isEmpty) {
  //     emitSafeState(state.copyWith(
  //       isLoading: false,
  //     ));
  //     return;
  //   }

  //   final res = await repo.sendforApprovalButton(docName, action);

  //   res.fold(
  //     (error) {
  //       emitSafeState(state.copyWith(isLoading: false, error: error));
  //     },
  //     (_) {
  //       shouldAskForConfirmation.value = false;
  //       final updatedForm = state.form.copyWith(docstatus: 0);
  //       final updatedState = state.copyWith(
  //         isSuccess: true,
  //         isLoading: false,
  //         form: updatedForm,
  //         successMsg: 'Sendfor Approval Successfully completed',
  //         type: ActionType.submit,
  //         showApprovalButtons: true,
  //       );
  //       emitSafeState(updatedState);
  //     },
  //   );
  // }

  // void approveVisit() async {
  //   emitSafeState(state.copyWith(isLoading: true));

  //   final docName = state.form.name.valueOrEmpty;

  //   if (docName.isEmpty) {
  //     emitSafeState(state.copyWith(
  //       isLoading: false,
  //     ));
  //     return;
  //   }

  //   final action = state.form.approvalAction(true);
  //   if (action.isEmpty) {
  //     emitSafeState(state.copyWith(
  //       isLoading: false,
  //     ));
  //     return;
  //   }

  //   final res = await repo.approveButton(docName, action);

  //   res.fold(
  //     (error) {
  //       emitSafeState(state.copyWith(isLoading: false, error: error));
  //     },
  //     (_) {
  //       shouldAskForConfirmation.value = false;
  //       final form = state.form.copyWith(docstatus: 1);
  //       emitSafeState(state.copyWith(
  //         isSuccess: true,
  //         isLoading: false,
  //         form: form,
  //         successMsg: 'Visit Approved Successfully',
  //         type: ActionType.completed,
  //         showApprovalButtons: false,
  //       ));
  //     },
  //   );
  // }

  // void rejectVisit() async {
  //   emitSafeState(state.copyWith(isLoading: true));

  //   final docName = state.form.name.valueOrEmpty;

  //   if (docName.isEmpty) {
  //     emitSafeState(state.copyWith(
  //       isLoading: false,
  //     ));
  //     return;
  //   }

  //   final action = state.form.approvalAction(false);
  //   if (action.isEmpty) {
  //     emitSafeState(state.copyWith(
  //       isLoading: false,
  //     ));
  //     return;
  //   }

  //   final res = await repo.rejectButton(docName, action);

  //   res.fold(
  //     (error) {
  //       emitSafeState(state.copyWith(isLoading: false, error: error));
  //     },
  //     (_) {
  //       shouldAskForConfirmation.value = false;
  //        final form = state.form.copyWith(docstatus: 1);
  //       emitSafeState(state.copyWith(
  //         isSuccess: true,
  //         isLoading: false,
  //         form: form,
  //         successMsg: 'Visit Rejected Successfully',
  //         type: ActionType.completed,
  //         showApprovalButtons: false,
  //       ));
  //     },
  //   );
  // }

  void _emitError(String error) {
    final failure = Failure(error: error, title: 'Missing Fields');
    emitSafeState(state.copyWith(error: failure, isLoading: false));
  }

  void handled() => emitSafeState(
      state.copyWith(error: null, isSuccess: false, successMsg: null));
  Option<String> _validate() {
    final form = state.form;
    if (form.plantName.doesNotHaveValue) {
      return optionOf('Select Plant Name');
    } else if (form.scheduledDate.doesNotHaveValue) {
      return optionOf('Enter Scheduled Date');
    } else if (form.scheduledTime.doesNotHaveValue) {
      return optionOf('Enter Scheduled Time.');
    } else if (form.duration.doesNotHaveValue) {
      return optionOf('Enter Duration');
    } else if (form.passType.doesNotHaveValue) {
      return optionOf('Select Pass Type.');
    } else if (form.whomToMeet.doesNotHaveValue) {
      return optionOf('Enter whom to Meet.');
    } else if (form.visiteeMobileNo.doesNotHaveValue) {
      return optionOf('Enter Visitee Mobile.');
    }
    //  else if (form.visiteeEmail.doesNotHaveValue) {
    //   return optionOf('Enter Visitee Email.');
    // }
     else if (form.visitorName.doesNotHaveValue) {
      return optionOf('Enter Visitor Name.');
    } else if (form.visitorEmail.doesNotHaveValue) {
      return optionOf('Enter Visitor Email.');
    } else if (form.visitorMobile.doesNotHaveValue) {
      return optionOf('Enter Visitor Mobile.');
    } else if (form.visitorCompanyName.doesNotHaveValue) {
      return optionOf('Enter Visitor Company Name.');
    } else if (form.buildingName.doesNotHaveValue) {
      return optionOf('Select Building Name.');
    } else if (form.department.doesNotHaveValue) {
      return optionOf('Select Department');
    } else if (form.facePhotoImg.isNull) {
      return optionOf('Capture Face Photo');
    } else if (form.idPhotoImg.isNull) {
      return optionOf('Capture Photo ID Proof');
    }

    return const None();
  }
}

@freezed
class CreateVisitState with _$CreateVisitState {
  const factory CreateVisitState({
    required CreateVisitForm form,
    required bool isLoading,
    required bool isSuccess,
    required ActionType type,
    String? successMsg,
    Failure? error,
    @Default(false) bool showApprovalButtons,
  }) = _CreateVisitState;

  factory CreateVisitState.initial() {
    final exitDate = DFU.friendlyFormat(DFU.now());
    final createdtime = DFU.hhMMss(DFU.now());
    return CreateVisitState(
      form: CreateVisitForm(
        scheduledDate: exitDate,
        scheduledTime: createdtime,
      ),
      isLoading: false,
      isSuccess: false,
      type: ActionType.edit,
      showApprovalButtons: false,
    );
  }
}
