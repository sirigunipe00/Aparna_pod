import 'dart:io';

import 'package:aparna_pod/core/core.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/data/empty_vehicle_repo.dart';
import 'package:aparna_pod/features/empty_vehicle_tracking/model/empty_vehicle_form.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_empty_vehicle_cubit.freezed.dart';

enum EmptyVehicleView { create, edit, completed }

extension ActionType on EmptyVehicleView {
  String toName() {
    return switch (this) {
      EmptyVehicleView.create => 'Create',
      EmptyVehicleView.edit => 'Submit',
      EmptyVehicleView.completed => 'Submitted',
    };
  }
}

@injectable
class CreateEmptyVehicleCubit
    extends AppBaseCubit<CreateEmptyVehicleState> {
  CreateEmptyVehicleCubit(this.repo)
      : super(CreateEmptyVehicleState.initial());
  final EmptyVehicleRepo repo;

  void onValueChanged({
    String? date,
    String? time,
    String? transporterList,
    String? company,
    String? gateMomentType,
    String? vehicleNo,
    String? vehicleType,
    String? driveName,
    String? driverMobileNumber,
    File? vehiclePhoto,
    String? remarks,
  }) {
    shouldAskForConfirmation.value = true;
    final form = state.form;
    final vechPhoto = vehiclePhoto ?? form.vehicleImg;

    final newForm = form.copyWith(
      transporterList: transporterList ?? form.transporterList,
      company: company ?? form.company,
      gateMomentType: gateMomentType ?? form.gateMomentType,
      date: date ?? form.date,
      vehicleType: vehicleType ?? form.vehicleType,
      vehicleNo: vehicleNo ?? form.vehicleNo,
      driveName: driveName ?? form.driveName,
      driverMobileNumber: driverMobileNumber ?? form.driverMobileNumber,
      docStatus: form.docStatus,
      vehicleImg: vechPhoto,
      time: time ?? form.time,
      remarks: remarks ?? form.remarks,
    );
    emitSafeState(state.copyWith(form: newForm));
  }

  void initDetails(Object? entry) {
    shouldAskForConfirmation.value = false;
    if (entry is EmptyVehicleForm) {
      final parsedDate = DFU.toDateTime(entry.date.valueOrEmpty, 'yyyy-MM-dd');
      final formattedStr = DFU.friendlyFormat(parsedDate);

      final status = entry.docStatus;

      final isSubmitted = StringUtils.equalsIgnoreCase(
          StringUtils.docStatus(status!), 'Submitted');
      final isCancelled = StringUtils.equalsIgnoreCase(
          StringUtils.docStatus(status).trim(), 'Cancelled');
      final mode = (isSubmitted || isCancelled)
          ? EmptyVehicleView.completed
          : EmptyVehicleView.edit;
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
        final nextMode = switch (state.view)
         {
          EmptyVehicleView.create => EmptyVehicleView.edit,
          EmptyVehicleView.edit ||
          EmptyVehicleView.completed => EmptyVehicleView.completed,
        };

        if (state.view == EmptyVehicleView.create) {
          final response = await repo.createEmptyVehicle(state.form);

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
              await repo.submitEmptyVehicle(state.form);

          return response.fold(
            (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
            (r) {
              shouldAskForConfirmation.value = false;
              emitSafeState(state.copyWith(
                isLoading: false,
                isSuccess: true,
                form: state.form.copyWith(docStatus: 1),
                successMsg: r,
                view: EmptyVehicleView.completed,
              ));
            },
          );
        }
      },
      _emitError,
    );
  }

  void _emitError(String error) {
    final failure = Failure(error: error, title: 'Missing Fields');
    emitSafeState(state.copyWith(error: failure, isLoading: false));
  }

  void errorHandled() {
    emitSafeState(state.copyWith(error: null, isLoading: false,isSuccess: false,successMsg: null));
  }

  Option<String> _validate() {
    final form = state.form;

    if (form.company.doesNotHaveValue) {
      return optionOf('Select Plant Name');
    } else if (form.gateMomentType.doesNotHaveValue) {
      return optionOf('Select Gate Movement Type');
    } else if (form.vehicleType.isNull) {
      return optionOf('Select Vehicle Type');
    } else if (form.transporterList.doesNotHaveValue) {
      return optionOf('Select Transporter');
    }   else if (form.vehicleNo.doesNotHaveValue) {
      return optionOf('Enter Vehicle Number');
    }
     else if (form.driveName.isNull) {
      return optionOf('Enter Driver Name');
    } else if (form.driverMobileNumber.doesNotHaveValue) {
      return optionOf('Enter Driver Mobile Number');
    } else if (form.vehicleImg == null && form.vehiclePhoto == null) {
      return optionOf('Capture Vehicle Photo');
    }
    //  else if (form.remarks.doesNotHaveValue && form.transporterList == 'Other'){
    //   return optionOf('Enter Remarks');
    // } 

    return const None();
  }
}

@freezed
class CreateEmptyVehicleState with _$CreateEmptyVehicleState {
  const factory CreateEmptyVehicleState({
    required EmptyVehicleForm form,
    required bool isLoading,
    required bool isSuccess,
    required EmptyVehicleView view,
    String? successMsg,
    Failure? error,
  }) = _CreateEmptyVehicleState;

  factory CreateEmptyVehicleState.initial() {
    final creationDate = DFU.friendlyFormat(DFU.now());
    final createdtime = DFU.hhMMss(DFU.now());

    return CreateEmptyVehicleState(
      form: EmptyVehicleForm(date: creationDate, time: createdtime),
      view: EmptyVehicleView.create,
      isLoading: false,
      isSuccess: false,
    );
  }
}
