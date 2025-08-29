// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {

 UserProfile? get userProfile; List<ConnectedDevice> get connectedDevices; List<MyService> get myServices; List<MedicationReminder> get medicationReminders; List<FavoriteItem> get favorites; AppSettings? get settings; bool get isLoading; String? get error;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.userProfile, userProfile) || other.userProfile == userProfile)&&const DeepCollectionEquality().equals(other.connectedDevices, connectedDevices)&&const DeepCollectionEquality().equals(other.myServices, myServices)&&const DeepCollectionEquality().equals(other.medicationReminders, medicationReminders)&&const DeepCollectionEquality().equals(other.favorites, favorites)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,userProfile,const DeepCollectionEquality().hash(connectedDevices),const DeepCollectionEquality().hash(myServices),const DeepCollectionEquality().hash(medicationReminders),const DeepCollectionEquality().hash(favorites),settings,isLoading,error);

@override
String toString() {
  return 'ProfileState(userProfile: $userProfile, connectedDevices: $connectedDevices, myServices: $myServices, medicationReminders: $medicationReminders, favorites: $favorites, settings: $settings, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 UserProfile? userProfile, List<ConnectedDevice> connectedDevices, List<MyService> myServices, List<MedicationReminder> medicationReminders, List<FavoriteItem> favorites, AppSettings? settings, bool isLoading, String? error
});


$UserProfileCopyWith<$Res>? get userProfile;$AppSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userProfile = freezed,Object? connectedDevices = null,Object? myServices = null,Object? medicationReminders = null,Object? favorites = null,Object? settings = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
userProfile: freezed == userProfile ? _self.userProfile : userProfile // ignore: cast_nullable_to_non_nullable
as UserProfile?,connectedDevices: null == connectedDevices ? _self.connectedDevices : connectedDevices // ignore: cast_nullable_to_non_nullable
as List<ConnectedDevice>,myServices: null == myServices ? _self.myServices : myServices // ignore: cast_nullable_to_non_nullable
as List<MyService>,medicationReminders: null == medicationReminders ? _self.medicationReminders : medicationReminders // ignore: cast_nullable_to_non_nullable
as List<MedicationReminder>,favorites: null == favorites ? _self.favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<FavoriteItem>,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppSettings?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get userProfile {
    if (_self.userProfile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.userProfile!, (value) {
    return _then(_self.copyWith(userProfile: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $AppSettingsCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserProfile? userProfile,  List<ConnectedDevice> connectedDevices,  List<MyService> myServices,  List<MedicationReminder> medicationReminders,  List<FavoriteItem> favorites,  AppSettings? settings,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.userProfile,_that.connectedDevices,_that.myServices,_that.medicationReminders,_that.favorites,_that.settings,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserProfile? userProfile,  List<ConnectedDevice> connectedDevices,  List<MyService> myServices,  List<MedicationReminder> medicationReminders,  List<FavoriteItem> favorites,  AppSettings? settings,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ProfileState():
return $default(_that.userProfile,_that.connectedDevices,_that.myServices,_that.medicationReminders,_that.favorites,_that.settings,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserProfile? userProfile,  List<ConnectedDevice> connectedDevices,  List<MyService> myServices,  List<MedicationReminder> medicationReminders,  List<FavoriteItem> favorites,  AppSettings? settings,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ProfileState() when $default != null:
return $default(_that.userProfile,_that.connectedDevices,_that.myServices,_that.medicationReminders,_that.favorites,_that.settings,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileState implements ProfileState {
  const _ProfileState({this.userProfile, final  List<ConnectedDevice> connectedDevices = const [], final  List<MyService> myServices = const [], final  List<MedicationReminder> medicationReminders = const [], final  List<FavoriteItem> favorites = const [], this.settings, this.isLoading = false, this.error}): _connectedDevices = connectedDevices,_myServices = myServices,_medicationReminders = medicationReminders,_favorites = favorites;
  

@override final  UserProfile? userProfile;
 final  List<ConnectedDevice> _connectedDevices;
@override@JsonKey() List<ConnectedDevice> get connectedDevices {
  if (_connectedDevices is EqualUnmodifiableListView) return _connectedDevices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connectedDevices);
}

 final  List<MyService> _myServices;
@override@JsonKey() List<MyService> get myServices {
  if (_myServices is EqualUnmodifiableListView) return _myServices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_myServices);
}

 final  List<MedicationReminder> _medicationReminders;
@override@JsonKey() List<MedicationReminder> get medicationReminders {
  if (_medicationReminders is EqualUnmodifiableListView) return _medicationReminders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_medicationReminders);
}

 final  List<FavoriteItem> _favorites;
@override@JsonKey() List<FavoriteItem> get favorites {
  if (_favorites is EqualUnmodifiableListView) return _favorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favorites);
}

@override final  AppSettings? settings;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.userProfile, userProfile) || other.userProfile == userProfile)&&const DeepCollectionEquality().equals(other._connectedDevices, _connectedDevices)&&const DeepCollectionEquality().equals(other._myServices, _myServices)&&const DeepCollectionEquality().equals(other._medicationReminders, _medicationReminders)&&const DeepCollectionEquality().equals(other._favorites, _favorites)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,userProfile,const DeepCollectionEquality().hash(_connectedDevices),const DeepCollectionEquality().hash(_myServices),const DeepCollectionEquality().hash(_medicationReminders),const DeepCollectionEquality().hash(_favorites),settings,isLoading,error);

@override
String toString() {
  return 'ProfileState(userProfile: $userProfile, connectedDevices: $connectedDevices, myServices: $myServices, medicationReminders: $medicationReminders, favorites: $favorites, settings: $settings, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 UserProfile? userProfile, List<ConnectedDevice> connectedDevices, List<MyService> myServices, List<MedicationReminder> medicationReminders, List<FavoriteItem> favorites, AppSettings? settings, bool isLoading, String? error
});


