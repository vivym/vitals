// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_management_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceManagementState {

 List<ConnectedDeviceEntity> get connectedDevices; bool get isLoading; bool get isConnecting; String? get connectingDeviceId; String? get error;
/// Create a copy of DeviceManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceManagementStateCopyWith<DeviceManagementState> get copyWith => _$DeviceManagementStateCopyWithImpl<DeviceManagementState>(this as DeviceManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceManagementState&&const DeepCollectionEquality().equals(other.connectedDevices, connectedDevices)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isConnecting, isConnecting) || other.isConnecting == isConnecting)&&(identical(other.connectingDeviceId, connectingDeviceId) || other.connectingDeviceId == connectingDeviceId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(connectedDevices),isLoading,isConnecting,connectingDeviceId,error);

@override
String toString() {
  return 'DeviceManagementState(connectedDevices: $connectedDevices, isLoading: $isLoading, isConnecting: $isConnecting, connectingDeviceId: $connectingDeviceId, error: $error)';
}


}

/// @nodoc
abstract mixin class $DeviceManagementStateCopyWith<$Res>  {
  factory $DeviceManagementStateCopyWith(DeviceManagementState value, $Res Function(DeviceManagementState) _then) = _$DeviceManagementStateCopyWithImpl;
@useResult
$Res call({
 List<ConnectedDeviceEntity> connectedDevices, bool isLoading, bool isConnecting, String? connectingDeviceId, String? error
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
@pragma('vm:prefer-inline') @override $Res call({Object? connectedDevices = null,Object? isLoading = null,Object? isConnecting = null,Object? connectingDeviceId = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
connectedDevices: null == connectedDevices ? _self.connectedDevices : connectedDevices // ignore: cast_nullable_to_non_nullable
as List<ConnectedDeviceEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isConnecting: null == isConnecting ? _self.isConnecting : isConnecting // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ConnectedDeviceEntity> connectedDevices,  bool isLoading,  bool isConnecting,  String? connectingDeviceId,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceManagementState() when $default != null:
return $default(_that.connectedDevices,_that.isLoading,_that.isConnecting,_that.connectingDeviceId,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ConnectedDeviceEntity> connectedDevices,  bool isLoading,  bool isConnecting,  String? connectingDeviceId,  String? error)  $default,) {final _that = this;
switch (_that) {
case _DeviceManagementState():
return $default(_that.connectedDevices,_that.isLoading,_that.isConnecting,_that.connectingDeviceId,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ConnectedDeviceEntity> connectedDevices,  bool isLoading,  bool isConnecting,  String? connectingDeviceId,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _DeviceManagementState() when $default != null:
return $default(_that.connectedDevices,_that.isLoading,_that.isConnecting,_that.connectingDeviceId,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceManagementState implements DeviceManagementState {
  const _DeviceManagementState({final  List<ConnectedDeviceEntity> connectedDevices = const [], this.isLoading = false, this.isConnecting = false, this.connectingDeviceId, this.error}): _connectedDevices = connectedDevices;
  

 final  List<ConnectedDeviceEntity> _connectedDevices;
@override@JsonKey() List<ConnectedDeviceEntity> get connectedDevices {
  if (_connectedDevices is EqualUnmodifiableListView) return _connectedDevices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connectedDevices);
}

@override@JsonKey() final  bool isLoading;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceManagementState&&const DeepCollectionEquality().equals(other._connectedDevices, _connectedDevices)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isConnecting, isConnecting) || other.isConnecting == isConnecting)&&(identical(other.connectingDeviceId, connectingDeviceId) || other.connectingDeviceId == connectingDeviceId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_connectedDevices),isLoading,isConnecting,connectingDeviceId,error);

@override
String toString() {
  return 'DeviceManagementState(connectedDevices: $connectedDevices, isLoading: $isLoading, isConnecting: $isConnecting, connectingDeviceId: $connectingDeviceId, error: $error)';
}


}

/// @nodoc
abstract mixin class _$DeviceManagementStateCopyWith<$Res> implements $DeviceManagementStateCopyWith<$Res> {
  factory _$DeviceManagementStateCopyWith(_DeviceManagementState value, $Res Function(_DeviceManagementState) _then) = __$DeviceManagementStateCopyWithImpl;
@override @useResult
$Res call({
 List<ConnectedDeviceEntity> connectedDevices, bool isLoading, bool isConnecting, String? connectingDeviceId, String? error
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
@override @pragma('vm:prefer-inline') $Res call({Object? connectedDevices = null,Object? isLoading = null,Object? isConnecting = null,Object? connectingDeviceId = freezed,Object? error = freezed,}) {
  return _then(_DeviceManagementState(
connectedDevices: null == connectedDevices ? _self._connectedDevices : connectedDevices // ignore: cast_nullable_to_non_nullable
as List<ConnectedDeviceEntity>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isConnecting: null == isConnecting ? _self.isConnecting : isConnecting // ignore: cast_nullable_to_non_nullable
as bool,connectingDeviceId: freezed == connectingDeviceId ? _self.connectingDeviceId : connectingDeviceId // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
