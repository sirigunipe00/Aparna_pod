// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_type_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IncidentTypeForm _$IncidentTypeFormFromJson(Map<String, dynamic> json) {
  return _IncidentTypeForm.fromJson(json);
}

/// @nodoc
mixin _$IncidentTypeForm {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get pincode => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line1')
  String? get line1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line2')
  String? get line2 => throw _privateConstructorUsedError;

  /// Serializes this IncidentTypeForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IncidentTypeForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IncidentTypeFormCopyWith<IncidentTypeForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentTypeFormCopyWith<$Res> {
  factory $IncidentTypeFormCopyWith(
          IncidentTypeForm value, $Res Function(IncidentTypeForm) then) =
      _$IncidentTypeFormCopyWithImpl<$Res, IncidentTypeForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      String? city,
      String? pincode,
      @JsonKey(name: 'address_line1') String? line1,
      @JsonKey(name: 'address_line2') String? line2});
}

/// @nodoc
class _$IncidentTypeFormCopyWithImpl<$Res, $Val extends IncidentTypeForm>
    implements $IncidentTypeFormCopyWith<$Res> {
  _$IncidentTypeFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IncidentTypeForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? city = freezed,
    Object? pincode = freezed,
    Object? line1 = freezed,
    Object? line2 = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncidentTypeFormImplCopyWith<$Res>
    implements $IncidentTypeFormCopyWith<$Res> {
  factory _$$IncidentTypeFormImplCopyWith(_$IncidentTypeFormImpl value,
          $Res Function(_$IncidentTypeFormImpl) then) =
      __$$IncidentTypeFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      String? city,
      String? pincode,
      @JsonKey(name: 'address_line1') String? line1,
      @JsonKey(name: 'address_line2') String? line2});
}

/// @nodoc
class __$$IncidentTypeFormImplCopyWithImpl<$Res>
    extends _$IncidentTypeFormCopyWithImpl<$Res, _$IncidentTypeFormImpl>
    implements _$$IncidentTypeFormImplCopyWith<$Res> {
  __$$IncidentTypeFormImplCopyWithImpl(_$IncidentTypeFormImpl _value,
      $Res Function(_$IncidentTypeFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of IncidentTypeForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? city = freezed,
    Object? pincode = freezed,
    Object? line1 = freezed,
    Object? line2 = freezed,
  }) {
    return _then(_$IncidentTypeFormImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncidentTypeFormImpl implements _IncidentTypeForm {
  _$IncidentTypeFormImpl(
      {@JsonKey(name: 'name') required this.name,
      this.city,
      this.pincode,
      @JsonKey(name: 'address_line1') this.line1,
      @JsonKey(name: 'address_line2') this.line2});

  factory _$IncidentTypeFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncidentTypeFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  final String? city;
  @override
  final String? pincode;
  @override
  @JsonKey(name: 'address_line1')
  final String? line1;
  @override
  @JsonKey(name: 'address_line2')
  final String? line2;

  @override
  String toString() {
    return 'IncidentTypeForm(name: $name, city: $city, pincode: $pincode, line1: $line1, line2: $line2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncidentTypeFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.line1, line1) || other.line1 == line1) &&
            (identical(other.line2, line2) || other.line2 == line2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, city, pincode, line1, line2);

  /// Create a copy of IncidentTypeForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncidentTypeFormImplCopyWith<_$IncidentTypeFormImpl> get copyWith =>
      __$$IncidentTypeFormImplCopyWithImpl<_$IncidentTypeFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncidentTypeFormImplToJson(
      this,
    );
  }
}

abstract class _IncidentTypeForm implements IncidentTypeForm {
  factory _IncidentTypeForm(
          {@JsonKey(name: 'name') required final String name,
          final String? city,
          final String? pincode,
          @JsonKey(name: 'address_line1') final String? line1,
          @JsonKey(name: 'address_line2') final String? line2}) =
      _$IncidentTypeFormImpl;

  factory _IncidentTypeForm.fromJson(Map<String, dynamic> json) =
      _$IncidentTypeFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  String? get city;
  @override
  String? get pincode;
  @override
  @JsonKey(name: 'address_line1')
  String? get line1;
  @override
  @JsonKey(name: 'address_line2')
  String? get line2;

  /// Create a copy of IncidentTypeForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncidentTypeFormImplCopyWith<_$IncidentTypeFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
