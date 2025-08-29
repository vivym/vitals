// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Patient {

 String get id; String get name;@JsonKey(name: 'id_number') String get idNumber; Gender get gender;@JsonKey(name: 'birth_date') DateTime get birthDate; String get phone;@JsonKey(name: 'medical_record_number') String? get medicalRecordNumber;@JsonKey(name: 'emergency_contact') String? get emergencyContact;@JsonKey(name: 'emergency_contact_phone') String? get emergencyContactPhone;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientCopyWith<Patient> get copyWith => _$PatientCopyWithImpl<Patient>(this as Patient, _$identity);

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.medicalRecordNumber, medicalRecordNumber) || other.medicalRecordNumber == medicalRecordNumber)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,idNumber,gender,birthDate,phone,medicalRecordNumber,emergencyContact,emergencyContactPhone,createdAt,updatedAt);

@override
String toString() {
  return 'Patient(id: $id, name: $name, idNumber: $idNumber, gender: $gender, birthDate: $birthDate, phone: $phone, medicalRecordNumber: $medicalRecordNumber, emergencyContact: $emergencyContact, emergencyContactPhone: $emergencyContactPhone, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PatientCopyWith<$Res>  {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) _then) = _$PatientCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'id_number') String idNumber, Gender gender,@JsonKey(name: 'birth_date') DateTime birthDate, String phone,@JsonKey(name: 'medical_record_number') String? medicalRecordNumber,@JsonKey(name: 'emergency_contact') String? emergencyContact,@JsonKey(name: 'emergency_contact_phone') String? emergencyContactPhone,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$PatientCopyWithImpl<$Res>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._self, this._then);

  final Patient _self;
  final $Res Function(Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? idNumber = null,Object? gender = null,Object? birthDate = null,Object? phone = null,Object? medicalRecordNumber = freezed,Object? emergencyContact = freezed,Object? emergencyContactPhone = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,medicalRecordNumber: freezed == medicalRecordNumber ? _self.medicalRecordNumber : medicalRecordNumber // ignore: cast_nullable_to_non_nullable
as String?,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactPhone: freezed == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Patient].
extension PatientPatterns on Patient {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Patient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Patient value)  $default,){
final _that = this;
switch (_that) {
case _Patient():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Patient value)?  $default,){
final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'id_number')  String idNumber,  Gender gender, @JsonKey(name: 'birth_date')  DateTime birthDate,  String phone, @JsonKey(name: 'medical_record_number')  String? medicalRecordNumber, @JsonKey(name: 'emergency_contact')  String? emergencyContact, @JsonKey(name: 'emergency_contact_phone')  String? emergencyContactPhone, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.name,_that.idNumber,_that.gender,_that.birthDate,_that.phone,_that.medicalRecordNumber,_that.emergencyContact,_that.emergencyContactPhone,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'id_number')  String idNumber,  Gender gender, @JsonKey(name: 'birth_date')  DateTime birthDate,  String phone, @JsonKey(name: 'medical_record_number')  String? medicalRecordNumber, @JsonKey(name: 'emergency_contact')  String? emergencyContact, @JsonKey(name: 'emergency_contact_phone')  String? emergencyContactPhone, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Patient():
return $default(_that.id,_that.name,_that.idNumber,_that.gender,_that.birthDate,_that.phone,_that.medicalRecordNumber,_that.emergencyContact,_that.emergencyContactPhone,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'id_number')  String idNumber,  Gender gender, @JsonKey(name: 'birth_date')  DateTime birthDate,  String phone, @JsonKey(name: 'medical_record_number')  String? medicalRecordNumber, @JsonKey(name: 'emergency_contact')  String? emergencyContact, @JsonKey(name: 'emergency_contact_phone')  String? emergencyContactPhone, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Patient() when $default != null:
return $default(_that.id,_that.name,_that.idNumber,_that.gender,_that.birthDate,_that.phone,_that.medicalRecordNumber,_that.emergencyContact,_that.emergencyContactPhone,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Patient extends Patient {
  const _Patient({required this.id, required this.name, @JsonKey(name: 'id_number') required this.idNumber, required this.gender, @JsonKey(name: 'birth_date') required this.birthDate, required this.phone, @JsonKey(name: 'medical_record_number') this.medicalRecordNumber, @JsonKey(name: 'emergency_contact') this.emergencyContact, @JsonKey(name: 'emergency_contact_phone') this.emergencyContactPhone, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'id_number') final  String idNumber;
@override final  Gender gender;
@override@JsonKey(name: 'birth_date') final  DateTime birthDate;
@override final  String phone;
@override@JsonKey(name: 'medical_record_number') final  String? medicalRecordNumber;
@override@JsonKey(name: 'emergency_contact') final  String? emergencyContact;
@override@JsonKey(name: 'emergency_contact_phone') final  String? emergencyContactPhone;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientCopyWith<_Patient> get copyWith => __$PatientCopyWithImpl<_Patient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Patient&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.medicalRecordNumber, medicalRecordNumber) || other.medicalRecordNumber == medicalRecordNumber)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,idNumber,gender,birthDate,phone,medicalRecordNumber,emergencyContact,emergencyContactPhone,createdAt,updatedAt);

