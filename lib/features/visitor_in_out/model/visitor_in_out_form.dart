import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitor_in_out_form.freezed.dart';
part 'visitor_in_out_form.g.dart';

@freezed
class VisitorInOutForm with _$VisitorInOutForm {
  const factory VisitorInOutForm({
    String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
    @JsonKey(name: 'modified') String? modifiedDate,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'docstatus') int? docstatus,
    @JsonKey(name: 'idx') int? index,
    @JsonKey(name: 'plant_name') String? plantName,
    @JsonKey(name: 'amended_from') String? amendedFrom,
    @JsonKey(name: 'qr_scanner') String? qrScanner,
    @JsonKey(name: 'invite_visitor') String? inviteVisitor,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'visitor_in_time') String? visitorInTime,
    @JsonKey(name: 'visitor_name') String? visitorName,
    @JsonKey(name: 'visitor_mobile') String? visitorMobile,
    @JsonKey(name: 'visitor_email') String? visitorEmail,
    @JsonKey(name: 'visitor_out_time') String? visitorExitTime,
    @JsonKey(name: 'pass_type') String? passType,
    @JsonKey(name: 'visitee_mobile') String? visiteeMobileNo,
    @JsonKey(name: 'whom_to_meet') String? whomToMeet,
    @JsonKey(name: 'visitor_company_name') String? visitorCompanyName,
    @JsonKey(name: 'visitee_email') String? visiteeEmail,
    @JsonKey(name: 'building_name') String? buildingName,
    @JsonKey(name: 'department') String? department,
  }) = _VisitorInOutForm;

  factory VisitorInOutForm.fromJson(Map<String, Object?> json) =>
      _$VisitorInOutFormFromJson(json);

  static Map<String, dynamic> toEncodedFormJson(final VisitorInOutForm form) {
    final json = form.toJson();

    return json;
  }
}
