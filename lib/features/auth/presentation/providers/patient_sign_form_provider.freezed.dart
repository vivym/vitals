// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_sign_form_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FormValidationState {

 Map<String, String> get errors; bool get isValid;
/// Create a copy of FormValidationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormValidationStateCopyWith<FormValidationState> get copyWith => _$FormValidationStateCopyWithImpl<FormValidationState>(this as FormValidationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormValidationState&&const DeepCollectionEquality().equals(other.errors, errors)&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(errors),isValid);

@override
String toString() {
  return 'FormValidationState(errors: $errors, isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class $FormValidationStateCopyWith<$Res>  {
  factory $FormValidationStateCopyWith(FormValidationState value, $Res Function(FormValidationState) _then) = _$FormValidationStateCopyWithImpl;
@useResult
$Res call({
 Map<String, String> errors, bool isValid
});




}
/// @nodoc
class _$FormValidationStateCopyWithImpl<$Res>
    implements $FormValidationStateCopyWith<$Res> {
  _$FormValidationStateCopyWithImpl(this._self, this._then);

  final FormValidationState _self;
  final $Res Function(FormValidationState) _then;

/// Create a copy of FormValidationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errors = null,Object? isValid = null,}) {
  return _then(_self.copyWith(
errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FormValidationState].
extension FormValidationStatePatterns on FormValidationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormValidationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormValidationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormValidationState value)  $default,){
final _that = this;
switch (_that) {
case _FormValidationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormValidationState value)?  $default,){
final _that = this;
switch (_that) {
case _FormValidationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, String> errors,  bool isValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormValidationState() when $default != null:
return $default(_that.errors,_that.isValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, String> errors,  bool isValid)  $default,) {final _that = this;
switch (_that) {
case _FormValidationState():
return $default(_that.errors,_that.isValid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, String> errors,  bool isValid)?  $default,) {final _that = this;
switch (_that) {
case _FormValidationState() when $default != null:
return $default(_that.errors,_that.isValid);case _:
  return null;

}
}

}

/// @nodoc


class _FormValidationState extends FormValidationState {
  const _FormValidationState({final  Map<String, String> errors = const {}, this.isValid = false}): _errors = errors,super._();
  

 final  Map<String, String> _errors;
@override@JsonKey() Map<String, String> get errors {
  if (_errors is EqualUnmodifiableMapView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_errors);
}

@override@JsonKey() final  bool isValid;

/// Create a copy of FormValidationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormValidationStateCopyWith<_FormValidationState> get copyWith => __$FormValidationStateCopyWithImpl<_FormValidationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormValidationState&&const DeepCollectionEquality().equals(other._errors, _errors)&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_errors),isValid);

@override
String toString() {
  return 'FormValidationState(errors: $errors, isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class _$FormValidationStateCopyWith<$Res> implements $FormValidationStateCopyWith<$Res> {
  factory _$FormValidationStateCopyWith(_FormValidationState value, $Res Function(_FormValidationState) _then) = __$FormValidationStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, String> errors, bool isValid
});




}
/// @nodoc
class __$FormValidationStateCopyWithImpl<$Res>
    implements _$FormValidationStateCopyWith<$Res> {
  __$FormValidationStateCopyWithImpl(this._self, this._then);

  final _FormValidationState _self;
  final $Res Function(_FormValidationState) _then;

/// Create a copy of FormValidationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errors = null,Object? isValid = null,}) {
  return _then(_FormValidationState(
errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$PatientSignFormState {

 String? get name; String? get idNumber; Gender? get gender; DateTime? get birthDate; String? get phone; String? get medicalRecordNumber; String? get emergencyContact; String? get emergencyContactPhone; FormValidationState get validationState; bool get isSubmitting; AppError? get generalError;
/// Create a copy of PatientSignFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientSignFormStateCopyWith<PatientSignFormState> get copyWith => _$PatientSignFormStateCopyWithImpl<PatientSignFormState>(this as PatientSignFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientSignFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.medicalRecordNumber, medicalRecordNumber) || other.medicalRecordNumber == medicalRecordNumber)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.validationState, validationState) || other.validationState == validationState)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.generalError, generalError) || other.generalError == generalError));
}


@override
int get hashCode => Object.hash(runtimeType,name,idNumber,gender,birthDate,phone,medicalRecordNumber,emergencyContact,emergencyContactPhone,validationState,isSubmitting,generalError);

@override
String toString() {
  return 'PatientSignFormState(name: $name, idNumber: $idNumber, gender: $gender, birthDate: $birthDate, phone: $phone, medicalRecordNumber: $medicalRecordNumber, emergencyContact: $emergencyContact, emergencyContactPhone: $emergencyContactPhone, validationState: $validationState, isSubmitting: $isSubmitting, generalError: $generalError)';
}


}

/// @nodoc
abstract mixin class $PatientSignFormStateCopyWith<$Res>  {
  factory $PatientSignFormStateCopyWith(PatientSignFormState value, $Res Function(PatientSignFormState) _then) = _$PatientSignFormStateCopyWithImpl;
@useResult
$Res call({
 String? name, String? idNumber, Gender? gender, DateTime? birthDate, String? phone, String? medicalRecordNumber, String? emergencyContact, String? emergencyContactPhone, FormValidationState validationState, bool isSubmitting, AppError? generalError
});


$FormValidationStateCopyWith<$Res> get validationState;$AppErrorCopyWith<$Res>? get generalError;

}
/// @nodoc
class _$PatientSignFormStateCopyWithImpl<$Res>
    implements $PatientSignFormStateCopyWith<$Res> {
  _$PatientSignFormStateCopyWithImpl(this._self, this._then);

  final PatientSignFormState _self;
  final $Res Function(PatientSignFormState) _then;

/// Create a copy of PatientSignFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? idNumber = freezed,Object? gender = freezed,Object? birthDate = freezed,Object? phone = freezed,Object? medicalRecordNumber = freezed,Object? emergencyContact = freezed,Object? emergencyContactPhone = freezed,Object? validationState = null,Object? isSubmitting = null,Object? generalError = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,medicalRecordNumber: freezed == medicalRecordNumber ? _self.medicalRecordNumber : medicalRecordNumber // ignore: cast_nullable_to_non_nullable
as String?,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactPhone: freezed == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String?,validationState: null == validationState ? _self.validationState : validationState // ignore: cast_nullable_to_non_nullable
as FormValidationState,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,generalError: freezed == generalError ? _self.generalError : generalError // ignore: cast_nullable_to_non_nullable
as AppError?,
  ));
}
/// Create a copy of PatientSignFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormValidationStateCopyWith<$Res> get validationState {
  
  return $FormValidationStateCopyWith<$Res>(_self.validationState, (value) {
    return _then(_self.copyWith(validationState: value));
  });
}/// Create a copy of PatientSignFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res>? get generalError {
    if (_self.generalError == null) {
    return null;
  }

  return $AppErrorCopyWith<$Res>(_self.generalError!, (value) {
    return _then(_self.copyWith(generalError: value));
  });
}
}


