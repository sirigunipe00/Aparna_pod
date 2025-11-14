import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gate_exit_form.freezed.dart';
part 'gate_exit_form.g.dart';

@freezed
class GateExitForm with _$GateExitForm {
  const factory GateExitForm({
    String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
    @JsonKey(name: 'modified') String? modifiedDate,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'docstatus') int? docstatus,
    @JsonKey(name: 'gate_exit_time') String? exitTime,
    @JsonKey(name: 'plant_name') String? plantName,
    @JsonKey(name: 'gate_exit_type') String? exitType,
    @JsonKey(name: 'gate_exit_date') String? exitDate,
    @JsonKey(name : 'expected_return_date') String? expectedReturnDate,
    @JsonKey(name: 'sender_employee_name') String? senderEmployeeName,
    @JsonKey(name: 'sender_employee_id') String? senderEmployeeId,
    @JsonKey(name: 'sender_email') String? senderEmail,
    @JsonKey(name: 'sender_mobile_no') String? senderMobileNo,
    @JsonKey(name: 'gstin') String? gstin,
    @JsonKey(name: 'customerreceiver_name') String? customerReceiverName,
    @JsonKey(name: 'customerreceiver__address') String? customerReceiverAddress,
    @JsonKey(name: 'po_number') String? poNumber,
    @JsonKey(name: 'is_eway_bill') int? isewayBill,
    @JsonKey(name: 'eway_bill') String? ewayBill,
    @JsonKey(name: 'challan_number') String? challanNumber,
    @JsonKey(name: 'people_count', defaultValue: 0) int? peopleCount,
    @JsonKey(name: 'vehicle_type') String? vehicleType,
    @JsonKey(name: 'vehicle_number') String? vehicleNumber,
    @JsonKey(name: 'driver_name') String? driverName,
    @JsonKey(name: 'driver_mobile_number') String? driverMobileNumber,
    @JsonKey(name: 'weighment_slip_token_no') String? weightSlipNo,
    @JsonKey(name: 'weight__in_kgs_', defaultValue: 0.0) double? weight,
    @JsonKey(name: 'weighment_date') String? weighmentDate,
    @JsonKey(name: 'weighment_time') String? weighmentTime,
    @JsonKey(includeToJson: false, includeFromJson: false)
    File? licensePhotoImg,
    @JsonKey(name: 'drivers_license_photo') String? licensePhoto,
    @JsonKey(includeToJson: false, includeFromJson: false)
    File? vehiclePhotoImg,
    @JsonKey(name: 'vehicle_image') String? vehiclePhoto,
    @JsonKey(includeToJson: false, includeFromJson: false) File? sealPhotoImg,
    @JsonKey(name: 'seal_photo') String? sealPhoto,
    @JsonKey(includeToJson: false, includeFromJson: false)
    File? breathAnalyserImg,
    @JsonKey(name: 'breath_analyser') String? breathAnalyser,
    @Default([]) @JsonKey(includeToJson: false, includeFromJson: false) List<File> invoiceImg,
    @JsonKey(name: 'invoicedc_image_ocr_scanning') String? invoice,
    @JsonKey(name: 'remark') String? remarks,
    @JsonKey(name: 'amended_from') String? amendedFrom,
    @JsonKey(name: 'total_amount') double? totalAmount,
    @Default(<String>[]) @JsonKey(includeFromJson: false, includeToJson: false) List<String> addInvs,
    @Default(<String>[]) @JsonKey(includeFromJson: false, includeToJson: false) List<String> deletedLines,
  }) = _GateExitForm;

  factory GateExitForm.fromJson(Map<String, Object?> json) =>
      _$GateExitFormFromJson(json);
}
