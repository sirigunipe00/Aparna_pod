// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_visitor_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InviteVisitorFormImpl _$$InviteVisitorFormImplFromJson(
        Map<String, dynamic> json) =>
    _$InviteVisitorFormImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creationDate: json['creation'] as String? ?? '',
      modifiedDate: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      docstatus: (json['docstatus'] as num?)?.toInt(),
      plantName: json['plant_name'] as String?,
      scheduledDate: json['scheduled_date'] as String?,
      duration: json['duration'] as String?,
      scheduledTime: json['scheduled_time'] as String?,
      inviteEmail: (json['invite_to_visitor_email'] as num?)?.toInt(),
      inviteMObile: (json['invite_to_visitor_mobile'] as num?)?.toInt(),
      multiVisit: (json['multi_visit'] as num?)?.toInt(),
      passType: json['pass_type'] as String?,
      visiteeMobileNo: json['visitee_mobile'] as String?,
      whomToMeet: json['whom_to_meet'] as String?,
      visiteeEmail: json['visitee_email'] as String?,
      visitorName: json['visitor_name'] as String?,
      visitorEmail: json['visitor_email'] as String?,
      visitorMobile: json['visitor_mobile'] as String?,
      visitorCompanyName: json['visitor_company_name'] as String?,
      buildingName: json['building_name'] as String?,
      department: json['department'] as String?,
      amendedFrom: json['amended_from'] as String?,
    );

Map<String, dynamic> _$$InviteVisitorFormImplToJson(
        _$InviteVisitorFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creationDate,
      'modified': instance.modifiedDate,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docstatus,
      'plant_name': instance.plantName,
      'duration': instance.duration,
      'scheduled_time': instance.scheduledTime,
      'invite_to_visitor_email': instance.inviteEmail,
      'invite_to_visitor_mobile': instance.inviteMObile,
      'multi_visit': instance.multiVisit,
      'pass_type': instance.passType,
      'visitee_mobile': instance.visiteeMobileNo,
      'whom_to_meet': instance.whomToMeet,
      'visitee_email': instance.visiteeEmail,
      'visitor_name': instance.visitorName,
      'visitor_email': instance.visitorEmail,
      'visitor_mobile': instance.visitorMobile,
      'visitor_company_name': instance.visitorCompanyName,
      'building_name': instance.buildingName,
      'department': instance.department,
      'amended_from': instance.amendedFrom,
    };
