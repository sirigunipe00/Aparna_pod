// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gate_entry_lines_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GateEntryLinesForm _$GateEntryLinesFormFromJson(Map<String, dynamic> json) {
  return _GateEntryLinesForm.fromJson(json);
}

/// @nodoc
mixin _$GateEntryLinesForm {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'docstatus')
  int? get docStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String? get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'serial_no')
  String? get serialNumber => throw _privateConstructorUsedError;
  @AssetnumberConvertor()
  @JsonKey(name: 'asset_no')
  int? get assetNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  double? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'uom')
  String? get oums => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_return')
  int? get isreturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent')
  String? get parentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'tracking_id')
  String? get trackingId => throw _privateConstructorUsedError;

  /// Serializes this GateEntryLinesForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GateEntryLinesForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GateEntryLinesFormCopyWith<GateEntryLinesForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GateEntryLinesFormCopyWith<$Res> {
  factory $GateEntryLinesFormCopyWith(
          GateEntryLinesForm value, $Res Function(GateEntryLinesForm) then) =
      _$GateEntryLinesFormCopyWithImpl<$Res, GateEntryLinesForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'docstatus') int? docStatus,
      @JsonKey(name: 'material_name') String? materialName,
      @JsonKey(name: 'serial_no') String? serialNumber,
      @AssetnumberConvertor() @JsonKey(name: 'asset_no') int? assetNumber,
      @JsonKey(name: 'qty') double? quantity,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'uom') String? oums,
      @JsonKey(name: 'is_return') int? isreturn,
      @JsonKey(name: 'parent') String? parentName,
      @JsonKey(name: 'tracking_id') String? trackingId});
}

/// @nodoc
class _$GateEntryLinesFormCopyWithImpl<$Res, $Val extends GateEntryLinesForm>
    implements $GateEntryLinesFormCopyWith<$Res> {
  _$GateEntryLinesFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GateEntryLinesForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? docStatus = freezed,
    Object? materialName = freezed,
    Object? serialNumber = freezed,
    Object? assetNumber = freezed,
    Object? quantity = freezed,
    Object? amount = freezed,
    Object? oums = freezed,
    Object? isreturn = freezed,
    Object? parentName = freezed,
    Object? trackingId = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: freezed == docStatus
          ? _value.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      materialName: freezed == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      assetNumber: freezed == assetNumber
          ? _value.assetNumber
          : assetNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      oums: freezed == oums
          ? _value.oums
          : oums // ignore: cast_nullable_to_non_nullable
              as String?,
      isreturn: freezed == isreturn
          ? _value.isreturn
          : isreturn // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingId: freezed == trackingId
          ? _value.trackingId
          : trackingId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GateEntryLinesFormImplCopyWith<$Res>
    implements $GateEntryLinesFormCopyWith<$Res> {
  factory _$$GateEntryLinesFormImplCopyWith(_$GateEntryLinesFormImpl value,
          $Res Function(_$GateEntryLinesFormImpl) then) =
      __$$GateEntryLinesFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'docstatus') int? docStatus,
      @JsonKey(name: 'material_name') String? materialName,
      @JsonKey(name: 'serial_no') String? serialNumber,
      @AssetnumberConvertor() @JsonKey(name: 'asset_no') int? assetNumber,
      @JsonKey(name: 'qty') double? quantity,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'uom') String? oums,
      @JsonKey(name: 'is_return') int? isreturn,
      @JsonKey(name: 'parent') String? parentName,
      @JsonKey(name: 'tracking_id') String? trackingId});
}

