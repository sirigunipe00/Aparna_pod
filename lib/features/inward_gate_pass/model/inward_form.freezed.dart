// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inward_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InwardForm _$InwardFormFromJson(Map<String, dynamic> json) {
  return _InwardForm.fromJson(json);
}

/// @nodoc
mixin _$InwardForm {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner')
  String? get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation', defaultValue: '')
  String? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified')
  String? get modifiedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_by')
  String? get modifiedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'docstatus')
  int? get docstatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'plant_name')
  String? get plantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_pass_type')
  String? get gatePassType => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_pass_date')
  String? get gatePassDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_pass_time')
  String? get gatePassTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorised_by')
  String? get authorisedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_type')
  String? get vehicleType => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_number')
  String? get vehicleNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_mobile_number')
  String? get driverMobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'outward_no')
  String? get outwardNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'outward_date')
  String? get outwardDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_manual_vendorcustomer')
  int? get ismanualvendor => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendorcustomer')
  String? get vendorcustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendorcustomer_records')
  String? get vendorRecords => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendorcustomer_manual')
  String? get vendorCustomerManual => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendorcustomer_manual_address')
  String? get vendorAddress => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  File? get gatePassImg => throw _privateConstructorUsedError;
  @JsonKey(name: 'gatepass_image')
  String? get gatePassPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'amended_from')
  String? get amendedFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'inward_gatepass_items', defaultValue: [])
  List<ItemsForm> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'inward_gate_pass_items', defaultValue: [])
  List<ItemsForm> get itemsLines => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get deletedLines => throw _privateConstructorUsedError;

  /// Serializes this InwardForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InwardForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InwardFormCopyWith<InwardForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InwardFormCopyWith<$Res> {
  factory $InwardFormCopyWith(
          InwardForm value, $Res Function(InwardForm) then) =
      _$InwardFormCopyWithImpl<$Res, InwardForm>;
  @useResult
  $Res call(
      {String? status,
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
      @JsonKey(name: 'inward_gatepass_items', defaultValue: [])
      List<ItemsForm> items,
      @JsonKey(name: 'inward_gate_pass_items', defaultValue: [])
      List<ItemsForm> itemsLines,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<String> deletedLines});
}

