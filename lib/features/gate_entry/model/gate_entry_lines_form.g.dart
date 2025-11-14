// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate_entry_lines_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GateEntryLinesFormImpl _$$GateEntryLinesFormImplFromJson(
        Map<String, dynamic> json) =>
    _$GateEntryLinesFormImpl(
      name: json['name'] as String?,
      docStatus: (json['docstatus'] as num?)?.toInt(),
      materialName: json['material_name'] as String?,
      serialNumber: json['serial_no'] as String?,
      assetNumber: _$JsonConverterFromJson<Object, int>(
          json['asset_no'], const AssetnumberConvertor().fromJson),
      quantity: (json['qty'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      oums: json['uom'] as String?,
      isreturn: (json['is_return'] as num?)?.toInt(),
      parentName: json['parent'] as String?,
      trackingId: json['tracking_id'] as String?,
    );

Map<String, dynamic> _$$GateEntryLinesFormImplToJson(
        _$GateEntryLinesFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'docstatus': instance.docStatus,
      'material_name': instance.materialName,
      'serial_no': instance.serialNumber,
      'asset_no': _$JsonConverterToJson<Object, int>(
          instance.assetNumber, const AssetnumberConvertor().toJson),
      'qty': instance.quantity,
      'amount': instance.amount,
      'uom': instance.oums,
      'is_return': instance.isreturn,
      'parent': instance.parentName,
      'tracking_id': instance.trackingId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
