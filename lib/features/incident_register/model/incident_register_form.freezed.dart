// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_register_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IncidentRegisterForm _$IncidentRegisterFormFromJson(Map<String, dynamic> json) {
  return _IncidentRegisterForm.fromJson(json);
}

/// @nodoc
mixin _$IncidentRegisterForm {
  String? get name => throw _privateConstructorUsedError;
  String? get owner => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified')
  String? get modifiedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'docstatus')
  int? get docStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'incident_investigator_rsm_name_')
  String? get incidentInvestigator => throw _privateConstructorUsedError;
  @JsonKey(name: 'incident_plant_name', defaultValue: '')
  String? get incidentPlantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_of_incident')
  String? get incidentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ael_associated_involved')
  String? get associatedInvol => throw _privateConstructorUsedError;
  @JsonKey(name: 'ael_assets_involved')
  String? get assetsInvolve => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'fir_complaint')
  String? get complaint => throw _privateConstructorUsedError;
  @JsonKey(name: 'notify_employee')
  String? get employeeEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'details_of_other_party')
  String? get otherPartyDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'incident_description_1')
  String? get desc1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'incident_description')
  String? get desc2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'action_takenrecommendation')
  String? get desc3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo')
  String? get photo => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get incPhotoImg => throw _privateConstructorUsedError;

  /// Serializes this IncidentRegisterForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IncidentRegisterForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IncidentRegisterFormCopyWith<IncidentRegisterForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentRegisterFormCopyWith<$Res> {
  factory $IncidentRegisterFormCopyWith(IncidentRegisterForm value,
          $Res Function(IncidentRegisterForm) then) =
      _$IncidentRegisterFormCopyWithImpl<$Res, IncidentRegisterForm>;
  @useResult
  $Res call(
      {String? name,
      String? owner,
      String? date,
      String? time,
      @JsonKey(name: 'modified') String? modifiedDate,
      @JsonKey(name: 'docstatus') int? docStatus,
      @JsonKey(name: 'incident_investigator_rsm_name_')
      String? incidentInvestigator,
      @JsonKey(name: 'incident_plant_name', defaultValue: '')
      String? incidentPlantName,
      @JsonKey(name: 'type_of_incident') String? incidentType,
      @JsonKey(name: 'ael_associated_involved') String? associatedInvol,
      @JsonKey(name: 'ael_assets_involved') String? assetsInvolve,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'fir_complaint') String? complaint,
      @JsonKey(name: 'notify_employee') String? employeeEmail,
      @JsonKey(name: 'remarks') String? remarks,
      @JsonKey(name: 'details_of_other_party') String? otherPartyDetails,
      @JsonKey(name: 'incident_description_1') String? desc1,
      @JsonKey(name: 'incident_description') String? desc2,
      @JsonKey(name: 'action_takenrecommendation') String? desc3,
      @JsonKey(name: 'photo') String? photo,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? incPhotoImg});
}

