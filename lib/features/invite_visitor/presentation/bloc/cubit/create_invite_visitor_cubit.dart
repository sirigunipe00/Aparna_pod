import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/auth/model/logged_in_user.dart';
import 'package:aparna_pod/features/invite_visitor/data/invite_visitor_repo.dart';
import 'package:aparna_pod/features/invite_visitor/model/invite_visitor_form.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_invite_visitor_cubit.freezed.dart';

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
class CreateInviteVisitorCubit extends AppBaseCubit<CreateInviteVisitorState> {
  CreateInviteVisitorCubit(this.repo)
      : super(CreateInviteVisitorState.initial());
  final InviteVisitorRepo repo;

  void init(Object? extra) {
    shouldAskForConfirmation.value = false;
    if (extra is InviteVisitorForm) {
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
    int? inviteMObile,
    int? inviteEmail,
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
    String? plantName,
  }) {
    shouldAskForConfirmation.value = true;
    final form = state.form;

    final newForm = form.copyWith(
      scheduledDate: scheduledDate ?? form.scheduledDate,
      buildingName: buildingName ?? form.buildingName,
      department: department ?? form.department,
      duration: duration ?? form.duration,
      inviteEmail: inviteEmail ?? form.inviteEmail,
      inviteMObile: inviteMObile ?? form.inviteMObile,
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
      plantName: plantName ?? form.plantName,
    );
    emitSafeState(state.copyWith(
      form: newForm,
      error: null,
    ));
  }

  void processInviteVisitor() {
    try {
      if (state.type == ActionType.edit) {
        return _createInviteVisitor();
      } else if (state.type == ActionType.submit) {
        return _submitInviteVisitor();
      }
    } on Exception catch (e, st) {
      $logger.error('[NewGateExitCubit]', e, st);
      _emitError(e.toString());
    }
  }

  void _createInviteVisitor() async {
    final validation = _validate();

    if (validation.isSome()) {
      final msg = validation.getOrElse(() => throw Exception());
      return _emitError(msg);
    }

    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.createInviteVisitor(state.form);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        shouldAskForConfirmation.value = false;
        final docNo = r;
        const message = 'Invite Visitor Created Successfully.';
        return emitSafeState(state.copyWith(
            form: state.form.copyWith(name: docNo, docstatus: 0),
            isLoading: false,
            type: ActionType.submit,
            isSuccess: true,
            successMsg: message));
      },
    );
  }

  void _submitInviteVisitor() async {
    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.submitInviteVisitor(state.form.name!);
    return res.fold(
      (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) {
        shouldAskForConfirmation.value = false;
        final form = state.form.copyWith(docstatus: 1);
        final updatedState = state.copyWith(
            isSuccess: true,
            successMsg: 'Invite Visitor Submitted Succesfully',
            isLoading: false,
            form: form,
            type: ActionType.completed);
        return emitSafeState(updatedState);
      },
    );
  }

  void _emitError(String error) {
    final failure = Failure(error: error, title: 'Missing Fields');
    emitSafeState(state.copyWith(error: failure, isLoading: false));
  }

  void handled() => emitSafeState(
      state.copyWith(error: null, isSuccess: false, successMsg: null));
  Option<String> _validate() {
    final form = state.form;

    if (form.scheduledDate.doesNotHaveValue) {
      return optionOf('Enter Scheduled Date');
    } else if (form.scheduledTime.doesNotHaveValue) {
      return optionOf('Enter Scheduled Time.');
    } else if (form.duration.doesNotHaveValue) {
      return optionOf('Enter Duration');
    } else if (form.plantName.doesNotHaveValue) {
      return optionOf('Select Plant Name');
    } else if (form.passType.doesNotHaveValue) {
      return optionOf('Select Pass Type.');
    } else if (form.whomToMeet.doesNotHaveValue) {
      return optionOf('Enter whom to Meet.');
    } else if (form.visiteeMobileNo.doesNotHaveValue) {
      return optionOf('Enter Visitee Mobile.');
    } else if (form.visitorName.doesNotHaveValue) {
      return optionOf('Enter Visitor Name.');
    } else if (form.visitorCompanyName.doesNotHaveValue) {
      return optionOf('Enter Visitor Company Name.');
    }
    //  else if (form.visitorEmail.doesNotHaveValue) {
    //   return optionOf('Enter Visitor Email.');
    // }
     else if (form.buildingName.doesNotHaveValue) {
      return optionOf('Select Building Name.');
    } else if (form.visitorMobile.doesNotHaveValue) {
      return optionOf('Enter Visitor Mobile.');
    } else if (form.department.doesNotHaveValue) {
      return optionOf('Select Department');
    }

    return const None();
  }
}

@freezed
class CreateInviteVisitorState with _$CreateInviteVisitorState {
  const factory CreateInviteVisitorState({
    required InviteVisitorForm form,
    required bool isLoading,
    required bool isSuccess,
    required ActionType type,
    String? successMsg,
    Failure? error,
  }) = _CreateInviteVisitorState;

  factory CreateInviteVisitorState.initial() {
    // final exitDate = DFU.friendlyFormat(DFU.now());
    // final createdtime = DFU.hhMMss(DFU.now());
    final user = $sl.get<LoggedInUser>();
    return CreateInviteVisitorState(
      form: InviteVisitorForm(
          inviteMObile: 1,
// scheduledDate: exitDate,
          // scheduledTime: createdtime,
          visiteeEmail: user.email),
      isLoading: false,
      isSuccess: false,
      type: ActionType.edit,
    );
  }
}
