// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inward_line_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InwardLineItemsImpl _$$InwardLineItemsImplFromJson(
        Map<String, dynamic> json) =>
    _$InwardLineItemsImpl(
      isManualItem: (json['is_manual_item'] as num?)?.toInt(),
      manualItemCode: json['manual_item_code'] as String?,
      manualItemName: json['manual_item_name'] as String?,
      docStatus: (json['docstatus'] as num?)?.toInt(),
      itemCode: json['item_code'] as String?,
      itemName: json['item_name'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      uom: json['uom'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      expiryDate: json['exp_date'] as String?,
      pendingQty: json['pending_qty_to_inward'] as String?,
    );

Map<String, dynamic> _$$InwardLineItemsImplToJson(
        _$InwardLineItemsImpl instance) =>
    <String, dynamic>{
      'is_manual_item': instance.isManualItem,
      'manual_item_code': instance.manualItemCode,
      'manual_item_name': instance.manualItemName,
      'docstatus': instance.docStatus,
      'item_code': instance.itemCode,
      'item_name': instance.itemName,
      'quantity': instance.quantity,
      'uom': instance.uom,
      'value': instance.value,
      'exp_date': instance.expiryDate,
      'pending_qty_to_inward': instance.pendingQty,
    };
