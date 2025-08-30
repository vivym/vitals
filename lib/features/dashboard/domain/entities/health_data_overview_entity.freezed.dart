// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_data_overview_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HealthDataOverviewEntity {

 BloodPressureSummaryEntity? get bloodPressure; HeartRateSummaryEntity? get heartRate; WeightSummaryEntity? get weight; StepsSummaryEntity? get steps; DateTime? get lastUpdated;
/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthDataOverviewEntityCopyWith<HealthDataOverviewEntity> get copyWith => _$HealthDataOverviewEntityCopyWithImpl<HealthDataOverviewEntity>(this as HealthDataOverviewEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthDataOverviewEntity&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}


@override
int get hashCode => Object.hash(runtimeType,bloodPressure,heartRate,weight,steps,lastUpdated);

@override
String toString() {
  return 'HealthDataOverviewEntity(bloodPressure: $bloodPressure, heartRate: $heartRate, weight: $weight, steps: $steps, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $HealthDataOverviewEntityCopyWith<$Res>  {
  factory $HealthDataOverviewEntityCopyWith(HealthDataOverviewEntity value, $Res Function(HealthDataOverviewEntity) _then) = _$HealthDataOverviewEntityCopyWithImpl;
@useResult
$Res call({
 BloodPressureSummaryEntity? bloodPressure, HeartRateSummaryEntity? heartRate, WeightSummaryEntity? weight, StepsSummaryEntity? steps, DateTime? lastUpdated
});


$BloodPressureSummaryEntityCopyWith<$Res>? get bloodPressure;$HeartRateSummaryEntityCopyWith<$Res>? get heartRate;$WeightSummaryEntityCopyWith<$Res>? get weight;$StepsSummaryEntityCopyWith<$Res>? get steps;

}
/// @nodoc
class _$HealthDataOverviewEntityCopyWithImpl<$Res>
    implements $HealthDataOverviewEntityCopyWith<$Res> {
  _$HealthDataOverviewEntityCopyWithImpl(this._self, this._then);

  final HealthDataOverviewEntity _self;
  final $Res Function(HealthDataOverviewEntity) _then;

/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bloodPressure = freezed,Object? heartRate = freezed,Object? weight = freezed,Object? steps = freezed,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as BloodPressureSummaryEntity?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as HeartRateSummaryEntity?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as WeightSummaryEntity?,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as StepsSummaryEntity?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BloodPressureSummaryEntityCopyWith<$Res>? get bloodPressure {
    if (_self.bloodPressure == null) {
    return null;
  }

  return $BloodPressureSummaryEntityCopyWith<$Res>(_self.bloodPressure!, (value) {
    return _then(_self.copyWith(bloodPressure: value));
  });
}/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeartRateSummaryEntityCopyWith<$Res>? get heartRate {
    if (_self.heartRate == null) {
    return null;
  }

  return $HeartRateSummaryEntityCopyWith<$Res>(_self.heartRate!, (value) {
    return _then(_self.copyWith(heartRate: value));
  });
}/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeightSummaryEntityCopyWith<$Res>? get weight {
    if (_self.weight == null) {
    return null;
  }

  return $WeightSummaryEntityCopyWith<$Res>(_self.weight!, (value) {
    return _then(_self.copyWith(weight: value));
  });
}/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StepsSummaryEntityCopyWith<$Res>? get steps {
    if (_self.steps == null) {
    return null;
  }

  return $StepsSummaryEntityCopyWith<$Res>(_self.steps!, (value) {
    return _then(_self.copyWith(steps: value));
  });
}
}