@override
String toString() {
  return 'Patient(id: $id, name: $name, idNumber: $idNumber, gender: $gender, birthDate: $birthDate, phone: $phone, medicalRecordNumber: $medicalRecordNumber, emergencyContact: $emergencyContact, emergencyContactPhone: $emergencyContactPhone, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$PatientCopyWith(_Patient value, $Res Function(_Patient) _then) = __$PatientCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'id_number') String idNumber, Gender gender,@JsonKey(name: 'birth_date') DateTime birthDate, String phone,@JsonKey(name: 'medical_record_number') String? medicalRecordNumber,@JsonKey(name: 'emergency_contact') String? emergencyContact,@JsonKey(name: 'emergency_contact_phone') String? emergencyContactPhone,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$PatientCopyWithImpl<$Res>
    implements _$PatientCopyWith<$Res> {
  __$PatientCopyWithImpl(this._self, this._then);

  final _Patient _self;
  final $Res Function(_Patient) _then;

/// Create a copy of Patient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? idNumber = null,Object? gender = null,Object? birthDate = null,Object? phone = null,Object? medicalRecordNumber = freezed,Object? emergencyContact = freezed,Object? emergencyContactPhone = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Patient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,medicalRecordNumber: freezed == medicalRecordNumber ? _self.medicalRecordNumber : medicalRecordNumber // ignore: cast_nullable_to_non_nullable
as String?,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactPhone: freezed == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CreatePatientRequest {

 String get name;@JsonKey(name: 'id_number') String get idNumber; Gender get gender;@JsonKey(name: 'birth_date') DateTime get birthDate; String get phone;@JsonKey(name: 'medical_record_number') String? get medicalRecordNumber;@JsonKey(name: 'emergency_contact') String? get emergencyContact;@JsonKey(name: 'emergency_contact_phone') String? get emergencyContactPhone;
/// Create a copy of CreatePatientRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePatientRequestCopyWith<CreatePatientRequest> get copyWith => _$CreatePatientRequestCopyWithImpl<CreatePatientRequest>(this as CreatePatientRequest, _$identity);

  /// Serializes this CreatePatientRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePatientRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.medicalRecordNumber, medicalRecordNumber) || other.medicalRecordNumber == medicalRecordNumber)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,idNumber,gender,birthDate,phone,medicalRecordNumber,emergencyContact,emergencyContactPhone);

@override
String toString() {
  return 'CreatePatientRequest(name: $name, idNumber: $idNumber, gender: $gender, birthDate: $birthDate, phone: $phone, medicalRecordNumber: $medicalRecordNumber, emergencyContact: $emergencyContact, emergencyContactPhone: $emergencyContactPhone)';
}


}

/// @nodoc
abstract mixin class $CreatePatientRequestCopyWith<$Res>  {
  factory $CreatePatientRequestCopyWith(CreatePatientRequest value, $Res Function(CreatePatientRequest) _then) = _$CreatePatientRequestCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'id_number') String idNumber, Gender gender,@JsonKey(name: 'birth_date') DateTime birthDate, String phone,@JsonKey(name: 'medical_record_number') String? medicalRecordNumber,@JsonKey(name: 'emergency_contact') String? emergencyContact,@JsonKey(name: 'emergency_contact_phone') String? emergencyContactPhone
});




}
/// @nodoc
class _$CreatePatientRequestCopyWithImpl<$Res>
    implements $CreatePatientRequestCopyWith<$Res> {
  _$CreatePatientRequestCopyWithImpl(this._self, this._then);

  final CreatePatientRequest _self;
  final $Res Function(CreatePatientRequest) _then;

/// Create a copy of CreatePatientRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? idNumber = null,Object? gender = null,Object? birthDate = null,Object? phone = null,Object? medicalRecordNumber = freezed,Object? emergencyContact = freezed,Object? emergencyContactPhone = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,medicalRecordNumber: freezed == medicalRecordNumber ? _self.medicalRecordNumber : medicalRecordNumber // ignore: cast_nullable_to_non_nullable
as String?,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactPhone: freezed == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePatientRequest].
extension CreatePatientRequestPatterns on CreatePatientRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePatientRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePatientRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePatientRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreatePatientRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePatientRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePatientRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'id_number')  String idNumber,  Gender gender, @JsonKey(name: 'birth_date')  DateTime birthDate,  String phone, @JsonKey(name: 'medical_record_number')  String? medicalRecordNumber, @JsonKey(name: 'emergency_contact')  String? emergencyContact, @JsonKey(name: 'emergency_contact_phone')  String? emergencyContactPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePatientRequest() when $default != null:
return $default(_that.name,_that.idNumber,_that.gender,_that.birthDate,_that.phone,_that.medicalRecordNumber,_that.emergencyContact,_that.emergencyContactPhone);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'id_number')  String idNumber,  Gender gender, @JsonKey(name: 'birth_date')  DateTime birthDate,  String phone, @JsonKey(name: 'medical_record_number')  String? medicalRecordNumber, @JsonKey(name: 'emergency_contact')  String? emergencyContact, @JsonKey(name: 'emergency_contact_phone')  String? emergencyContactPhone)  $default,) {final _that = this;
switch (_that) {
case _CreatePatientRequest():
return $default(_that.name,_that.idNumber,_that.gender,_that.birthDate,_that.phone,_that.medicalRecordNumber,_that.emergencyContact,_that.emergencyContactPhone);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'id_number')  String idNumber,  Gender gender, @JsonKey(name: 'birth_date')  DateTime birthDate,  String phone, @JsonKey(name: 'medical_record_number')  String? medicalRecordNumber, @JsonKey(name: 'emergency_contact')  String? emergencyContact, @JsonKey(name: 'emergency_contact_phone')  String? emergencyContactPhone)?  $default,) {final _that = this;
switch (_that) {
case _CreatePatientRequest() when $default != null:
return $default(_that.name,_that.idNumber,_that.gender,_that.birthDate,_that.phone,_that.medicalRecordNumber,_that.emergencyContact,_that.emergencyContactPhone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePatientRequest extends CreatePatientRequest {
  const _CreatePatientRequest({required this.name, @JsonKey(name: 'id_number') required this.idNumber, required this.gender, @JsonKey(name: 'birth_date') required this.birthDate, required this.phone, @JsonKey(name: 'medical_record_number') this.medicalRecordNumber, @JsonKey(name: 'emergency_contact') this.emergencyContact, @JsonKey(name: 'emergency_contact_phone') this.emergencyContactPhone}): super._();
  factory _CreatePatientRequest.fromJson(Map<String, dynamic> json) => _$CreatePatientRequestFromJson(json);

@override final  String name;
@override@JsonKey(name: 'id_number') final  String idNumber;
@override final  Gender gender;
@override@JsonKey(name: 'birth_date') final  DateTime birthDate;
@override final  String phone;
@override@JsonKey(name: 'medical_record_number') final  String? medicalRecordNumber;
@override@JsonKey(name: 'emergency_contact') final  String? emergencyContact;
@override@JsonKey(name: 'emergency_contact_phone') final  String? emergencyContactPhone;

/// Create a copy of CreatePatientRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePatientRequestCopyWith<_CreatePatientRequest> get copyWith => __$CreatePatientRequestCopyWithImpl<_CreatePatientRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePatientRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePatientRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.medicalRecordNumber, medicalRecordNumber) || other.medicalRecordNumber == medicalRecordNumber)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,idNumber,gender,birthDate,phone,medicalRecordNumber,emergencyContact,emergencyContactPhone);

@override
String toString() {
  return 'CreatePatientRequest(name: $name, idNumber: $idNumber, gender: $gender, birthDate: $birthDate, phone: $phone, medicalRecordNumber: $medicalRecordNumber, emergencyContact: $emergencyContact, emergencyContactPhone: $emergencyContactPhone)';
}


}

/// @nodoc
abstract mixin class _$CreatePatientRequestCopyWith<$Res> implements $CreatePatientRequestCopyWith<$Res> {
  factory _$CreatePatientRequestCopyWith(_CreatePatientRequest value, $Res Function(_CreatePatientRequest) _then) = __$CreatePatientRequestCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'id_number') String idNumber, Gender gender,@JsonKey(name: 'birth_date') DateTime birthDate, String phone,@JsonKey(name: 'medical_record_number') String? medicalRecordNumber,@JsonKey(name: 'emergency_contact') String? emergencyContact,@JsonKey(name: 'emergency_contact_phone') String? emergencyContactPhone
});




}
/// @nodoc
class __$CreatePatientRequestCopyWithImpl<$Res>
    implements _$CreatePatientRequestCopyWith<$Res> {
  __$CreatePatientRequestCopyWithImpl(this._self, this._then);

  final _CreatePatientRequest _self;
  final $Res Function(_CreatePatientRequest) _then;

/// Create a copy of CreatePatientRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? idNumber = null,Object? gender = null,Object? birthDate = null,Object? phone = null,Object? medicalRecordNumber = freezed,Object? emergencyContact = freezed,Object? emergencyContactPhone = freezed,}) {
  return _then(_CreatePatientRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,medicalRecordNumber: freezed == medicalRecordNumber ? _self.medicalRecordNumber : medicalRecordNumber // ignore: cast_nullable_to_non_nullable
as String?,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactPhone: freezed == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
