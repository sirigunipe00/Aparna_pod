// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_visit_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateVisitForm _$CreateVisitFormFromJson(Map<String, dynamic> json) {
  return _CreateVisitForm.fromJson(json);
}

/// @nodoc
mixin _$CreateVisitForm {
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
  @JsonKey(name: 'scheduled_date')
  String? get scheduledDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_time')
  String? get scheduledTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'multi_visit')
  int? get multiVisit => throw _privateConstructorUsedError;
  @JsonKey(name: 'pass_type')
  String? get passType => throw _privateConstructorUsedError;
  @JsonKey(name: 'visitee_mobile')
  String? get visiteeMobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'whom_to_meet')
  String? get whomToMeet => throw _privateConstructorUsedError;
  @JsonKey(name: 'visitee_email')
  String? get visiteeEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'name1')
  String? get visitorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get visitorEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_no')
  String? get visitorMobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'visitor_company_name')
  String? get visitorCompanyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'building_name')
  String? get buildingName => throw _privateConstructorUsedError;
  @JsonKey(name: 'department')
  String? get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'amended_from')
  String? get amendedFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_number')
  String? get idNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'laptop_details')
  String? get laptopDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'other_devices_details')
  String? get otherDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'workflow_state')
  String? get workflowState => throw _privateConstructorUsedError;
  @JsonKey(
      includeToJson: false,
      includeFromJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get facePhotoImg => throw _privateConstructorUsedError;
  @JsonKey(name: 'face_photo')
  String? get facePhoto => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  File? get idPhotoImg => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_id_proof')
  String? get idPhoto => throw _privateConstructorUsedError;

  /// Serializes this CreateVisitForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateVisitForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateVisitFormCopyWith<CreateVisitForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateVisitFormCopyWith<$Res> {
  factory $CreateVisitFormCopyWith(
          CreateVisitForm value, $Res Function(CreateVisitForm) then) =
      _$CreateVisitFormCopyWithImpl<$Res, CreateVisitForm>;
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
      @JsonKey(name: 'scheduled_date') String? scheduledDate,
      @JsonKey(name: 'duration') String? duration,
      @JsonKey(name: 'scheduled_time') String? scheduledTime,
      @JsonKey(name: 'multi_visit') int? multiVisit,
      @JsonKey(name: 'pass_type') String? passType,
      @JsonKey(name: 'visitee_mobile') String? visiteeMobileNo,
      @JsonKey(name: 'whom_to_meet') String? whomToMeet,
      @JsonKey(name: 'visitee_email') String? visiteeEmail,
      @JsonKey(name: 'name1') String? visitorName,
      @JsonKey(name: 'email') String? visitorEmail,
      @JsonKey(name: 'mobile_no') String? visitorMobile,
      @JsonKey(name: 'visitor_company_name') String? visitorCompanyName,
      @JsonKey(name: 'building_name') String? buildingName,
      @JsonKey(name: 'department') String? department,
      @JsonKey(name: 'amended_from') String? amendedFrom,
      @JsonKey(name: 'id_number') String? idNumber,
      @JsonKey(name: 'laptop_details') String? laptopDetails,
      @JsonKey(name: 'other_devices_details') String? otherDetails,
      @JsonKey(name: 'workflow_state') String? workflowState,
      @JsonKey(
          includeToJson: false,
          includeFromJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? facePhotoImg,
      @JsonKey(name: 'face_photo') String? facePhoto,
      @JsonKey(includeToJson: false, includeFromJson: false) File? idPhotoImg,
      @JsonKey(name: 'photo_id_proof') String? idPhoto});
}

