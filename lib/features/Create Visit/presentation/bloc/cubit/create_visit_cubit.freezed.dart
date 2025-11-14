// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_visit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateVisitState {
  CreateVisitForm get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  ActionType get type => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  bool get showApprovalButtons => throw _privateConstructorUsedError;

  /// Create a copy of CreateVisitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateVisitStateCopyWith<CreateVisitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateVisitStateCopyWith<$Res> {
  factory $CreateVisitStateCopyWith(
          CreateVisitState value, $Res Function(CreateVisitState) then) =
      _$CreateVisitStateCopyWithImpl<$Res, CreateVisitState>;
  @useResult
  $Res call(
      {CreateVisitForm form,
      bool isLoading,
      bool isSuccess,
      ActionType type,
      String? successMsg,
      Failure? error,
      bool showApprovalButtons});

  $CreateVisitFormCopyWith<$Res> get form;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$CreateVisitStateCopyWithImpl<$Res, $Val extends CreateVisitState>
    implements $CreateVisitStateCopyWith<$Res> {
  _$CreateVisitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateVisitState
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
    Object? showApprovalButtons = null,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as CreateVisitForm,
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
      showApprovalButtons: null == showApprovalButtons
          ? _value.showApprovalButtons
          : showApprovalButtons // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CreateVisitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateVisitFormCopyWith<$Res> get form {
    return $CreateVisitFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }

  /// Create a copy of CreateVisitState
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
abstract class _$$CreateVisitStateImplCopyWith<$Res>
    implements $CreateVisitStateCopyWith<$Res> {
  factory _$$CreateVisitStateImplCopyWith(_$CreateVisitStateImpl value,
          $Res Function(_$CreateVisitStateImpl) then) =
      __$$CreateVisitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CreateVisitForm form,
      bool isLoading,
      bool isSuccess,
      ActionType type,
      String? successMsg,
      Failure? error,
      bool showApprovalButtons});

  @override
  $CreateVisitFormCopyWith<$Res> get form;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$CreateVisitStateImplCopyWithImpl<$Res>
    extends _$CreateVisitStateCopyWithImpl<$Res, _$CreateVisitStateImpl>
    implements _$$CreateVisitStateImplCopyWith<$Res> {
  __$$CreateVisitStateImplCopyWithImpl(_$CreateVisitStateImpl _value,
      $Res Function(_$CreateVisitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateVisitState
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
    Object? showApprovalButtons = null,
  }) {
    return _then(_$CreateVisitStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as CreateVisitForm,
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
      showApprovalButtons: null == showApprovalButtons
          ? _value.showApprovalButtons
          : showApprovalButtons // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CreateVisitStateImpl implements _CreateVisitState {
  const _$CreateVisitStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isSuccess,
      required this.type,
      this.successMsg,
      this.error,
      this.showApprovalButtons = false});

  @override
  final CreateVisitForm form;
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
  @override
  @JsonKey()
  final bool showApprovalButtons;

  @override
  String toString() {
    return 'CreateVisitState(form: $form, isLoading: $isLoading, isSuccess: $isSuccess, type: $type, successMsg: $successMsg, error: $error, showApprovalButtons: $showApprovalButtons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVisitStateImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.showApprovalButtons, showApprovalButtons) ||
                other.showApprovalButtons == showApprovalButtons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, form, isLoading, isSuccess, type,
      successMsg, error, showApprovalButtons);

  /// Create a copy of CreateVisitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateVisitStateImplCopyWith<_$CreateVisitStateImpl> get copyWith =>
      __$$CreateVisitStateImplCopyWithImpl<_$CreateVisitStateImpl>(
          this, _$identity);
}

abstract class _CreateVisitState implements CreateVisitState {
  const factory _CreateVisitState(
      {required final CreateVisitForm form,
      required final bool isLoading,
      required final bool isSuccess,
      required final ActionType type,
      final String? successMsg,
      final Failure? error,
      final bool showApprovalButtons}) = _$CreateVisitStateImpl;

  @override
  CreateVisitForm get form;
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
  bool get showApprovalButtons;

  /// Create a copy of CreateVisitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateVisitStateImplCopyWith<_$CreateVisitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
