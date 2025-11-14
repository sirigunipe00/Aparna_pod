// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inward_line_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InwardLineItems _$InwardLineItemsFromJson(Map<String, dynamic> json) {
  return _InwardLineItems.fromJson(json);
}

/// @nodoc
mixin _$InwardLineItems {
  @JsonKey(name: 'is_manual_item')
  int? get isManualItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'manual_item_code')
  String? get manualItemCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'manual_item_name')
  String? get manualItemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'docstatus')
  int? get docStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_code')
  String? get itemCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String? get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  double? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'uom')
  String? get uom => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  double? get value => throw _privateConstructorUsedError;
  @AssetnumberConvertor()
  @JsonKey(name: 'exp_date')
  String? get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_qty_to_inward')
  String? get pendingQty => throw _privateConstructorUsedError;

  /// Serializes this InwardLineItems to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InwardLineItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InwardLineItemsCopyWith<InwardLineItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InwardLineItemsCopyWith<$Res> {
  factory $InwardLineItemsCopyWith(
          InwardLineItems value, $Res Function(InwardLineItems) then) =
      _$InwardLineItemsCopyWithImpl<$Res, InwardLineItems>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_manual_item') int? isManualItem,
      @JsonKey(name: 'manual_item_code') String? manualItemCode,
      @JsonKey(name: 'manual_item_name') String? manualItemName,
      @JsonKey(name: 'docstatus') int? docStatus,
      @JsonKey(name: 'item_code') String? itemCode,
      @JsonKey(name: 'item_name') String? itemName,
      @JsonKey(name: 'quantity') double? quantity,
      @JsonKey(name: 'uom') String? uom,
      @JsonKey(name: 'value') double? value,
      @AssetnumberConvertor() @JsonKey(name: 'exp_date') String? expiryDate,
      @JsonKey(name: 'pending_qty_to_inward') String? pendingQty});
}

/// @nodoc
class _$InwardLineItemsCopyWithImpl<$Res, $Val extends InwardLineItems>
    implements $InwardLineItemsCopyWith<$Res> {
  _$InwardLineItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InwardLineItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isManualItem = freezed,
    Object? manualItemCode = freezed,
    Object? manualItemName = freezed,
    Object? docStatus = freezed,
    Object? itemCode = freezed,
    Object? itemName = freezed,
    Object? quantity = freezed,
    Object? uom = freezed,
    Object? value = freezed,
    Object? expiryDate = freezed,
    Object? pendingQty = freezed,
  }) {
    return _then(_value.copyWith(
      isManualItem: freezed == isManualItem
          ? _value.isManualItem
          : isManualItem // ignore: cast_nullable_to_non_nullable
              as int?,
      manualItemCode: freezed == manualItemCode
          ? _value.manualItemCode
          : manualItemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      manualItemName: freezed == manualItemName
          ? _value.manualItemName
          : manualItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: freezed == docStatus
          ? _value.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      itemCode: freezed == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingQty: freezed == pendingQty
          ? _value.pendingQty
          : pendingQty // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InwardLineItemsImplCopyWith<$Res>
    implements $InwardLineItemsCopyWith<$Res> {
  factory _$$InwardLineItemsImplCopyWith(_$InwardLineItemsImpl value,
          $Res Function(_$InwardLineItemsImpl) then) =
      __$$InwardLineItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_manual_item') int? isManualItem,
      @JsonKey(name: 'manual_item_code') String? manualItemCode,
      @JsonKey(name: 'manual_item_name') String? manualItemName,
      @JsonKey(name: 'docstatus') int? docStatus,
      @JsonKey(name: 'item_code') String? itemCode,
      @JsonKey(name: 'item_name') String? itemName,
      @JsonKey(name: 'quantity') double? quantity,
      @JsonKey(name: 'uom') String? uom,
      @JsonKey(name: 'value') double? value,
      @AssetnumberConvertor() @JsonKey(name: 'exp_date') String? expiryDate,
      @JsonKey(name: 'pending_qty_to_inward') String? pendingQty});
}

/// @nodoc
class __$$InwardLineItemsImplCopyWithImpl<$Res>
    extends _$InwardLineItemsCopyWithImpl<$Res, _$InwardLineItemsImpl>
    implements _$$InwardLineItemsImplCopyWith<$Res> {
  __$$InwardLineItemsImplCopyWithImpl(
      _$InwardLineItemsImpl _value, $Res Function(_$InwardLineItemsImpl) _then)
      : super(_value, _then);

  /// Create a copy of InwardLineItems
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isManualItem = freezed,
    Object? manualItemCode = freezed,
    Object? manualItemName = freezed,
    Object? docStatus = freezed,
    Object? itemCode = freezed,
    Object? itemName = freezed,
    Object? quantity = freezed,
    Object? uom = freezed,
    Object? value = freezed,
    Object? expiryDate = freezed,
    Object? pendingQty = freezed,
  }) {
    return _then(_$InwardLineItemsImpl(
      isManualItem: freezed == isManualItem
          ? _value.isManualItem
          : isManualItem // ignore: cast_nullable_to_non_nullable
              as int?,
      manualItemCode: freezed == manualItemCode
          ? _value.manualItemCode
          : manualItemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      manualItemName: freezed == manualItemName
          ? _value.manualItemName
          : manualItemName // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: freezed == docStatus
          ? _value.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      itemCode: freezed == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingQty: freezed == pendingQty
          ? _value.pendingQty
          : pendingQty // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InwardLineItemsImpl implements _InwardLineItems {
  const _$InwardLineItemsImpl(
      {@JsonKey(name: 'is_manual_item') this.isManualItem,
      @JsonKey(name: 'manual_item_code') this.manualItemCode,
      @JsonKey(name: 'manual_item_name') this.manualItemName,
      @JsonKey(name: 'docstatus') this.docStatus,
      @JsonKey(name: 'item_code') this.itemCode,
      @JsonKey(name: 'item_name') this.itemName,
      @JsonKey(name: 'quantity') this.quantity,
      @JsonKey(name: 'uom') this.uom,
      @JsonKey(name: 'value') this.value,
      @AssetnumberConvertor() @JsonKey(name: 'exp_date') this.expiryDate,
      @JsonKey(name: 'pending_qty_to_inward') this.pendingQty});

  factory _$InwardLineItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InwardLineItemsImplFromJson(json);

  @override
  @JsonKey(name: 'is_manual_item')
  final int? isManualItem;
  @override
  @JsonKey(name: 'manual_item_code')
  final String? manualItemCode;
  @override
  @JsonKey(name: 'manual_item_name')
  final String? manualItemName;
  @override
  @JsonKey(name: 'docstatus')
  final int? docStatus;
  @override
  @JsonKey(name: 'item_code')
  final String? itemCode;
  @override
  @JsonKey(name: 'item_name')
  final String? itemName;
  @override
  @JsonKey(name: 'quantity')
  final double? quantity;
  @override
  @JsonKey(name: 'uom')
  final String? uom;
  @override
  @JsonKey(name: 'value')
  final double? value;
  @override
  @AssetnumberConvertor()
  @JsonKey(name: 'exp_date')
  final String? expiryDate;
  @override
  @JsonKey(name: 'pending_qty_to_inward')
  final String? pendingQty;

  @override
  String toString() {
    return 'InwardLineItems(isManualItem: $isManualItem, manualItemCode: $manualItemCode, manualItemName: $manualItemName, docStatus: $docStatus, itemCode: $itemCode, itemName: $itemName, quantity: $quantity, uom: $uom, value: $value, expiryDate: $expiryDate, pendingQty: $pendingQty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InwardLineItemsImpl &&
            (identical(other.isManualItem, isManualItem) ||
                other.isManualItem == isManualItem) &&
            (identical(other.manualItemCode, manualItemCode) ||
                other.manualItemCode == manualItemCode) &&
            (identical(other.manualItemName, manualItemName) ||
                other.manualItemName == manualItemName) &&
            (identical(other.docStatus, docStatus) ||
                other.docStatus == docStatus) &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.pendingQty, pendingQty) ||
                other.pendingQty == pendingQty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isManualItem,
      manualItemCode,
      manualItemName,
      docStatus,
      itemCode,
      itemName,
      quantity,
      uom,
      value,
      expiryDate,
      pendingQty);

  /// Create a copy of InwardLineItems
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InwardLineItemsImplCopyWith<_$InwardLineItemsImpl> get copyWith =>
      __$$InwardLineItemsImplCopyWithImpl<_$InwardLineItemsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InwardLineItemsImplToJson(
      this,
    );
  }
}

