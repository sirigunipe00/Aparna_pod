import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident_register_form.freezed.dart';
part 'incident_register_form.g.dart';

@freezed
class IncidentRegisterForm with _$IncidentRegisterForm {
  const factory IncidentRegisterForm({
    String? name,
    String? owner,
    String? date,
    String? time,
    @JsonKey(name: 'modified') String? modifiedDate,
    @JsonKey(name: 'docstatus') int? docStatus,
    @JsonKey(name: 'incident_investigator_rsm_name_')
    String? incidentInvestigator,
    @JsonKey(name: 'incident_plant_name', defaultValue: '')
    String? incidentPlantName,
    @JsonKey(name: 'type_of_incident') String? incidentType,
    @JsonKey(name: 'ael_associated_involved') String? associatedInvol,
    @JsonKey(name: 'ael_assets_involved') String? assetsInvolve,
    @JsonKey(name: 'amount') int? amount,
    @JsonKey(name: 'fir_complaint') String? complaint,
    @JsonKey(name: 'notify_employee') String? employeeEmail,
    @JsonKey(name: 'remarks') String? remarks,
    @JsonKey(name: 'details_of_other_party') String? otherPartyDetails,
    @JsonKey(name: 'incident_description_1') String? desc1,
    @JsonKey(name: 'incident_description') String? desc2,
    @JsonKey(name: 'action_takenrecommendation') String? desc3,
    @JsonKey(name: 'photo') String? photo,
    @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull,

    )
    File? incPhotoImg,
  }) = _IncidentRegisterForm;

  factory IncidentRegisterForm.fromJson(Map<String, dynamic> json) =>
      _$IncidentRegisterFormFromJson(json);

  static Map<String, dynamic> toEncodedFormJson(
      final IncidentRegisterForm form) {
    final json = form.toJson();

    json['photo'] = form.incPhotoImg;

    return json;
  }
}

dynamic toNull(_) => null;