/// Adds pattern-matching-related methods to [PatientSignFormState].
extension PatientSignFormStatePatterns on PatientSignFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientSignFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientSignFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientSignFormState value)  $default,){
final _that = this;
switch (_that) {
case _PatientSignFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientSignFormState value)?  $default,){
final _that = this;
switch (_that) {
case _PatientSignFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? idNumber,  Gender? gender,  DateTime? birthDate,  String? phone,  String? medicalRecordNumber,  String? emergencyContact,  String? emergencyContactPhone,  FormValidationState validationState,  bool isSubmitting,  AppError? generalError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientSignFormState() when $default != null:
return $default(_that.name,_that.idNumber,_that.gender,_that.birthDate,_that.phone,_that.medicalRecordNumber,_that.emergencyContact,_that.emergencyContactPhone,_that.validationState,_that.isSubmitting,_that.generalError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? idNumber,  Gender? gender,  DateTime? birthDate,  String? phone,  String? medicalRecordNumber,  String? emergencyContact,  String? emergencyContactPhone,  FormValidationState validationState,  bool isSubmitting,  AppError? generalError)  $default,) {final _that = this;
switch (_that) {
case _PatientSignFormState():
return $default(_that.name,_that.idNumber,_that.gender,_that.birthDate,_that.phone,_that.medicalRecordNumber,_that.emergencyContact,_that.emergencyContactPhone,_that.validationState,_that.isSubmitting,_that.generalError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? idNumber,  Gender? gender,  DateTime? birthDate,  String? phone,  String? medicalRecordNumber,  String? emergencyContact,  String? emergencyContactPhone,  FormValidationState validationState,  bool isSubmitting,  AppError? generalError)?  $default,) {final _that = this;
switch (_that) {
case _PatientSignFormState() when $default != null:
return $default(_that.name,_that.idNumber,_that.gender,_that.birthDate,_that.phone,_that.medicalRecordNumber,_that.emergencyContact,_that.emergencyContactPhone,_that.validationState,_that.isSubmitting,_that.generalError);case _:
  return null;

}
}

}

/// @nodoc


class _PatientSignFormState extends PatientSignFormState {
  const _PatientSignFormState({this.name, this.idNumber, this.gender, this.birthDate, this.phone, this.medicalRecordNumber, this.emergencyContact, this.emergencyContactPhone, this.validationState = const FormValidationState(), this.isSubmitting = false, this.generalError}): super._();
  

@override final  String? name;
@override final  String? idNumber;
@override final  Gender? gender;
@override final  DateTime? birthDate;
@override final  String? phone;
@override final  String? medicalRecordNumber;
@override final  String? emergencyContact;
@override final  String? emergencyContactPhone;
@override@JsonKey() final  FormValidationState validationState;
@override@JsonKey() final  bool isSubmitting;
@override final  AppError? generalError;

/// Create a copy of PatientSignFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientSignFormStateCopyWith<_PatientSignFormState> get copyWith => __$PatientSignFormStateCopyWithImpl<_PatientSignFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientSignFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.medicalRecordNumber, medicalRecordNumber) || other.medicalRecordNumber == medicalRecordNumber)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.validationState, validationState) || other.validationState == validationState)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.generalError, generalError) || other.generalError == generalError));
}


@override
int get hashCode => Object.hash(runtimeType,name,idNumber,gender,birthDate,phone,medicalRecordNumber,emergencyContact,emergencyContactPhone,validationState,isSubmitting,generalError);

@override
String toString() {
  return 'PatientSignFormState(name: $name, idNumber: $idNumber, gender: $gender, birthDate: $birthDate, phone: $phone, medicalRecordNumber: $medicalRecordNumber, emergencyContact: $emergencyContact, emergencyContactPhone: $emergencyContactPhone, validationState: $validationState, isSubmitting: $isSubmitting, generalError: $generalError)';
}


}

