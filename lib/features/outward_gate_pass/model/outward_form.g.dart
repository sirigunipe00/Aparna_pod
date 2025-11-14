// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outward_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutwardFormImpl _$$OutwardFormImplFromJson(Map<String, dynamic> json) =>
    _$OutwardFormImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creationDate: json['creation'] as String? ?? '',
      modifiedDate: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      docstatus: (json['docstatus'] as num?)?.toInt(),
      plantName: json['plant_name'] as String?,
      gatePassType: json['gate_pass_type'] as String?,
      gatePassDate: json['gate_pass_date'] as String?,
      gatePassTime: json['gate_pass_time'] as String?,
      authorisedBy: json['authorised_by'] as String?,
      vehicleType: json['vehicle_type'] as String?,
      vehicleNumber: json['vehicle_number'] as String?,
      driverMobileNumber: json['driver_mobile_number'] as String?,
      remarks: json['remarks'] as String?,
      outwardNo: json['outward_no'] as String?,
      outwardDate: json['outward_date'] as String?,
      ismanualvendor: (json['is_manual_vendorcustomer'] as num?)?.toInt(),
      vendorcustomer: json['vendorcustomer'] as String?,
      vendorRecords: json['vendorcustomer_records'] as String?,
      vendorCustomerManual: json['vendorcustomer_manual'] as String?,
      vendorAddress: json['vendorcustomer_manual_address'] as String?,
      gatePassPhoto: json['gatepass_image'] as String?,
      amendedFrom: json['amended_from'] as String?,
      items: (json['outward_gatepass_items'] as List<dynamic>?)
              ?.map((e) => ItemsForm.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      itemLines: (json['outward_gate_pass_items'] as List<dynamic>?)
              ?.map((e) => ItemsForm.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$OutwardFormImplToJson(_$OutwardFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creationDate,
      'modified': instance.modifiedDate,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docstatus,
      'plant_name': instance.plantName,
      'gate_pass_type': instance.gatePassType,
      'gate_pass_date': instance.gatePassDate,
      'gate_pass_time': instance.gatePassTime,
      'authorised_by': instance.authorisedBy,
      'vehicle_type': instance.vehicleType,
      'vehicle_number': instance.vehicleNumber,
      'driver_mobile_number': instance.driverMobileNumber,
      'remarks': instance.remarks,
      'outward_no': instance.outwardNo,
      'outward_date': instance.outwardDate,
      'is_manual_vendorcustomer': instance.ismanualvendor,
      'vendorcustomer': instance.vendorcustomer,
      'vendorcustomer_records': instance.vendorRecords,
      'vendorcustomer_manual': instance.vendorCustomerManual,
      'vendorcustomer_manual_address': instance.vendorAddress,
      'gatepass_image': instance.gatePassPhoto,
      'amended_from': instance.amendedFrom,
      'outward_gatepass_items': instance.items,
      'outward_gate_pass_items': instance.itemLines,
    };
