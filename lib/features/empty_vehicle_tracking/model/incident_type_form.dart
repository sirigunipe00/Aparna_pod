import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident_type_form.freezed.dart';
part 'incident_type_form.g.dart';

@freezed
class IncidentTypeForm with _$IncidentTypeForm {
  factory IncidentTypeForm({
    @JsonKey(name: 'name') required String name,
    String? city,
    String? pincode,
    @JsonKey(name: 'address_line1') String? line1,
    @JsonKey(name: 'address_line2') String? line2,
  }) = _IncidentTypeForm;

  factory IncidentTypeForm.fromJson(Map<String, Object?> json) =>
      _$IncidentTypeFormFromJson(json);

  static List<String> fields = ['name'];
}
