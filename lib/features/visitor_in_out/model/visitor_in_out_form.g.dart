// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_in_out_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitorInOutFormImpl _$$VisitorInOutFormImplFromJson(
        Map<String, dynamic> json) =>
    _$VisitorInOutFormImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creationDate: json['creation'] as String? ?? '',
      modifiedDate: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      docstatus: (json['docstatus'] as num?)?.toInt(),
      index: (json['idx'] as num?)?.toInt(),
      plantName: json['plant_name'] as String?,
      amendedFrom: json['amended_from'] as String?,
      qrScanner: json['qr_scanner'] as String?,
      inviteVisitor: json['invite_visitor'] as String?,
      type: json['type'] as String?,
      visitorInTime: json['visitor_in_time'] as String?,
      visitorName: json['visitor_name'] as String?,
      visitorMobile: json['visitor_mobile'] as String?,
      visitorEmail: json['visitor_email'] as String?,
      visitorExitTime: json['visitor_out_time'] as String?,
      passType: json['pass_type'] as String?,
      visiteeMobileNo: json['visitee_mobile'] as String?,
      whomToMeet: json['whom_to_meet'] as String?,
      visitorCompanyName: json['visitor_company_name'] as String?,
      visiteeEmail: json['visitee_email'] as String?,
      buildingName: json['building_name'] as String?,
      department: json['department'] as String?,
    );

Map<String, dynamic> _$$VisitorInOutFormImplToJson(
        _$VisitorInOutFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creationDate,
      'modified': instance.modifiedDate,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docstatus,
      'idx': instance.index,
      'plant_name': instance.plantName,
      'amended_from': instance.amendedFrom,
      'qr_scanner': instance.qrScanner,
      'invite_visitor': instance.inviteVisitor,
      'type': instance.type,
      'visitor_in_time': instance.visitorInTime,
      'visitor_name': instance.visitorName,
      'visitor_mobile': instance.visitorMobile,
      'visitor_email': instance.visitorEmail,
      'visitor_out_time': instance.visitorExitTime,
      'pass_type': instance.passType,
      'visitee_mobile': instance.visiteeMobileNo,
      'whom_to_meet': instance.whomToMeet,
      'visitor_company_name': instance.visitorCompanyName,
      'visitee_email': instance.visiteeEmail,
      'building_name': instance.buildingName,
      'department': instance.department,
    };
