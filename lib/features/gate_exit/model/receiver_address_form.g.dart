// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver_address_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiverAddressFormImpl _$$ReceiverAddressFormImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiverAddressFormImpl(
      name: json['name'] as String,
      addressTitle: json['address_title'] as String,
      addressType: json['address_type'] as String,
      city: json['city'] as String?,
      pincode: json['pincode'] as String?,
      parent: json['parent'] as String?,
      line1: json['address_line1'] as String?,
      line2: json['address_line2'] as String?,
    );

Map<String, dynamic> _$$ReceiverAddressFormImplToJson(
        _$ReceiverAddressFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address_title': instance.addressTitle,
      'address_type': instance.addressType,
      'city': instance.city,
      'pincode': instance.pincode,
      'parent': instance.parent,
      'address_line1': instance.line1,
      'address_line2': instance.line2,
    };