/// @nodoc
class _$InwardFormCopyWithImpl<$Res, $Val extends InwardForm>
    implements $InwardFormCopyWith<$Res> {
  _$InwardFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InwardForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? owner = freezed,
    Object? creationDate = freezed,
    Object? modifiedDate = freezed,
    Object? modifiedBy = freezed,
    Object? docstatus = freezed,
    Object? plantName = freezed,
    Object? gatePassType = freezed,
    Object? gatePassDate = freezed,
    Object? gatePassTime = freezed,
    Object? authorisedBy = freezed,
    Object? vehicleType = freezed,
    Object? vehicleNumber = freezed,
    Object? driverMobileNumber = freezed,
    Object? remarks = freezed,
    Object? outwardNo = freezed,
    Object? outwardDate = freezed,
    Object? ismanualvendor = freezed,
    Object? vendorcustomer = freezed,
    Object? vendorRecords = freezed,
    Object? vendorCustomerManual = freezed,
    Object? vendorAddress = freezed,
    Object? gatePassImg = freezed,
    Object? gatePassPhoto = freezed,
    Object? amendedFrom = freezed,
    Object? items = null,
    Object? itemsLines = null,
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
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      docstatus: freezed == docstatus
          ? _value.docstatus
          : docstatus // ignore: cast_nullable_to_non_nullable
              as int?,
      plantName: freezed == plantName
          ? _value.plantName
          : plantName // ignore: cast_nullable_to_non_nullable
              as String?,
      gatePassType: freezed == gatePassType
          ? _value.gatePassType
          : gatePassType // ignore: cast_nullable_to_non_nullable
              as String?,
      gatePassDate: freezed == gatePassDate
          ? _value.gatePassDate
          : gatePassDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gatePassTime: freezed == gatePassTime
          ? _value.gatePassTime
          : gatePassTime // ignore: cast_nullable_to_non_nullable
              as String?,
      authorisedBy: freezed == authorisedBy
          ? _value.authorisedBy
          : authorisedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      driverMobileNumber: freezed == driverMobileNumber
          ? _value.driverMobileNumber
          : driverMobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      outwardNo: freezed == outwardNo
          ? _value.outwardNo
          : outwardNo // ignore: cast_nullable_to_non_nullable
              as String?,
      outwardDate: freezed == outwardDate
          ? _value.outwardDate
          : outwardDate // ignore: cast_nullable_to_non_nullable
              as String?,
      ismanualvendor: freezed == ismanualvendor
          ? _value.ismanualvendor
          : ismanualvendor // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorcustomer: freezed == vendorcustomer
          ? _value.vendorcustomer
          : vendorcustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorRecords: freezed == vendorRecords
          ? _value.vendorRecords
          : vendorRecords // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorCustomerManual: freezed == vendorCustomerManual
          ? _value.vendorCustomerManual
          : vendorCustomerManual // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorAddress: freezed == vendorAddress
          ? _value.vendorAddress
          : vendorAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      gatePassImg: freezed == gatePassImg
          ? _value.gatePassImg
          : gatePassImg // ignore: cast_nullable_to_non_nullable
              as File?,
      gatePassPhoto: freezed == gatePassPhoto
          ? _value.gatePassPhoto
          : gatePassPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      amendedFrom: freezed == amendedFrom
          ? _value.amendedFrom
          : amendedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemsForm>,
      itemsLines: null == itemsLines
          ? _value.itemsLines
          : itemsLines // ignore: cast_nullable_to_non_nullable
              as List<ItemsForm>,
      deletedLines: null == deletedLines
          ? _value.deletedLines
          : deletedLines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InwardFormImplCopyWith<$Res>
    implements $InwardFormCopyWith<$Res> {
  factory _$$InwardFormImplCopyWith(
          _$InwardFormImpl value, $Res Function(_$InwardFormImpl) then) =
      __$$InwardFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
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
      @JsonKey(name: 'inward_gatepass_items', defaultValue: [])
      List<ItemsForm> items,
      @JsonKey(name: 'inward_gate_pass_items', defaultValue: [])
      List<ItemsForm> itemsLines,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<String> deletedLines});
}

