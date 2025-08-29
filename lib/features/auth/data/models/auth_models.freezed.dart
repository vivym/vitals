// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginRequest {

 String get phone;@JsonKey(name: 'agreed_to_terms') bool get agreedToTerms;
/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestCopyWith<LoginRequest> get copyWith => _$LoginRequestCopyWithImpl<LoginRequest>(this as LoginRequest, _$identity);

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.agreedToTerms, agreedToTerms) || other.agreedToTerms == agreedToTerms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,agreedToTerms);

@override
String toString() {
  return 'LoginRequest(phone: $phone, agreedToTerms: $agreedToTerms)';
}


}

/// @nodoc
abstract mixin class $LoginRequestCopyWith<$Res>  {
  factory $LoginRequestCopyWith(LoginRequest value, $Res Function(LoginRequest) _then) = _$LoginRequestCopyWithImpl;
@useResult
$Res call({
 String phone,@JsonKey(name: 'agreed_to_terms') bool agreedToTerms
});




}
/// @nodoc
class _$LoginRequestCopyWithImpl<$Res>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._self, this._then);

  final LoginRequest _self;
  final $Res Function(LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phone = null,Object? agreedToTerms = null,}) {
  return _then(_self.copyWith(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,agreedToTerms: null == agreedToTerms ? _self.agreedToTerms : agreedToTerms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginRequest].
extension LoginRequestPatterns on LoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _LoginRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String phone, @JsonKey(name: 'agreed_to_terms')  bool agreedToTerms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.phone,_that.agreedToTerms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String phone, @JsonKey(name: 'agreed_to_terms')  bool agreedToTerms)  $default,) {final _that = this;
switch (_that) {
case _LoginRequest():
return $default(_that.phone,_that.agreedToTerms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String phone, @JsonKey(name: 'agreed_to_terms')  bool agreedToTerms)?  $default,) {final _that = this;
switch (_that) {
case _LoginRequest() when $default != null:
return $default(_that.phone,_that.agreedToTerms);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginRequest extends LoginRequest {
  const _LoginRequest({required this.phone, @JsonKey(name: 'agreed_to_terms') this.agreedToTerms = true}): super._();
  factory _LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

@override final  String phone;
@override@JsonKey(name: 'agreed_to_terms') final  bool agreedToTerms;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestCopyWith<_LoginRequest> get copyWith => __$LoginRequestCopyWithImpl<_LoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequest&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.agreedToTerms, agreedToTerms) || other.agreedToTerms == agreedToTerms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,phone,agreedToTerms);

@override
String toString() {
  return 'LoginRequest(phone: $phone, agreedToTerms: $agreedToTerms)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestCopyWith<$Res> implements $LoginRequestCopyWith<$Res> {
  factory _$LoginRequestCopyWith(_LoginRequest value, $Res Function(_LoginRequest) _then) = __$LoginRequestCopyWithImpl;
@override @useResult
$Res call({
 String phone,@JsonKey(name: 'agreed_to_terms') bool agreedToTerms
});




}
/// @nodoc
class __$LoginRequestCopyWithImpl<$Res>
    implements _$LoginRequestCopyWith<$Res> {
  __$LoginRequestCopyWithImpl(this._self, this._then);

  final _LoginRequest _self;
  final $Res Function(_LoginRequest) _then;

/// Create a copy of LoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? agreedToTerms = null,}) {
  return _then(_LoginRequest(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,agreedToTerms: null == agreedToTerms ? _self.agreedToTerms : agreedToTerms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$LoginResponse {

 String get token; User get user; List<Patient> get patients;@JsonKey(name: 'expires_at') DateTime? get expiresAt;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.token, token) || other.token == token)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.patients, patients)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,user,const DeepCollectionEquality().hash(patients),expiresAt);

@override
String toString() {
  return 'LoginResponse(token: $token, user: $user, patients: $patients, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 String token, User user, List<Patient> patients,@JsonKey(name: 'expires_at') DateTime? expiresAt
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? user = null,Object? patients = null,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,patients: null == patients ? _self.patients : patients // ignore: cast_nullable_to_non_nullable
as List<Patient>,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  User user,  List<Patient> patients, @JsonKey(name: 'expires_at')  DateTime? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.token,_that.user,_that.patients,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  User user,  List<Patient> patients, @JsonKey(name: 'expires_at')  DateTime? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that.token,_that.user,_that.patients,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  User user,  List<Patient> patients, @JsonKey(name: 'expires_at')  DateTime? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.token,_that.user,_that.patients,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse extends LoginResponse {
  const _LoginResponse({required this.token, required this.user, final  List<Patient> patients = const [], @JsonKey(name: 'expires_at') this.expiresAt}): _patients = patients,super._();
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override final  String token;
@override final  User user;
 final  List<Patient> _patients;
@override@JsonKey() List<Patient> get patients {
  if (_patients is EqualUnmodifiableListView) return _patients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_patients);
}

@override@JsonKey(name: 'expires_at') final  DateTime? expiresAt;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.token, token) || other.token == token)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._patients, _patients)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,user,const DeepCollectionEquality().hash(_patients),expiresAt);

