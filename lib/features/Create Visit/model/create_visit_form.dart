
import 'dart:io';

import 'package:aparna_pod/core/utils/typedefs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_visit_form.freezed.dart';
part 'create_visit_form.g.dart';

@freezed
class CreateVisitForm with _$CreateVisitForm {
  const factory CreateVisitForm({
    String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
    @JsonKey(name: 'modified') String? modifiedDate,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'docstatus') int? docstatus,
    @JsonKey(name: 'plant_name') String? plantName,
    @JsonKey(name: 'scheduled_date') String? scheduledDate,
    @JsonKey(name: 'duration') String? duration,
    @JsonKey(name: 'scheduled_time') String? scheduledTime,
    @JsonKey(name: 'multi_visit') int? multiVisit,
    @JsonKey(name: 'pass_type') String? passType,
    @JsonKey(name: 'visitee_mobile') String? visiteeMobileNo,
    @JsonKey(name: 'whom_to_meet') String? whomToMeet,
    @JsonKey(name: 'visitee_email') String? visiteeEmail,
    @JsonKey(name: 'name1') String? visitorName,
    @JsonKey(name: 'email') String? visitorEmail,
    @JsonKey(name: 'mobile_no') String? visitorMobile,
    @JsonKey(name: 'visitor_company_name') String? visitorCompanyName,
    @JsonKey(name: 'building_name') String? buildingName,
    @JsonKey(name: 'department') String? department,
    @JsonKey(name: 'amended_from') String? amendedFrom,
    @JsonKey(name: 'id_number') String? idNumber,
    @JsonKey(name: 'laptop_details') String? laptopDetails,
    @JsonKey(name: 'other_devices_details') String? otherDetails,
    @JsonKey(name: 'workflow_state') String? workflowState,
    @JsonKey(includeToJson: false, includeFromJson: false,toJson: toNull,fromJson: toNull)
    File? facePhotoImg,
    @JsonKey(name: 'face_photo')  String? facePhoto,
    @JsonKey(includeToJson: false, includeFromJson: false)
    File? idPhotoImg,
    @JsonKey(name: 'photo_id_proof') String? idPhoto,
  }) = _CreateVisitForm;

  factory CreateVisitForm.fromJson(Map<String, Object?> json) =>
      _$CreateVisitFormFromJson(json);

  static Map<String, dynamic> toEncodedFormJson(final CreateVisitForm form) {
    final json = form.toJson();


    return json;
  }
}

// extension CreateVisitFormExt on CreateVisitForm {
//   String approvalAction(bool approve) {
//     if (workflowState == 'Draft') {
//       return 'Send for Approval';
//     } else if (workflowState == 'Pending') {
//       return approve ? 'Approve' : 'Reject';
//     }
//     return '';
//   }
// }