/// @nodoc
class _$IncidentRegisterFormCopyWithImpl<$Res,
        $Val extends IncidentRegisterForm>
    implements $IncidentRegisterFormCopyWith<$Res> {
  _$IncidentRegisterFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IncidentRegisterForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? modifiedDate = freezed,
    Object? docStatus = freezed,
    Object? incidentInvestigator = freezed,
    Object? incidentPlantName = freezed,
    Object? incidentType = freezed,
    Object? associatedInvol = freezed,
    Object? assetsInvolve = freezed,
    Object? amount = freezed,
    Object? complaint = freezed,
    Object? employeeEmail = freezed,
    Object? remarks = freezed,
    Object? otherPartyDetails = freezed,
    Object? desc1 = freezed,
    Object? desc2 = freezed,
    Object? desc3 = freezed,
    Object? photo = freezed,
    Object? incPhotoImg = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: freezed == docStatus
          ? _value.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      incidentInvestigator: freezed == incidentInvestigator
          ? _value.incidentInvestigator
          : incidentInvestigator // ignore: cast_nullable_to_non_nullable
              as String?,
      incidentPlantName: freezed == incidentPlantName
          ? _value.incidentPlantName
          : incidentPlantName // ignore: cast_nullable_to_non_nullable
              as String?,
      incidentType: freezed == incidentType
          ? _value.incidentType
          : incidentType // ignore: cast_nullable_to_non_nullable
              as String?,
      associatedInvol: freezed == associatedInvol
          ? _value.associatedInvol
          : associatedInvol // ignore: cast_nullable_to_non_nullable
              as String?,
      assetsInvolve: freezed == assetsInvolve
          ? _value.assetsInvolve
          : assetsInvolve // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      complaint: freezed == complaint
          ? _value.complaint
          : complaint // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeEmail: freezed == employeeEmail
          ? _value.employeeEmail
          : employeeEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      otherPartyDetails: freezed == otherPartyDetails
          ? _value.otherPartyDetails
          : otherPartyDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      desc1: freezed == desc1
          ? _value.desc1
          : desc1 // ignore: cast_nullable_to_non_nullable
              as String?,
      desc2: freezed == desc2
          ? _value.desc2
          : desc2 // ignore: cast_nullable_to_non_nullable
              as String?,
      desc3: freezed == desc3
          ? _value.desc3
          : desc3 // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      incPhotoImg: freezed == incPhotoImg
          ? _value.incPhotoImg
          : incPhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncidentRegisterFormImplCopyWith<$Res>
    implements $IncidentRegisterFormCopyWith<$Res> {
  factory _$$IncidentRegisterFormImplCopyWith(_$IncidentRegisterFormImpl value,
          $Res Function(_$IncidentRegisterFormImpl) then) =
      __$$IncidentRegisterFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? owner,
      String? date,
      String? time,
      @JsonKey(name: 'modified') String? modifiedDate,
      @JsonKey(name: 'docstatus') int? docStatus,
      @JsonKey(name: 'incident_investigator_rsm_name_')
      String? incidentInvestigator,
      @JsonKey(name: 'incident_plant_name', defaultValue: '')
      String? incidentPlantName,
      @JsonKey(name: 'type_of_incident') String? incidentType,
      @JsonKey(name: 'ael_associated_involved') String? associatedInvol,
      @JsonKey(name: 'ael_assets_involved') String? assetsInvolve,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'fir_complaint') String? complaint,
      @JsonKey(name: 'notify_employee') String? employeeEmail,
      @JsonKey(name: 'remarks') String? remarks,
      @JsonKey(name: 'details_of_other_party') String? otherPartyDetails,
      @JsonKey(name: 'incident_description_1') String? desc1,
      @JsonKey(name: 'incident_description') String? desc2,
      @JsonKey(name: 'action_takenrecommendation') String? desc3,
      @JsonKey(name: 'photo') String? photo,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? incPhotoImg});
}