@override $UserProfileCopyWith<$Res>? get userProfile;@override $AppSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userProfile = freezed,Object? connectedDevices = null,Object? myServices = null,Object? medicationReminders = null,Object? favorites = null,Object? settings = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ProfileState(
userProfile: freezed == userProfile ? _self.userProfile : userProfile // ignore: cast_nullable_to_non_nullable
as UserProfile?,connectedDevices: null == connectedDevices ? _self._connectedDevices : connectedDevices // ignore: cast_nullable_to_non_nullable
as List<ConnectedDevice>,myServices: null == myServices ? _self._myServices : myServices // ignore: cast_nullable_to_non_nullable
as List<MyService>,medicationReminders: null == medicationReminders ? _self._medicationReminders : medicationReminders // ignore: cast_nullable_to_non_nullable
as List<MedicationReminder>,favorites: null == favorites ? _self._favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<FavoriteItem>,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as AppSettings?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get userProfile {
    if (_self.userProfile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.userProfile!, (value) {
    return _then(_self.copyWith(userProfile: value));
  });
}/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $AppSettingsCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

/// @nodoc
mixin _$DeviceManagementState {

 List<ConnectedDevice> get connectedDevices; List<DeviceType> get availableDevices; bool get isConnecting; String? get connectingDeviceId; String? get error;
/// Create a copy of DeviceManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceManagementStateCopyWith<DeviceManagementState> get copyWith => _$DeviceManagementStateCopyWithImpl<DeviceManagementState>(this as DeviceManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceManagementState&&const DeepCollectionEquality().equals(other.connectedDevices, connectedDevices)&&const DeepCollectionEquality().equals(other.availableDevices, availableDevices)&&(identical(other.isConnecting, isConnecting) || other.isConnecting == isConnecting)&&(identical(other.connectingDeviceId, connectingDeviceId) || other.connectingDeviceId == connectingDeviceId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(connectedDevices),const DeepCollectionEquality().hash(availableDevices),isConnecting,connectingDeviceId,error);

@override
String toString() {
  return 'DeviceManagementState(connectedDevices: $connectedDevices, availableDevices: $availableDevices, isConnecting: $isConnecting, connectingDeviceId: $connectingDeviceId, error: $error)';
}


}

/// @nodoc
abstract mixin class $DeviceManagementStateCopyWith<$Res>  {
  factory $DeviceManagementStateCopyWith(DeviceManagementState value, $Res Function(DeviceManagementState) _then) = _$DeviceManagementStateCopyWithImpl;
@useResult
$Res call({
 List<ConnectedDevice> connectedDevices, List<DeviceType> availableDevices, bool isConnecting, String? connectingDeviceId, String? error
});




}
/// @nodoc
class _$DeviceManagementStateCopyWithImpl<$Res>
    implements $DeviceManagementStateCopyWith<$Res> {
  _$DeviceManagementStateCopyWithImpl(this._self, this._then);

  final DeviceManagementState _self;
  final $Res Function(DeviceManagementState) _then;

/// Create a copy of DeviceManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectedDevices = null,Object? availableDevices = null,Object? isConnecting = null,Object? connectingDeviceId = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
connectedDevices: null == connectedDevices ? _self.connectedDevices : connectedDevices // ignore: cast_nullable_to_non_nullable
as List<ConnectedDevice>,availableDevices: null == availableDevices ? _self.availableDevices : availableDevices // ignore: cast_nullable_to_non_nullable
as List<DeviceType>,isConnecting: null == isConnecting ? _self.isConnecting : isConnecting // ignore: cast_nullable_to_non_nullable
as bool,connectingDeviceId: freezed == connectingDeviceId ? _self.connectingDeviceId : connectingDeviceId // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceManagementState].
extension DeviceManagementStatePatterns on DeviceManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceManagementState value)  $default,){
final _that = this;
switch (_that) {
case _DeviceManagementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ConnectedDevice> connectedDevices,  List<DeviceType> availableDevices,  bool isConnecting,  String? connectingDeviceId,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceManagementState() when $default != null:
return $default(_that.connectedDevices,_that.availableDevices,_that.isConnecting,_that.connectingDeviceId,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ConnectedDevice> connectedDevices,  List<DeviceType> availableDevices,  bool isConnecting,  String? connectingDeviceId,  String? error)  $default,) {final _that = this;
switch (_that) {
case _DeviceManagementState():
return $default(_that.connectedDevices,_that.availableDevices,_that.isConnecting,_that.connectingDeviceId,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ConnectedDevice> connectedDevices,  List<DeviceType> availableDevices,  bool isConnecting,  String? connectingDeviceId,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _DeviceManagementState() when $default != null:
return $default(_that.connectedDevices,_that.availableDevices,_that.isConnecting,_that.connectingDeviceId,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceManagementState implements DeviceManagementState {
  const _DeviceManagementState({final  List<ConnectedDevice> connectedDevices = const [], final  List<DeviceType> availableDevices = const [], this.isConnecting = false, this.connectingDeviceId, this.error}): _connectedDevices = connectedDevices,_availableDevices = availableDevices;
  

 final  List<ConnectedDevice> _connectedDevices;
@override@JsonKey() List<ConnectedDevice> get connectedDevices {
  if (_connectedDevices is EqualUnmodifiableListView) return _connectedDevices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connectedDevices);
}

 final  List<DeviceType> _availableDevices;
@override@JsonKey() List<DeviceType> get availableDevices {
  if (_availableDevices is EqualUnmodifiableListView) return _availableDevices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableDevices);
}

@override@JsonKey() final  bool isConnecting;
@override final  String? connectingDeviceId;
@override final  String? error;

/// Create a copy of DeviceManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceManagementStateCopyWith<_DeviceManagementState> get copyWith => __$DeviceManagementStateCopyWithImpl<_DeviceManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceManagementState&&const DeepCollectionEquality().equals(other._connectedDevices, _connectedDevices)&&const DeepCollectionEquality().equals(other._availableDevices, _availableDevices)&&(identical(other.isConnecting, isConnecting) || other.isConnecting == isConnecting)&&(identical(other.connectingDeviceId, connectingDeviceId) || other.connectingDeviceId == connectingDeviceId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_connectedDevices),const DeepCollectionEquality().hash(_availableDevices),isConnecting,connectingDeviceId,error);

@override
String toString() {
  return 'DeviceManagementState(connectedDevices: $connectedDevices, availableDevices: $availableDevices, isConnecting: $isConnecting, connectingDeviceId: $connectingDeviceId, error: $error)';
}


}

/// @nodoc
abstract mixin class _$DeviceManagementStateCopyWith<$Res> implements $DeviceManagementStateCopyWith<$Res> {
  factory _$DeviceManagementStateCopyWith(_DeviceManagementState value, $Res Function(_DeviceManagementState) _then) = __$DeviceManagementStateCopyWithImpl;
@override @useResult
$Res call({
 List<ConnectedDevice> connectedDevices, List<DeviceType> availableDevices, bool isConnecting, String? connectingDeviceId, String? error
});




}
/// @nodoc
class __$DeviceManagementStateCopyWithImpl<$Res>
    implements _$DeviceManagementStateCopyWith<$Res> {
  __$DeviceManagementStateCopyWithImpl(this._self, this._then);

  final _DeviceManagementState _self;
  final $Res Function(_DeviceManagementState) _then;

/// Create a copy of DeviceManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectedDevices = null,Object? availableDevices = null,Object? isConnecting = null,Object? connectingDeviceId = freezed,Object? error = freezed,}) {
  return _then(_DeviceManagementState(
connectedDevices: null == connectedDevices ? _self._connectedDevices : connectedDevices // ignore: cast_nullable_to_non_nullable
as List<ConnectedDevice>,availableDevices: null == availableDevices ? _self._availableDevices : availableDevices // ignore: cast_nullable_to_non_nullable
as List<DeviceType>,isConnecting: null == isConnecting ? _self.isConnecting : isConnecting // ignore: cast_nullable_to_non_nullable
as bool,connectingDeviceId: freezed == connectingDeviceId ? _self.connectingDeviceId : connectingDeviceId // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$MedicationReminderState {

 List<MedicationReminder> get reminders; List<DateTime> get upcomingReminders; bool get isLoading; bool get notificationsPermissionGranted; String? get error;
/// Create a copy of MedicationReminderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicationReminderStateCopyWith<MedicationReminderState> get copyWith => _$MedicationReminderStateCopyWithImpl<MedicationReminderState>(this as MedicationReminderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicationReminderState&&const DeepCollectionEquality().equals(other.reminders, reminders)&&const DeepCollectionEquality().equals(other.upcomingReminders, upcomingReminders)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.notificationsPermissionGranted, notificationsPermissionGranted) || other.notificationsPermissionGranted == notificationsPermissionGranted)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reminders),const DeepCollectionEquality().hash(upcomingReminders),isLoading,notificationsPermissionGranted,error);

@override
String toString() {
  return 'MedicationReminderState(reminders: $reminders, upcomingReminders: $upcomingReminders, isLoading: $isLoading, notificationsPermissionGranted: $notificationsPermissionGranted, error: $error)';
}


}

/// @nodoc
abstract mixin class $MedicationReminderStateCopyWith<$Res>  {
  factory $MedicationReminderStateCopyWith(MedicationReminderState value, $Res Function(MedicationReminderState) _then) = _$MedicationReminderStateCopyWithImpl;
@useResult
$Res call({
 List<MedicationReminder> reminders, List<DateTime> upcomingReminders, bool isLoading, bool notificationsPermissionGranted, String? error
});




}
/// @nodoc
class _$MedicationReminderStateCopyWithImpl<$Res>
    implements $MedicationReminderStateCopyWith<$Res> {
  _$MedicationReminderStateCopyWithImpl(this._self, this._then);

  final MedicationReminderState _self;
  final $Res Function(MedicationReminderState) _then;

/// Create a copy of MedicationReminderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reminders = null,Object? upcomingReminders = null,Object? isLoading = null,Object? notificationsPermissionGranted = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
reminders: null == reminders ? _self.reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<MedicationReminder>,upcomingReminders: null == upcomingReminders ? _self.upcomingReminders : upcomingReminders // ignore: cast_nullable_to_non_nullable
as List<DateTime>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,notificationsPermissionGranted: null == notificationsPermissionGranted ? _self.notificationsPermissionGranted : notificationsPermissionGranted // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicationReminderState].
extension MedicationReminderStatePatterns on MedicationReminderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicationReminderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicationReminderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicationReminderState value)  $default,){
final _that = this;
switch (_that) {
case _MedicationReminderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicationReminderState value)?  $default,){
final _that = this;
switch (_that) {
case _MedicationReminderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<MedicationReminder> reminders,  List<DateTime> upcomingReminders,  bool isLoading,  bool notificationsPermissionGranted,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicationReminderState() when $default != null:
return $default(_that.reminders,_that.upcomingReminders,_that.isLoading,_that.notificationsPermissionGranted,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<MedicationReminder> reminders,  List<DateTime> upcomingReminders,  bool isLoading,  bool notificationsPermissionGranted,  String? error)  $default,) {final _that = this;
switch (_that) {
case _MedicationReminderState():
return $default(_that.reminders,_that.upcomingReminders,_that.isLoading,_that.notificationsPermissionGranted,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<MedicationReminder> reminders,  List<DateTime> upcomingReminders,  bool isLoading,  bool notificationsPermissionGranted,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _MedicationReminderState() when $default != null:
return $default(_that.reminders,_that.upcomingReminders,_that.isLoading,_that.notificationsPermissionGranted,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MedicationReminderState implements MedicationReminderState {
  const _MedicationReminderState({final  List<MedicationReminder> reminders = const [], final  List<DateTime> upcomingReminders = const [], this.isLoading = false, this.notificationsPermissionGranted = false, this.error}): _reminders = reminders,_upcomingReminders = upcomingReminders;
  

 final  List<MedicationReminder> _reminders;
@override@JsonKey() List<MedicationReminder> get reminders {
  if (_reminders is EqualUnmodifiableListView) return _reminders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reminders);
}

 final  List<DateTime> _upcomingReminders;
@override@JsonKey() List<DateTime> get upcomingReminders {
  if (_upcomingReminders is EqualUnmodifiableListView) return _upcomingReminders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingReminders);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool notificationsPermissionGranted;
@override final  String? error;

/// Create a copy of MedicationReminderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicationReminderStateCopyWith<_MedicationReminderState> get copyWith => __$MedicationReminderStateCopyWithImpl<_MedicationReminderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicationReminderState&&const DeepCollectionEquality().equals(other._reminders, _reminders)&&const DeepCollectionEquality().equals(other._upcomingReminders, _upcomingReminders)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.notificationsPermissionGranted, notificationsPermissionGranted) || other.notificationsPermissionGranted == notificationsPermissionGranted)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reminders),const DeepCollectionEquality().hash(_upcomingReminders),isLoading,notificationsPermissionGranted,error);

@override
String toString() {
  return 'MedicationReminderState(reminders: $reminders, upcomingReminders: $upcomingReminders, isLoading: $isLoading, notificationsPermissionGranted: $notificationsPermissionGranted, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MedicationReminderStateCopyWith<$Res> implements $MedicationReminderStateCopyWith<$Res> {
  factory _$MedicationReminderStateCopyWith(_MedicationReminderState value, $Res Function(_MedicationReminderState) _then) = __$MedicationReminderStateCopyWithImpl;
@override @useResult
$Res call({
 List<MedicationReminder> reminders, List<DateTime> upcomingReminders, bool isLoading, bool notificationsPermissionGranted, String? error
});




}
/// @nodoc
class __$MedicationReminderStateCopyWithImpl<$Res>
    implements _$MedicationReminderStateCopyWith<$Res> {
  __$MedicationReminderStateCopyWithImpl(this._self, this._then);

  final _MedicationReminderState _self;
  final $Res Function(_MedicationReminderState) _then;

/// Create a copy of MedicationReminderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reminders = null,Object? upcomingReminders = null,Object? isLoading = null,Object? notificationsPermissionGranted = null,Object? error = freezed,}) {
  return _then(_MedicationReminderState(
reminders: null == reminders ? _self._reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<MedicationReminder>,upcomingReminders: null == upcomingReminders ? _self._upcomingReminders : upcomingReminders // ignore: cast_nullable_to_non_nullable
as List<DateTime>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,notificationsPermissionGranted: null == notificationsPermissionGranted ? _self.notificationsPermissionGranted : notificationsPermissionGranted // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
