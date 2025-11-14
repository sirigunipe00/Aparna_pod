// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gate_entry_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GateEntryForm _$GateEntryFormFromJson(Map<String, dynamic> json) {
  return _GateEntryForm.fromJson(json);
}

/// @nodoc
mixin _$GateEntryForm {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation', defaultValue: '')
  String? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'plant_name')
  String? get plantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_entry_type')
  String? get entryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_type')
  String? get materialType => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String? get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_entry_time')
  String? get entryTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_address')
  String? get supplierAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_address_copy')
  String? get customerAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'expected_return_date')
  String? get expectedReturnDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_mobile_no')
  String? get senderMobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_name')
  String? get receiverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_department')
  String? get receiverDept => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_email')
  String? get receiverEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiver_mobile_number')
  String? get receiverMobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'po_number')
  String? get poNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_eway_bill', defaultValue: 0)
  int? get isewayBill => throw _privateConstructorUsedError;
  @JsonKey(name: 'eway_bill')
  String? get ewayBill => throw _privateConstructorUsedError;
  @JsonKey(name: 'challan_number')
  String? get challanNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'people_count')
  int? get peopleCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_type')
  String? get vehicleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_number')
  String? get vehicleNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_name')
  String? get driverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_mobile_number')
  String? get drivermobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'weighment_slip_token_no')
  String? get weightSlipNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight__in_kgs_')
  double? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'weighment_date')
  String? get weighmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'weighment_time')
  String? get weighmentTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'commentremark')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'docstatus')
  int? get docStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_name')
  String? get senderName => throw _privateConstructorUsedError;
  @JsonKey(name: 'drivers_license_photo')
  String? get driversLicensePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_image')
  String? get vehicleImg => throw _privateConstructorUsedError;
  @JsonKey(name: 'seal_photo')
  String? get sealPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'breath_analyser')
  String? get breathAnalyser => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoicedc_image_ocr_scanning')
  String? get ocrScanning => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get licensePhotoImg => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehiclePhotoImg => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get sealPhotoImg => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get breathAnalyserImg => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  List<File> get invoiceImg => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get addInvs => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get deletedLines => throw _privateConstructorUsedError;

  /// Serializes this GateEntryForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GateEntryForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GateEntryFormCopyWith<GateEntryForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GateEntryFormCopyWith<$Res> {
  factory $GateEntryFormCopyWith(
          GateEntryForm value, $Res Function(GateEntryForm) then) =
      _$GateEntryFormCopyWithImpl<$Res, GateEntryForm>;
  @useResult
  $Res call(
      {String? status,
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
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      List<File> invoiceImg,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<String> addInvs,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<String> deletedLines});
}