/// @nodoc
class __$$GateEntryLinesFormImplCopyWithImpl<$Res>
    extends _$GateEntryLinesFormCopyWithImpl<$Res, _$GateEntryLinesFormImpl>
    implements _$$GateEntryLinesFormImplCopyWith<$Res> {
  __$$GateEntryLinesFormImplCopyWithImpl(_$GateEntryLinesFormImpl _value,
      $Res Function(_$GateEntryLinesFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of GateEntryLinesForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? docStatus = freezed,
    Object? materialName = freezed,
    Object? serialNumber = freezed,
    Object? assetNumber = freezed,
    Object? quantity = freezed,
    Object? amount = freezed,
    Object? oums = freezed,
    Object? isreturn = freezed,
    Object? parentName = freezed,
    Object? trackingId = freezed,
  }) {
    return _then(_$GateEntryLinesFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: freezed == docStatus
          ? _value.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      materialName: freezed == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      assetNumber: freezed == assetNumber
          ? _value.assetNumber
          : assetNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      oums: freezed == oums
          ? _value.oums
          : oums // ignore: cast_nullable_to_non_nullable
              as String?,
      isreturn: freezed == isreturn
          ? _value.isreturn
          : isreturn // ignore: cast_nullable_to_non_nullable
              as int?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingId: freezed == trackingId
          ? _value.trackingId
          : trackingId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GateEntryLinesFormImpl implements _GateEntryLinesForm {
  const _$GateEntryLinesFormImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'docstatus') this.docStatus,
      @JsonKey(name: 'material_name') this.materialName,
      @JsonKey(name: 'serial_no') this.serialNumber,
      @AssetnumberConvertor() @JsonKey(name: 'asset_no') this.assetNumber,
      @JsonKey(name: 'qty') this.quantity,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'uom') this.oums,
      @JsonKey(name: 'is_return') this.isreturn,
      @JsonKey(name: 'parent') this.parentName,
      @JsonKey(name: 'tracking_id') this.trackingId});

  factory _$GateEntryLinesFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$GateEntryLinesFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'docstatus')
  final int? docStatus;
  @override
  @JsonKey(name: 'material_name')
  final String? materialName;
  @override
  @JsonKey(name: 'serial_no')
  final String? serialNumber;
  @override
  @AssetnumberConvertor()
  @JsonKey(name: 'asset_no')
  final int? assetNumber;
  @override
  @JsonKey(name: 'qty')
  final double? quantity;
  @override
  @JsonKey(name: 'amount')
  final double? amount;
  @override
  @JsonKey(name: 'uom')
  final String? oums;
  @override
  @JsonKey(name: 'is_return')
  final int? isreturn;
  @override
  @JsonKey(name: 'parent')
  final String? parentName;
  @override
  @JsonKey(name: 'tracking_id')
  final String? trackingId;

  @override
  String toString() {
    return 'GateEntryLinesForm(name: $name, docStatus: $docStatus, materialName: $materialName, serialNumber: $serialNumber, assetNumber: $assetNumber, quantity: $quantity, amount: $amount, oums: $oums, isreturn: $isreturn, parentName: $parentName, trackingId: $trackingId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GateEntryLinesFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.docStatus, docStatus) ||
                other.docStatus == docStatus) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.assetNumber, assetNumber) ||
                other.assetNumber == assetNumber) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.oums, oums) || other.oums == oums) &&
            (identical(other.isreturn, isreturn) ||
                other.isreturn == isreturn) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName) &&
            (identical(other.trackingId, trackingId) ||
                other.trackingId == trackingId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      docStatus,
      materialName,
      serialNumber,
      assetNumber,
      quantity,
      amount,
      oums,
      isreturn,
      parentName,
      trackingId);

  /// Create a copy of GateEntryLinesForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GateEntryLinesFormImplCopyWith<_$GateEntryLinesFormImpl> get copyWith =>
      __$$GateEntryLinesFormImplCopyWithImpl<_$GateEntryLinesFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GateEntryLinesFormImplToJson(
      this,
    );
  }
}

abstract class _GateEntryLinesForm implements GateEntryLinesForm {
  const factory _GateEntryLinesForm(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'docstatus') final int? docStatus,
      @JsonKey(name: 'material_name') final String? materialName,
      @JsonKey(name: 'serial_no') final String? serialNumber,
      @AssetnumberConvertor() @JsonKey(name: 'asset_no') final int? assetNumber,
      @JsonKey(name: 'qty') final double? quantity,
      @JsonKey(name: 'amount') final double? amount,
      @JsonKey(name: 'uom') final String? oums,
      @JsonKey(name: 'is_return') final int? isreturn,
      @JsonKey(name: 'parent') final String? parentName,
      @JsonKey(name: 'tracking_id')
      final String? trackingId}) = _$GateEntryLinesFormImpl;

  factory _GateEntryLinesForm.fromJson(Map<String, dynamic> json) =
      _$GateEntryLinesFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'docstatus')
  int? get docStatus;
  @override
  @JsonKey(name: 'material_name')
  String? get materialName;
  @override
  @JsonKey(name: 'serial_no')
  String? get serialNumber;
  @override
  @AssetnumberConvertor()
  @JsonKey(name: 'asset_no')
  int? get assetNumber;
  @override
  @JsonKey(name: 'qty')
  double? get quantity;
  @override
  @JsonKey(name: 'amount')
  double? get amount;
  @override
  @JsonKey(name: 'uom')
  String? get oums;
  @override
  @JsonKey(name: 'is_return')
  int? get isreturn;
  @override
  @JsonKey(name: 'parent')
  String? get parentName;
  @override
  @JsonKey(name: 'tracking_id')
  String? get trackingId;

  /// Create a copy of GateEntryLinesForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GateEntryLinesFormImplCopyWith<_$GateEntryLinesFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