/// @nodoc
class _$CreateVisitFormCopyWithImpl<$Res, $Val extends CreateVisitForm>
    implements $CreateVisitFormCopyWith<$Res> {
  _$CreateVisitFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateVisitForm
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
    Object? scheduledDate = freezed,
    Object? duration = freezed,
    Object? scheduledTime = freezed,
    Object? multiVisit = freezed,
    Object? passType = freezed,
    Object? visiteeMobileNo = freezed,
    Object? whomToMeet = freezed,
    Object? visiteeEmail = freezed,
    Object? visitorName = freezed,
    Object? visitorEmail = freezed,
    Object? visitorMobile = freezed,
    Object? visitorCompanyName = freezed,
    Object? buildingName = freezed,
    Object? department = freezed,
    Object? amendedFrom = freezed,
    Object? idNumber = freezed,
    Object? laptopDetails = freezed,
    Object? otherDetails = freezed,
    Object? workflowState = freezed,
    Object? facePhotoImg = freezed,
    Object? facePhoto = freezed,
    Object? idPhotoImg = freezed,
    Object? idPhoto = freezed,
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
      scheduledDate: freezed == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledTime: freezed == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as String?,
      multiVisit: freezed == multiVisit
          ? _value.multiVisit
          : multiVisit // ignore: cast_nullable_to_non_nullable
              as int?,
      passType: freezed == passType
          ? _value.passType
          : passType // ignore: cast_nullable_to_non_nullable
              as String?,
      visiteeMobileNo: freezed == visiteeMobileNo
          ? _value.visiteeMobileNo
          : visiteeMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      whomToMeet: freezed == whomToMeet
          ? _value.whomToMeet
          : whomToMeet // ignore: cast_nullable_to_non_nullable
              as String?,
      visiteeEmail: freezed == visiteeEmail
          ? _value.visiteeEmail
          : visiteeEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorName: freezed == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorEmail: freezed == visitorEmail
          ? _value.visitorEmail
          : visitorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorMobile: freezed == visitorMobile
          ? _value.visitorMobile
          : visitorMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorCompanyName: freezed == visitorCompanyName
          ? _value.visitorCompanyName
          : visitorCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      buildingName: freezed == buildingName
          ? _value.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      amendedFrom: freezed == amendedFrom
          ? _value.amendedFrom
          : amendedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      laptopDetails: freezed == laptopDetails
          ? _value.laptopDetails
          : laptopDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      otherDetails: freezed == otherDetails
          ? _value.otherDetails
          : otherDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      workflowState: freezed == workflowState
          ? _value.workflowState
          : workflowState // ignore: cast_nullable_to_non_nullable
              as String?,
      facePhotoImg: freezed == facePhotoImg
          ? _value.facePhotoImg
          : facePhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      facePhoto: freezed == facePhoto
          ? _value.facePhoto
          : facePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      idPhotoImg: freezed == idPhotoImg
          ? _value.idPhotoImg
          : idPhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      idPhoto: freezed == idPhoto
          ? _value.idPhoto
          : idPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateVisitFormImplCopyWith<$Res>
    implements $CreateVisitFormCopyWith<$Res> {
  factory _$$CreateVisitFormImplCopyWith(_$CreateVisitFormImpl value,
          $Res Function(_$CreateVisitFormImpl) then) =
      __$$CreateVisitFormImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'scheduled_date') String? scheduledDate,
      @JsonKey(name: 'duration') String? duration,
      @JsonKey(name: 'scheduled_time') String? scheduledTime,
      @JsonKey(name: 'multi_visit') int? multiVisit,
      @JsonKey(name: 'pass_type') String? passType,
      @JsonKey(name: 'visitee_mobile') String? visiteeMobileNo,
      @JsonKey(name: 'whom_to_meet') String? whomToMeet,
      @JsonKey(name: 'visitee_email') String? visiteeEmail,
      @JsonKey(name: 'name1') String? visitorName,
      @JsonKey(name: 'email') String? visitorEmail,
      @JsonKey(name: 'mobile_no') String? visitorMobile,
      @JsonKey(name: 'visitor_company_name') String? visitorCompanyName,
      @JsonKey(name: 'building_name') String? buildingName,
      @JsonKey(name: 'department') String? department,
      @JsonKey(name: 'amended_from') String? amendedFrom,
      @JsonKey(name: 'id_number') String? idNumber,
      @JsonKey(name: 'laptop_details') String? laptopDetails,
      @JsonKey(name: 'other_devices_details') String? otherDetails,
      @JsonKey(name: 'workflow_state') String? workflowState,
      @JsonKey(
          includeToJson: false,
          includeFromJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? facePhotoImg,
      @JsonKey(name: 'face_photo') String? facePhoto,
      @JsonKey(includeToJson: false, includeFromJson: false) File? idPhotoImg,
      @JsonKey(name: 'photo_id_proof') String? idPhoto});
}

