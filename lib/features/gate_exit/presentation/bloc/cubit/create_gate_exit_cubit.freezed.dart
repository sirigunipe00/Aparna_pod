// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_gate_exit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateGateExitState {
  GateExitForm get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  ActionType get type => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  List<GateEntryLinesForm> get lines => throw _privateConstructorUsedError;

  /// Create a copy of CreateGateExitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateGateExitStateCopyWith<CreateGateExitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGateExitStateCopyWith<$Res> {
  factory $CreateGateExitStateCopyWith(
          CreateGateExitState value, $Res Function(CreateGateExitState) then) =
      _$CreateGateExitStateCopyWithImpl<$Res, CreateGateExitState>;
  @useResult
  $Res call(
      {GateExitForm form,
      bool isLoading,
      bool isSuccess,
      ActionType type,
      String? successMsg,
      Failure? error,
      List<GateEntryLinesForm> lines});

  $GateExitFormCopyWith<$Res> get form;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$CreateGateExitStateCopyWithImpl<$Res, $Val extends CreateGateExitState>
    implements $CreateGateExitStateCopyWith<$Res> {
  _$CreateGateExitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateGateExitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? type = null,
    Object? successMsg = freezed,
    Object? error = freezed,
    Object? lines = null,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as GateExitForm,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      successMsg: freezed == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<GateEntryLinesForm>,
    ) as $Val);
  }

  /// Create a copy of CreateGateExitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GateExitFormCopyWith<$Res> get form {
    return $GateExitFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }

  /// Create a copy of CreateGateExitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateGateExitStateImplCopyWith<$Res>
    implements $CreateGateExitStateCopyWith<$Res> {
  factory _$$CreateGateExitStateImplCopyWith(_$CreateGateExitStateImpl value,
          $Res Function(_$CreateGateExitStateImpl) then) =
      __$$CreateGateExitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GateExitForm form,
      bool isLoading,
      bool isSuccess,
      ActionType type,
      String? successMsg,
      Failure? error,
      List<GateEntryLinesForm> lines});

  @override
  $GateExitFormCopyWith<$Res> get form;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$CreateGateExitStateImplCopyWithImpl<$Res>
    extends _$CreateGateExitStateCopyWithImpl<$Res, _$CreateGateExitStateImpl>
    implements _$$CreateGateExitStateImplCopyWith<$Res> {
  __$$CreateGateExitStateImplCopyWithImpl(_$CreateGateExitStateImpl _value,
      $Res Function(_$CreateGateExitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateGateExitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? type = null,
    Object? successMsg = freezed,
    Object? error = freezed,
    Object? lines = null,
  }) {
    return _then(_$CreateGateExitStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as GateExitForm,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActionType,
      successMsg: freezed == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<GateEntryLinesForm>,
    ));
  }
}

/// @nodoc

class _$CreateGateExitStateImpl implements _CreateGateExitState {
  const _$CreateGateExitStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isSuccess,
      required this.type,
      this.successMsg,
      this.error,
      required final List<GateEntryLinesForm> lines})
      : _lines = lines;

  @override
  final GateExitForm form;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final ActionType type;
  @override
  final String? successMsg;
  @override
  final Failure? error;
  final List<GateEntryLinesForm> _lines;
  @override
  List<GateEntryLinesForm> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  @override
  String toString() {
    return 'CreateGateExitState(form: $form, isLoading: $isLoading, isSuccess: $isSuccess, type: $type, successMsg: $successMsg, error: $error, lines: $lines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateGateExitStateImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._lines, _lines));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form, isLoading, isSuccess, type,
      successMsg, error, const DeepCollectionEquality().hash(_lines));

  /// Create a copy of CreateGateExitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateGateExitStateImplCopyWith<_$CreateGateExitStateImpl> get copyWith =>
      __$$CreateGateExitStateImplCopyWithImpl<_$CreateGateExitStateImpl>(
          this, _$identity);
}

abstract class _CreateGateExitState implements CreateGateExitState {
  const factory _CreateGateExitState(
          {required final GateExitForm form,
          required final bool isLoading,
          required final bool isSuccess,
          required final ActionType type,
          final String? successMsg,
          final Failure? error,
          required final List<GateEntryLinesForm> lines}) =
      _$CreateGateExitStateImpl;

  @override
  GateExitForm get form;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  ActionType get type;
  @override
  String? get successMsg;
  @override
  Failure? get error;
  @override
  List<GateEntryLinesForm> get lines;

  /// Create a copy of CreateGateExitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateGateExitStateImplCopyWith<_$CreateGateExitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
