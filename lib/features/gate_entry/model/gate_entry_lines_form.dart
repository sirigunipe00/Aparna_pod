import 'package:freezed_annotation/freezed_annotation.dart';

part 'gate_entry_lines_form.freezed.dart';
part 'gate_entry_lines_form.g.dart';

@freezed
class GateEntryLinesForm with _$GateEntryLinesForm {
  const factory GateEntryLinesForm({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'docstatus') int? docStatus,
    @JsonKey(name: 'material_name') String? materialName,
    @JsonKey(name: 'serial_no') String? serialNumber,
    @AssetnumberConvertor()
    @JsonKey(name: 'asset_no')
    int? assetNumber,
    @JsonKey(name: 'qty') double? quantity,
    @JsonKey(name: 'amount') double? amount,
    @JsonKey(name: 'uom') String? oums,
    @JsonKey(name: 'is_return') int? isreturn,
    @JsonKey(name: 'parent') String? parentName,
    @JsonKey(name: 'tracking_id') String? trackingId,
  }) = _GateEntryLinesForm;

  factory GateEntryLinesForm.fromJson(Map<String, dynamic> json) =>
      _$GateEntryLinesFormFromJson(json);

  static Map<String, dynamic> toEncodedFormJson(final GateEntryLinesForm form) {
    final json = form.toJson();

    return json;
  }
}

class AssetnumberConvertor implements JsonConverter<int, Object> {
  const AssetnumberConvertor();
  @override
  int fromJson(Object json) => int.parse(json.toString());

  @override
  Object toJson(int object) {
    return object;
  }
}

dynamic toNull(_) => null;
