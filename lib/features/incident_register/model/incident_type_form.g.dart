// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_type_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncidentTypeFormImpl _$$IncidentTypeFormImplFromJson(
        Map<String, dynamic> json) =>
    _$IncidentTypeFormImpl(
      name: json['name'] as String,
      city: json['city'] as String?,
      pincode: json['pincode'] as String?,
      line1: json['address_line1'] as String?,
      line2: json['address_line2'] as String?,
    );

Map<String, dynamic> _$$IncidentTypeFormImplToJson(
        _$IncidentTypeFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'pincode': instance.pincode,
      'address_line1': instance.line1,
      'address_line2': instance.line2,
    };