@override
String toString() {
  return 'LoginResponse(token: $token, user: $user, patients: $patients, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
 String token, User user, List<Patient> patients,@JsonKey(name: 'expires_at') DateTime? expiresAt
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? user = null,Object? patients = null,Object? expiresAt = freezed,}) {
  return _then(_LoginResponse(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,patients: null == patients ? _self._patients : patients // ignore: cast_nullable_to_non_nullable
as List<Patient>,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc
mixin _$AuthState {

 User? get user; List<Patient> get patients; String? get token; bool get isAuthenticated; bool get isLoading; bool get hasAgreedToTerms; AppError? get error;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.patients, patients)&&(identical(other.token, token) || other.token == token)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasAgreedToTerms, hasAgreedToTerms) || other.hasAgreedToTerms == hasAgreedToTerms)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(patients),token,isAuthenticated,isLoading,hasAgreedToTerms,error);

@override
String toString() {
  return 'AuthState(user: $user, patients: $patients, token: $token, isAuthenticated: $isAuthenticated, isLoading: $isLoading, hasAgreedToTerms: $hasAgreedToTerms, error: $error)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 User? user, List<Patient> patients, String? token, bool isAuthenticated, bool isLoading, bool hasAgreedToTerms, AppError? error
});


$UserCopyWith<$Res>? get user;$AppErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? patients = null,Object? token = freezed,Object? isAuthenticated = null,Object? isLoading = null,Object? hasAgreedToTerms = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,patients: null == patients ? _self.patients : patients // ignore: cast_nullable_to_non_nullable
as List<Patient>,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasAgreedToTerms: null == hasAgreedToTerms ? _self.hasAgreedToTerms : hasAgreedToTerms // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError?,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthState
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User? user,  List<Patient> patients,  String? token,  bool isAuthenticated,  bool isLoading,  bool hasAgreedToTerms,  AppError? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.user,_that.patients,_that.token,_that.isAuthenticated,_that.isLoading,_that.hasAgreedToTerms,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User? user,  List<Patient> patients,  String? token,  bool isAuthenticated,  bool isLoading,  bool hasAgreedToTerms,  AppError? error)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.user,_that.patients,_that.token,_that.isAuthenticated,_that.isLoading,_that.hasAgreedToTerms,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User? user,  List<Patient> patients,  String? token,  bool isAuthenticated,  bool isLoading,  bool hasAgreedToTerms,  AppError? error)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.user,_that.patients,_that.token,_that.isAuthenticated,_that.isLoading,_that.hasAgreedToTerms,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState extends AuthState {
  const _AuthState({this.user, final  List<Patient> patients = const [], this.token, this.isAuthenticated = false, this.isLoading = false, this.hasAgreedToTerms = false, this.error}): _patients = patients,super._();
  

@override final  User? user;
 final  List<Patient> _patients;
@override@JsonKey() List<Patient> get patients {
  if (_patients is EqualUnmodifiableListView) return _patients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_patients);
}

