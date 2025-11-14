import 'package:freezed_annotation/freezed_annotation.dart';

part 'items_form.freezed.dart';
part 'items_form.g.dart';

@freezed
class ItemsForm with _$ItemsForm {
  const factory ItemsForm({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'docstatus') int? docStatus,
    @JsonKey(name: 'is_manual_item') int? isManualItem,
    @JsonKey(name: 'manual_item_code') String? manualItemCode,
    @JsonKey(name: 'manual_item_name') String? manualItemName,
    @JsonKey(name: 'item_code') String? itemCode,
    @JsonKey(name: 'item_name') String? itemName,
    @JsonKey(name: 'quantity') double? quantity,
    @JsonKey(name: 'uom') String? uom,
    @JsonKey(name: 'value') double? value,
    @JsonKey(name: 'pending_qty_to_inward') double? pendingQty,
    @AssetnumberConvertor()
    @JsonKey(name: 'exp_date') String? expiryDate,
    

  }) = _ItemsForm;

  factory ItemsForm.fromJson(Map<String, dynamic> json) =>
      _$ItemsFormFromJson(json);

  static Map<String, dynamic> toEncodedFormJson(final ItemsForm form) {
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
