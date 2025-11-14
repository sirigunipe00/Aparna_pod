import 'dart:io';

import 'package:aparna_pod/features/outward_gate_pass/model/items_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inward_form.freezed.dart';
part 'inward_form.g.dart';

@freezed
class InwardForm with _$InwardForm {
  const factory InwardForm({
    String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
    @JsonKey(name: 'modified') String? modifiedDate,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'docstatus') int? docstatus,
    @JsonKey(name: 'plant_name') String? plantName,
    @JsonKey(name: 'gate_pass_type') String? gatePassType,
    @JsonKey(name: 'gate_pass_date') String? gatePassDate,
    @JsonKey(name: 'gate_pass_time') String? gatePassTime,
    @JsonKey(name: 'authorised_by') String? authorisedBy,
    @JsonKey(name: 'vehicle_type') String? vehicleType,
    @JsonKey(name: 'vehicle_number') String? vehicleNumber,
    @JsonKey(name: 'driver_mobile_number') String? driverMobileNumber,
    @JsonKey(name: 'remarks') String? remarks,
    @JsonKey(name: 'outward_no') String? outwardNo,
    @JsonKey(name: 'outward_date') String? outwardDate,
    @JsonKey(name: 'is_manual_vendorcustomer') int? ismanualvendor,
    @JsonKey(name: 'vendorcustomer') String? vendorcustomer,
    @JsonKey(name: 'vendorcustomer_records') String? vendorRecords,
    @JsonKey(name: 'vendorcustomer_manual') String? vendorCustomerManual,
    @JsonKey(name: 'vendorcustomer_manual_address') String? vendorAddress,
    @JsonKey(includeToJson: false, includeFromJson: false) File? gatePassImg,
    @JsonKey(name: 'gatepass_image') String? gatePassPhoto,
    @JsonKey(name: 'amended_from') String? amendedFrom,  
    @JsonKey(name: 'inward_gatepass_items',defaultValue: []) required  List<ItemsForm> items,
    @JsonKey(name: 'inward_gate_pass_items',defaultValue: []) required  List<ItemsForm> itemsLines,
    @Default(<String>[]) @JsonKey(includeFromJson: false, includeToJson: false) List<String> deletedLines,

    // @Default(<String>[])
    // @JsonKey(includeFromJson: false, includeToJson: false)
    // List<String> deletedLines,
  }) = _InwardForm;

  factory InwardForm.fromJson(Map<String, Object?> json) =>
      _$InwardFormFromJson(json);

    static Map<String, dynamic> toEncodedFormJson(final InwardForm form) {
    final json = form.toJson();

    return json;
  }
}
