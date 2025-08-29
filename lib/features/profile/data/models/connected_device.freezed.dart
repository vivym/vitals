// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connected_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConnectedDevice {

 String get id; String get name; DeviceType get type; DeviceStatus get status;@JsonKey(name: 'connected_at') DateTime? get connectedAt;@JsonKey(name: 'last_sync') DateTime? get lastSync; Map<String, dynamic>? get settings;
/// Create a copy of ConnectedDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectedDeviceCopyWith<ConnectedDevice> get copyWith => _$ConnectedDeviceCopyWithImpl<ConnectedDevice>(this as ConnectedDevice, _$identity);

  /// Serializes this ConnectedDevice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedDevice&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.lastSync, lastSync) || other.lastSync == lastSync)&&const DeepCollectionEquality().equals(other.settings, settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,status,connectedAt,lastSync,const DeepCollectionEquality().hash(settings));

@override
String toString() {
  return 'ConnectedDevice(id: $id, name: $name, type: $type, status: $status, connectedAt: $connectedAt, lastSync: $lastSync, settings: $settings)';
}


}

/// @nodoc
abstract mixin class $ConnectedDeviceCopyWith<$Res>  {
  factory $ConnectedDeviceCopyWith(ConnectedDevice value, $Res Function(ConnectedDevice) _then) = _$ConnectedDeviceCopyWithImpl;
@useResult
$Res call({
 String id, String name, DeviceType type, DeviceStatus status,@JsonKey(name: 'connected_at') DateTime? connectedAt,@JsonKey(name: 'last_sync') DateTime? lastSync, Map<String, dynamic>? settings
});




}
/// @nodoc
class _$ConnectedDeviceCopyWithImpl<$Res>
    implements $ConnectedDeviceCopyWith<$Res> {
  _$ConnectedDeviceCopyWithImpl(this._self, this._then);

  final ConnectedDevice _self;
  final $Res Function(ConnectedDevice) _then;

/// Create a copy of ConnectedDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? status = null,Object? connectedAt = freezed,Object? lastSync = freezed,Object? settings = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeviceStatus,connectedAt: freezed == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSync: freezed == lastSync ? _self.lastSync : lastSync // ignore: cast_nullable_to_non_nullable
as DateTime?,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConnectedDevice].
extension ConnectedDevicePatterns on ConnectedDevice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectedDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectedDevice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectedDevice value)  $default,){
final _that = this;
switch (_that) {
case _ConnectedDevice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectedDevice value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectedDevice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  DeviceType type,  DeviceStatus status, @JsonKey(name: 'connected_at')  DateTime? connectedAt, @JsonKey(name: 'last_sync')  DateTime? lastSync,  Map<String, dynamic>? settings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectedDevice() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.status,_that.connectedAt,_that.lastSync,_that.settings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  DeviceType type,  DeviceStatus status, @JsonKey(name: 'connected_at')  DateTime? connectedAt, @JsonKey(name: 'last_sync')  DateTime? lastSync,  Map<String, dynamic>? settings)  $default,) {final _that = this;
switch (_that) {
case _ConnectedDevice():
return $default(_that.id,_that.name,_that.type,_that.status,_that.connectedAt,_that.lastSync,_that.settings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  DeviceType type,  DeviceStatus status, @JsonKey(name: 'connected_at')  DateTime? connectedAt, @JsonKey(name: 'last_sync')  DateTime? lastSync,  Map<String, dynamic>? settings)?  $default,) {final _that = this;
switch (_that) {
case _ConnectedDevice() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.status,_that.connectedAt,_that.lastSync,_that.settings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectedDevice implements ConnectedDevice {
  const _ConnectedDevice({required this.id, required this.name, required this.type, required this.status, @JsonKey(name: 'connected_at') this.connectedAt, @JsonKey(name: 'last_sync') this.lastSync, final  Map<String, dynamic>? settings}): _settings = settings;
  factory _ConnectedDevice.fromJson(Map<String, dynamic> json) => _$ConnectedDeviceFromJson(json);

@override final  String id;
@override final  String name;
@override final  DeviceType type;
@override final  DeviceStatus status;
@override@JsonKey(name: 'connected_at') final  DateTime? connectedAt;
@override@JsonKey(name: 'last_sync') final  DateTime? lastSync;
 final  Map<String, dynamic>? _settings;
@override Map<String, dynamic>? get settings {
  final value = _settings;
  if (value == null) return null;
  if (_settings is EqualUnmodifiableMapView) return _settings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ConnectedDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectedDeviceCopyWith<_ConnectedDevice> get copyWith => __$ConnectedDeviceCopyWithImpl<_ConnectedDevice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectedDeviceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectedDevice&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.lastSync, lastSync) || other.lastSync == lastSync)&&const DeepCollectionEquality().equals(other._settings, _settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type,status,connectedAt,lastSync,const DeepCollectionEquality().hash(_settings));

@override
String toString() {
  return 'ConnectedDevice(id: $id, name: $name, type: $type, status: $status, connectedAt: $connectedAt, lastSync: $lastSync, settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$ConnectedDeviceCopyWith<$Res> implements $ConnectedDeviceCopyWith<$Res> {
  factory _$ConnectedDeviceCopyWith(_ConnectedDevice value, $Res Function(_ConnectedDevice) _then) = __$ConnectedDeviceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, DeviceType type, DeviceStatus status,@JsonKey(name: 'connected_at') DateTime? connectedAt,@JsonKey(name: 'last_sync') DateTime? lastSync, Map<String, dynamic>? settings
});




}
/// @nodoc
class __$ConnectedDeviceCopyWithImpl<$Res>
    implements _$ConnectedDeviceCopyWith<$Res> {
  __$ConnectedDeviceCopyWithImpl(this._self, this._then);

  final _ConnectedDevice _self;
  final $Res Function(_ConnectedDevice) _then;

/// Create a copy of ConnectedDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? status = null,Object? connectedAt = freezed,Object? lastSync = freezed,Object? settings = freezed,}) {
  return _then(_ConnectedDevice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeviceStatus,connectedAt: freezed == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSync: freezed == lastSync ? _self.lastSync : lastSync // ignore: cast_nullable_to_non_nullable
as DateTime?,settings: freezed == settings ? _self._settings : settings // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