/// @nodoc
class _$GateEntryFormCopyWithImpl<$Res, $Val extends GateEntryForm>
    implements $GateEntryFormCopyWith<$Res> {
  _$GateEntryFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GateEntryForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? creationDate = freezed,
    Object? plantName = freezed,
    Object? entryType = freezed,
    Object? materialType = freezed,
    Object? supplierName = freezed,
    Object? entryTime = freezed,
    Object? customerName = freezed,
    Object? supplierAddress = freezed,
    Object? customerAddress = freezed,
    Object? expectedReturnDate = freezed,
    Object? senderMobileNo = freezed,
    Object? receiverName = freezed,
    Object? receiverDept = freezed,
    Object? receiverEmail = freezed,
    Object? receiverMobile = freezed,
    Object? poNumber = freezed,
    Object? isewayBill = freezed,
    Object? ewayBill = freezed,
    Object? challanNumber = freezed,
    Object? peopleCount = freezed,
    Object? vehicleType = freezed,
    Object? vehicleNumber = freezed,
    Object? driverName = freezed,
    Object? drivermobileNo = freezed,
    Object? weightSlipNo = freezed,
    Object? weight = freezed,
    Object? weighmentDate = freezed,
    Object? weighmentTime = freezed,
    Object? remarks = freezed,
    Object? docStatus = freezed,
    Object? senderName = freezed,
    Object? driversLicensePhoto = freezed,
    Object? vehicleImg = freezed,
    Object? sealPhoto = freezed,
    Object? breathAnalyser = freezed,
    Object? ocrScanning = freezed,
    Object? totalAmount = freezed,
    Object? licensePhotoImg = freezed,
    Object? vehiclePhotoImg = freezed,
    Object? sealPhotoImg = freezed,
    Object? breathAnalyserImg = freezed,
    Object? invoiceImg = null,
    Object? addInvs = null,
    Object? deletedLines = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      plantName: freezed == plantName
          ? _value.plantName
          : plantName // ignore: cast_nullable_to_non_nullable
              as String?,
      entryType: freezed == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String?,
      materialType: freezed == materialType
          ? _value.materialType
          : materialType // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      entryTime: freezed == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierAddress: freezed == supplierAddress
          ? _value.supplierAddress
          : supplierAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      customerAddress: freezed == customerAddress
          ? _value.customerAddress
          : customerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedReturnDate: freezed == expectedReturnDate
          ? _value.expectedReturnDate
          : expectedReturnDate // ignore: cast_nullable_to_non_nullable
              as String?,
      senderMobileNo: freezed == senderMobileNo
          ? _value.senderMobileNo
          : senderMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverName: freezed == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverDept: freezed == receiverDept
          ? _value.receiverDept
          : receiverDept // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverEmail: freezed == receiverEmail
          ? _value.receiverEmail
          : receiverEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverMobile: freezed == receiverMobile
          ? _value.receiverMobile
          : receiverMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      poNumber: freezed == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isewayBill: freezed == isewayBill
          ? _value.isewayBill
          : isewayBill // ignore: cast_nullable_to_non_nullable
              as int?,
      ewayBill: freezed == ewayBill
          ? _value.ewayBill
          : ewayBill // ignore: cast_nullable_to_non_nullable
              as String?,
      challanNumber: freezed == challanNumber
          ? _value.challanNumber
          : challanNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      peopleCount: freezed == peopleCount
          ? _value.peopleCount
          : peopleCount // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      drivermobileNo: freezed == drivermobileNo
          ? _value.drivermobileNo
          : drivermobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      weightSlipNo: freezed == weightSlipNo
          ? _value.weightSlipNo
          : weightSlipNo // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      weighmentDate: freezed == weighmentDate
          ? _value.weighmentDate
          : weighmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      weighmentTime: freezed == weighmentTime
          ? _value.weighmentTime
          : weighmentTime // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: freezed == docStatus
          ? _value.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      driversLicensePhoto: freezed == driversLicensePhoto
          ? _value.driversLicensePhoto
          : driversLicensePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleImg: freezed == vehicleImg
          ? _value.vehicleImg
          : vehicleImg // ignore: cast_nullable_to_non_nullable
              as String?,
      sealPhoto: freezed == sealPhoto
          ? _value.sealPhoto
          : sealPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      breathAnalyser: freezed == breathAnalyser
          ? _value.breathAnalyser
          : breathAnalyser // ignore: cast_nullable_to_non_nullable
              as String?,
      ocrScanning: freezed == ocrScanning
          ? _value.ocrScanning
          : ocrScanning // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      licensePhotoImg: freezed == licensePhotoImg
          ? _value.licensePhotoImg
          : licensePhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      vehiclePhotoImg: freezed == vehiclePhotoImg
          ? _value.vehiclePhotoImg
          : vehiclePhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      sealPhotoImg: freezed == sealPhotoImg
          ? _value.sealPhotoImg
          : sealPhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      breathAnalyserImg: freezed == breathAnalyserImg
          ? _value.breathAnalyserImg
          : breathAnalyserImg // ignore: cast_nullable_to_non_nullable
              as File?,
      invoiceImg: null == invoiceImg
          ? _value.invoiceImg
          : invoiceImg // ignore: cast_nullable_to_non_nullable
              as List<File>,
      addInvs: null == addInvs
          ? _value.addInvs
          : addInvs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      deletedLines: null == deletedLines
          ? _value.deletedLines
          : deletedLines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GateEntryFormImplCopyWith<$Res>
    implements $GateEntryFormCopyWith<$Res> {
  factory _$$GateEntryFormImplCopyWith(
          _$GateEntryFormImpl value, $Res Function(_$GateEntryFormImpl) then) =
      __$$GateEntryFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
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
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      List<File> invoiceImg,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<String> addInvs,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<String> deletedLines});
}