/// @nodoc
class __$$InwardFormImplCopyWithImpl<$Res>
    extends _$InwardFormCopyWithImpl<$Res, _$InwardFormImpl>
    implements _$$InwardFormImplCopyWith<$Res> {
  __$$InwardFormImplCopyWithImpl(
      _$InwardFormImpl _value, $Res Function(_$InwardFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of InwardForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? owner = freezed,
    Object? creationDate = freezed,
    Object? modifiedDate = freezed,
    Object? modifiedBy = freezed,
    Object? docstatus = freezed,
    Object? plantName = freezed,
    Object? gatePassType = freezed,
    Object? gatePassDate = freezed,
    Object? gatePassTime = freezed,
    Object? authorisedBy = freezed,
    Object? vehicleType = freezed,
    Object? vehicleNumber = freezed,
    Object? driverMobileNumber = freezed,
    Object? remarks = freezed,
    Object? outwardNo = freezed,
    Object? outwardDate = freezed,
    Object? ismanualvendor = freezed,
    Object? vendorcustomer = freezed,
    Object? vendorRecords = freezed,
    Object? vendorCustomerManual = freezed,
    Object? vendorAddress = freezed,
    Object? gatePassImg = freezed,
    Object? gatePassPhoto = freezed,
    Object? amendedFrom = freezed,
    Object? items = null,
    Object? itemsLines = null,
    Object? deletedLines = null,
  }) {
    return _then(_$InwardFormImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      docstatus: freezed == docstatus
          ? _value.docstatus
          : docstatus // ignore: cast_nullable_to_non_nullable
              as int?,
      plantName: freezed == plantName
          ? _value.plantName
          : plantName // ignore: cast_nullable_to_non_nullable
              as String?,
      gatePassType: freezed == gatePassType
          ? _value.gatePassType
          : gatePassType // ignore: cast_nullable_to_non_nullable
              as String?,
      gatePassDate: freezed == gatePassDate
          ? _value.gatePassDate
          : gatePassDate // ignore: cast_nullable_to_non_nullable
              as String?,
      gatePassTime: freezed == gatePassTime
          ? _value.gatePassTime
          : gatePassTime // ignore: cast_nullable_to_non_nullable
              as String?,
      authorisedBy: freezed == authorisedBy
          ? _value.authorisedBy
          : authorisedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleType: freezed == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleNumber: freezed == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      driverMobileNumber: freezed == driverMobileNumber
          ? _value.driverMobileNumber
          : driverMobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      outwardNo: freezed == outwardNo
          ? _value.outwardNo
          : outwardNo // ignore: cast_nullable_to_non_nullable
              as String?,
      outwardDate: freezed == outwardDate
          ? _value.outwardDate
          : outwardDate // ignore: cast_nullable_to_non_nullable
              as String?,
      ismanualvendor: freezed == ismanualvendor
          ? _value.ismanualvendor
          : ismanualvendor // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorcustomer: freezed == vendorcustomer
          ? _value.vendorcustomer
          : vendorcustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorRecords: freezed == vendorRecords
          ? _value.vendorRecords
          : vendorRecords // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorCustomerManual: freezed == vendorCustomerManual
          ? _value.vendorCustomerManual
          : vendorCustomerManual // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorAddress: freezed == vendorAddress
          ? _value.vendorAddress
          : vendorAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      gatePassImg: freezed == gatePassImg
          ? _value.gatePassImg
          : gatePassImg // ignore: cast_nullable_to_non_nullable
              as File?,
      gatePassPhoto: freezed == gatePassPhoto
          ? _value.gatePassPhoto
          : gatePassPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      amendedFrom: freezed == amendedFrom
          ? _value.amendedFrom
          : amendedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemsForm>,
      itemsLines: null == itemsLines
          ? _value._itemsLines
          : itemsLines // ignore: cast_nullable_to_non_nullable
              as List<ItemsForm>,
      deletedLines: null == deletedLines
          ? _value._deletedLines
          : deletedLines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InwardFormImpl implements _InwardForm {
  const _$InwardFormImpl(
      {this.status,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'owner') this.owner,
      @JsonKey(name: 'creation', defaultValue: '') this.creationDate,
      @JsonKey(name: 'modified') this.modifiedDate,
      @JsonKey(name: 'modified_by') this.modifiedBy,
      @JsonKey(name: 'docstatus') this.docstatus,
      @JsonKey(name: 'plant_name') this.plantName,
      @JsonKey(name: 'gate_pass_type') this.gatePassType,
      @JsonKey(name: 'gate_pass_date') this.gatePassDate,
      @JsonKey(name: 'gate_pass_time') this.gatePassTime,
      @JsonKey(name: 'authorised_by') this.authorisedBy,
      @JsonKey(name: 'vehicle_type') this.vehicleType,
      @JsonKey(name: 'vehicle_number') this.vehicleNumber,
      @JsonKey(name: 'driver_mobile_number') this.driverMobileNumber,
      @JsonKey(name: 'remarks') this.remarks,
      @JsonKey(name: 'outward_no') this.outwardNo,
      @JsonKey(name: 'outward_date') this.outwardDate,
      @JsonKey(name: 'is_manual_vendorcustomer') this.ismanualvendor,
      @JsonKey(name: 'vendorcustomer') this.vendorcustomer,
      @JsonKey(name: 'vendorcustomer_records') this.vendorRecords,
      @JsonKey(name: 'vendorcustomer_manual') this.vendorCustomerManual,
      @JsonKey(name: 'vendorcustomer_manual_address') this.vendorAddress,
      @JsonKey(includeToJson: false, includeFromJson: false) this.gatePassImg,
      @JsonKey(name: 'gatepass_image') this.gatePassPhoto,
      @JsonKey(name: 'amended_from') this.amendedFrom,
      @JsonKey(name: 'inward_gatepass_items', defaultValue: [])
      required final List<ItemsForm> items,
      @JsonKey(name: 'inward_gate_pass_items', defaultValue: [])
      required final List<ItemsForm> itemsLines,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<String> deletedLines = const <String>[]})
      : _items = items,
        _itemsLines = itemsLines,
        _deletedLines = deletedLines;

  factory _$InwardFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$InwardFormImplFromJson(json);

  @override
  final String? status;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'owner')
  final String? owner;
  @override
  @JsonKey(name: 'creation', defaultValue: '')
  final String? creationDate;
  @override
  @JsonKey(name: 'modified')
  final String? modifiedDate;
  @override
  @JsonKey(name: 'modified_by')
  final String? modifiedBy;
  @override
  @JsonKey(name: 'docstatus')
  final int? docstatus;
  @override
  @JsonKey(name: 'plant_name')
  final String? plantName;
  @override
  @JsonKey(name: 'gate_pass_type')
  final String? gatePassType;
  @override
  @JsonKey(name: 'gate_pass_date')
  final String? gatePassDate;
  @override
  @JsonKey(name: 'gate_pass_time')
  final String? gatePassTime;
  @override
  @JsonKey(name: 'authorised_by')
  final String? authorisedBy;
  @override
  @JsonKey(name: 'vehicle_type')
  final String? vehicleType;
  @override
  @JsonKey(name: 'vehicle_number')
  final String? vehicleNumber;
  @override
  @JsonKey(name: 'driver_mobile_number')
  final String? driverMobileNumber;
  @override
  @JsonKey(name: 'remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'outward_no')
  final String? outwardNo;
  @override
  @JsonKey(name: 'outward_date')
  final String? outwardDate;
  @override
  @JsonKey(name: 'is_manual_vendorcustomer')
  final int? ismanualvendor;
  @override
  @JsonKey(name: 'vendorcustomer')
  final String? vendorcustomer;
  @override
  @JsonKey(name: 'vendorcustomer_records')
  final String? vendorRecords;
  @override
  @JsonKey(name: 'vendorcustomer_manual')
  final String? vendorCustomerManual;
  @override
  @JsonKey(name: 'vendorcustomer_manual_address')
  final String? vendorAddress;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final File? gatePassImg;
  @override
  @JsonKey(name: 'gatepass_image')
  final String? gatePassPhoto;
  @override
  @JsonKey(name: 'amended_from')
  final String? amendedFrom;
  final List<ItemsForm> _items;
  @override
  @JsonKey(name: 'inward_gatepass_items', defaultValue: [])
  List<ItemsForm> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<ItemsForm> _itemsLines;
  @override
  @JsonKey(name: 'inward_gate_pass_items', defaultValue: [])
  List<ItemsForm> get itemsLines {
    if (_itemsLines is EqualUnmodifiableListView) return _itemsLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemsLines);
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
    return 'InwardForm(status: $status, name: $name, owner: $owner, creationDate: $creationDate, modifiedDate: $modifiedDate, modifiedBy: $modifiedBy, docstatus: $docstatus, plantName: $plantName, gatePassType: $gatePassType, gatePassDate: $gatePassDate, gatePassTime: $gatePassTime, authorisedBy: $authorisedBy, vehicleType: $vehicleType, vehicleNumber: $vehicleNumber, driverMobileNumber: $driverMobileNumber, remarks: $remarks, outwardNo: $outwardNo, outwardDate: $outwardDate, ismanualvendor: $ismanualvendor, vendorcustomer: $vendorcustomer, vendorRecords: $vendorRecords, vendorCustomerManual: $vendorCustomerManual, vendorAddress: $vendorAddress, gatePassImg: $gatePassImg, gatePassPhoto: $gatePassPhoto, amendedFrom: $amendedFrom, items: $items, itemsLines: $itemsLines, deletedLines: $deletedLines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InwardFormImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.docstatus, docstatus) ||
                other.docstatus == docstatus) &&
            (identical(other.plantName, plantName) ||
                other.plantName == plantName) &&
            (identical(other.gatePassType, gatePassType) ||
                other.gatePassType == gatePassType) &&
            (identical(other.gatePassDate, gatePassDate) ||
                other.gatePassDate == gatePassDate) &&
            (identical(other.gatePassTime, gatePassTime) ||
                other.gatePassTime == gatePassTime) &&
            (identical(other.authorisedBy, authorisedBy) ||
                other.authorisedBy == authorisedBy) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.driverMobileNumber, driverMobileNumber) ||
                other.driverMobileNumber == driverMobileNumber) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.outwardNo, outwardNo) ||
                other.outwardNo == outwardNo) &&
            (identical(other.outwardDate, outwardDate) ||
                other.outwardDate == outwardDate) &&
            (identical(other.ismanualvendor, ismanualvendor) ||
                other.ismanualvendor == ismanualvendor) &&
            (identical(other.vendorcustomer, vendorcustomer) ||
                other.vendorcustomer == vendorcustomer) &&
            (identical(other.vendorRecords, vendorRecords) ||
                other.vendorRecords == vendorRecords) &&
            (identical(other.vendorCustomerManual, vendorCustomerManual) ||
                other.vendorCustomerManual == vendorCustomerManual) &&
            (identical(other.vendorAddress, vendorAddress) ||
                other.vendorAddress == vendorAddress) &&
            (identical(other.gatePassImg, gatePassImg) ||
                other.gatePassImg == gatePassImg) &&
            (identical(other.gatePassPhoto, gatePassPhoto) ||
                other.gatePassPhoto == gatePassPhoto) &&
            (identical(other.amendedFrom, amendedFrom) ||
                other.amendedFrom == amendedFrom) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._itemsLines, _itemsLines) &&
            const DeepCollectionEquality()
                .equals(other._deletedLines, _deletedLines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        name,
        owner,
        creationDate,
        modifiedDate,
        modifiedBy,
        docstatus,
        plantName,
        gatePassType,
        gatePassDate,
        gatePassTime,
        authorisedBy,
        vehicleType,
        vehicleNumber,
        driverMobileNumber,
        remarks,
        outwardNo,
        outwardDate,
        ismanualvendor,
        vendorcustomer,
        vendorRecords,
        vendorCustomerManual,
        vendorAddress,
        gatePassImg,
        gatePassPhoto,
        amendedFrom,
        const DeepCollectionEquality().hash(_items),
        const DeepCollectionEquality().hash(_itemsLines),
        const DeepCollectionEquality().hash(_deletedLines)
      ]);

  /// Create a copy of InwardForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InwardFormImplCopyWith<_$InwardFormImpl> get copyWith =>
      __$$InwardFormImplCopyWithImpl<_$InwardFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InwardFormImplToJson(
      this,
    );
  }
}