/// @nodoc
class __$$CreateVisitFormImplCopyWithImpl<$Res>
    extends _$CreateVisitFormCopyWithImpl<$Res, _$CreateVisitFormImpl>
    implements _$$CreateVisitFormImplCopyWith<$Res> {
  __$$CreateVisitFormImplCopyWithImpl(
      _$CreateVisitFormImpl _value, $Res Function(_$CreateVisitFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateVisitForm
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
    Object? scheduledDate = freezed,
    Object? duration = freezed,
    Object? scheduledTime = freezed,
    Object? multiVisit = freezed,
    Object? passType = freezed,
    Object? visiteeMobileNo = freezed,
    Object? whomToMeet = freezed,
    Object? visiteeEmail = freezed,
    Object? visitorName = freezed,
    Object? visitorEmail = freezed,
    Object? visitorMobile = freezed,
    Object? visitorCompanyName = freezed,
    Object? buildingName = freezed,
    Object? department = freezed,
    Object? amendedFrom = freezed,
    Object? idNumber = freezed,
    Object? laptopDetails = freezed,
    Object? otherDetails = freezed,
    Object? workflowState = freezed,
    Object? facePhotoImg = freezed,
    Object? facePhoto = freezed,
    Object? idPhotoImg = freezed,
    Object? idPhoto = freezed,
  }) {
    return _then(_$CreateVisitFormImpl(
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
      scheduledDate: freezed == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledTime: freezed == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as String?,
      multiVisit: freezed == multiVisit
          ? _value.multiVisit
          : multiVisit // ignore: cast_nullable_to_non_nullable
              as int?,
      passType: freezed == passType
          ? _value.passType
          : passType // ignore: cast_nullable_to_non_nullable
              as String?,
      visiteeMobileNo: freezed == visiteeMobileNo
          ? _value.visiteeMobileNo
          : visiteeMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      whomToMeet: freezed == whomToMeet
          ? _value.whomToMeet
          : whomToMeet // ignore: cast_nullable_to_non_nullable
              as String?,
      visiteeEmail: freezed == visiteeEmail
          ? _value.visiteeEmail
          : visiteeEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorName: freezed == visitorName
          ? _value.visitorName
          : visitorName // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorEmail: freezed == visitorEmail
          ? _value.visitorEmail
          : visitorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorMobile: freezed == visitorMobile
          ? _value.visitorMobile
          : visitorMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      visitorCompanyName: freezed == visitorCompanyName
          ? _value.visitorCompanyName
          : visitorCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      buildingName: freezed == buildingName
          ? _value.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      amendedFrom: freezed == amendedFrom
          ? _value.amendedFrom
          : amendedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: freezed == idNumber
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      laptopDetails: freezed == laptopDetails
          ? _value.laptopDetails
          : laptopDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      otherDetails: freezed == otherDetails
          ? _value.otherDetails
          : otherDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      workflowState: freezed == workflowState
          ? _value.workflowState
          : workflowState // ignore: cast_nullable_to_non_nullable
              as String?,
      facePhotoImg: freezed == facePhotoImg
          ? _value.facePhotoImg
          : facePhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      facePhoto: freezed == facePhoto
          ? _value.facePhoto
          : facePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      idPhotoImg: freezed == idPhotoImg
          ? _value.idPhotoImg
          : idPhotoImg // ignore: cast_nullable_to_non_nullable
              as File?,
      idPhoto: freezed == idPhoto
          ? _value.idPhoto
          : idPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateVisitFormImpl implements _CreateVisitForm {
  const _$CreateVisitFormImpl(
      {this.status,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'owner') this.owner,
      @JsonKey(name: 'creation', defaultValue: '') this.creationDate,
      @JsonKey(name: 'modified') this.modifiedDate,
      @JsonKey(name: 'modified_by') this.modifiedBy,
      @JsonKey(name: 'docstatus') this.docstatus,
      @JsonKey(name: 'plant_name') this.plantName,
      @JsonKey(name: 'scheduled_date') this.scheduledDate,
      @JsonKey(name: 'duration') this.duration,
      @JsonKey(name: 'scheduled_time') this.scheduledTime,
      @JsonKey(name: 'multi_visit') this.multiVisit,
      @JsonKey(name: 'pass_type') this.passType,
      @JsonKey(name: 'visitee_mobile') this.visiteeMobileNo,
      @JsonKey(name: 'whom_to_meet') this.whomToMeet,
      @JsonKey(name: 'visitee_email') this.visiteeEmail,
      @JsonKey(name: 'name1') this.visitorName,
      @JsonKey(name: 'email') this.visitorEmail,
      @JsonKey(name: 'mobile_no') this.visitorMobile,
      @JsonKey(name: 'visitor_company_name') this.visitorCompanyName,
      @JsonKey(name: 'building_name') this.buildingName,
      @JsonKey(name: 'department') this.department,
      @JsonKey(name: 'amended_from') this.amendedFrom,
      @JsonKey(name: 'id_number') this.idNumber,
      @JsonKey(name: 'laptop_details') this.laptopDetails,
      @JsonKey(name: 'other_devices_details') this.otherDetails,
      @JsonKey(name: 'workflow_state') this.workflowState,
      @JsonKey(
          includeToJson: false,
          includeFromJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.facePhotoImg,
      @JsonKey(name: 'face_photo') this.facePhoto,
      @JsonKey(includeToJson: false, includeFromJson: false) this.idPhotoImg,
      @JsonKey(name: 'photo_id_proof') this.idPhoto});

  factory _$CreateVisitFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateVisitFormImplFromJson(json);

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
  @JsonKey(name: 'scheduled_date')
  final String? scheduledDate;
  @override
  @JsonKey(name: 'duration')
  final String? duration;
  @override
  @JsonKey(name: 'scheduled_time')
  final String? scheduledTime;
  @override
  @JsonKey(name: 'multi_visit')
  final int? multiVisit;
  @override
  @JsonKey(name: 'pass_type')
  final String? passType;
  @override
  @JsonKey(name: 'visitee_mobile')
  final String? visiteeMobileNo;
  @override
  @JsonKey(name: 'whom_to_meet')
  final String? whomToMeet;
  @override
  @JsonKey(name: 'visitee_email')
  final String? visiteeEmail;
  @override
  @JsonKey(name: 'name1')
  final String? visitorName;
  @override
  @JsonKey(name: 'email')
  final String? visitorEmail;
  @override
  @JsonKey(name: 'mobile_no')
  final String? visitorMobile;
  @override
  @JsonKey(name: 'visitor_company_name')
  final String? visitorCompanyName;
  @override
  @JsonKey(name: 'building_name')
  final String? buildingName;
  @override
  @JsonKey(name: 'department')
  final String? department;
  @override
  @JsonKey(name: 'amended_from')
  final String? amendedFrom;
  @override
  @JsonKey(name: 'id_number')
  final String? idNumber;
  @override
  @JsonKey(name: 'laptop_details')
  final String? laptopDetails;
  @override
  @JsonKey(name: 'other_devices_details')
  final String? otherDetails;
  @override
  @JsonKey(name: 'workflow_state')
  final String? workflowState;
  @override
  @JsonKey(
      includeToJson: false,
      includeFromJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? facePhotoImg;
  @override
  @JsonKey(name: 'face_photo')
  final String? facePhoto;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final File? idPhotoImg;
  @override
  @JsonKey(name: 'photo_id_proof')
  final String? idPhoto;

  @override
  String toString() {
    return 'CreateVisitForm(status: $status, name: $name, owner: $owner, creationDate: $creationDate, modifiedDate: $modifiedDate, modifiedBy: $modifiedBy, docstatus: $docstatus, plantName: $plantName, scheduledDate: $scheduledDate, duration: $duration, scheduledTime: $scheduledTime, multiVisit: $multiVisit, passType: $passType, visiteeMobileNo: $visiteeMobileNo, whomToMeet: $whomToMeet, visiteeEmail: $visiteeEmail, visitorName: $visitorName, visitorEmail: $visitorEmail, visitorMobile: $visitorMobile, visitorCompanyName: $visitorCompanyName, buildingName: $buildingName, department: $department, amendedFrom: $amendedFrom, idNumber: $idNumber, laptopDetails: $laptopDetails, otherDetails: $otherDetails, workflowState: $workflowState, facePhotoImg: $facePhotoImg, facePhoto: $facePhoto, idPhotoImg: $idPhotoImg, idPhoto: $idPhoto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVisitFormImpl &&
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
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.multiVisit, multiVisit) ||
                other.multiVisit == multiVisit) &&
            (identical(other.passType, passType) ||
                other.passType == passType) &&
            (identical(other.visiteeMobileNo, visiteeMobileNo) ||
                other.visiteeMobileNo == visiteeMobileNo) &&
            (identical(other.whomToMeet, whomToMeet) ||
                other.whomToMeet == whomToMeet) &&
            (identical(other.visiteeEmail, visiteeEmail) ||
                other.visiteeEmail == visiteeEmail) &&
            (identical(other.visitorName, visitorName) ||
                other.visitorName == visitorName) &&
            (identical(other.visitorEmail, visitorEmail) ||
                other.visitorEmail == visitorEmail) &&
            (identical(other.visitorMobile, visitorMobile) ||
                other.visitorMobile == visitorMobile) &&
            (identical(other.visitorCompanyName, visitorCompanyName) ||
                other.visitorCompanyName == visitorCompanyName) &&
            (identical(other.buildingName, buildingName) ||
                other.buildingName == buildingName) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.amendedFrom, amendedFrom) ||
                other.amendedFrom == amendedFrom) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            (identical(other.laptopDetails, laptopDetails) ||
                other.laptopDetails == laptopDetails) &&
            (identical(other.otherDetails, otherDetails) ||
                other.otherDetails == otherDetails) &&
            (identical(other.workflowState, workflowState) ||
                other.workflowState == workflowState) &&
            (identical(other.facePhotoImg, facePhotoImg) ||
                other.facePhotoImg == facePhotoImg) &&
            (identical(other.facePhoto, facePhoto) ||
                other.facePhoto == facePhoto) &&
            (identical(other.idPhotoImg, idPhotoImg) ||
                other.idPhotoImg == idPhotoImg) &&
            (identical(other.idPhoto, idPhoto) || other.idPhoto == idPhoto));
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
        scheduledDate,
        duration,
        scheduledTime,
        multiVisit,
        passType,
        visiteeMobileNo,
        whomToMeet,
        visiteeEmail,
        visitorName,
        visitorEmail,
        visitorMobile,
        visitorCompanyName,
        buildingName,
        department,
        amendedFrom,
        idNumber,
        laptopDetails,
        otherDetails,
        workflowState,
        facePhotoImg,
        facePhoto,
        idPhotoImg,
        idPhoto
      ]);

  /// Create a copy of CreateVisitForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateVisitFormImplCopyWith<_$CreateVisitFormImpl> get copyWith =>
      __$$CreateVisitFormImplCopyWithImpl<_$CreateVisitFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateVisitFormImplToJson(
      this,
    );
  }
}