/// @nodoc
class __$$GateEntryFormImplCopyWithImpl<$Res>
    extends _$GateEntryFormCopyWithImpl<$Res, _$GateEntryFormImpl>
    implements _$$GateEntryFormImplCopyWith<$Res> {
  __$$GateEntryFormImplCopyWithImpl(
      _$GateEntryFormImpl _value, $Res Function(_$GateEntryFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of GateEntryForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? creationDate = freezed,
    Object? plantName = freezed,
    Object? entryType = freezed,
    Object? materialType = freezed,
    Object? supplierName = freezed,
    Object? entryTime = freezed,
    Object? customerName = freezed,
    Object? supplierAddress = freezed,
    Object? customerAddress = freezed,
    Object? expectedReturnDate = freezed,
    Object? senderMobileNo = freezed,
    Object? receiverName = freezed,
    Object? receiverDept = freezed,
    Object? receiverEmail = freezed,
    Object? receiverMobile = freezed,
    Object? poNumber = freezed,
    Object? isewayBill = freezed,
    Object? ewayBill = freezed,
    Object? challanNumber = freezed,
    Object? peopleCount = freezed,
    Object? vehicleType = freezed,
    Object? vehicleNumber = freezed,
    Object? driverName = freezed,
    Object? drivermobileNo = freezed,
    Object? weightSlipNo = freezed,
    Object? weight = freezed,
    Object? weighmentDate = freezed,
    Object? weighmentTime = freezed,
    Object? remarks = freezed,
    Object? docStatus = freezed,
    Object? senderName = freezed,
    Object? driversLicensePhoto = freezed,
    Object? vehicleImg = freezed,
    Object? sealPhoto = freezed,
    Object? breathAnalyser = freezed,
    Object? ocrScanning = freezed,
    Object? totalAmount = freezed,
    Object? licensePhotoImg = freezed,
    Object? vehiclePhotoImg = freezed,
    Object? sealPhotoImg = freezed,
    Object? breathAnalyserImg = freezed,
    Object? invoiceImg = null,
    Object? addInvs = null,
    Object? deletedLines = null,
  }) {
    return _then(_$GateEntryFormImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      plantName: freezed == plantName
          ? _value.plantName
          : plantName // ignore: cast_nullable_to_non_nullable
              as String?,
      entryType: freezed == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String?,
      materialType: freezed == materialType
          ? _value.materialType
          : materialType // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      entryTime: freezed == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierAddress: freezed == supplierAddress
          ? _value.supplierAddress
          : supplierAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      customerAddress: freezed == customerAddress
          ? _value.customerAddress
          : customerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedReturnDate: freezed == expectedReturnDate
          ? _value.expectedReturnDate
          : expectedReturnDate // ignore: cast_nullable_to_non_nullable
              as String?,
      senderMobileNo: freezed == senderMobileNo
          ? _value.senderMobileNo
          : senderMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverName: freezed == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverDept: freezed == receiverDept
          ? _value.receiverDept
          : receiverDept // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverEmail: freezed == receiverEmail
          ? _value.receiverEmail
          : receiverEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverMobile: freezed == receiverMobile
          ? _value.receiverMobile
          : receiverMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      poNumber: freezed == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isewayBill: freezed == isewayBill
          ? _value.isewayBill
          : isewayBill // ignore: cast_nullable_to_non_nullable
              as int?,
      ewayBill: freezed == ewayBill
          ? _value.ewayBill
          : ewayBill // ignore: cast_nullable_to_non_nullable
              as String?,
      challanNumber: freezed == challanNumber
          ? _value.challanNumber
          : challanNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      peopleCount: freezed == peopleCount
          ? _value.peopleCount
          : peopleCount // ignore: cast_nullable_to_non_nullable
              as int?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      drivermobileNo: freezed == drivermobileNo
          ? _value.drivermobileNo
          : drivermobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      weightSlipNo: freezed == weightSlipNo
          ? _value.weightSlipNo
          : weightSlipNo // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      weighmentDate: freezed == weighmentDate
          ? _value.weighmentDate
          : weighmentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      weighmentTime: freezed == weighmentTime
          ? _value.weighmentTime
          : weighmentTime // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: freezed == docStatus
          ? _value.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      senderName: freezed == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String?,
      driversLicensePhoto: freezed == driversLicensePhoto
          ? _value.driversLicensePhoto
          : driversLicensePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleImg: freezed == vehicleImg
          ? _value.vehicleImg
          : vehicleImg // ignore: cast_nullable_to_non_nullable
              as String?,
      sealPhoto: freezed == sealPhoto
          ? _value.sealPhoto
          : sealPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      breathAnalyser: freezed == breathAnalyser
          ? _value.breathAnalyser
          : breathAnalyser // ignore: cast_nullable_to_non_nullable
              as String?,
      ocrScanning: freezed == ocrScanning
          ? _value.ocrScanning
          : ocrScanning // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      licensePhotoImg: freezed == licensePhotoImg
          ? _value.licensePhotoImg
          : licensePhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      vehiclePhotoImg: freezed == vehiclePhotoImg
          ? _value.vehiclePhotoImg
          : vehiclePhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      sealPhotoImg: freezed == sealPhotoImg
          ? _value.sealPhotoImg
          : sealPhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      breathAnalyserImg: freezed == breathAnalyserImg
          ? _value.breathAnalyserImg
          : breathAnalyserImg // ignore: cast_nullable_to_non_nullable
              as File?,
      invoiceImg: null == invoiceImg
          ? _value._invoiceImg
          : invoiceImg // ignore: cast_nullable_to_non_nullable
              as List<File>,
      addInvs: null == addInvs
          ? _value._addInvs
          : addInvs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      deletedLines: null == deletedLines
          ? _value._deletedLines
          : deletedLines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GateEntryFormImpl implements _GateEntryForm {
  const _$GateEntryFormImpl(
      {this.status,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'creation', defaultValue: '') this.creationDate,
      @JsonKey(name: 'plant_name') this.plantName,
      @JsonKey(name: 'gate_entry_type') this.entryType,
      @JsonKey(name: 'material_type') this.materialType,
      @JsonKey(name: 'supplier_name') this.supplierName,
      @JsonKey(name: 'gate_entry_time') this.entryTime,
      @JsonKey(name: 'customer_name') this.customerName,
      @JsonKey(name: 'sender_address') this.supplierAddress,
      @JsonKey(name: 'sender_address_copy') this.customerAddress,
      @JsonKey(name: 'expected_return_date') this.expectedReturnDate,
      @JsonKey(name: 'sender_mobile_no') this.senderMobileNo,
      @JsonKey(name: 'receiver_name') this.receiverName,
      @JsonKey(name: 'receiver_department') this.receiverDept,
      @JsonKey(name: 'receiver_email') this.receiverEmail,
      @JsonKey(name: 'receiver_mobile_number') this.receiverMobile,
      @JsonKey(name: 'po_number') this.poNumber,
      @JsonKey(name: 'is_eway_bill', defaultValue: 0) this.isewayBill,
      @JsonKey(name: 'eway_bill') this.ewayBill,
      @JsonKey(name: 'challan_number') this.challanNumber,
      @JsonKey(name: 'people_count') this.peopleCount,
      @JsonKey(name: 'vehicle_type') this.vehicleType,
      @JsonKey(name: 'vehicle_number') this.vehicleNumber,
      @JsonKey(name: 'driver_name') this.driverName,
      @JsonKey(name: 'driver_mobile_number') this.drivermobileNo,
      @JsonKey(name: 'weighment_slip_token_no') this.weightSlipNo,
      @JsonKey(name: 'weight__in_kgs_') this.weight,
      @JsonKey(name: 'weighment_date') this.weighmentDate,
      @JsonKey(name: 'weighment_time') this.weighmentTime,
      @JsonKey(name: 'commentremark') this.remarks,
      @JsonKey(name: 'docstatus') this.docStatus,
      @JsonKey(name: 'sender_name') this.senderName,
      @JsonKey(name: 'drivers_license_photo') this.driversLicensePhoto,
      @JsonKey(name: 'vehicle_image') this.vehicleImg,
      @JsonKey(name: 'seal_photo') this.sealPhoto,
      @JsonKey(name: 'breath_analyser') this.breathAnalyser,
      @JsonKey(name: 'invoicedc_image_ocr_scanning') this.ocrScanning,
      @JsonKey(name: 'total_amount') this.totalAmount,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.licensePhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.vehiclePhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.sealPhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.breathAnalyserImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final List<File> invoiceImg = const [],
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<String> addInvs = const <String>[],
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<String> deletedLines = const <String>[]})
      : _invoiceImg = invoiceImg,
        _addInvs = addInvs,
        _deletedLines = deletedLines;

  factory _$GateEntryFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$GateEntryFormImplFromJson(json);

  @override
  final String? status;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'creation', defaultValue: '')
  final String? creationDate;
  @override
  @JsonKey(name: 'plant_name')
  final String? plantName;
  @override
  @JsonKey(name: 'gate_entry_type')
  final String? entryType;
  @override
  @JsonKey(name: 'material_type')
  final String? materialType;
  @override
  @JsonKey(name: 'supplier_name')
  final String? supplierName;
  @override
  @JsonKey(name: 'gate_entry_time')
  final String? entryTime;
  @override
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @override
  @JsonKey(name: 'sender_address')
  final String? supplierAddress;
  @override
  @JsonKey(name: 'sender_address_copy')
  final String? customerAddress;
  @override
  @JsonKey(name: 'expected_return_date')
  final String? expectedReturnDate;
  @override
  @JsonKey(name: 'sender_mobile_no')
  final String? senderMobileNo;
  @override
  @JsonKey(name: 'receiver_name')
  final String? receiverName;
  @override
  @JsonKey(name: 'receiver_department')
  final String? receiverDept;
  @override
  @JsonKey(name: 'receiver_email')
  final String? receiverEmail;
  @override
  @JsonKey(name: 'receiver_mobile_number')
  final String? receiverMobile;
  @override
  @JsonKey(name: 'po_number')
  final String? poNumber;
  @override
  @JsonKey(name: 'is_eway_bill', defaultValue: 0)
  final int? isewayBill;
  @override
  @JsonKey(name: 'eway_bill')
  final String? ewayBill;
  @override
  @JsonKey(name: 'challan_number')
  final String? challanNumber;
  @override
  @JsonKey(name: 'people_count')
  final int? peopleCount;
  @override
  @JsonKey(name: 'vehicle_type')
  final String? vehicleType;
  @override
  @JsonKey(name: 'vehicle_number')
  final String? vehicleNumber;
  @override
  @JsonKey(name: 'driver_name')
  final String? driverName;
  @override
  @JsonKey(name: 'driver_mobile_number')
  final String? drivermobileNo;
  @override
  @JsonKey(name: 'weighment_slip_token_no')
  final String? weightSlipNo;
  @override
  @JsonKey(name: 'weight__in_kgs_')
  final double? weight;
  @override
  @JsonKey(name: 'weighment_date')
  final String? weighmentDate;
  @override
  @JsonKey(name: 'weighment_time')
  final String? weighmentTime;
  @override
  @JsonKey(name: 'commentremark')
  final String? remarks;
  @override
  @JsonKey(name: 'docstatus')
  final int? docStatus;
  @override
  @JsonKey(name: 'sender_name')
  final String? senderName;
  @override
  @JsonKey(name: 'drivers_license_photo')
  final String? driversLicensePhoto;
  @override
  @JsonKey(name: 'vehicle_image')
  final String? vehicleImg;
  @override
  @JsonKey(name: 'seal_photo')
  final String? sealPhoto;
  @override
  @JsonKey(name: 'breath_analyser')
  final String? breathAnalyser;
  @override
  @JsonKey(name: 'invoicedc_image_ocr_scanning')
  final String? ocrScanning;
  @override
  @JsonKey(name: 'total_amount')
  final double? totalAmount;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? licensePhotoImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? vehiclePhotoImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? sealPhotoImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? breathAnalyserImg;
  final List<File> _invoiceImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  List<File> get invoiceImg {
    if (_invoiceImg is EqualUnmodifiableListView) return _invoiceImg;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceImg);
  }

  final List<String> _addInvs;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get addInvs {
    if (_addInvs is EqualUnmodifiableListView) return _addInvs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addInvs);
  }

  final List<String> _deletedLines;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get deletedLines {
    if (_deletedLines is EqualUnmodifiableListView) return _deletedLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deletedLines);
  }

  @override
  String toString() {
    return 'GateEntryForm(status: $status, name: $name, creationDate: $creationDate, plantName: $plantName, entryType: $entryType, materialType: $materialType, supplierName: $supplierName, entryTime: $entryTime, customerName: $customerName, supplierAddress: $supplierAddress, customerAddress: $customerAddress, expectedReturnDate: $expectedReturnDate, senderMobileNo: $senderMobileNo, receiverName: $receiverName, receiverDept: $receiverDept, receiverEmail: $receiverEmail, receiverMobile: $receiverMobile, poNumber: $poNumber, isewayBill: $isewayBill, ewayBill: $ewayBill, challanNumber: $challanNumber, peopleCount: $peopleCount, vehicleType: $vehicleType, vehicleNumber: $vehicleNumber, driverName: $driverName, drivermobileNo: $drivermobileNo, weightSlipNo: $weightSlipNo, weight: $weight, weighmentDate: $weighmentDate, weighmentTime: $weighmentTime, remarks: $remarks, docStatus: $docStatus, senderName: $senderName, driversLicensePhoto: $driversLicensePhoto, vehicleImg: $vehicleImg, sealPhoto: $sealPhoto, breathAnalyser: $breathAnalyser, ocrScanning: $ocrScanning, totalAmount: $totalAmount, licensePhotoImg: $licensePhotoImg, vehiclePhotoImg: $vehiclePhotoImg, sealPhotoImg: $sealPhotoImg, breathAnalyserImg: $breathAnalyserImg, invoiceImg: $invoiceImg, addInvs: $addInvs, deletedLines: $deletedLines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GateEntryFormImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.plantName, plantName) ||
                other.plantName == plantName) &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.materialType, materialType) ||
                other.materialType == materialType) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.entryTime, entryTime) ||
                other.entryTime == entryTime) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.supplierAddress, supplierAddress) ||
                other.supplierAddress == supplierAddress) &&
            (identical(other.customerAddress, customerAddress) ||
                other.customerAddress == customerAddress) &&
            (identical(other.expectedReturnDate, expectedReturnDate) ||
                other.expectedReturnDate == expectedReturnDate) &&
            (identical(other.senderMobileNo, senderMobileNo) ||
                other.senderMobileNo == senderMobileNo) &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.receiverDept, receiverDept) ||
                other.receiverDept == receiverDept) &&
            (identical(other.receiverEmail, receiverEmail) ||
                other.receiverEmail == receiverEmail) &&
            (identical(other.receiverMobile, receiverMobile) ||
                other.receiverMobile == receiverMobile) &&
            (identical(other.poNumber, poNumber) ||
                other.poNumber == poNumber) &&
            (identical(other.isewayBill, isewayBill) ||
                other.isewayBill == isewayBill) &&
            (identical(other.ewayBill, ewayBill) ||
                other.ewayBill == ewayBill) &&
            (identical(other.challanNumber, challanNumber) ||
                other.challanNumber == challanNumber) &&
            (identical(other.peopleCount, peopleCount) ||
                other.peopleCount == peopleCount) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.drivermobileNo, drivermobileNo) ||
                other.drivermobileNo == drivermobileNo) &&
            (identical(other.weightSlipNo, weightSlipNo) ||
                other.weightSlipNo == weightSlipNo) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.weighmentDate, weighmentDate) ||
                other.weighmentDate == weighmentDate) &&
            (identical(other.weighmentTime, weighmentTime) ||
                other.weighmentTime == weighmentTime) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.docStatus, docStatus) ||
                other.docStatus == docStatus) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.driversLicensePhoto, driversLicensePhoto) ||
                other.driversLicensePhoto == driversLicensePhoto) &&
            (identical(other.vehicleImg, vehicleImg) ||
                other.vehicleImg == vehicleImg) &&
            (identical(other.sealPhoto, sealPhoto) ||
                other.sealPhoto == sealPhoto) &&
            (identical(other.breathAnalyser, breathAnalyser) ||
                other.breathAnalyser == breathAnalyser) &&
            (identical(other.ocrScanning, ocrScanning) ||
                other.ocrScanning == ocrScanning) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.licensePhotoImg, licensePhotoImg) ||
                other.licensePhotoImg == licensePhotoImg) &&
            (identical(other.vehiclePhotoImg, vehiclePhotoImg) ||
                other.vehiclePhotoImg == vehiclePhotoImg) &&
            (identical(other.sealPhotoImg, sealPhotoImg) ||
                other.sealPhotoImg == sealPhotoImg) &&
            (identical(other.breathAnalyserImg, breathAnalyserImg) ||
                other.breathAnalyserImg == breathAnalyserImg) &&
            const DeepCollectionEquality()
                .equals(other._invoiceImg, _invoiceImg) &&
            const DeepCollectionEquality().equals(other._addInvs, _addInvs) &&
            const DeepCollectionEquality()
                .equals(other._deletedLines, _deletedLines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        name,
        creationDate,
        plantName,
        entryType,
        materialType,
        supplierName,
        entryTime,
        customerName,
        supplierAddress,
        customerAddress,
        expectedReturnDate,
        senderMobileNo,
        receiverName,
        receiverDept,
        receiverEmail,
        receiverMobile,
        poNumber,
        isewayBill,
        ewayBill,
        challanNumber,
        peopleCount,
        vehicleType,
        vehicleNumber,
        driverName,
        drivermobileNo,
        weightSlipNo,
        weight,
        weighmentDate,
        weighmentTime,
        remarks,
        docStatus,
        senderName,
        driversLicensePhoto,
        vehicleImg,
        sealPhoto,
        breathAnalyser,
        ocrScanning,
        totalAmount,
        licensePhotoImg,
        vehiclePhotoImg,
        sealPhotoImg,
        breathAnalyserImg,
        const DeepCollectionEquality().hash(_invoiceImg),
        const DeepCollectionEquality().hash(_addInvs),
        const DeepCollectionEquality().hash(_deletedLines)
      ]);

  /// Create a copy of GateEntryForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GateEntryFormImplCopyWith<_$GateEntryFormImpl> get copyWith =>
      __$$GateEntryFormImplCopyWithImpl<_$GateEntryFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GateEntryFormImplToJson(
      this,
    );
  }
}