@override final  String? token;
@override@JsonKey() final  bool isAuthenticated;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasAgreedToTerms;
@override final  AppError? error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other._patients, _patients)&&(identical(other.token, token) || other.token == token)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasAgreedToTerms, hasAgreedToTerms) || other.hasAgreedToTerms == hasAgreedToTerms)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,user,const DeepCollectionEquality().hash(_patients),token,isAuthenticated,isLoading,hasAgreedToTerms,error);

@override
String toString() {
  return 'AuthState(user: $user, patients: $patients, token: $token, isAuthenticated: $isAuthenticated, isLoading: $isLoading, hasAgreedToTerms: $hasAgreedToTerms, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 User? user, List<Patient> patients, String? token, bool isAuthenticated, bool isLoading, bool hasAgreedToTerms, AppError? error
});


@override $UserCopyWith<$Res>? get user;@override $AppErrorCopyWith<$Res>? get error;

}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? patients = null,Object? token = freezed,Object? isAuthenticated = null,Object? isLoading = null,Object? hasAgreedToTerms = null,Object? error = freezed,}) {
  return _then(_AuthState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,patients: null == patients ? _self._patients : patients // ignore: cast_nullable_to_non_nullable
as List<Patient>,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,isAuthenticated: null == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasAgreedToTerms: null == hasAgreedToTerms ? _self.hasAgreedToTerms : hasAgreedToTerms // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthState
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
mixin _$PatientFormState {

 String? get name; String? get idNumber; Gender? get gender; DateTime? get birthDate; String? get phone; String? get medicalRecordNumber; String? get emergencyContact; String? get emergencyContactPhone; FormValidationState get validationState; bool get isSubmitting; AppError? get generalError;
/// Create a copy of PatientFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientFormStateCopyWith<PatientFormState> get copyWith => _$PatientFormStateCopyWithImpl<PatientFormState>(this as PatientFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.medicalRecordNumber, medicalRecordNumber) || other.medicalRecordNumber == medicalRecordNumber)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.validationState, validationState) || other.validationState == validationState)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.generalError, generalError) || other.generalError == generalError));
}


@override
int get hashCode => Object.hash(runtimeType,name,idNumber,gender,birthDate,phone,medicalRecordNumber,emergencyContact,emergencyContactPhone,validationState,isSubmitting,generalError);

@override
String toString() {
  return 'PatientFormState(name: $name, idNumber: $idNumber, gender: $gender, birthDate: $birthDate, phone: $phone, medicalRecordNumber: $medicalRecordNumber, emergencyContact: $emergencyContact, emergencyContactPhone: $emergencyContactPhone, validationState: $validationState, isSubmitting: $isSubmitting, generalError: $generalError)';
}


}

/// @nodoc
abstract mixin class $PatientFormStateCopyWith<$Res>  {
  factory $PatientFormStateCopyWith(PatientFormState value, $Res Function(PatientFormState) _then) = _$PatientFormStateCopyWithImpl;
@useResult
$Res call({
 String? name, String? idNumber, Gender? gender, DateTime? birthDate, String? phone, String? medicalRecordNumber, String? emergencyContact, String? emergencyContactPhone, FormValidationState validationState, bool isSubmitting, AppError? generalError
});


$FormValidationStateCopyWith<$Res> get validationState;$AppErrorCopyWith<$Res>? get generalError;

}
/// @nodoc
class _$PatientFormStateCopyWithImpl<$Res>
    implements $PatientFormStateCopyWith<$Res> {
  _$PatientFormStateCopyWithImpl(this._self, this._then);

  final PatientFormState _self;
  final $Res Function(PatientFormState) _then;

/// Create a copy of PatientFormState
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
/// Create a copy of PatientFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormValidationStateCopyWith<$Res> get validationState {
  
  return $FormValidationStateCopyWith<$Res>(_self.validationState, (value) {
    return _then(_self.copyWith(validationState: value));
  });
}/// Create a copy of PatientFormState
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


/// Adds pattern-matching-related methods to [PatientFormState].
extension PatientFormStatePatterns on PatientFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientFormState value)  $default,){
final _that = this;
switch (_that) {
case _PatientFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientFormState value)?  $default,){
final _that = this;
switch (_that) {
case _PatientFormState() when $default != null:
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
case _PatientFormState() when $default != null:
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
case _PatientFormState():
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
case _PatientFormState() when $default != null:
return $default(_that.name,_that.idNumber,_that.gender,_that.birthDate,_that.phone,_that.medicalRecordNumber,_that.emergencyContact,_that.emergencyContactPhone,_that.validationState,_that.isSubmitting,_that.generalError);case _:
  return null;

}
}

}

