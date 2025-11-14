// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_name_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialNameFormImpl _$$MaterialNameFormImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialNameFormImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      uom: json['stock_uom'] as String?,
      itemName: json['item_name'] as String?,
    );

Map<String, dynamic> _$$MaterialNameFormImplToJson(
        _$MaterialNameFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'stock_uom': instance.uom,
      'item_name': instance.itemName,
    };
