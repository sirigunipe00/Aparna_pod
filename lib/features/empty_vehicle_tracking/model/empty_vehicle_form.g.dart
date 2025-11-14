// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_vehicle_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmptyVehicleFormImpl _$$EmptyVehicleFormImplFromJson(
        Map<String, dynamic> json) =>
    _$EmptyVehicleFormImpl(
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      modifiedDate: json['modified'] as String?,
      docStatus: (json['docstatus'] as num?)?.toInt(),
      transporterList: json['transporter_list'] as String?,
      company: json['company'] as String? ?? '',
      gateMomentType: json['gate_movement_type'] as String?,
      vehicleType: json['vehice_type'] as String?,
      vehicleNo: json['vehicle_number'] as String?,
      driveName: json['driver_name'] as String?,
      driverMobileNumber: json['driver_phone_number'] as String?,
      vehiclePhoto: json['vehicle_photo'] as String?,
      remarks: json['remarks'] as String?,
      vehicleImg: toNull(json['vehicleImg']),
    );

Map<String, dynamic> _$$EmptyVehicleFormImplToJson(
        _$EmptyVehicleFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'date': instance.date,
      'time': instance.time,
      'modified': instance.modifiedDate,
      'docstatus': instance.docStatus,
      'transporter_list': instance.transporterList,
      'company': instance.company,
      'gate_movement_type': instance.gateMomentType,
      'vehice_type': instance.vehicleType,
      'vehicle_number': instance.vehicleNo,
      'driver_name': instance.driveName,
      'driver_phone_number': instance.driverMobileNumber,
      'vehicle_photo': instance.vehiclePhoto,
      'remarks': instance.remarks,
    };
