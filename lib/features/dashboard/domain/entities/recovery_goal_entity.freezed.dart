// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recovery_goal_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecoveryGoalEntity {

 String get id; String get title; String get description; GoalType get type; double get targetValue; double get currentValue; String get unit; DateTime get deadline; GoalStatus get status; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of RecoveryGoalEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecoveryGoalEntityCopyWith<RecoveryGoalEntity> get copyWith => _$RecoveryGoalEntityCopyWithImpl<RecoveryGoalEntity>(this as RecoveryGoalEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoveryGoalEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,type,targetValue,currentValue,unit,deadline,status,createdAt,updatedAt);

@override
String toString() {
  return 'RecoveryGoalEntity(id: $id, title: $title, description: $description, type: $type, targetValue: $targetValue, currentValue: $currentValue, unit: $unit, deadline: $deadline, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RecoveryGoalEntityCopyWith<$Res>  {
  factory $RecoveryGoalEntityCopyWith(RecoveryGoalEntity value, $Res Function(RecoveryGoalEntity) _then) = _$RecoveryGoalEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, GoalType type, double targetValue, double currentValue, String unit, DateTime deadline, GoalStatus status, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$RecoveryGoalEntityCopyWithImpl<$Res>
    implements $RecoveryGoalEntityCopyWith<$Res> {
  _$RecoveryGoalEntityCopyWithImpl(this._self, this._then);

  final RecoveryGoalEntity _self;
  final $Res Function(RecoveryGoalEntity) _then;

/// Create a copy of RecoveryGoalEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? type = null,Object? targetValue = null,Object? currentValue = null,Object? unit = null,Object? deadline = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GoalType,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecoveryGoalEntity].
extension RecoveryGoalEntityPatterns on RecoveryGoalEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecoveryGoalEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecoveryGoalEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecoveryGoalEntity value)  $default,){
final _that = this;
switch (_that) {
case _RecoveryGoalEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecoveryGoalEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RecoveryGoalEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  GoalType type,  double targetValue,  double currentValue,  String unit,  DateTime deadline,  GoalStatus status,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecoveryGoalEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.type,_that.targetValue,_that.currentValue,_that.unit,_that.deadline,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  GoalType type,  double targetValue,  double currentValue,  String unit,  DateTime deadline,  GoalStatus status,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RecoveryGoalEntity():
return $default(_that.id,_that.title,_that.description,_that.type,_that.targetValue,_that.currentValue,_that.unit,_that.deadline,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  GoalType type,  double targetValue,  double currentValue,  String unit,  DateTime deadline,  GoalStatus status,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RecoveryGoalEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.type,_that.targetValue,_that.currentValue,_that.unit,_that.deadline,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _RecoveryGoalEntity extends RecoveryGoalEntity {
  const _RecoveryGoalEntity({required this.id, required this.title, required this.description, required this.type, required this.targetValue, required this.currentValue, required this.unit, required this.deadline, required this.status, this.createdAt, this.updatedAt}): super._();
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  GoalType type;
@override final  double targetValue;
@override final  double currentValue;
@override final  String unit;
@override final  DateTime deadline;
@override final  GoalStatus status;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of RecoveryGoalEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecoveryGoalEntityCopyWith<_RecoveryGoalEntity> get copyWith => __$RecoveryGoalEntityCopyWithImpl<_RecoveryGoalEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecoveryGoalEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,type,targetValue,currentValue,unit,deadline,status,createdAt,updatedAt);

@override
String toString() {
  return 'RecoveryGoalEntity(id: $id, title: $title, description: $description, type: $type, targetValue: $targetValue, currentValue: $currentValue, unit: $unit, deadline: $deadline, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RecoveryGoalEntityCopyWith<$Res> implements $RecoveryGoalEntityCopyWith<$Res> {
  factory _$RecoveryGoalEntityCopyWith(_RecoveryGoalEntity value, $Res Function(_RecoveryGoalEntity) _then) = __$RecoveryGoalEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, GoalType type, double targetValue, double currentValue, String unit, DateTime deadline, GoalStatus status, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$RecoveryGoalEntityCopyWithImpl<$Res>
    implements _$RecoveryGoalEntityCopyWith<$Res> {
  __$RecoveryGoalEntityCopyWithImpl(this._self, this._then);

  final _RecoveryGoalEntity _self;
  final $Res Function(_RecoveryGoalEntity) _then;

/// Create a copy of RecoveryGoalEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? type = null,Object? targetValue = null,Object? currentValue = null,Object? unit = null,Object? deadline = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_RecoveryGoalEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GoalType,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
