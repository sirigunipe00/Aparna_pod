// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_visit_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateVisitFormImpl _$$CreateVisitFormImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateVisitFormImpl(
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
      multiVisit: (json['multi_visit'] as num?)?.toInt(),
      passType: json['pass_type'] as String?,
      visiteeMobileNo: json['visitee_mobile'] as String?,
      whomToMeet: json['whom_to_meet'] as String?,
      visiteeEmail: json['visitee_email'] as String?,
      visitorName: json['name1'] as String?,
      visitorEmail: json['email'] as String?,
      visitorMobile: json['mobile_no'] as String?,
      visitorCompanyName: json['visitor_company_name'] as String?,
      buildingName: json['building_name'] as String?,
      department: json['department'] as String?,
      amendedFrom: json['amended_from'] as String?,
      idNumber: json['id_number'] as String?,
      laptopDetails: json['laptop_details'] as String?,
      otherDetails: json['other_devices_details'] as String?,
      workflowState: json['workflow_state'] as String?,
      facePhoto: json['face_photo'] as String?,
      idPhoto: json['photo_id_proof'] as String?,
    );

Map<String, dynamic> _$$CreateVisitFormImplToJson(
        _$CreateVisitFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creationDate,
      'modified': instance.modifiedDate,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docstatus,
      'plant_name': instance.plantName,
      'scheduled_date': instance.scheduledDate,
      'duration': instance.duration,
      'scheduled_time': instance.scheduledTime,
      'multi_visit': instance.multiVisit,
      'pass_type': instance.passType,
      'visitee_mobile': instance.visiteeMobileNo,
      'whom_to_meet': instance.whomToMeet,
      'visitee_email': instance.visiteeEmail,
      'name1': instance.visitorName,
      'email': instance.visitorEmail,
      'mobile_no': instance.visitorMobile,
      'visitor_company_name': instance.visitorCompanyName,
      'building_name': instance.buildingName,
      'department': instance.department,
      'amended_from': instance.amendedFrom,
      'id_number': instance.idNumber,
      'laptop_details': instance.laptopDetails,
      'other_devices_details': instance.otherDetails,
      'workflow_state': instance.workflowState,
      'face_photo': instance.facePhoto,
      'photo_id_proof': instance.idPhoto,
    };
