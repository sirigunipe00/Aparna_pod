import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/visitor_in_out/data/visitor_in_out_repo.dart';
import 'package:aparna_pod/features/visitor_in_out/model/visitor_in_out_form.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_visitor_in_out_cubit.freezed.dart';

enum ActionType { edit, submit, completed}

extension ActionTypeApi on ActionType {
  String toName() {
    return switch (this) {
      ActionType.edit => 'Create',
      ActionType.completed || ActionType.submit => 'Submit',
    };
  }
}

@injectable
class CreateVisitorInOutCubit extends AppBaseCubit<CreateVisitorInOutState> {
  CreateVisitorInOutCubit(this.repo) : super(CreateVisitorInOutState.initial());
  final VisitorInOutRepo repo;

  void init(Object? extra) {
    shouldAskForConfirmation.value = false;
    if (extra is VisitorInOutForm) {
      final status = StringUtils.docStatus(extra.docstatus!);

      final type = switch (status) {
        'Draft' => ActionType.submit,
        'Submitted' => ActionType.completed,
        String() => ActionType.edit,
      };

      emitSafeState(state.copyWith(
        type: type,
        form: extra.copyWith(),
      ));
    }
  }

  void onFieldValueChanged({
    String? qrScanner,
    String? visitorInTime,
    String? inviteVisitor,
    String? visitorName,
    String? visitorEmail,
    String? visitorMobile,
    String? visitorExitTime,
    String? passType,
    String? visiteeMobileNo,
    String? whomToMeet,
    String? visitorCompanyName,
    String? visiteeEmail,
    String? buildingName,
    String? department,
    String? plantName,
  }) {
    shouldAskForConfirmation.value = false;
    final form = state.form;

    final newForm = form.copyWith(
      qrScanner: qrScanner ?? form.qrScanner,
      inviteVisitor: inviteVisitor ?? form.inviteVisitor,
      visitorInTime: visitorInTime ?? form.visitorInTime,
      visitorEmail: visitorEmail ?? form.visitorEmail,
      visitorMobile: visitorMobile ?? form.visitorMobile,
      visitorName: visitorName ?? form.visitorName,
      visitorExitTime: visitorExitTime ?? form.visitorExitTime,
      buildingName: buildingName ?? form.buildingName,
      department: department ?? form.department,
      passType: passType ?? form.passType,
      visiteeEmail: visiteeEmail ?? form.visiteeEmail,
      visiteeMobileNo: visiteeMobileNo ?? form.visiteeMobileNo,
      visitorCompanyName: visitorCompanyName ?? form.visitorCompanyName,
      whomToMeet: whomToMeet ?? form.whomToMeet,
      plantName: plantName ?? form.plantName,
    );
    
    emitSafeState(state.copyWith(
      form: newForm,
      error: null,
    ));
    if (state.form.visitorExitTime != null && state.type == ActionType.submit) {
      shouldAskForConfirmation.value = true;
    }
  }

  void reset() => emitSafeState(CreateVisitorInOutState.initial());

  Future<Option<String>> processVisitorInOut() async {
    try {
      if (state.type == ActionType.edit) {
        return await createVisitorInOut();
      } else if (state.type == ActionType.submit) {
        return await submitVisitorInOut();
      }
    } on Exception catch (e, st) {
      $logger.error('[CreateVisitorInOutCubit]', e, st);
      _emitError(e.toString());
      return optionOf('Unexpected error occurred');
    }
    return none();
  }

  Future<Option<String>> createVisitorInOut() async {
    final validation = _validate();

    if (validation.isSome()) {
      final msg = validation.getOrElse(() => 'Invalid input');
      _emitError(msg);
      return optionOf(msg);
    }

    emitSafeState(state.copyWith(isLoading: true));
    final res =
        await repo.createInOut(state.form.qrScanner, state.form.visitorInTime);
    return res.fold(
      (l) {
        emitSafeState(state.copyWith(isLoading: false, error: l,));
        return optionOf(l.error); // or l.toString()
      },
      (r) {
        shouldAskForConfirmation.value = false;
        const message = 'Visitor In Out Created.';
        emitSafeState(state.copyWith(
          form: state.form.copyWith(
          name: r, docstatus: 0),
          isLoading: false,
          type: ActionType.submit,
          successMsg: message,
        ));
        return optionOf(message);
      },
    );
  }

  Future<Option<String>> submitVisitorInOut() async {
    if (state.form.visitorExitTime.doesNotHaveValue) {
      const msg = 'Please select Visitor Exit Time';
      _emitError(msg);
      return optionOf(msg);
    }

    emitSafeState(state.copyWith(isLoading: true));
    final res = await repo.submitVisitorInOut(
        state.form.name!, state.form.visitorExitTime!);
    return res.fold(
      (l) {
        emitSafeState(state.copyWith(isLoading: false, error: l));
        return optionOf(l.error); // or l.toString()
      },
      (r) {
        shouldAskForConfirmation.value = false;
        const message = 'Visitor In Out Submitted Succesfully';
        emitSafeState(state.copyWith(
          successMsg: message,
          isLoading: false,
          form: state.form.copyWith(docstatus: 1),
          type: ActionType.completed,
        ));
        return optionOf(message);
      },
    );
  }

  void _emitError(String error) {
    final failure = Failure(error: error, title: 'Missing Fields');
    emitSafeState(state.copyWith(error: failure, isLoading: false));
  }

  void handled() => emitSafeState(state.copyWith(error: null, successMsg: null));
  Option<String> _validate() {
    // final form = state.form;

    // if (form.qrScanner.doesNotHaveValue) {
    //   return optionOf('Please Scan the Qr');
    // }

    // else if (form.plantName.doesNotHaveValue) {
    //   return optionOf('Select Plant Name');
    // }

    return const None();
  }
}

@freezed
class CreateVisitorInOutState with _$CreateVisitorInOutState {
  const factory CreateVisitorInOutState({
    required VisitorInOutForm form,
    required bool isLoading,
    required ActionType type,
    String? successMsg,
    Failure? error,
  }) = _CreateVisitorInOutState;

  factory CreateVisitorInOutState.initial() {
    final createdtime = DFU.hhMMss(DFU.now());
    return CreateVisitorInOutState(
      form: VisitorInOutForm(
        // visitorExitTime: createdtime,
        visitorInTime: createdtime,
      ),
      isLoading: false,
      type: ActionType.edit,
    );
  }
}
