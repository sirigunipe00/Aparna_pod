// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_name_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialNameForm _$MaterialNameFormFromJson(Map<String, dynamic> json) {
  return _MaterialNameForm.fromJson(json);
}

/// @nodoc
mixin _$MaterialNameForm {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_uom')
  String? get uom => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String? get itemName => throw _privateConstructorUsedError;

  /// Serializes this MaterialNameForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialNameForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialNameFormCopyWith<MaterialNameForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialNameFormCopyWith<$Res> {
  factory $MaterialNameFormCopyWith(
          MaterialNameForm value, $Res Function(MaterialNameForm) then) =
      _$MaterialNameFormCopyWithImpl<$Res, MaterialNameForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'stock_uom') String? uom,
      @JsonKey(name: 'item_name') String? itemName});
}

/// @nodoc
class _$MaterialNameFormCopyWithImpl<$Res, $Val extends MaterialNameForm>
    implements $MaterialNameFormCopyWith<$Res> {
  _$MaterialNameFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialNameForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? uom = freezed,
    Object? itemName = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialNameFormImplCopyWith<$Res>
    implements $MaterialNameFormCopyWith<$Res> {
  factory _$$MaterialNameFormImplCopyWith(_$MaterialNameFormImpl value,
          $Res Function(_$MaterialNameFormImpl) then) =
      __$$MaterialNameFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'stock_uom') String? uom,
      @JsonKey(name: 'item_name') String? itemName});
}

/// @nodoc
class __$$MaterialNameFormImplCopyWithImpl<$Res>
    extends _$MaterialNameFormCopyWithImpl<$Res, _$MaterialNameFormImpl>
    implements _$$MaterialNameFormImplCopyWith<$Res> {
  __$$MaterialNameFormImplCopyWithImpl(_$MaterialNameFormImpl _value,
      $Res Function(_$MaterialNameFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialNameForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? uom = freezed,
    Object? itemName = freezed,
  }) {
    return _then(_$MaterialNameFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialNameFormImpl implements _MaterialNameForm {
  _$MaterialNameFormImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'stock_uom') this.uom,
      @JsonKey(name: 'item_name') this.itemName});

  factory _$MaterialNameFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialNameFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'stock_uom')
  final String? uom;
  @override
  @JsonKey(name: 'item_name')
  final String? itemName;

  @override
  String toString() {
    return 'MaterialNameForm(name: $name, description: $description, uom: $uom, itemName: $itemName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialNameFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, uom, itemName);

  /// Create a copy of MaterialNameForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialNameFormImplCopyWith<_$MaterialNameFormImpl> get copyWith =>
      __$$MaterialNameFormImplCopyWithImpl<_$MaterialNameFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialNameFormImplToJson(
      this,
    );
  }
}

abstract class _MaterialNameForm implements MaterialNameForm {
  factory _MaterialNameForm(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'stock_uom') final String? uom,
          @JsonKey(name: 'item_name') final String? itemName}) =
      _$MaterialNameFormImpl;

  factory _MaterialNameForm.fromJson(Map<String, dynamic> json) =
      _$MaterialNameFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'stock_uom')
  String? get uom;
  @override
  @JsonKey(name: 'item_name')
  String? get itemName;

  /// Create a copy of MaterialNameForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialNameFormImplCopyWith<_$MaterialNameFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
