import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pod_upload_form.freezed.dart';
part 'pod_upload_form.g.dart';

@freezed
class PodUploadForm with _$PodUploadForm {
  const factory PodUploadForm({
    @JsonKey(name: 'creation') String? creation,
    @JsonKey(name: 'docstatus') int? docStatus,
    @JsonKey(name: 'name') String? name,

    @JsonKey(name: "plant_code") String? plantCode,
    @JsonKey(name: "date") String? invoiceDate,
    @JsonKey(name: "sap_no") String? sapNo,
    @JsonKey(name: "invoice_no") String? invoiceNo,
    @JsonKey(name: "delivery_challan_no") String? deliveryChallanNo,

    @JsonKey(name: "files") List<Map<String, dynamic>>? files,

    @JsonKey(includeToJson: false, includeFromJson: false)
    List<File>? invoiceFiles,
  }) = _PodUploadForm;

  factory PodUploadForm.fromJson(Map<String, dynamic> json) =>
      _$PodUploadFormFromJson(json);
}