abstract class _InwardForm implements InwardForm {
  const factory _InwardForm(
      {final String? status,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'owner') final String? owner,
      @JsonKey(name: 'creation', defaultValue: '') final String? creationDate,
      @JsonKey(name: 'modified') final String? modifiedDate,
      @JsonKey(name: 'modified_by') final String? modifiedBy,
      @JsonKey(name: 'docstatus') final int? docstatus,
      @JsonKey(name: 'plant_name') final String? plantName,
      @JsonKey(name: 'gate_pass_type') final String? gatePassType,
      @JsonKey(name: 'gate_pass_date') final String? gatePassDate,
      @JsonKey(name: 'gate_pass_time') final String? gatePassTime,
      @JsonKey(name: 'authorised_by') final String? authorisedBy,
      @JsonKey(name: 'vehicle_type') final String? vehicleType,
      @JsonKey(name: 'vehicle_number') final String? vehicleNumber,
      @JsonKey(name: 'driver_mobile_number') final String? driverMobileNumber,
      @JsonKey(name: 'remarks') final String? remarks,
      @JsonKey(name: 'outward_no') final String? outwardNo,
      @JsonKey(name: 'outward_date') final String? outwardDate,
      @JsonKey(name: 'is_manual_vendorcustomer') final int? ismanualvendor,
      @JsonKey(name: 'vendorcustomer') final String? vendorcustomer,
      @JsonKey(name: 'vendorcustomer_records') final String? vendorRecords,
      @JsonKey(name: 'vendorcustomer_manual')
      final String? vendorCustomerManual,
      @JsonKey(name: 'vendorcustomer_manual_address')
      final String? vendorAddress,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final File? gatePassImg,
      @JsonKey(name: 'gatepass_image') final String? gatePassPhoto,
      @JsonKey(name: 'amended_from') final String? amendedFrom,
      @JsonKey(name: 'inward_gatepass_items', defaultValue: [])
      required final List<ItemsForm> items,
      @JsonKey(name: 'inward_gate_pass_items', defaultValue: [])
      required final List<ItemsForm> itemsLines,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<String> deletedLines}) = _$InwardFormImpl;

  factory _InwardForm.fromJson(Map<String, dynamic> json) =
      _$InwardFormImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'owner')
  String? get owner;
  @override
  @JsonKey(name: 'creation', defaultValue: '')
  String? get creationDate;
  @override
  @JsonKey(name: 'modified')
  String? get modifiedDate;
  @override
  @JsonKey(name: 'modified_by')
  String? get modifiedBy;
  @override
  @JsonKey(name: 'docstatus')
  int? get docstatus;
  @override
  @JsonKey(name: 'plant_name')
  String? get plantName;
  @override
  @JsonKey(name: 'gate_pass_type')
  String? get gatePassType;
  @override
  @JsonKey(name: 'gate_pass_date')
  String? get gatePassDate;
  @override
  @JsonKey(name: 'gate_pass_time')
  String? get gatePassTime;
  @override
  @JsonKey(name: 'authorised_by')
  String? get authorisedBy;
  @override
  @JsonKey(name: 'vehicle_type')
  String? get vehicleType;
  @override
  @JsonKey(name: 'vehicle_number')
  String? get vehicleNumber;
  @override
  @JsonKey(name: 'driver_mobile_number')
  String? get driverMobileNumber;
  @override
  @JsonKey(name: 'remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'outward_no')
  String? get outwardNo;
  @override
  @JsonKey(name: 'outward_date')
  String? get outwardDate;
  @override
  @JsonKey(name: 'is_manual_vendorcustomer')
  int? get ismanualvendor;
  @override
  @JsonKey(name: 'vendorcustomer')
  String? get vendorcustomer;
  @override
  @JsonKey(name: 'vendorcustomer_records')
  String? get vendorRecords;
  @override
  @JsonKey(name: 'vendorcustomer_manual')
  String? get vendorCustomerManual;
  @override
  @JsonKey(name: 'vendorcustomer_manual_address')
  String? get vendorAddress;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  File? get gatePassImg;
  @override
  @JsonKey(name: 'gatepass_image')
  String? get gatePassPhoto;
  @override
  @JsonKey(name: 'amended_from')
  String? get amendedFrom;
  @override
  @JsonKey(name: 'inward_gatepass_items', defaultValue: [])
  List<ItemsForm> get items;
  @override
  @JsonKey(name: 'inward_gate_pass_items', defaultValue: [])
  List<ItemsForm> get itemsLines;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> get deletedLines;

  /// Create a copy of InwardForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InwardFormImplCopyWith<_$InwardFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