/// @nodoc
abstract mixin class _$PatientSignFormStateCopyWith<$Res> implements $PatientSignFormStateCopyWith<$Res> {
  factory _$PatientSignFormStateCopyWith(_PatientSignFormState value, $Res Function(_PatientSignFormState) _then) = __$PatientSignFormStateCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? idNumber, Gender? gender, DateTime? birthDate, String? phone, String? medicalRecordNumber, String? emergencyContact, String? emergencyContactPhone, FormValidationState validationState, bool isSubmitting, AppError? generalError
});


@override $FormValidationStateCopyWith<$Res> get validationState;@override $AppErrorCopyWith<$Res>? get generalError;

}
/// @nodoc
class __$PatientSignFormStateCopyWithImpl<$Res>
    implements _$PatientSignFormStateCopyWith<$Res> {
  __$PatientSignFormStateCopyWithImpl(this._self, this._then);

  final _PatientSignFormState _self;
  final $Res Function(_PatientSignFormState) _then;

/// Create a copy of PatientSignFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? idNumber = freezed,Object? gender = freezed,Object? birthDate = freezed,Object? phone = freezed,Object? medicalRecordNumber = freezed,Object? emergencyContact = freezed,Object? emergencyContactPhone = freezed,Object? validationState = null,Object? isSubmitting = null,Object? generalError = freezed,}) {
  return _then(_PatientSignFormState(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender?,birthDate: freezed == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as DateTime?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,medicalRecordNumber: freezed == medicalRecordNumber ? _self.medicalRecordNumber : medicalRecordNumber // ignore: cast_nullable_to_non_nullable
as String?,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactPhone: freezed == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String?,validationState: null == validationState ? _self.validationState : validationState // ignore: cast_nullable_to_non_nullable
as FormValidationState,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,generalError: freezed == generalError ? _self.generalError : generalError // ignore: cast_nullable_to_non_nullable
as AppError?,
  ));
}

/// Create a copy of PatientSignFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormValidationStateCopyWith<$Res> get validationState {
  
  return $FormValidationStateCopyWith<$Res>(_self.validationState, (value) {
    return _then(_self.copyWith(validationState: value));
  });
}/// Create a copy of PatientSignFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res>? get generalError {
    if (_self.generalError == null) {
    return null;
  }

  return $AppErrorCopyWith<$Res>(_self.generalError!, (value) {
    return _then(_self.copyWith(generalError: value));
  });
}
}

// dart format on
