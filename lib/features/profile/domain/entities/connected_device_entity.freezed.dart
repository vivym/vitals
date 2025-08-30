// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connected_device_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConnectedDeviceEntity {

 String get id; String get name; DeviceType get type; DeviceStatus get status; String? get brand; String? get model; String? get macAddress; DateTime? get lastSyncAt; DateTime? get connectedAt; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of ConnectedDeviceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectedDeviceEntityCopyWith<ConnectedDeviceEntity> get copyWith => _$ConnectedDeviceEntityCopyWithImpl<ConnectedDeviceEntity>(this as ConnectedDeviceEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedDeviceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.macAddress, macAddress) || other.macAddress == macAddress)&&(identical(other.lastSyncAt, lastSyncAt) || other.lastSyncAt == lastSyncAt)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,status,brand,model,macAddress,lastSyncAt,connectedAt,createdAt,updatedAt);

@override
String toString() {
  return 'ConnectedDeviceEntity(id: $id, name: $name, type: $type, status: $status, brand: $brand, model: $model, macAddress: $macAddress, lastSyncAt: $lastSyncAt, connectedAt: $connectedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ConnectedDeviceEntityCopyWith<$Res>  {
  factory $ConnectedDeviceEntityCopyWith(ConnectedDeviceEntity value, $Res Function(ConnectedDeviceEntity) _then) = _$ConnectedDeviceEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, DeviceType type, DeviceStatus status, String? brand, String? model, String? macAddress, DateTime? lastSyncAt, DateTime? connectedAt, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ConnectedDeviceEntityCopyWithImpl<$Res>
    implements $ConnectedDeviceEntityCopyWith<$Res> {
  _$ConnectedDeviceEntityCopyWithImpl(this._self, this._then);

  final ConnectedDeviceEntity _self;
  final $Res Function(ConnectedDeviceEntity) _then;

/// Create a copy of ConnectedDeviceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = null,Object? status = null,Object? brand = freezed,Object? model = freezed,Object? macAddress = freezed,Object? lastSyncAt = freezed,Object? connectedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeviceStatus,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,macAddress: freezed == macAddress ? _self.macAddress : macAddress // ignore: cast_nullable_to_non_nullable
as String?,lastSyncAt: freezed == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as DateTime?,connectedAt: freezed == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConnectedDeviceEntity].
extension ConnectedDeviceEntityPatterns on ConnectedDeviceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectedDeviceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectedDeviceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectedDeviceEntity value)  $default,){
final _that = this;
switch (_that) {
case _ConnectedDeviceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectedDeviceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectedDeviceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  DeviceType type,  DeviceStatus status,  String? brand,  String? model,  String? macAddress,  DateTime? lastSyncAt,  DateTime? connectedAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectedDeviceEntity() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.status,_that.brand,_that.model,_that.macAddress,_that.lastSyncAt,_that.connectedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  DeviceType type,  DeviceStatus status,  String? brand,  String? model,  String? macAddress,  DateTime? lastSyncAt,  DateTime? connectedAt,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ConnectedDeviceEntity():
return $default(_that.id,_that.name,_that.type,_that.status,_that.brand,_that.model,_that.macAddress,_that.lastSyncAt,_that.connectedAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  DeviceType type,  DeviceStatus status,  String? brand,  String? model,  String? macAddress,  DateTime? lastSyncAt,  DateTime? connectedAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ConnectedDeviceEntity() when $default != null:
return $default(_that.id,_that.name,_that.type,_that.status,_that.brand,_that.model,_that.macAddress,_that.lastSyncAt,_that.connectedAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ConnectedDeviceEntity extends ConnectedDeviceEntity {
  const _ConnectedDeviceEntity({required this.id, required this.name, required this.type, required this.status, this.brand, this.model, this.macAddress, this.lastSyncAt, this.connectedAt, this.createdAt, this.updatedAt}): super._();
  

@override final  String id;
@override final  String name;
@override final  DeviceType type;
@override final  DeviceStatus status;
@override final  String? brand;
@override final  String? model;
@override final  String? macAddress;
@override final  DateTime? lastSyncAt;
@override final  DateTime? connectedAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of ConnectedDeviceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectedDeviceEntityCopyWith<_ConnectedDeviceEntity> get copyWith => __$ConnectedDeviceEntityCopyWithImpl<_ConnectedDeviceEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectedDeviceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model)&&(identical(other.macAddress, macAddress) || other.macAddress == macAddress)&&(identical(other.lastSyncAt, lastSyncAt) || other.lastSyncAt == lastSyncAt)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,type,status,brand,model,macAddress,lastSyncAt,connectedAt,createdAt,updatedAt);

@override
String toString() {
  return 'ConnectedDeviceEntity(id: $id, name: $name, type: $type, status: $status, brand: $brand, model: $model, macAddress: $macAddress, lastSyncAt: $lastSyncAt, connectedAt: $connectedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ConnectedDeviceEntityCopyWith<$Res> implements $ConnectedDeviceEntityCopyWith<$Res> {
  factory _$ConnectedDeviceEntityCopyWith(_ConnectedDeviceEntity value, $Res Function(_ConnectedDeviceEntity) _then) = __$ConnectedDeviceEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, DeviceType type, DeviceStatus status, String? brand, String? model, String? macAddress, DateTime? lastSyncAt, DateTime? connectedAt, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$ConnectedDeviceEntityCopyWithImpl<$Res>
    implements _$ConnectedDeviceEntityCopyWith<$Res> {
  __$ConnectedDeviceEntityCopyWithImpl(this._self, this._then);

  final _ConnectedDeviceEntity _self;
  final $Res Function(_ConnectedDeviceEntity) _then;

/// Create a copy of ConnectedDeviceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = null,Object? status = null,Object? brand = freezed,Object? model = freezed,Object? macAddress = freezed,Object? lastSyncAt = freezed,Object? connectedAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ConnectedDeviceEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DeviceType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeviceStatus,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,macAddress: freezed == macAddress ? _self.macAddress : macAddress // ignore: cast_nullable_to_non_nullable
as String?,lastSyncAt: freezed == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as DateTime?,connectedAt: freezed == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
