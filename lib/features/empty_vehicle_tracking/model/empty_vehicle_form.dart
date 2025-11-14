import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'empty_vehicle_form.freezed.dart';
part 'empty_vehicle_form.g.dart';

@freezed
class EmptyVehicleForm with _$EmptyVehicleForm {
  const factory EmptyVehicleForm({
    String? name,
    String? owner,
    String? date,
    String? time,
    @JsonKey(name: 'modified') String? modifiedDate,
    @JsonKey(name: 'docstatus') int? docStatus,
    @JsonKey(name: 'transporter_list') String? transporterList,
    @JsonKey(name: 'company', defaultValue: '') String? company,
    @JsonKey(name: 'gate_movement_type') String? gateMomentType,
    @JsonKey(name: 'vehice_type') String? vehicleType,
    @JsonKey(name: 'vehicle_number') String? vehicleNo,
    @JsonKey(name: 'driver_name') String? driveName,
    @JsonKey(name: 'driver_phone_number') String? driverMobileNumber,
    @JsonKey(name: 'vehicle_photo') String? vehiclePhoto,
    @JsonKey(name: 'remarks') String? remarks,
    @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull,

    )
    File? vehicleImg,
  }) = _EmptyVehicleForm;

  factory EmptyVehicleForm.fromJson(Map<String, dynamic> json) =>
      _$EmptyVehicleFormFromJson(json);

  static Map<String, dynamic> toEncodedFormJson(
      final EmptyVehicleForm form) {
    final json = form.toJson();

    json['vehicle_photo'] = form.vehicleImg;

    return json;
  }
}

dynamic toNull(_) => null;