abstract class _InwardLineItems implements InwardLineItems {
  const factory _InwardLineItems(
          {@JsonKey(name: 'is_manual_item') final int? isManualItem,
          @JsonKey(name: 'manual_item_code') final String? manualItemCode,
          @JsonKey(name: 'manual_item_name') final String? manualItemName,
          @JsonKey(name: 'docstatus') final int? docStatus,
          @JsonKey(name: 'item_code') final String? itemCode,
          @JsonKey(name: 'item_name') final String? itemName,
          @JsonKey(name: 'quantity') final double? quantity,
          @JsonKey(name: 'uom') final String? uom,
          @JsonKey(name: 'value') final double? value,
          @AssetnumberConvertor()
          @JsonKey(name: 'exp_date')
          final String? expiryDate,
          @JsonKey(name: 'pending_qty_to_inward') final String? pendingQty}) =
      _$InwardLineItemsImpl;

  factory _InwardLineItems.fromJson(Map<String, dynamic> json) =
      _$InwardLineItemsImpl.fromJson;

  @override
  @JsonKey(name: 'is_manual_item')
  int? get isManualItem;
  @override
  @JsonKey(name: 'manual_item_code')
  String? get manualItemCode;
  @override
  @JsonKey(name: 'manual_item_name')
  String? get manualItemName;
  @override
  @JsonKey(name: 'docstatus')
  int? get docStatus;
  @override
  @JsonKey(name: 'item_code')
  String? get itemCode;
  @override
  @JsonKey(name: 'item_name')
  String? get itemName;
  @override
  @JsonKey(name: 'quantity')
  double? get quantity;
  @override
  @JsonKey(name: 'uom')
  String? get uom;
  @override
  @JsonKey(name: 'value')
  double? get value;
  @override
  @AssetnumberConvertor()
  @JsonKey(name: 'exp_date')
  String? get expiryDate;
  @override
  @JsonKey(name: 'pending_qty_to_inward')
  String? get pendingQty;

  /// Create a copy of InwardLineItems
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InwardLineItemsImplCopyWith<_$InwardLineItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
