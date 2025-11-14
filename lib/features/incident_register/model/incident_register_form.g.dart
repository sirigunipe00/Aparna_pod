// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_register_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncidentRegisterFormImpl _$$IncidentRegisterFormImplFromJson(
        Map<String, dynamic> json) =>
    _$IncidentRegisterFormImpl(
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      modifiedDate: json['modified'] as String?,
      docStatus: (json['docstatus'] as num?)?.toInt(),
      incidentInvestigator: json['incident_investigator_rsm_name_'] as String?,
      incidentPlantName: json['incident_plant_name'] as String? ?? '',
      incidentType: json['type_of_incident'] as String?,
      associatedInvol: json['ael_associated_involved'] as String?,
      assetsInvolve: json['ael_assets_involved'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      complaint: json['fir_complaint'] as String?,
      employeeEmail: json['notify_employee'] as String?,
      remarks: json['remarks'] as String?,
      otherPartyDetails: json['details_of_other_party'] as String?,
      desc1: json['incident_description_1'] as String?,
      desc2: json['incident_description'] as String?,
      desc3: json['action_takenrecommendation'] as String?,
      photo: json['photo'] as String?,
      incPhotoImg: toNull(json['incPhotoImg']),
    );

Map<String, dynamic> _$$IncidentRegisterFormImplToJson(
        _$IncidentRegisterFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'date': instance.date,
      'time': instance.time,
      'modified': instance.modifiedDate,
      'docstatus': instance.docStatus,
      'incident_investigator_rsm_name_': instance.incidentInvestigator,
      'incident_plant_name': instance.incidentPlantName,
      'type_of_incident': instance.incidentType,
      'ael_associated_involved': instance.associatedInvol,
      'ael_assets_involved': instance.assetsInvolve,
      'amount': instance.amount,
      'fir_complaint': instance.complaint,
      'notify_employee': instance.employeeEmail,
      'remarks': instance.remarks,
      'details_of_other_party': instance.otherPartyDetails,
      'incident_description_1': instance.desc1,
      'incident_description': instance.desc2,
      'action_takenrecommendation': instance.desc3,
      'photo': instance.photo,
    };
