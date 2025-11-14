// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_name_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SupplierNameForm _$SupplierNameFormFromJson(Map<String, dynamic> json) {
  return _SupplierNameForm.fromJson(json);
}

/// @nodoc
mixin _$SupplierNameForm {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String get supName => throw _privateConstructorUsedError;

  /// Serializes this SupplierNameForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SupplierNameForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupplierNameFormCopyWith<SupplierNameForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplierNameFormCopyWith<$Res> {
  factory $SupplierNameFormCopyWith(
          SupplierNameForm value, $Res Function(SupplierNameForm) then) =
      _$SupplierNameFormCopyWithImpl<$Res, SupplierNameForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'supplier_name') String supName});
}

/// @nodoc
class _$SupplierNameFormCopyWithImpl<$Res, $Val extends SupplierNameForm>
    implements $SupplierNameFormCopyWith<$Res> {
  _$SupplierNameFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SupplierNameForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? supName = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      supName: null == supName
          ? _value.supName
          : supName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupplierNameFormImplCopyWith<$Res>
    implements $SupplierNameFormCopyWith<$Res> {
  factory _$$SupplierNameFormImplCopyWith(_$SupplierNameFormImpl value,
          $Res Function(_$SupplierNameFormImpl) then) =
      __$$SupplierNameFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'supplier_name') String supName});
}

/// @nodoc
class __$$SupplierNameFormImplCopyWithImpl<$Res>
    extends _$SupplierNameFormCopyWithImpl<$Res, _$SupplierNameFormImpl>
    implements _$$SupplierNameFormImplCopyWith<$Res> {
  __$$SupplierNameFormImplCopyWithImpl(_$SupplierNameFormImpl _value,
      $Res Function(_$SupplierNameFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of SupplierNameForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? supName = null,
  }) {
    return _then(_$SupplierNameFormImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      supName: null == supName
          ? _value.supName
          : supName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupplierNameFormImpl implements _SupplierNameForm {
  _$SupplierNameFormImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'supplier_name') required this.supName});

  factory _$SupplierNameFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupplierNameFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'supplier_name')
  final String supName;

  @override
  String toString() {
    return 'SupplierNameForm(name: $name, supName: $supName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupplierNameFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.supName, supName) || other.supName == supName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, supName);

  /// Create a copy of SupplierNameForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupplierNameFormImplCopyWith<_$SupplierNameFormImpl> get copyWith =>
      __$$SupplierNameFormImplCopyWithImpl<_$SupplierNameFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupplierNameFormImplToJson(
      this,
    );
  }
}

abstract class _SupplierNameForm implements SupplierNameForm {
  factory _SupplierNameForm(
          {@JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'supplier_name') required final String supName}) =
      _$SupplierNameFormImpl;

  factory _SupplierNameForm.fromJson(Map<String, dynamic> json) =
      _$SupplierNameFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'supplier_name')
  String get supName;

  /// Create a copy of SupplierNameForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupplierNameFormImplCopyWith<_$SupplierNameFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
