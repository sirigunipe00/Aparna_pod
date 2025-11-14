
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_visitor_form.freezed.dart';
part 'invite_visitor_form.g.dart';

@freezed
class InviteVisitorForm with _$InviteVisitorForm {
  const factory InviteVisitorForm({
    String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
    @JsonKey(name: 'modified') String? modifiedDate,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'docstatus') int? docstatus,
    @JsonKey(name: 'plant_name') String? plantName,
    @JsonKey(name: 'scheduled_date', includeToJson: false) String? scheduledDate,
    @JsonKey(name: 'duration') String? duration,
    @JsonKey(name: 'scheduled_time') String? scheduledTime,
    @JsonKey(name: 'invite_to_visitor_email') int? inviteEmail,
    @JsonKey(name: 'invite_to_visitor_mobile') int? inviteMObile,
    @JsonKey(name: 'multi_visit') int? multiVisit,
    @JsonKey(name: 'pass_type') String? passType,
    @JsonKey(name: 'visitee_mobile') String? visiteeMobileNo,
    @JsonKey(name: 'whom_to_meet') String? whomToMeet,
    @JsonKey(name: 'visitee_email') String? visiteeEmail,
    @JsonKey(name: 'visitor_name') String? visitorName,
    @JsonKey(name: 'visitor_email') String? visitorEmail,
    @JsonKey(name: 'visitor_mobile') String? visitorMobile,
    @JsonKey(name: 'visitor_company_name') String? visitorCompanyName,
    @JsonKey(name: 'building_name') String? buildingName,
    @JsonKey(name: 'department') String? department,
    @JsonKey(name: 'amended_from') String? amendedFrom,
  }) = _InviteVisitorForm;

  factory InviteVisitorForm.fromJson(Map<String, Object?> json) =>
      _$InviteVisitorFormFromJson(json);

  static Map<String, dynamic> toEncodedFormJson(final InviteVisitorForm form) {
    final json = form.toJson();


    return json;
  }
}