abstract class _GateEntryForm implements GateEntryForm {
  const factory _GateEntryForm(
      {final String? status,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'creation', defaultValue: '') final String? creationDate,
      @JsonKey(name: 'plant_name') final String? plantName,
      @JsonKey(name: 'gate_entry_type') final String? entryType,
      @JsonKey(name: 'material_type') final String? materialType,
      @JsonKey(name: 'supplier_name') final String? supplierName,
      @JsonKey(name: 'gate_entry_time') final String? entryTime,
      @JsonKey(name: 'customer_name') final String? customerName,
      @JsonKey(name: 'sender_address') final String? supplierAddress,
      @JsonKey(name: 'sender_address_copy') final String? customerAddress,
      @JsonKey(name: 'expected_return_date') final String? expectedReturnDate,
      @JsonKey(name: 'sender_mobile_no') final String? senderMobileNo,
      @JsonKey(name: 'receiver_name') final String? receiverName,
      @JsonKey(name: 'receiver_department') final String? receiverDept,
      @JsonKey(name: 'receiver_email') final String? receiverEmail,
      @JsonKey(name: 'receiver_mobile_number') final String? receiverMobile,
      @JsonKey(name: 'po_number') final String? poNumber,
      @JsonKey(name: 'is_eway_bill', defaultValue: 0) final int? isewayBill,
      @JsonKey(name: 'eway_bill') final String? ewayBill,
      @JsonKey(name: 'challan_number') final String? challanNumber,
      @JsonKey(name: 'people_count') final int? peopleCount,
      @JsonKey(name: 'vehicle_type') final String? vehicleType,
      @JsonKey(name: 'vehicle_number') final String? vehicleNumber,
      @JsonKey(name: 'driver_name') final String? driverName,
      @JsonKey(name: 'driver_mobile_number') final String? drivermobileNo,
      @JsonKey(name: 'weighment_slip_token_no') final String? weightSlipNo,
      @JsonKey(name: 'weight__in_kgs_') final double? weight,
      @JsonKey(name: 'weighment_date') final String? weighmentDate,
      @JsonKey(name: 'weighment_time') final String? weighmentTime,
      @JsonKey(name: 'commentremark') final String? remarks,
      @JsonKey(name: 'docstatus') final int? docStatus,
      @JsonKey(name: 'sender_name') final String? senderName,
      @JsonKey(name: 'drivers_license_photo') final String? driversLicensePhoto,
      @JsonKey(name: 'vehicle_image') final String? vehicleImg,
      @JsonKey(name: 'seal_photo') final String? sealPhoto,
      @JsonKey(name: 'breath_analyser') final String? breathAnalyser,
      @JsonKey(name: 'invoicedc_image_ocr_scanning') final String? ocrScanning,
      @JsonKey(name: 'total_amount') final double? totalAmount,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? licensePhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? vehiclePhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? sealPhotoImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? breathAnalyserImg,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final List<File> invoiceImg,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<String> addInvs,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<String> deletedLines}) = _$GateEntryFormImpl;

  factory _GateEntryForm.fromJson(Map<String, dynamic> json) =
      _$GateEntryFormImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'creation', defaultValue: '')
  String? get creationDate;
  @override
  @JsonKey(name: 'plant_name')
  String? get plantName;
  @override
  @JsonKey(name: 'gate_entry_type')
  String? get entryType;
  @override
  @JsonKey(name: 'material_type')
  String? get materialType;
  @override
  @JsonKey(name: 'supplier_name')
  String? get supplierName;
  @override
  @JsonKey(name: 'gate_entry_time')
  String? get entryTime;
  @override
  @JsonKey(name: 'customer_name')
  String? get customerName;
  @override
  @JsonKey(name: 'sender_address')
  String? get supplierAddress;
  @override
  @JsonKey(name: 'sender_address_copy')
  String? get customerAddress;
  @override
  @JsonKey(name: 'expected_return_date')
  String? get expectedReturnDate;
  @override
  @JsonKey(name: 'sender_mobile_no')
  String? get senderMobileNo;
  @override
  @JsonKey(name: 'receiver_name')
  String? get receiverName;
  @override
  @JsonKey(name: 'receiver_department')
  String? get receiverDept;
  @override
  @JsonKey(name: 'receiver_email')
  String? get receiverEmail;
  @override
  @JsonKey(name: 'receiver_mobile_number')
  String? get receiverMobile;
  @override
  @JsonKey(name: 'po_number')
  String? get poNumber;
  @override
  @JsonKey(name: 'is_eway_bill', defaultValue: 0)
  int? get isewayBill;
  @override
  @JsonKey(name: 'eway_bill')
  String? get ewayBill;
  @override
  @JsonKey(name: 'challan_number')
  String? get challanNumber;
  @override
  @JsonKey(name: 'people_count')
  int? get peopleCount;
  @override
  @JsonKey(name: 'vehicle_type')
  String? get vehicleType;
  @override
  @JsonKey(name: 'vehicle_number')
  String? get vehicleNumber;
  @override
  @JsonKey(name: 'driver_name')
  String? get driverName;
  @override
  @JsonKey(name: 'driver_mobile_number')
  String? get drivermobileNo;
  @override
  @JsonKey(name: 'weighment_slip_token_no')
  String? get weightSlipNo;
  @override
  @JsonKey(name: 'weight__in_kgs_')
  double? get weight;
  @override
  @JsonKey(name: 'weighment_date')
  String? get weighmentDate;
  @override
  @JsonKey(name: 'weighment_time')
  String? get weighmentTime;
  @override
  @JsonKey(name: 'commentremark')
  String? get remarks;
  @override
  @JsonKey(name: 'docstatus')
  int? get docStatus;
  @override
  @JsonKey(name: 'sender_name')
  String? get senderName;
  @override
  @JsonKey(name: 'drivers_license_photo')
  String? get driversLicensePhoto;
  @override
  @JsonKey(name: 'vehicle_image')
  String? get vehicleImg;
  @override
  @JsonKey(name: 'seal_photo')
  String? get sealPhoto;
  @override
  @JsonKey(name: 'breath_analyser')
  String? get breathAnalyser;
  @override
  @JsonKey(name: 'invoicedc_image_ocr_scanning')
  String? get ocrScanning;
  @override
  @JsonKey(name: 'total_amount')
  double? get totalAmount;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get licensePhotoImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get vehiclePhotoImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get sealPhotoImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get breathAnalyserImg;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  List<File> get invoiceImg;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get addInvs;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get deletedLines;

  /// Create a copy of GateEntryForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GateEntryFormImplCopyWith<_$GateEntryFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
