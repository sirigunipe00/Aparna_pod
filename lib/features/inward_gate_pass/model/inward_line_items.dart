import 'package:freezed_annotation/freezed_annotation.dart';

part 'inward_line_items.freezed.dart';
part 'inward_line_items.g.dart';

@freezed
class InwardLineItems with _$InwardLineItems {
  const factory InwardLineItems({
    @JsonKey(name: 'is_manual_item') int? isManualItem,
    @JsonKey(name: 'manual_item_code') String? manualItemCode,
    @JsonKey(name: 'manual_item_name') String? manualItemName,
    @JsonKey(name: 'docstatus') int? docStatus,
    @JsonKey(name: 'item_code') String? itemCode,
    @JsonKey(name: 'item_name') String? itemName,
    @JsonKey(name: 'quantity') double? quantity,
    @JsonKey(name: 'uom') String? uom,
    @JsonKey(name: 'value') double? value,
    @AssetnumberConvertor()
    @JsonKey(name: 'exp_date') String? expiryDate,
    @JsonKey(name: 'pending_qty_to_inward') String? pendingQty,

    

  }) = _InwardLineItems;

  factory InwardLineItems.fromJson(Map<String, dynamic> json) =>
      _$InwardLineItemsFromJson(json);

  static Map<String, dynamic> toEncodedFormJson(final InwardLineItems form) {
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
