// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uom_list_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UomListForm _$UomListFormFromJson(Map<String, dynamic> json) {
  return _UomListForm.fromJson(json);
}

/// @nodoc
mixin _$UomListForm {
  String? get gstin => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  /// Serializes this UomListForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UomListForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UomListFormCopyWith<UomListForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UomListFormCopyWith<$Res> {
  factory $UomListFormCopyWith(
          UomListForm value, $Res Function(UomListForm) then) =
      _$UomListFormCopyWithImpl<$Res, UomListForm>;
  @useResult
  $Res call({String? gstin, @JsonKey(name: 'name') String name});
}

/// @nodoc
class _$UomListFormCopyWithImpl<$Res, $Val extends UomListForm>
    implements $UomListFormCopyWith<$Res> {
  _$UomListFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UomListForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gstin = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      gstin: freezed == gstin
          ? _value.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UomListFormImplCopyWith<$Res>
    implements $UomListFormCopyWith<$Res> {
  factory _$$UomListFormImplCopyWith(
          _$UomListFormImpl value, $Res Function(_$UomListFormImpl) then) =
      __$$UomListFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? gstin, @JsonKey(name: 'name') String name});
}

/// @nodoc
class __$$UomListFormImplCopyWithImpl<$Res>
    extends _$UomListFormCopyWithImpl<$Res, _$UomListFormImpl>
    implements _$$UomListFormImplCopyWith<$Res> {
  __$$UomListFormImplCopyWithImpl(
      _$UomListFormImpl _value, $Res Function(_$UomListFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of UomListForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gstin = freezed,
    Object? name = null,
  }) {
    return _then(_$UomListFormImpl(
      gstin: freezed == gstin
          ? _value.gstin
          : gstin // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UomListFormImpl implements _UomListForm {
  _$UomListFormImpl({this.gstin, @JsonKey(name: 'name') required this.name});

  factory _$UomListFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$UomListFormImplFromJson(json);

  @override
  final String? gstin;
  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'UomListForm(gstin: $gstin, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UomListFormImpl &&
            (identical(other.gstin, gstin) || other.gstin == gstin) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gstin, name);

  /// Create a copy of UomListForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UomListFormImplCopyWith<_$UomListFormImpl> get copyWith =>
      __$$UomListFormImplCopyWithImpl<_$UomListFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UomListFormImplToJson(
      this,
    );
  }
}

abstract class _UomListForm implements UomListForm {
  factory _UomListForm(
      {final String? gstin,
      @JsonKey(name: 'name') required final String name}) = _$UomListFormImpl;

  factory _UomListForm.fromJson(Map<String, dynamic> json) =
      _$UomListFormImpl.fromJson;

  @override
  String? get gstin;
  @override
  @JsonKey(name: 'name')
  String get name;

  /// Create a copy of UomListForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UomListFormImplCopyWith<_$UomListFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