/// @nodoc
class __$$IncidentRegisterFormImplCopyWithImpl<$Res>
    extends _$IncidentRegisterFormCopyWithImpl<$Res, _$IncidentRegisterFormImpl>
    implements _$$IncidentRegisterFormImplCopyWith<$Res> {
  __$$IncidentRegisterFormImplCopyWithImpl(_$IncidentRegisterFormImpl _value,
      $Res Function(_$IncidentRegisterFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of IncidentRegisterForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? modifiedDate = freezed,
    Object? docStatus = freezed,
    Object? incidentInvestigator = freezed,
    Object? incidentPlantName = freezed,
    Object? incidentType = freezed,
    Object? associatedInvol = freezed,
    Object? assetsInvolve = freezed,
    Object? amount = freezed,
    Object? complaint = freezed,
    Object? employeeEmail = freezed,
    Object? remarks = freezed,
    Object? otherPartyDetails = freezed,
    Object? desc1 = freezed,
    Object? desc2 = freezed,
    Object? desc3 = freezed,
    Object? photo = freezed,
    Object? incPhotoImg = freezed,
  }) {
    return _then(_$IncidentRegisterFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedDate: freezed == modifiedDate
          ? _value.modifiedDate
          : modifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      docStatus: freezed == docStatus
          ? _value.docStatus
          : docStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      incidentInvestigator: freezed == incidentInvestigator
          ? _value.incidentInvestigator
          : incidentInvestigator // ignore: cast_nullable_to_non_nullable
              as String?,
      incidentPlantName: freezed == incidentPlantName
          ? _value.incidentPlantName
          : incidentPlantName // ignore: cast_nullable_to_non_nullable
              as String?,
      incidentType: freezed == incidentType
          ? _value.incidentType
          : incidentType // ignore: cast_nullable_to_non_nullable
              as String?,
      associatedInvol: freezed == associatedInvol
          ? _value.associatedInvol
          : associatedInvol // ignore: cast_nullable_to_non_nullable
              as String?,
      assetsInvolve: freezed == assetsInvolve
          ? _value.assetsInvolve
          : assetsInvolve // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      complaint: freezed == complaint
          ? _value.complaint
          : complaint // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeEmail: freezed == employeeEmail
          ? _value.employeeEmail
          : employeeEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      otherPartyDetails: freezed == otherPartyDetails
          ? _value.otherPartyDetails
          : otherPartyDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      desc1: freezed == desc1
          ? _value.desc1
          : desc1 // ignore: cast_nullable_to_non_nullable
              as String?,
      desc2: freezed == desc2
          ? _value.desc2
          : desc2 // ignore: cast_nullable_to_non_nullable
              as String?,
      desc3: freezed == desc3
          ? _value.desc3
          : desc3 // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      incPhotoImg: freezed == incPhotoImg
          ? _value.incPhotoImg
          : incPhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncidentRegisterFormImpl implements _IncidentRegisterForm {
  const _$IncidentRegisterFormImpl(
      {this.name,
      this.owner,
      this.date,
      this.time,
      @JsonKey(name: 'modified') this.modifiedDate,
      @JsonKey(name: 'docstatus') this.docStatus,
      @JsonKey(name: 'incident_investigator_rsm_name_')
      this.incidentInvestigator,
      @JsonKey(name: 'incident_plant_name', defaultValue: '')
      this.incidentPlantName,
      @JsonKey(name: 'type_of_incident') this.incidentType,
      @JsonKey(name: 'ael_associated_involved') this.associatedInvol,
      @JsonKey(name: 'ael_assets_involved') this.assetsInvolve,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'fir_complaint') this.complaint,
      @JsonKey(name: 'notify_employee') this.employeeEmail,
      @JsonKey(name: 'remarks') this.remarks,
      @JsonKey(name: 'details_of_other_party') this.otherPartyDetails,
      @JsonKey(name: 'incident_description_1') this.desc1,
      @JsonKey(name: 'incident_description') this.desc2,
      @JsonKey(name: 'action_takenrecommendation') this.desc3,
      @JsonKey(name: 'photo') this.photo,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.incPhotoImg});

  factory _$IncidentRegisterFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncidentRegisterFormImplFromJson(json);

  @override
  final String? name;
  @override
  final String? owner;
  @override
  final String? date;
  @override
  final String? time;
  @override
  @JsonKey(name: 'modified')
  final String? modifiedDate;
  @override
  @JsonKey(name: 'docstatus')
  final int? docStatus;
  @override
  @JsonKey(name: 'incident_investigator_rsm_name_')
  final String? incidentInvestigator;
  @override
  @JsonKey(name: 'incident_plant_name', defaultValue: '')
  final String? incidentPlantName;
  @override
  @JsonKey(name: 'type_of_incident')
  final String? incidentType;
  @override
  @JsonKey(name: 'ael_associated_involved')
  final String? associatedInvol;
  @override
  @JsonKey(name: 'ael_assets_involved')
  final String? assetsInvolve;
  @override
  @JsonKey(name: 'amount')
  final int? amount;
  @override
  @JsonKey(name: 'fir_complaint')
  final String? complaint;
  @override
  @JsonKey(name: 'notify_employee')
  final String? employeeEmail;
  @override
  @JsonKey(name: 'remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'details_of_other_party')
  final String? otherPartyDetails;
  @override
  @JsonKey(name: 'incident_description_1')
  final String? desc1;
  @override
  @JsonKey(name: 'incident_description')
  final String? desc2;
  @override
  @JsonKey(name: 'action_takenrecommendation')
  final String? desc3;
  @override
  @JsonKey(name: 'photo')
  final String? photo;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? incPhotoImg;

  @override
  String toString() {
    return 'IncidentRegisterForm(name: $name, owner: $owner, date: $date, time: $time, modifiedDate: $modifiedDate, docStatus: $docStatus, incidentInvestigator: $incidentInvestigator, incidentPlantName: $incidentPlantName, incidentType: $incidentType, associatedInvol: $associatedInvol, assetsInvolve: $assetsInvolve, amount: $amount, complaint: $complaint, employeeEmail: $employeeEmail, remarks: $remarks, otherPartyDetails: $otherPartyDetails, desc1: $desc1, desc2: $desc2, desc3: $desc3, photo: $photo, incPhotoImg: $incPhotoImg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncidentRegisterFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.modifiedDate, modifiedDate) ||
                other.modifiedDate == modifiedDate) &&
            (identical(other.docStatus, docStatus) ||
                other.docStatus == docStatus) &&
            (identical(other.incidentInvestigator, incidentInvestigator) ||
                other.incidentInvestigator == incidentInvestigator) &&
            (identical(other.incidentPlantName, incidentPlantName) ||
                other.incidentPlantName == incidentPlantName) &&
            (identical(other.incidentType, incidentType) ||
                other.incidentType == incidentType) &&
            (identical(other.associatedInvol, associatedInvol) ||
                other.associatedInvol == associatedInvol) &&
            (identical(other.assetsInvolve, assetsInvolve) ||
                other.assetsInvolve == assetsInvolve) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.complaint, complaint) ||
                other.complaint == complaint) &&
            (identical(other.employeeEmail, employeeEmail) ||
                other.employeeEmail == employeeEmail) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.otherPartyDetails, otherPartyDetails) ||
                other.otherPartyDetails == otherPartyDetails) &&
            (identical(other.desc1, desc1) || other.desc1 == desc1) &&
            (identical(other.desc2, desc2) || other.desc2 == desc2) &&
            (identical(other.desc3, desc3) || other.desc3 == desc3) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.incPhotoImg, incPhotoImg) ||
                other.incPhotoImg == incPhotoImg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        owner,
        date,
        time,
        modifiedDate,
        docStatus,
        incidentInvestigator,
        incidentPlantName,
        incidentType,
        associatedInvol,
        assetsInvolve,
        amount,
        complaint,
        employeeEmail,
        remarks,
        otherPartyDetails,
        desc1,
        desc2,
        desc3,
        photo,
        incPhotoImg
      ]);

  /// Create a copy of IncidentRegisterForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncidentRegisterFormImplCopyWith<_$IncidentRegisterFormImpl>
      get copyWith =>
          __$$IncidentRegisterFormImplCopyWithImpl<_$IncidentRegisterFormImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncidentRegisterFormImplToJson(
      this,
    );
  }
}