abstract class _CreateVisitForm implements CreateVisitForm {
  const factory _CreateVisitForm(
      {final String? status,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'owner') final String? owner,
      @JsonKey(name: 'creation', defaultValue: '') final String? creationDate,
      @JsonKey(name: 'modified') final String? modifiedDate,
      @JsonKey(name: 'modified_by') final String? modifiedBy,
      @JsonKey(name: 'docstatus') final int? docstatus,
      @JsonKey(name: 'plant_name') final String? plantName,
      @JsonKey(name: 'scheduled_date') final String? scheduledDate,
      @JsonKey(name: 'duration') final String? duration,
      @JsonKey(name: 'scheduled_time') final String? scheduledTime,
      @JsonKey(name: 'multi_visit') final int? multiVisit,
      @JsonKey(name: 'pass_type') final String? passType,
      @JsonKey(name: 'visitee_mobile') final String? visiteeMobileNo,
      @JsonKey(name: 'whom_to_meet') final String? whomToMeet,
      @JsonKey(name: 'visitee_email') final String? visiteeEmail,
      @JsonKey(name: 'name1') final String? visitorName,
      @JsonKey(name: 'email') final String? visitorEmail,
      @JsonKey(name: 'mobile_no') final String? visitorMobile,
      @JsonKey(name: 'visitor_company_name') final String? visitorCompanyName,
      @JsonKey(name: 'building_name') final String? buildingName,
      @JsonKey(name: 'department') final String? department,
      @JsonKey(name: 'amended_from') final String? amendedFrom,
      @JsonKey(name: 'id_number') final String? idNumber,
      @JsonKey(name: 'laptop_details') final String? laptopDetails,
      @JsonKey(name: 'other_devices_details') final String? otherDetails,
      @JsonKey(name: 'workflow_state') final String? workflowState,
      @JsonKey(
          includeToJson: false,
          includeFromJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? facePhotoImg,
      @JsonKey(name: 'face_photo') final String? facePhoto,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final File? idPhotoImg,
      @JsonKey(name: 'photo_id_proof')
      final String? idPhoto}) = _$CreateVisitFormImpl;