/// @nodoc


class _PatientFormState extends PatientFormState {
  const _PatientFormState({this.name, this.idNumber, this.gender, this.birthDate, this.phone, this.medicalRecordNumber, this.emergencyContact, this.emergencyContactPhone, this.validationState = const FormValidationState(), this.isSubmitting = false, this.generalError}): super._();
  

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

/// Create a copy of PatientFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientFormStateCopyWith<_PatientFormState> get copyWith => __$PatientFormStateCopyWithImpl<_PatientFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.medicalRecordNumber, medicalRecordNumber) || other.medicalRecordNumber == medicalRecordNumber)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.validationState, validationState) || other.validationState == validationState)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.generalError, generalError) || other.generalError == generalError));
}


@override
int get hashCode => Object.hash(runtimeType,name,idNumber,gender,birthDate,phone,medicalRecordNumber,emergencyContact,emergencyContactPhone,validationState,isSubmitting,generalError);

@override
String toString() {
  return 'PatientFormState(name: $name, idNumber: $idNumber, gender: $gender, birthDate: $birthDate, phone: $phone, medicalRecordNumber: $medicalRecordNumber, emergencyContact: $emergencyContact, emergencyContactPhone: $emergencyContactPhone, validationState: $validationState, isSubmitting: $isSubmitting, generalError: $generalError)';
}


}

/// @nodoc
abstract mixin class _$PatientFormStateCopyWith<$Res> implements $PatientFormStateCopyWith<$Res> {
  factory _$PatientFormStateCopyWith(_PatientFormState value, $Res Function(_PatientFormState) _then) = __$PatientFormStateCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? idNumber, Gender? gender, DateTime? birthDate, String? phone, String? medicalRecordNumber, String? emergencyContact, String? emergencyContactPhone, FormValidationState validationState, bool isSubmitting, AppError? generalError
});


@override $FormValidationStateCopyWith<$Res> get validationState;@override $AppErrorCopyWith<$Res>? get generalError;

}
/// @nodoc
class __$PatientFormStateCopyWithImpl<$Res>
    implements _$PatientFormStateCopyWith<$Res> {
  __$PatientFormStateCopyWithImpl(this._self, this._then);

  final _PatientFormState _self;
  final $Res Function(_PatientFormState) _then;

/// Create a copy of PatientFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? idNumber = freezed,Object? gender = freezed,Object? birthDate = freezed,Object? phone = freezed,Object? medicalRecordNumber = freezed,Object? emergencyContact = freezed,Object? emergencyContactPhone = freezed,Object? validationState = null,Object? isSubmitting = null,Object? generalError = freezed,}) {
  return _then(_PatientFormState(
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

/// Create a copy of PatientFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormValidationStateCopyWith<$Res> get validationState {
  
  return $FormValidationStateCopyWith<$Res>(_self.validationState, (value) {
    return _then(_self.copyWith(validationState: value));
  });
}/// Create a copy of PatientFormState
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