/// Adds pattern-matching-related methods to [HealthDataOverviewEntity].
extension HealthDataOverviewEntityPatterns on HealthDataOverviewEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthDataOverviewEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthDataOverviewEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthDataOverviewEntity value)  $default,){
final _that = this;
switch (_that) {
case _HealthDataOverviewEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthDataOverviewEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HealthDataOverviewEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BloodPressureSummaryEntity? bloodPressure,  HeartRateSummaryEntity? heartRate,  WeightSummaryEntity? weight,  StepsSummaryEntity? steps,  DateTime? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthDataOverviewEntity() when $default != null:
return $default(_that.bloodPressure,_that.heartRate,_that.weight,_that.steps,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BloodPressureSummaryEntity? bloodPressure,  HeartRateSummaryEntity? heartRate,  WeightSummaryEntity? weight,  StepsSummaryEntity? steps,  DateTime? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _HealthDataOverviewEntity():
return $default(_that.bloodPressure,_that.heartRate,_that.weight,_that.steps,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BloodPressureSummaryEntity? bloodPressure,  HeartRateSummaryEntity? heartRate,  WeightSummaryEntity? weight,  StepsSummaryEntity? steps,  DateTime? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _HealthDataOverviewEntity() when $default != null:
return $default(_that.bloodPressure,_that.heartRate,_that.weight,_that.steps,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc


class _HealthDataOverviewEntity implements HealthDataOverviewEntity {
  const _HealthDataOverviewEntity({this.bloodPressure, this.heartRate, this.weight, this.steps, this.lastUpdated});
  

@override final  BloodPressureSummaryEntity? bloodPressure;
@override final  HeartRateSummaryEntity? heartRate;
@override final  WeightSummaryEntity? weight;
@override final  StepsSummaryEntity? steps;
@override final  DateTime? lastUpdated;

/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthDataOverviewEntityCopyWith<_HealthDataOverviewEntity> get copyWith => __$HealthDataOverviewEntityCopyWithImpl<_HealthDataOverviewEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthDataOverviewEntity&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}


@override
int get hashCode => Object.hash(runtimeType,bloodPressure,heartRate,weight,steps,lastUpdated);

@override
String toString() {
  return 'HealthDataOverviewEntity(bloodPressure: $bloodPressure, heartRate: $heartRate, weight: $weight, steps: $steps, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$HealthDataOverviewEntityCopyWith<$Res> implements $HealthDataOverviewEntityCopyWith<$Res> {
  factory _$HealthDataOverviewEntityCopyWith(_HealthDataOverviewEntity value, $Res Function(_HealthDataOverviewEntity) _then) = __$HealthDataOverviewEntityCopyWithImpl;
@override @useResult
$Res call({
 BloodPressureSummaryEntity? bloodPressure, HeartRateSummaryEntity? heartRate, WeightSummaryEntity? weight, StepsSummaryEntity? steps, DateTime? lastUpdated
});


@override $BloodPressureSummaryEntityCopyWith<$Res>? get bloodPressure;@override $HeartRateSummaryEntityCopyWith<$Res>? get heartRate;@override $WeightSummaryEntityCopyWith<$Res>? get weight;@override $StepsSummaryEntityCopyWith<$Res>? get steps;

}
/// @nodoc
class __$HealthDataOverviewEntityCopyWithImpl<$Res>
    implements _$HealthDataOverviewEntityCopyWith<$Res> {
  __$HealthDataOverviewEntityCopyWithImpl(this._self, this._then);

  final _HealthDataOverviewEntity _self;
  final $Res Function(_HealthDataOverviewEntity) _then;

/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bloodPressure = freezed,Object? heartRate = freezed,Object? weight = freezed,Object? steps = freezed,Object? lastUpdated = freezed,}) {
  return _then(_HealthDataOverviewEntity(
bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as BloodPressureSummaryEntity?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as HeartRateSummaryEntity?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as WeightSummaryEntity?,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as StepsSummaryEntity?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BloodPressureSummaryEntityCopyWith<$Res>? get bloodPressure {
    if (_self.bloodPressure == null) {
    return null;
  }

  return $BloodPressureSummaryEntityCopyWith<$Res>(_self.bloodPressure!, (value) {
    return _then(_self.copyWith(bloodPressure: value));
  });
}/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeartRateSummaryEntityCopyWith<$Res>? get heartRate {
    if (_self.heartRate == null) {
    return null;
  }

  return $HeartRateSummaryEntityCopyWith<$Res>(_self.heartRate!, (value) {
    return _then(_self.copyWith(heartRate: value));
  });
}/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeightSummaryEntityCopyWith<$Res>? get weight {
    if (_self.weight == null) {
    return null;
  }

  return $WeightSummaryEntityCopyWith<$Res>(_self.weight!, (value) {
    return _then(_self.copyWith(weight: value));
  });
}/// Create a copy of HealthDataOverviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StepsSummaryEntityCopyWith<$Res>? get steps {
    if (_self.steps == null) {
    return null;
  }

  return $StepsSummaryEntityCopyWith<$Res>(_self.steps!, (value) {
    return _then(_self.copyWith(steps: value));
  });
}
}

/// @nodoc
mixin _$BloodPressureSummaryEntity {

 int get systolic; int get diastolic; DateTime get recordedAt; BloodPressureLevel? get level; String? get trend;
/// Create a copy of BloodPressureSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodPressureSummaryEntityCopyWith<BloodPressureSummaryEntity> get copyWith => _$BloodPressureSummaryEntityCopyWithImpl<BloodPressureSummaryEntity>(this as BloodPressureSummaryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodPressureSummaryEntity&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.level, level) || other.level == level)&&(identical(other.trend, trend) || other.trend == trend));
}


@override
int get hashCode => Object.hash(runtimeType,systolic,diastolic,recordedAt,level,trend);

@override
String toString() {
  return 'BloodPressureSummaryEntity(systolic: $systolic, diastolic: $diastolic, recordedAt: $recordedAt, level: $level, trend: $trend)';
}


}

/// @nodoc
abstract mixin class $BloodPressureSummaryEntityCopyWith<$Res>  {
  factory $BloodPressureSummaryEntityCopyWith(BloodPressureSummaryEntity value, $Res Function(BloodPressureSummaryEntity) _then) = _$BloodPressureSummaryEntityCopyWithImpl;
@useResult
$Res call({
 int systolic, int diastolic, DateTime recordedAt, BloodPressureLevel? level, String? trend
});




}
/// @nodoc
class _$BloodPressureSummaryEntityCopyWithImpl<$Res>
    implements $BloodPressureSummaryEntityCopyWith<$Res> {
  _$BloodPressureSummaryEntityCopyWithImpl(this._self, this._then);

  final BloodPressureSummaryEntity _self;
  final $Res Function(BloodPressureSummaryEntity) _then;

/// Create a copy of BloodPressureSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? systolic = null,Object? diastolic = null,Object? recordedAt = null,Object? level = freezed,Object? trend = freezed,}) {
  return _then(_self.copyWith(
systolic: null == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int,diastolic: null == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as BloodPressureLevel?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BloodPressureSummaryEntity].
extension BloodPressureSummaryEntityPatterns on BloodPressureSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BloodPressureSummaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BloodPressureSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BloodPressureSummaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _BloodPressureSummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BloodPressureSummaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BloodPressureSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int systolic,  int diastolic,  DateTime recordedAt,  BloodPressureLevel? level,  String? trend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BloodPressureSummaryEntity() when $default != null:
return $default(_that.systolic,_that.diastolic,_that.recordedAt,_that.level,_that.trend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int systolic,  int diastolic,  DateTime recordedAt,  BloodPressureLevel? level,  String? trend)  $default,) {final _that = this;
switch (_that) {
case _BloodPressureSummaryEntity():
return $default(_that.systolic,_that.diastolic,_that.recordedAt,_that.level,_that.trend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int systolic,  int diastolic,  DateTime recordedAt,  BloodPressureLevel? level,  String? trend)?  $default,) {final _that = this;
switch (_that) {
case _BloodPressureSummaryEntity() when $default != null:
return $default(_that.systolic,_that.diastolic,_that.recordedAt,_that.level,_that.trend);case _:
  return null;

}
}

}

/// @nodoc


class _BloodPressureSummaryEntity implements BloodPressureSummaryEntity {
  const _BloodPressureSummaryEntity({required this.systolic, required this.diastolic, required this.recordedAt, this.level, this.trend});
  

@override final  int systolic;
@override final  int diastolic;
@override final  DateTime recordedAt;
@override final  BloodPressureLevel? level;
@override final  String? trend;

/// Create a copy of BloodPressureSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BloodPressureSummaryEntityCopyWith<_BloodPressureSummaryEntity> get copyWith => __$BloodPressureSummaryEntityCopyWithImpl<_BloodPressureSummaryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodPressureSummaryEntity&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.level, level) || other.level == level)&&(identical(other.trend, trend) || other.trend == trend));
}


@override
int get hashCode => Object.hash(runtimeType,systolic,diastolic,recordedAt,level,trend);

@override
String toString() {
  return 'BloodPressureSummaryEntity(systolic: $systolic, diastolic: $diastolic, recordedAt: $recordedAt, level: $level, trend: $trend)';
}


}

/// @nodoc
abstract mixin class _$BloodPressureSummaryEntityCopyWith<$Res> implements $BloodPressureSummaryEntityCopyWith<$Res> {
  factory _$BloodPressureSummaryEntityCopyWith(_BloodPressureSummaryEntity value, $Res Function(_BloodPressureSummaryEntity) _then) = __$BloodPressureSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 int systolic, int diastolic, DateTime recordedAt, BloodPressureLevel? level, String? trend
});




}
/// @nodoc
class __$BloodPressureSummaryEntityCopyWithImpl<$Res>
    implements _$BloodPressureSummaryEntityCopyWith<$Res> {
  __$BloodPressureSummaryEntityCopyWithImpl(this._self, this._then);

  final _BloodPressureSummaryEntity _self;
  final $Res Function(_BloodPressureSummaryEntity) _then;

/// Create a copy of BloodPressureSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? systolic = null,Object? diastolic = null,Object? recordedAt = null,Object? level = freezed,Object? trend = freezed,}) {
  return _then(_BloodPressureSummaryEntity(
systolic: null == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int,diastolic: null == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as BloodPressureLevel?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$HeartRateSummaryEntity {

 int get bpm; DateTime get recordedAt; HeartRateZone? get zone; String? get trend;
/// Create a copy of HeartRateSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeartRateSummaryEntityCopyWith<HeartRateSummaryEntity> get copyWith => _$HeartRateSummaryEntityCopyWithImpl<HeartRateSummaryEntity>(this as HeartRateSummaryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeartRateSummaryEntity&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.trend, trend) || other.trend == trend));
}


@override
int get hashCode => Object.hash(runtimeType,bpm,recordedAt,zone,trend);

@override
String toString() {
  return 'HeartRateSummaryEntity(bpm: $bpm, recordedAt: $recordedAt, zone: $zone, trend: $trend)';
}


}

/// @nodoc
abstract mixin class $HeartRateSummaryEntityCopyWith<$Res>  {
  factory $HeartRateSummaryEntityCopyWith(HeartRateSummaryEntity value, $Res Function(HeartRateSummaryEntity) _then) = _$HeartRateSummaryEntityCopyWithImpl;
@useResult
$Res call({
 int bpm, DateTime recordedAt, HeartRateZone? zone, String? trend
});




}
/// @nodoc
class _$HeartRateSummaryEntityCopyWithImpl<$Res>
    implements $HeartRateSummaryEntityCopyWith<$Res> {
  _$HeartRateSummaryEntityCopyWithImpl(this._self, this._then);

  final HeartRateSummaryEntity _self;
  final $Res Function(HeartRateSummaryEntity) _then;

/// Create a copy of HeartRateSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bpm = null,Object? recordedAt = null,Object? zone = freezed,Object? trend = freezed,}) {
  return _then(_self.copyWith(
bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as HeartRateZone?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HeartRateSummaryEntity].
extension HeartRateSummaryEntityPatterns on HeartRateSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HeartRateSummaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HeartRateSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HeartRateSummaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _HeartRateSummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HeartRateSummaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HeartRateSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int bpm,  DateTime recordedAt,  HeartRateZone? zone,  String? trend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HeartRateSummaryEntity() when $default != null:
return $default(_that.bpm,_that.recordedAt,_that.zone,_that.trend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int bpm,  DateTime recordedAt,  HeartRateZone? zone,  String? trend)  $default,) {final _that = this;
switch (_that) {
case _HeartRateSummaryEntity():
return $default(_that.bpm,_that.recordedAt,_that.zone,_that.trend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int bpm,  DateTime recordedAt,  HeartRateZone? zone,  String? trend)?  $default,) {final _that = this;
switch (_that) {
case _HeartRateSummaryEntity() when $default != null:
return $default(_that.bpm,_that.recordedAt,_that.zone,_that.trend);case _:
  return null;

}
}

}

/// @nodoc


class _HeartRateSummaryEntity implements HeartRateSummaryEntity {
  const _HeartRateSummaryEntity({required this.bpm, required this.recordedAt, this.zone, this.trend});
  

@override final  int bpm;
@override final  DateTime recordedAt;
@override final  HeartRateZone? zone;
@override final  String? trend;

/// Create a copy of HeartRateSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeartRateSummaryEntityCopyWith<_HeartRateSummaryEntity> get copyWith => __$HeartRateSummaryEntityCopyWithImpl<_HeartRateSummaryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeartRateSummaryEntity&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.trend, trend) || other.trend == trend));
}


@override
int get hashCode => Object.hash(runtimeType,bpm,recordedAt,zone,trend);

@override
String toString() {
  return 'HeartRateSummaryEntity(bpm: $bpm, recordedAt: $recordedAt, zone: $zone, trend: $trend)';
}


}

/// @nodoc
abstract mixin class _$HeartRateSummaryEntityCopyWith<$Res> implements $HeartRateSummaryEntityCopyWith<$Res> {
  factory _$HeartRateSummaryEntityCopyWith(_HeartRateSummaryEntity value, $Res Function(_HeartRateSummaryEntity) _then) = __$HeartRateSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 int bpm, DateTime recordedAt, HeartRateZone? zone, String? trend
});




}
/// @nodoc
class __$HeartRateSummaryEntityCopyWithImpl<$Res>
    implements _$HeartRateSummaryEntityCopyWith<$Res> {
  __$HeartRateSummaryEntityCopyWithImpl(this._self, this._then);

  final _HeartRateSummaryEntity _self;
  final $Res Function(_HeartRateSummaryEntity) _then;

/// Create a copy of HeartRateSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bpm = null,Object? recordedAt = null,Object? zone = freezed,Object? trend = freezed,}) {
  return _then(_HeartRateSummaryEntity(
bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as HeartRateZone?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$WeightSummaryEntity {

 double get weight; DateTime get recordedAt; double? get bmi; BMICategory? get category; String? get trend;
/// Create a copy of WeightSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeightSummaryEntityCopyWith<WeightSummaryEntity> get copyWith => _$WeightSummaryEntityCopyWithImpl<WeightSummaryEntity>(this as WeightSummaryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeightSummaryEntity&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.category, category) || other.category == category)&&(identical(other.trend, trend) || other.trend == trend));
}


@override
int get hashCode => Object.hash(runtimeType,weight,recordedAt,bmi,category,trend);

@override
String toString() {
  return 'WeightSummaryEntity(weight: $weight, recordedAt: $recordedAt, bmi: $bmi, category: $category, trend: $trend)';
}


}

/// @nodoc
abstract mixin class $WeightSummaryEntityCopyWith<$Res>  {
  factory $WeightSummaryEntityCopyWith(WeightSummaryEntity value, $Res Function(WeightSummaryEntity) _then) = _$WeightSummaryEntityCopyWithImpl;
@useResult
$Res call({
 double weight, DateTime recordedAt, double? bmi, BMICategory? category, String? trend
});




}
/// @nodoc
class _$WeightSummaryEntityCopyWithImpl<$Res>
    implements $WeightSummaryEntityCopyWith<$Res> {
  _$WeightSummaryEntityCopyWithImpl(this._self, this._then);

  final WeightSummaryEntity _self;
  final $Res Function(WeightSummaryEntity) _then;

/// Create a copy of WeightSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weight = null,Object? recordedAt = null,Object? bmi = freezed,Object? category = freezed,Object? trend = freezed,}) {
  return _then(_self.copyWith(
weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BMICategory?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WeightSummaryEntity].
extension WeightSummaryEntityPatterns on WeightSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeightSummaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeightSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeightSummaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _WeightSummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeightSummaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WeightSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double weight,  DateTime recordedAt,  double? bmi,  BMICategory? category,  String? trend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeightSummaryEntity() when $default != null:
return $default(_that.weight,_that.recordedAt,_that.bmi,_that.category,_that.trend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double weight,  DateTime recordedAt,  double? bmi,  BMICategory? category,  String? trend)  $default,) {final _that = this;
switch (_that) {
case _WeightSummaryEntity():
return $default(_that.weight,_that.recordedAt,_that.bmi,_that.category,_that.trend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double weight,  DateTime recordedAt,  double? bmi,  BMICategory? category,  String? trend)?  $default,) {final _that = this;
switch (_that) {
case _WeightSummaryEntity() when $default != null:
return $default(_that.weight,_that.recordedAt,_that.bmi,_that.category,_that.trend);case _:
  return null;

}
}

}

/// @nodoc


class _WeightSummaryEntity implements WeightSummaryEntity {
  const _WeightSummaryEntity({required this.weight, required this.recordedAt, this.bmi, this.category, this.trend});
  

@override final  double weight;
@override final  DateTime recordedAt;
@override final  double? bmi;
@override final  BMICategory? category;
@override final  String? trend;

/// Create a copy of WeightSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeightSummaryEntityCopyWith<_WeightSummaryEntity> get copyWith => __$WeightSummaryEntityCopyWithImpl<_WeightSummaryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeightSummaryEntity&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.category, category) || other.category == category)&&(identical(other.trend, trend) || other.trend == trend));
}


@override
int get hashCode => Object.hash(runtimeType,weight,recordedAt,bmi,category,trend);

@override
String toString() {
  return 'WeightSummaryEntity(weight: $weight, recordedAt: $recordedAt, bmi: $bmi, category: $category, trend: $trend)';
}


}

/// @nodoc
abstract mixin class _$WeightSummaryEntityCopyWith<$Res> implements $WeightSummaryEntityCopyWith<$Res> {
  factory _$WeightSummaryEntityCopyWith(_WeightSummaryEntity value, $Res Function(_WeightSummaryEntity) _then) = __$WeightSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 double weight, DateTime recordedAt, double? bmi, BMICategory? category, String? trend
});




}
/// @nodoc
class __$WeightSummaryEntityCopyWithImpl<$Res>
    implements _$WeightSummaryEntityCopyWith<$Res> {
  __$WeightSummaryEntityCopyWithImpl(this._self, this._then);

  final _WeightSummaryEntity _self;
  final $Res Function(_WeightSummaryEntity) _then;

/// Create a copy of WeightSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weight = null,Object? recordedAt = null,Object? bmi = freezed,Object? category = freezed,Object? trend = freezed,}) {
  return _then(_WeightSummaryEntity(
weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BMICategory?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$StepsSummaryEntity {

 int get steps; int get goal; DateTime get recordedAt; double? get calories; double? get distance;
/// Create a copy of StepsSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepsSummaryEntityCopyWith<StepsSummaryEntity> get copyWith => _$StepsSummaryEntityCopyWithImpl<StepsSummaryEntity>(this as StepsSummaryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepsSummaryEntity&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.distance, distance) || other.distance == distance));
}


@override
int get hashCode => Object.hash(runtimeType,steps,goal,recordedAt,calories,distance);

@override
String toString() {
  return 'StepsSummaryEntity(steps: $steps, goal: $goal, recordedAt: $recordedAt, calories: $calories, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $StepsSummaryEntityCopyWith<$Res>  {
  factory $StepsSummaryEntityCopyWith(StepsSummaryEntity value, $Res Function(StepsSummaryEntity) _then) = _$StepsSummaryEntityCopyWithImpl;
@useResult
$Res call({
 int steps, int goal, DateTime recordedAt, double? calories, double? distance
});




}
/// @nodoc
class _$StepsSummaryEntityCopyWithImpl<$Res>
    implements $StepsSummaryEntityCopyWith<$Res> {
  _$StepsSummaryEntityCopyWithImpl(this._self, this._then);

  final StepsSummaryEntity _self;
  final $Res Function(StepsSummaryEntity) _then;

/// Create a copy of StepsSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? steps = null,Object? goal = null,Object? recordedAt = null,Object? calories = freezed,Object? distance = freezed,}) {
  return _then(_self.copyWith(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [StepsSummaryEntity].
extension StepsSummaryEntityPatterns on StepsSummaryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StepsSummaryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StepsSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StepsSummaryEntity value)  $default,){
final _that = this;
switch (_that) {
case _StepsSummaryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StepsSummaryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StepsSummaryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int steps,  int goal,  DateTime recordedAt,  double? calories,  double? distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StepsSummaryEntity() when $default != null:
return $default(_that.steps,_that.goal,_that.recordedAt,_that.calories,_that.distance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int steps,  int goal,  DateTime recordedAt,  double? calories,  double? distance)  $default,) {final _that = this;
switch (_that) {
case _StepsSummaryEntity():
return $default(_that.steps,_that.goal,_that.recordedAt,_that.calories,_that.distance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int steps,  int goal,  DateTime recordedAt,  double? calories,  double? distance)?  $default,) {final _that = this;
switch (_that) {
case _StepsSummaryEntity() when $default != null:
return $default(_that.steps,_that.goal,_that.recordedAt,_that.calories,_that.distance);case _:
  return null;

}
}

}

/// @nodoc


class _StepsSummaryEntity implements StepsSummaryEntity {
  const _StepsSummaryEntity({required this.steps, required this.goal, required this.recordedAt, this.calories, this.distance});
  

@override final  int steps;
@override final  int goal;
@override final  DateTime recordedAt;
@override final  double? calories;
@override final  double? distance;

/// Create a copy of StepsSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepsSummaryEntityCopyWith<_StepsSummaryEntity> get copyWith => __$StepsSummaryEntityCopyWithImpl<_StepsSummaryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepsSummaryEntity&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.distance, distance) || other.distance == distance));
}


@override
int get hashCode => Object.hash(runtimeType,steps,goal,recordedAt,calories,distance);

@override
String toString() {
  return 'StepsSummaryEntity(steps: $steps, goal: $goal, recordedAt: $recordedAt, calories: $calories, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$StepsSummaryEntityCopyWith<$Res> implements $StepsSummaryEntityCopyWith<$Res> {
  factory _$StepsSummaryEntityCopyWith(_StepsSummaryEntity value, $Res Function(_StepsSummaryEntity) _then) = __$StepsSummaryEntityCopyWithImpl;
@override @useResult
$Res call({
 int steps, int goal, DateTime recordedAt, double? calories, double? distance
});




}
/// @nodoc
class __$StepsSummaryEntityCopyWithImpl<$Res>
    implements _$StepsSummaryEntityCopyWith<$Res> {
  __$StepsSummaryEntityCopyWithImpl(this._self, this._then);

  final _StepsSummaryEntity _self;
  final $Res Function(_StepsSummaryEntity) _then;

/// Create a copy of StepsSummaryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? steps = null,Object? goal = null,Object? recordedAt = null,Object? calories = freezed,Object? distance = freezed,}) {
  return _then(_StepsSummaryEntity(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
