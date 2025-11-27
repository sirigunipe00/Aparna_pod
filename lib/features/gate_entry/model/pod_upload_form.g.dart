// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pod_upload_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PodUploadFormImpl _$$PodUploadFormImplFromJson(Map<String, dynamic> json) =>
    _$PodUploadFormImpl(
      creation: json['creation'] as String?,
      docStatus: (json['docstatus'] as num?)?.toInt(),
      name: json['name'] as String?,
      plantCode: json['plant_code'] as String?,
      invoiceDate: json['date'] as String?,
      sapNo: json['sap_no'] as String?,
      invoiceNo: json['invoice_no'] as String?,
      deliveryChallanNo: json['delivery_challan_no'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$PodUploadFormImplToJson(_$PodUploadFormImpl instance) =>
    <String, dynamic>{
      'creation': instance.creation,
      'docstatus': instance.docStatus,
      'name': instance.name,
      'plant_code': instance.plantCode,
      'date': instance.invoiceDate,
      'sap_no': instance.sapNo,
      'invoice_no': instance.invoiceNo,
      'delivery_challan_no': instance.deliveryChallanNo,
      'files': instance.files,
    };