  factory _CreateVisitForm.fromJson(Map<String, dynamic> json) =
      _$CreateVisitFormImpl.fromJson;

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
  @JsonKey(name: 'scheduled_date')
  String? get scheduledDate;
  @override
  @JsonKey(name: 'duration')
  String? get duration;
  @override
  @JsonKey(name: 'scheduled_time')
  String? get scheduledTime;
  @override
  @JsonKey(name: 'multi_visit')
  int? get multiVisit;
  @override
  @JsonKey(name: 'pass_type')
  String? get passType;
  @override
  @JsonKey(name: 'visitee_mobile')
  String? get visiteeMobileNo;
  @override
  @JsonKey(name: 'whom_to_meet')
  String? get whomToMeet;
  @override
  @JsonKey(name: 'visitee_email')
  String? get visiteeEmail;
  @override
  @JsonKey(name: 'name1')
  String? get visitorName;
  @override
  @JsonKey(name: 'email')
  String? get visitorEmail;
  @override
  @JsonKey(name: 'mobile_no')
  String? get visitorMobile;
  @override
  @JsonKey(name: 'visitor_company_name')
  String? get visitorCompanyName;
  @override
  @JsonKey(name: 'building_name')
  String? get buildingName;
  @override
  @JsonKey(name: 'department')
  String? get department;
  @override
  @JsonKey(name: 'amended_from')
  String? get amendedFrom;
  @override
  @JsonKey(name: 'id_number')
  String? get idNumber;
  @override
  @JsonKey(name: 'laptop_details')
  String? get laptopDetails;
  @override
  @JsonKey(name: 'other_devices_details')
  String? get otherDetails;
  @override
  @JsonKey(name: 'workflow_state')
  String? get workflowState;
  @override
  @JsonKey(
      includeToJson: false,
      includeFromJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get facePhotoImg;
  @override
  @JsonKey(name: 'face_photo')
  String? get facePhoto;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  File? get idPhotoImg;
  @override
  @JsonKey(name: 'photo_id_proof')
  String? get idPhoto;

  /// Create a copy of CreateVisitForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateVisitFormImplCopyWith<_$CreateVisitFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
