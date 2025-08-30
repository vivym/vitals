// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

 UserEntity? get user; PatientEntity? get patient; String? get token; bool get isAuthenticated; bool get isLoading; bool get hasAgreedToTerms; bool get hasSignedPatient; AppError? get error;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.user, user) || other.user == user)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.token, token) || other.token == token)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasAgreedToTerms, hasAgreedToTerms) || other.hasAgreedToTerms == hasAgreedToTerms)&&(identical(other.hasSignedPatient, hasSignedPatient) || other.hasSignedPatient == hasSignedPatient)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,user,patient,token,isAuthenticated,isLoading,hasAgreedToTerms,hasSignedPatient,error);

@override
String toString() {
  return 'AuthState(user: $user, patient: $patient, token: $token, isAuthenticated: $isAuthenticated, isLoading: $isLoading, hasAgreedToTerms: $hasAgreedToTerms, hasSignedPatient: $hasSignedPatient, error: $error)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 UserEntity? user, PatientEntity? patient, String? token, bool isAuthenticated, bool isLoading, bool hasAgreedToTerms, bool hasSignedPatient, AppError? error
});


$AppErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? patient = freezed,Object? token = freezed,Object? isAuthenticated = null,Object? isLoading = null,Object? hasAgreedToTerms = null,Object? hasSignedPatient = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,patient: freezed == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientEntity?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasAgreedToTerms: null == hasAgreedToTerms ? _self.hasAgreedToTerms : hasAgreedToTerms // ignore: cast_nullable_to_non_nullable
as bool,hasSignedPatient: null == hasSignedPatient ? _self.hasSignedPatient : hasSignedPatient // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError?,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserEntity? user,  PatientEntity? patient,  String? token,  bool isAuthenticated,  bool isLoading,  bool hasAgreedToTerms,  bool hasSignedPatient,  AppError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.user,_that.patient,_that.token,_that.isAuthenticated,_that.isLoading,_that.hasAgreedToTerms,_that.hasSignedPatient,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserEntity? user,  PatientEntity? patient,  String? token,  bool isAuthenticated,  bool isLoading,  bool hasAgreedToTerms,  bool hasSignedPatient,  AppError? error)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.user,_that.patient,_that.token,_that.isAuthenticated,_that.isLoading,_that.hasAgreedToTerms,_that.hasSignedPatient,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserEntity? user,  PatientEntity? patient,  String? token,  bool isAuthenticated,  bool isLoading,  bool hasAgreedToTerms,  bool hasSignedPatient,  AppError? error)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.user,_that.patient,_that.token,_that.isAuthenticated,_that.isLoading,_that.hasAgreedToTerms,_that.hasSignedPatient,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState extends AuthState {
  const _AuthState({this.user, this.patient, this.token, this.isAuthenticated = false, this.isLoading = false, this.hasAgreedToTerms = false, this.hasSignedPatient = false, this.error}): super._();
  

@override final  UserEntity? user;
@override final  PatientEntity? patient;
@override final  String? token;
@override@JsonKey() final  bool isAuthenticated;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasAgreedToTerms;
@override@JsonKey() final  bool hasSignedPatient;
@override final  AppError? error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.user, user) || other.user == user)&&(identical(other.patient, patient) || other.patient == patient)&&(identical(other.token, token) || other.token == token)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasAgreedToTerms, hasAgreedToTerms) || other.hasAgreedToTerms == hasAgreedToTerms)&&(identical(other.hasSignedPatient, hasSignedPatient) || other.hasSignedPatient == hasSignedPatient)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,user,patient,token,isAuthenticated,isLoading,hasAgreedToTerms,hasSignedPatient,error);

@override
String toString() {
  return 'AuthState(user: $user, patient: $patient, token: $token, isAuthenticated: $isAuthenticated, isLoading: $isLoading, hasAgreedToTerms: $hasAgreedToTerms, hasSignedPatient: $hasSignedPatient, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 UserEntity? user, PatientEntity? patient, String? token, bool isAuthenticated, bool isLoading, bool hasAgreedToTerms, bool hasSignedPatient, AppError? error
});


@override $AppErrorCopyWith<$Res>? get error;

}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? patient = freezed,Object? token = freezed,Object? isAuthenticated = null,Object? isLoading = null,Object? hasAgreedToTerms = null,Object? hasSignedPatient = null,Object? error = freezed,}) {
  return _then(_AuthState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,patient: freezed == patient ? _self.patient : patient // ignore: cast_nullable_to_non_nullable
as PatientEntity?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasAgreedToTerms: null == hasAgreedToTerms ? _self.hasAgreedToTerms : hasAgreedToTerms // ignore: cast_nullable_to_non_nullable
as bool,hasSignedPatient: null == hasSignedPatient ? _self.hasSignedPatient : hasSignedPatient // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
