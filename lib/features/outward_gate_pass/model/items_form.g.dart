// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemsFormImpl _$$ItemsFormImplFromJson(Map<String, dynamic> json) =>
    _$ItemsFormImpl(
      name: json['name'] as String?,
      docStatus: (json['docstatus'] as num?)?.toInt(),
      isManualItem: (json['is_manual_item'] as num?)?.toInt(),
      manualItemCode: json['manual_item_code'] as String?,
      manualItemName: json['manual_item_name'] as String?,
      itemCode: json['item_code'] as String?,
      itemName: json['item_name'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      uom: json['uom'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      pendingQty: (json['pending_qty_to_inward'] as num?)?.toDouble(),
      expiryDate: json['exp_date'] as String?,
    );

Map<String, dynamic> _$$ItemsFormImplToJson(_$ItemsFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'docstatus': instance.docStatus,
      'is_manual_item': instance.isManualItem,
      'manual_item_code': instance.manualItemCode,
      'manual_item_name': instance.manualItemName,
      'item_code': instance.itemCode,
      'item_name': instance.itemName,
      'quantity': instance.quantity,
      'uom': instance.uom,
      'value': instance.value,
      'pending_qty_to_inward': instance.pendingQty,
      'exp_date': instance.expiryDate,
    };