abstract class _IncidentRegisterForm implements IncidentRegisterForm {
  const factory _IncidentRegisterForm(
      {final String? name,
      final String? owner,
      final String? date,
      final String? time,
      @JsonKey(name: 'modified') final String? modifiedDate,
      @JsonKey(name: 'docstatus') final int? docStatus,
      @JsonKey(name: 'incident_investigator_rsm_name_')
      final String? incidentInvestigator,
      @JsonKey(name: 'incident_plant_name', defaultValue: '')
      final String? incidentPlantName,
      @JsonKey(name: 'type_of_incident') final String? incidentType,
      @JsonKey(name: 'ael_associated_involved') final String? associatedInvol,
      @JsonKey(name: 'ael_assets_involved') final String? assetsInvolve,
      @JsonKey(name: 'amount') final int? amount,
      @JsonKey(name: 'fir_complaint') final String? complaint,
      @JsonKey(name: 'notify_employee') final String? employeeEmail,
      @JsonKey(name: 'remarks') final String? remarks,
      @JsonKey(name: 'details_of_other_party') final String? otherPartyDetails,
      @JsonKey(name: 'incident_description_1') final String? desc1,
      @JsonKey(name: 'incident_description') final String? desc2,
      @JsonKey(name: 'action_takenrecommendation') final String? desc3,
      @JsonKey(name: 'photo') final String? photo,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? incPhotoImg}) = _$IncidentRegisterFormImpl;

  factory _IncidentRegisterForm.fromJson(Map<String, dynamic> json) =
      _$IncidentRegisterFormImpl.fromJson;

  @override
  String? get name;
  @override
  String? get owner;
  @override
  String? get date;
  @override
  String? get time;
  @override
  @JsonKey(name: 'modified')
  String? get modifiedDate;
  @override
  @JsonKey(name: 'docstatus')
  int? get docStatus;
  @override
  @JsonKey(name: 'incident_investigator_rsm_name_')
  String? get incidentInvestigator;
  @override
  @JsonKey(name: 'incident_plant_name', defaultValue: '')
  String? get incidentPlantName;
  @override
  @JsonKey(name: 'type_of_incident')
  String? get incidentType;
  @override
  @JsonKey(name: 'ael_associated_involved')
  String? get associatedInvol;
  @override
  @JsonKey(name: 'ael_assets_involved')
  String? get assetsInvolve;
  @override
  @JsonKey(name: 'amount')
  int? get amount;
  @override
  @JsonKey(name: 'fir_complaint')
  String? get complaint;
  @override
  @JsonKey(name: 'notify_employee')
  String? get employeeEmail;
  @override
  @JsonKey(name: 'remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'details_of_other_party')
  String? get otherPartyDetails;
  @override
  @JsonKey(name: 'incident_description_1')
  String? get desc1;
  @override
  @JsonKey(name: 'incident_description')
  String? get desc2;
  @override
  @JsonKey(name: 'action_takenrecommendation')
  String? get desc3;
  @override
  @JsonKey(name: 'photo')
  String? get photo;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get incPhotoImg;

  /// Create a copy of IncidentRegisterForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncidentRegisterFormImplCopyWith<_$IncidentRegisterFormImpl>
      get copyWith => throw _privateConstructorUsedError;
}
