import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gate_entry_form.freezed.dart';
part 'gate_entry_form.g.dart';

@freezed
class GateEntryForm with _$GateEntryForm {
  const factory GateEntryForm({
    String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
    @JsonKey(name: 'plant_name') String? plantName,
    @JsonKey(name: 'gate_entry_type') String? entryType,
    @JsonKey(name: 'material_type') String? materialType,
    @JsonKey(name: 'supplier_name') String? supplierName,
    @JsonKey(name: 'gate_entry_time') String? entryTime,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'sender_address') String? supplierAddress,
     @JsonKey(name: 'sender_address_copy') String? customerAddress,
    @JsonKey(name: 'expected_return_date') String? expectedReturnDate,
    @JsonKey(name: 'sender_mobile_no') String? senderMobileNo,
    @JsonKey(name: 'receiver_name') String? receiverName,
    @JsonKey(name: 'receiver_department') String? receiverDept,
    @JsonKey(name: 'receiver_email') String? receiverEmail,
    @JsonKey(name: 'receiver_mobile_number') String? receiverMobile,
    @JsonKey(name: 'po_number') String? poNumber,
    @JsonKey(name: 'is_eway_bill', defaultValue: 0) int? isewayBill,
    @JsonKey(name: 'eway_bill') String? ewayBill,
    @JsonKey(name: 'challan_number') String? challanNumber,
    @JsonKey(name: 'people_count') int? peopleCount,
    @JsonKey(name: 'vehicle_type') String? vehicleType,
    @JsonKey(name: 'vehicle_number') String? vehicleNumber,
    @JsonKey(name: 'driver_name') String? driverName,
    @JsonKey(name: 'driver_mobile_number') String? drivermobileNo,
    @JsonKey(name: 'weighment_slip_token_no') String? weightSlipNo,
    @JsonKey(name: 'weight__in_kgs_') double? weight,
    @JsonKey(name: 'weighment_date') String? weighmentDate,
    @JsonKey(name: 'weighment_time') String? weighmentTime,
    @JsonKey(name: 'commentremark') String? remarks,
    @JsonKey(name: 'docstatus') int? docStatus,
    @JsonKey(name: 'sender_name') String? senderName,
    @JsonKey(name: 'drivers_license_photo') String? driversLicensePhoto,
    @JsonKey(name: 'vehicle_image') String? vehicleImg,
    @JsonKey(name: 'seal_photo') String? sealPhoto,
    @JsonKey(name: 'breath_analyser') String? breathAnalyser,
    @JsonKey(name: 'invoicedc_image_ocr_scanning') String? ocrScanning,
    @JsonKey(name: 'total_amount') double? totalAmount,
    @JsonKey(
        includeFromJson: true,
        includeToJson: false,
        toJson: toNull,
        fromJson: toNull)
    File? licensePhotoImg,
    @JsonKey(
        includeFromJson: true,
        includeToJson: false,
        toJson: toNull,
        fromJson: toNull)
    File? vehiclePhotoImg,
    @JsonKey(
        includeFromJson: true,
        includeToJson: false,
        toJson: toNull,
        fromJson: toNull)
    File? sealPhotoImg,
    @JsonKey(
        includeFromJson: true,
        includeToJson: false,
        toJson: toNull,
        fromJson: toNull)
    File? breathAnalyserImg,
    @Default([]) @JsonKey(
        includeFromJson: true,
        includeToJson: false,
        toJson: toNull,
        fromJson: toNull)
    List<File> invoiceImg,
    @Default(<String>[]) @JsonKey(includeFromJson: false, includeToJson: false) List<String> addInvs,
    @Default(<String>[]) @JsonKey(includeFromJson: false, includeToJson: false) List<String> deletedLines,
  }) = _GateEntryForm;

  factory GateEntryForm.fromJson(Map<String, dynamic> json) =>
      _$GateEntryFormFromJson(json);
}

dynamic toNull(_) => null;
