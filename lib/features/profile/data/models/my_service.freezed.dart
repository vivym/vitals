// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyService {

 String get id; String get name; String get description; ServiceType get type; ServiceStatus get status; String? get iconUrl;@JsonKey(name: 'subscribed_at') DateTime? get subscribedAt;@JsonKey(name: 'expires_at') DateTime? get expiresAt;
/// Create a copy of MyService
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyServiceCopyWith<MyService> get copyWith => _$MyServiceCopyWithImpl<MyService>(this as MyService, _$identity);

  /// Serializes this MyService to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyService&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.subscribedAt, subscribedAt) || other.subscribedAt == subscribedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,type,status,iconUrl,subscribedAt,expiresAt);

@override
String toString() {
  return 'MyService(id: $id, name: $name, description: $description, type: $type, status: $status, iconUrl: $iconUrl, subscribedAt: $subscribedAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $MyServiceCopyWith<$Res>  {
  factory $MyServiceCopyWith(MyService value, $Res Function(MyService) _then) = _$MyServiceCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, ServiceType type, ServiceStatus status, String? iconUrl,@JsonKey(name: 'subscribed_at') DateTime? subscribedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt
});




}
/// @nodoc
class _$MyServiceCopyWithImpl<$Res>
    implements $MyServiceCopyWith<$Res> {
  _$MyServiceCopyWithImpl(this._self, this._then);

  final MyService _self;
  final $Res Function(MyService) _then;

/// Create a copy of MyService
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? type = null,Object? status = null,Object? iconUrl = freezed,Object? subscribedAt = freezed,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ServiceType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ServiceStatus,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,subscribedAt: freezed == subscribedAt ? _self.subscribedAt : subscribedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyService].
extension MyServicePatterns on MyService {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyService value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyService() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyService value)  $default,){
final _that = this;
switch (_that) {
case _MyService():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyService value)?  $default,){
final _that = this;
switch (_that) {
case _MyService() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  ServiceType type,  ServiceStatus status,  String? iconUrl, @JsonKey(name: 'subscribed_at')  DateTime? subscribedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyService() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.type,_that.status,_that.iconUrl,_that.subscribedAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  ServiceType type,  ServiceStatus status,  String? iconUrl, @JsonKey(name: 'subscribed_at')  DateTime? subscribedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _MyService():
return $default(_that.id,_that.name,_that.description,_that.type,_that.status,_that.iconUrl,_that.subscribedAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  ServiceType type,  ServiceStatus status,  String? iconUrl, @JsonKey(name: 'subscribed_at')  DateTime? subscribedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _MyService() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.type,_that.status,_that.iconUrl,_that.subscribedAt,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyService implements MyService {
  const _MyService({required this.id, required this.name, required this.description, required this.type, required this.status, this.iconUrl, @JsonKey(name: 'subscribed_at') this.subscribedAt, @JsonKey(name: 'expires_at') this.expiresAt});
  factory _MyService.fromJson(Map<String, dynamic> json) => _$MyServiceFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  ServiceType type;
@override final  ServiceStatus status;
@override final  String? iconUrl;
@override@JsonKey(name: 'subscribed_at') final  DateTime? subscribedAt;
@override@JsonKey(name: 'expires_at') final  DateTime? expiresAt;

/// Create a copy of MyService
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyServiceCopyWith<_MyService> get copyWith => __$MyServiceCopyWithImpl<_MyService>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyServiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyService&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.subscribedAt, subscribedAt) || other.subscribedAt == subscribedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,type,status,iconUrl,subscribedAt,expiresAt);

@override
String toString() {
  return 'MyService(id: $id, name: $name, description: $description, type: $type, status: $status, iconUrl: $iconUrl, subscribedAt: $subscribedAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$MyServiceCopyWith<$Res> implements $MyServiceCopyWith<$Res> {
  factory _$MyServiceCopyWith(_MyService value, $Res Function(_MyService) _then) = __$MyServiceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, ServiceType type, ServiceStatus status, String? iconUrl,@JsonKey(name: 'subscribed_at') DateTime? subscribedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt
});




}
/// @nodoc
class __$MyServiceCopyWithImpl<$Res>
    implements _$MyServiceCopyWith<$Res> {
  __$MyServiceCopyWithImpl(this._self, this._then);

  final _MyService _self;
  final $Res Function(_MyService) _then;

/// Create a copy of MyService
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? type = null,Object? status = null,Object? iconUrl = freezed,Object? subscribedAt = freezed,Object? expiresAt = freezed,}) {
  return _then(_MyService(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ServiceType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ServiceStatus,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,subscribedAt: freezed == subscribedAt ? _self.subscribedAt : subscribedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
