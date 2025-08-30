// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HealthDataOverview {

 BloodPressureSummary? get bloodPressure; HeartRateSummary? get heartRate; WeightSummary? get weight; StepsSummary? get steps;@JsonKey(name: 'last_updated') DateTime? get lastUpdated;
/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthDataOverviewCopyWith<HealthDataOverview> get copyWith => _$HealthDataOverviewCopyWithImpl<HealthDataOverview>(this as HealthDataOverview, _$identity);

  /// Serializes this HealthDataOverview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthDataOverview&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bloodPressure,heartRate,weight,steps,lastUpdated);

@override
String toString() {
  return 'HealthDataOverview(bloodPressure: $bloodPressure, heartRate: $heartRate, weight: $weight, steps: $steps, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $HealthDataOverviewCopyWith<$Res>  {
  factory $HealthDataOverviewCopyWith(HealthDataOverview value, $Res Function(HealthDataOverview) _then) = _$HealthDataOverviewCopyWithImpl;
@useResult
$Res call({
 BloodPressureSummary? bloodPressure, HeartRateSummary? heartRate, WeightSummary? weight, StepsSummary? steps,@JsonKey(name: 'last_updated') DateTime? lastUpdated
});


$BloodPressureSummaryCopyWith<$Res>? get bloodPressure;$HeartRateSummaryCopyWith<$Res>? get heartRate;$WeightSummaryCopyWith<$Res>? get weight;$StepsSummaryCopyWith<$Res>? get steps;

}
/// @nodoc
class _$HealthDataOverviewCopyWithImpl<$Res>
    implements $HealthDataOverviewCopyWith<$Res> {
  _$HealthDataOverviewCopyWithImpl(this._self, this._then);

  final HealthDataOverview _self;
  final $Res Function(HealthDataOverview) _then;

/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bloodPressure = freezed,Object? heartRate = freezed,Object? weight = freezed,Object? steps = freezed,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as BloodPressureSummary?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as HeartRateSummary?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as WeightSummary?,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as StepsSummary?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BloodPressureSummaryCopyWith<$Res>? get bloodPressure {
    if (_self.bloodPressure == null) {
    return null;
  }

  return $BloodPressureSummaryCopyWith<$Res>(_self.bloodPressure!, (value) {
    return _then(_self.copyWith(bloodPressure: value));
  });
}/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeartRateSummaryCopyWith<$Res>? get heartRate {
    if (_self.heartRate == null) {
    return null;
  }

  return $HeartRateSummaryCopyWith<$Res>(_self.heartRate!, (value) {
    return _then(_self.copyWith(heartRate: value));
  });
}/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeightSummaryCopyWith<$Res>? get weight {
    if (_self.weight == null) {
    return null;
  }

  return $WeightSummaryCopyWith<$Res>(_self.weight!, (value) {
    return _then(_self.copyWith(weight: value));
  });
}/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StepsSummaryCopyWith<$Res>? get steps {
    if (_self.steps == null) {
    return null;
  }

  return $StepsSummaryCopyWith<$Res>(_self.steps!, (value) {
    return _then(_self.copyWith(steps: value));
  });
}
}


/// Adds pattern-matching-related methods to [HealthDataOverview].
extension HealthDataOverviewPatterns on HealthDataOverview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthDataOverview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthDataOverview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthDataOverview value)  $default,){
final _that = this;
switch (_that) {
case _HealthDataOverview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthDataOverview value)?  $default,){
final _that = this;
switch (_that) {
case _HealthDataOverview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BloodPressureSummary? bloodPressure,  HeartRateSummary? heartRate,  WeightSummary? weight,  StepsSummary? steps, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthDataOverview() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BloodPressureSummary? bloodPressure,  HeartRateSummary? heartRate,  WeightSummary? weight,  StepsSummary? steps, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _HealthDataOverview():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BloodPressureSummary? bloodPressure,  HeartRateSummary? heartRate,  WeightSummary? weight,  StepsSummary? steps, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _HealthDataOverview() when $default != null:
return $default(_that.bloodPressure,_that.heartRate,_that.weight,_that.steps,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthDataOverview implements HealthDataOverview {
  const _HealthDataOverview({this.bloodPressure, this.heartRate, this.weight, this.steps, @JsonKey(name: 'last_updated') this.lastUpdated});
  factory _HealthDataOverview.fromJson(Map<String, dynamic> json) => _$HealthDataOverviewFromJson(json);

@override final  BloodPressureSummary? bloodPressure;
@override final  HeartRateSummary? heartRate;
@override final  WeightSummary? weight;
@override final  StepsSummary? steps;
@override@JsonKey(name: 'last_updated') final  DateTime? lastUpdated;

/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthDataOverviewCopyWith<_HealthDataOverview> get copyWith => __$HealthDataOverviewCopyWithImpl<_HealthDataOverview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthDataOverviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthDataOverview&&(identical(other.bloodPressure, bloodPressure) || other.bloodPressure == bloodPressure)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bloodPressure,heartRate,weight,steps,lastUpdated);

@override
String toString() {
  return 'HealthDataOverview(bloodPressure: $bloodPressure, heartRate: $heartRate, weight: $weight, steps: $steps, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$HealthDataOverviewCopyWith<$Res> implements $HealthDataOverviewCopyWith<$Res> {
  factory _$HealthDataOverviewCopyWith(_HealthDataOverview value, $Res Function(_HealthDataOverview) _then) = __$HealthDataOverviewCopyWithImpl;
@override @useResult
$Res call({
 BloodPressureSummary? bloodPressure, HeartRateSummary? heartRate, WeightSummary? weight, StepsSummary? steps,@JsonKey(name: 'last_updated') DateTime? lastUpdated
});


@override $BloodPressureSummaryCopyWith<$Res>? get bloodPressure;@override $HeartRateSummaryCopyWith<$Res>? get heartRate;@override $WeightSummaryCopyWith<$Res>? get weight;@override $StepsSummaryCopyWith<$Res>? get steps;

}
/// @nodoc
class __$HealthDataOverviewCopyWithImpl<$Res>
    implements _$HealthDataOverviewCopyWith<$Res> {
  __$HealthDataOverviewCopyWithImpl(this._self, this._then);

  final _HealthDataOverview _self;
  final $Res Function(_HealthDataOverview) _then;

/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bloodPressure = freezed,Object? heartRate = freezed,Object? weight = freezed,Object? steps = freezed,Object? lastUpdated = freezed,}) {
  return _then(_HealthDataOverview(
bloodPressure: freezed == bloodPressure ? _self.bloodPressure : bloodPressure // ignore: cast_nullable_to_non_nullable
as BloodPressureSummary?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as HeartRateSummary?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as WeightSummary?,steps: freezed == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as StepsSummary?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BloodPressureSummaryCopyWith<$Res>? get bloodPressure {
    if (_self.bloodPressure == null) {
    return null;
  }

  return $BloodPressureSummaryCopyWith<$Res>(_self.bloodPressure!, (value) {
    return _then(_self.copyWith(bloodPressure: value));
  });
}/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeartRateSummaryCopyWith<$Res>? get heartRate {
    if (_self.heartRate == null) {
    return null;
  }

  return $HeartRateSummaryCopyWith<$Res>(_self.heartRate!, (value) {
    return _then(_self.copyWith(heartRate: value));
  });
}/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeightSummaryCopyWith<$Res>? get weight {
    if (_self.weight == null) {
    return null;
  }

  return $WeightSummaryCopyWith<$Res>(_self.weight!, (value) {
    return _then(_self.copyWith(weight: value));
  });
}/// Create a copy of HealthDataOverview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StepsSummaryCopyWith<$Res>? get steps {
    if (_self.steps == null) {
    return null;
  }

  return $StepsSummaryCopyWith<$Res>(_self.steps!, (value) {
    return _then(_self.copyWith(steps: value));
  });
}
}


/// @nodoc
mixin _$BloodPressureSummary {

 int get systolic;// 收缩压
 int get diastolic;// 舒张压
 DateTime get recordedAt; BloodPressureLevel? get level;// 血压水平评估
 String? get trend;
/// Create a copy of BloodPressureSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodPressureSummaryCopyWith<BloodPressureSummary> get copyWith => _$BloodPressureSummaryCopyWithImpl<BloodPressureSummary>(this as BloodPressureSummary, _$identity);

  /// Serializes this BloodPressureSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodPressureSummary&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.level, level) || other.level == level)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,systolic,diastolic,recordedAt,level,trend);

@override
String toString() {
  return 'BloodPressureSummary(systolic: $systolic, diastolic: $diastolic, recordedAt: $recordedAt, level: $level, trend: $trend)';
}


}

/// @nodoc
abstract mixin class $BloodPressureSummaryCopyWith<$Res>  {
  factory $BloodPressureSummaryCopyWith(BloodPressureSummary value, $Res Function(BloodPressureSummary) _then) = _$BloodPressureSummaryCopyWithImpl;
@useResult
$Res call({
 int systolic, int diastolic, DateTime recordedAt, BloodPressureLevel? level, String? trend
});




}
/// @nodoc
class _$BloodPressureSummaryCopyWithImpl<$Res>
    implements $BloodPressureSummaryCopyWith<$Res> {
  _$BloodPressureSummaryCopyWithImpl(this._self, this._then);

  final BloodPressureSummary _self;
  final $Res Function(BloodPressureSummary) _then;

/// Create a copy of BloodPressureSummary
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


/// Adds pattern-matching-related methods to [BloodPressureSummary].
extension BloodPressureSummaryPatterns on BloodPressureSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BloodPressureSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BloodPressureSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BloodPressureSummary value)  $default,){
final _that = this;
switch (_that) {
case _BloodPressureSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BloodPressureSummary value)?  $default,){
final _that = this;
switch (_that) {
case _BloodPressureSummary() when $default != null:
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
case _BloodPressureSummary() when $default != null:
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
case _BloodPressureSummary():
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
case _BloodPressureSummary() when $default != null:
return $default(_that.systolic,_that.diastolic,_that.recordedAt,_that.level,_that.trend);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BloodPressureSummary implements BloodPressureSummary {
  const _BloodPressureSummary({required this.systolic, required this.diastolic, required this.recordedAt, this.level, this.trend});
  factory _BloodPressureSummary.fromJson(Map<String, dynamic> json) => _$BloodPressureSummaryFromJson(json);

@override final  int systolic;
// 收缩压
@override final  int diastolic;
// 舒张压
@override final  DateTime recordedAt;
@override final  BloodPressureLevel? level;
// 血压水平评估
@override final  String? trend;

/// Create a copy of BloodPressureSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BloodPressureSummaryCopyWith<_BloodPressureSummary> get copyWith => __$BloodPressureSummaryCopyWithImpl<_BloodPressureSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BloodPressureSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodPressureSummary&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.level, level) || other.level == level)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,systolic,diastolic,recordedAt,level,trend);

@override
String toString() {
  return 'BloodPressureSummary(systolic: $systolic, diastolic: $diastolic, recordedAt: $recordedAt, level: $level, trend: $trend)';
}


}

/// @nodoc
abstract mixin class _$BloodPressureSummaryCopyWith<$Res> implements $BloodPressureSummaryCopyWith<$Res> {
  factory _$BloodPressureSummaryCopyWith(_BloodPressureSummary value, $Res Function(_BloodPressureSummary) _then) = __$BloodPressureSummaryCopyWithImpl;
@override @useResult
$Res call({
 int systolic, int diastolic, DateTime recordedAt, BloodPressureLevel? level, String? trend
});




}
/// @nodoc
class __$BloodPressureSummaryCopyWithImpl<$Res>
    implements _$BloodPressureSummaryCopyWith<$Res> {
  __$BloodPressureSummaryCopyWithImpl(this._self, this._then);

  final _BloodPressureSummary _self;
  final $Res Function(_BloodPressureSummary) _then;

/// Create a copy of BloodPressureSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? systolic = null,Object? diastolic = null,Object? recordedAt = null,Object? level = freezed,Object? trend = freezed,}) {
  return _then(_BloodPressureSummary(
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
mixin _$HeartRateSummary {

 int get bpm; DateTime get recordedAt; HeartRateZone? get zone; String? get trend;
/// Create a copy of HeartRateSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeartRateSummaryCopyWith<HeartRateSummary> get copyWith => _$HeartRateSummaryCopyWithImpl<HeartRateSummary>(this as HeartRateSummary, _$identity);

  /// Serializes this HeartRateSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeartRateSummary&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bpm,recordedAt,zone,trend);

@override
String toString() {
  return 'HeartRateSummary(bpm: $bpm, recordedAt: $recordedAt, zone: $zone, trend: $trend)';
}


}

/// @nodoc
abstract mixin class $HeartRateSummaryCopyWith<$Res>  {
  factory $HeartRateSummaryCopyWith(HeartRateSummary value, $Res Function(HeartRateSummary) _then) = _$HeartRateSummaryCopyWithImpl;
@useResult
$Res call({
 int bpm, DateTime recordedAt, HeartRateZone? zone, String? trend
});




}
/// @nodoc
class _$HeartRateSummaryCopyWithImpl<$Res>
    implements $HeartRateSummaryCopyWith<$Res> {
  _$HeartRateSummaryCopyWithImpl(this._self, this._then);

  final HeartRateSummary _self;
  final $Res Function(HeartRateSummary) _then;

/// Create a copy of HeartRateSummary
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


/// Adds pattern-matching-related methods to [HeartRateSummary].
extension HeartRateSummaryPatterns on HeartRateSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HeartRateSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HeartRateSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HeartRateSummary value)  $default,){
final _that = this;
switch (_that) {
case _HeartRateSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HeartRateSummary value)?  $default,){
final _that = this;
switch (_that) {
case _HeartRateSummary() when $default != null:
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
case _HeartRateSummary() when $default != null:
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
case _HeartRateSummary():
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
case _HeartRateSummary() when $default != null:
return $default(_that.bpm,_that.recordedAt,_that.zone,_that.trend);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HeartRateSummary implements HeartRateSummary {
  const _HeartRateSummary({required this.bpm, required this.recordedAt, this.zone, this.trend});
  factory _HeartRateSummary.fromJson(Map<String, dynamic> json) => _$HeartRateSummaryFromJson(json);

@override final  int bpm;
@override final  DateTime recordedAt;
@override final  HeartRateZone? zone;
@override final  String? trend;

/// Create a copy of HeartRateSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeartRateSummaryCopyWith<_HeartRateSummary> get copyWith => __$HeartRateSummaryCopyWithImpl<_HeartRateSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeartRateSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeartRateSummary&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bpm,recordedAt,zone,trend);

@override
String toString() {
  return 'HeartRateSummary(bpm: $bpm, recordedAt: $recordedAt, zone: $zone, trend: $trend)';
}


}

/// @nodoc
abstract mixin class _$HeartRateSummaryCopyWith<$Res> implements $HeartRateSummaryCopyWith<$Res> {
  factory _$HeartRateSummaryCopyWith(_HeartRateSummary value, $Res Function(_HeartRateSummary) _then) = __$HeartRateSummaryCopyWithImpl;
@override @useResult
$Res call({
 int bpm, DateTime recordedAt, HeartRateZone? zone, String? trend
});




}
/// @nodoc
class __$HeartRateSummaryCopyWithImpl<$Res>
    implements _$HeartRateSummaryCopyWith<$Res> {
  __$HeartRateSummaryCopyWithImpl(this._self, this._then);

  final _HeartRateSummary _self;
  final $Res Function(_HeartRateSummary) _then;

/// Create a copy of HeartRateSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bpm = null,Object? recordedAt = null,Object? zone = freezed,Object? trend = freezed,}) {
  return _then(_HeartRateSummary(
bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as HeartRateZone?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WeightSummary {

 double get weight;// 单位：kg
 DateTime get recordedAt; double? get bmi; BMICategory? get category; String? get trend;
/// Create a copy of WeightSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeightSummaryCopyWith<WeightSummary> get copyWith => _$WeightSummaryCopyWithImpl<WeightSummary>(this as WeightSummary, _$identity);

  /// Serializes this WeightSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeightSummary&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.category, category) || other.category == category)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weight,recordedAt,bmi,category,trend);

@override
String toString() {
  return 'WeightSummary(weight: $weight, recordedAt: $recordedAt, bmi: $bmi, category: $category, trend: $trend)';
}


}

/// @nodoc
abstract mixin class $WeightSummaryCopyWith<$Res>  {
  factory $WeightSummaryCopyWith(WeightSummary value, $Res Function(WeightSummary) _then) = _$WeightSummaryCopyWithImpl;
@useResult
$Res call({
 double weight, DateTime recordedAt, double? bmi, BMICategory? category, String? trend
});




}
/// @nodoc
class _$WeightSummaryCopyWithImpl<$Res>
    implements $WeightSummaryCopyWith<$Res> {
  _$WeightSummaryCopyWithImpl(this._self, this._then);

  final WeightSummary _self;
  final $Res Function(WeightSummary) _then;

/// Create a copy of WeightSummary
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


/// Adds pattern-matching-related methods to [WeightSummary].
extension WeightSummaryPatterns on WeightSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeightSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeightSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeightSummary value)  $default,){
final _that = this;
switch (_that) {
case _WeightSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeightSummary value)?  $default,){
final _that = this;
switch (_that) {
case _WeightSummary() when $default != null:
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
case _WeightSummary() when $default != null:
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
case _WeightSummary():
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
case _WeightSummary() when $default != null:
return $default(_that.weight,_that.recordedAt,_that.bmi,_that.category,_that.trend);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeightSummary implements WeightSummary {
  const _WeightSummary({required this.weight, required this.recordedAt, this.bmi, this.category, this.trend});
  factory _WeightSummary.fromJson(Map<String, dynamic> json) => _$WeightSummaryFromJson(json);

@override final  double weight;
// 单位：kg
@override final  DateTime recordedAt;
@override final  double? bmi;
@override final  BMICategory? category;
@override final  String? trend;

/// Create a copy of WeightSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeightSummaryCopyWith<_WeightSummary> get copyWith => __$WeightSummaryCopyWithImpl<_WeightSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeightSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeightSummary&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.category, category) || other.category == category)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weight,recordedAt,bmi,category,trend);

@override
String toString() {
  return 'WeightSummary(weight: $weight, recordedAt: $recordedAt, bmi: $bmi, category: $category, trend: $trend)';
}


}

/// @nodoc
abstract mixin class _$WeightSummaryCopyWith<$Res> implements $WeightSummaryCopyWith<$Res> {
  factory _$WeightSummaryCopyWith(_WeightSummary value, $Res Function(_WeightSummary) _then) = __$WeightSummaryCopyWithImpl;
@override @useResult
$Res call({
 double weight, DateTime recordedAt, double? bmi, BMICategory? category, String? trend
});




}
/// @nodoc
class __$WeightSummaryCopyWithImpl<$Res>
    implements _$WeightSummaryCopyWith<$Res> {
  __$WeightSummaryCopyWithImpl(this._self, this._then);

  final _WeightSummary _self;
  final $Res Function(_WeightSummary) _then;

/// Create a copy of WeightSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weight = null,Object? recordedAt = null,Object? bmi = freezed,Object? category = freezed,Object? trend = freezed,}) {
  return _then(_WeightSummary(
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
mixin _$StepsSummary {

 int get steps; DateTime get recordedAt; int? get goal; double? get calories; double? get distance;
/// Create a copy of StepsSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepsSummaryCopyWith<StepsSummary> get copyWith => _$StepsSummaryCopyWithImpl<StepsSummary>(this as StepsSummary, _$identity);

  /// Serializes this StepsSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepsSummary&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,steps,recordedAt,goal,calories,distance);

@override
String toString() {
  return 'StepsSummary(steps: $steps, recordedAt: $recordedAt, goal: $goal, calories: $calories, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $StepsSummaryCopyWith<$Res>  {
  factory $StepsSummaryCopyWith(StepsSummary value, $Res Function(StepsSummary) _then) = _$StepsSummaryCopyWithImpl;
@useResult
$Res call({
 int steps, DateTime recordedAt, int? goal, double? calories, double? distance
});




}
/// @nodoc
class _$StepsSummaryCopyWithImpl<$Res>
    implements $StepsSummaryCopyWith<$Res> {
  _$StepsSummaryCopyWithImpl(this._self, this._then);

  final StepsSummary _self;
  final $Res Function(StepsSummary) _then;

/// Create a copy of StepsSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? steps = null,Object? recordedAt = null,Object? goal = freezed,Object? calories = freezed,Object? distance = freezed,}) {
  return _then(_self.copyWith(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int?,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [StepsSummary].
extension StepsSummaryPatterns on StepsSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StepsSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StepsSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StepsSummary value)  $default,){
final _that = this;
switch (_that) {
case _StepsSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StepsSummary value)?  $default,){
final _that = this;
switch (_that) {
case _StepsSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int steps,  DateTime recordedAt,  int? goal,  double? calories,  double? distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StepsSummary() when $default != null:
return $default(_that.steps,_that.recordedAt,_that.goal,_that.calories,_that.distance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int steps,  DateTime recordedAt,  int? goal,  double? calories,  double? distance)  $default,) {final _that = this;
switch (_that) {
case _StepsSummary():
return $default(_that.steps,_that.recordedAt,_that.goal,_that.calories,_that.distance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int steps,  DateTime recordedAt,  int? goal,  double? calories,  double? distance)?  $default,) {final _that = this;
switch (_that) {
case _StepsSummary() when $default != null:
return $default(_that.steps,_that.recordedAt,_that.goal,_that.calories,_that.distance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StepsSummary extends StepsSummary {
  const _StepsSummary({required this.steps, required this.recordedAt, this.goal, this.calories, this.distance}): super._();
  factory _StepsSummary.fromJson(Map<String, dynamic> json) => _$StepsSummaryFromJson(json);

@override final  int steps;
@override final  DateTime recordedAt;
@override final  int? goal;
@override final  double? calories;
@override final  double? distance;

/// Create a copy of StepsSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepsSummaryCopyWith<_StepsSummary> get copyWith => __$StepsSummaryCopyWithImpl<_StepsSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StepsSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepsSummary&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,steps,recordedAt,goal,calories,distance);

@override
String toString() {
  return 'StepsSummary(steps: $steps, recordedAt: $recordedAt, goal: $goal, calories: $calories, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$StepsSummaryCopyWith<$Res> implements $StepsSummaryCopyWith<$Res> {
  factory _$StepsSummaryCopyWith(_StepsSummary value, $Res Function(_StepsSummary) _then) = __$StepsSummaryCopyWithImpl;
@override @useResult
$Res call({
 int steps, DateTime recordedAt, int? goal, double? calories, double? distance
});




}
/// @nodoc
class __$StepsSummaryCopyWithImpl<$Res>
    implements _$StepsSummaryCopyWith<$Res> {
  __$StepsSummaryCopyWithImpl(this._self, this._then);

  final _StepsSummary _self;
  final $Res Function(_StepsSummary) _then;

/// Create a copy of StepsSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? steps = null,Object? recordedAt = null,Object? goal = freezed,Object? calories = freezed,Object? distance = freezed,}) {
  return _then(_StepsSummary(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int?,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$RecoveryGoal {

 String get id; String get title; String get description; GoalType get type; double get targetValue; double get currentValue; String get unit; DateTime get deadline; GoalStatus get status;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of RecoveryGoal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecoveryGoalCopyWith<RecoveryGoal> get copyWith => _$RecoveryGoalCopyWithImpl<RecoveryGoal>(this as RecoveryGoal, _$identity);

  /// Serializes this RecoveryGoal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoveryGoal&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,type,targetValue,currentValue,unit,deadline,status,createdAt,updatedAt);

@override
String toString() {
  return 'RecoveryGoal(id: $id, title: $title, description: $description, type: $type, targetValue: $targetValue, currentValue: $currentValue, unit: $unit, deadline: $deadline, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RecoveryGoalCopyWith<$Res>  {
  factory $RecoveryGoalCopyWith(RecoveryGoal value, $Res Function(RecoveryGoal) _then) = _$RecoveryGoalCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, GoalType type, double targetValue, double currentValue, String unit, DateTime deadline, GoalStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$RecoveryGoalCopyWithImpl<$Res>
    implements $RecoveryGoalCopyWith<$Res> {
  _$RecoveryGoalCopyWithImpl(this._self, this._then);

  final RecoveryGoal _self;
  final $Res Function(RecoveryGoal) _then;

/// Create a copy of RecoveryGoal
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


/// Adds pattern-matching-related methods to [RecoveryGoal].
extension RecoveryGoalPatterns on RecoveryGoal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecoveryGoal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecoveryGoal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecoveryGoal value)  $default,){
final _that = this;
switch (_that) {
case _RecoveryGoal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecoveryGoal value)?  $default,){
final _that = this;
switch (_that) {
case _RecoveryGoal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  GoalType type,  double targetValue,  double currentValue,  String unit,  DateTime deadline,  GoalStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecoveryGoal() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  GoalType type,  double targetValue,  double currentValue,  String unit,  DateTime deadline,  GoalStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RecoveryGoal():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  GoalType type,  double targetValue,  double currentValue,  String unit,  DateTime deadline,  GoalStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RecoveryGoal() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.type,_that.targetValue,_that.currentValue,_that.unit,_that.deadline,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecoveryGoal extends RecoveryGoal {
  const _RecoveryGoal({required this.id, required this.title, required this.description, required this.type, required this.targetValue, required this.currentValue, required this.unit, required this.deadline, this.status = GoalStatus.active, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _RecoveryGoal.fromJson(Map<String, dynamic> json) => _$RecoveryGoalFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  GoalType type;
@override final  double targetValue;
@override final  double currentValue;
@override final  String unit;
@override final  DateTime deadline;
@override@JsonKey() final  GoalStatus status;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of RecoveryGoal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecoveryGoalCopyWith<_RecoveryGoal> get copyWith => __$RecoveryGoalCopyWithImpl<_RecoveryGoal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecoveryGoalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecoveryGoal&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,type,targetValue,currentValue,unit,deadline,status,createdAt,updatedAt);

@override
String toString() {
  return 'RecoveryGoal(id: $id, title: $title, description: $description, type: $type, targetValue: $targetValue, currentValue: $currentValue, unit: $unit, deadline: $deadline, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RecoveryGoalCopyWith<$Res> implements $RecoveryGoalCopyWith<$Res> {
  factory _$RecoveryGoalCopyWith(_RecoveryGoal value, $Res Function(_RecoveryGoal) _then) = __$RecoveryGoalCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, GoalType type, double targetValue, double currentValue, String unit, DateTime deadline, GoalStatus status,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$RecoveryGoalCopyWithImpl<$Res>
    implements _$RecoveryGoalCopyWith<$Res> {
  __$RecoveryGoalCopyWithImpl(this._self, this._then);

  final _RecoveryGoal _self;
  final $Res Function(_RecoveryGoal) _then;

/// Create a copy of RecoveryGoal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? type = null,Object? targetValue = null,Object? currentValue = null,Object? unit = null,Object? deadline = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_RecoveryGoal(
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


/// @nodoc
mixin _$HealthEducationItem {

 String get id; String get title; String get summary; String get content; EducationType get type; String? get imageUrl; String? get videoUrl; int get readingTimeMinutes;// 预计阅读时间（分钟）
 List<String> get tags;@JsonKey(name: 'published_at') DateTime get publishedAt; bool get isRead; bool get isFavorited; String? get category; String? get authorName; String? get thumbnailUrl; List<String> get imageUrls; DateTime? get readAt;
/// Create a copy of HealthEducationItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthEducationItemCopyWith<HealthEducationItem> get copyWith => _$HealthEducationItemCopyWithImpl<HealthEducationItem>(this as HealthEducationItem, _$identity);

  /// Serializes this HealthEducationItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthEducationItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.readingTimeMinutes, readingTimeMinutes) || other.readingTimeMinutes == readingTimeMinutes)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited)&&(identical(other.category, category) || other.category == category)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,content,type,imageUrl,videoUrl,readingTimeMinutes,const DeepCollectionEquality().hash(tags),publishedAt,isRead,isFavorited,category,authorName,thumbnailUrl,const DeepCollectionEquality().hash(imageUrls),readAt);

@override
String toString() {
  return 'HealthEducationItem(id: $id, title: $title, summary: $summary, content: $content, type: $type, imageUrl: $imageUrl, videoUrl: $videoUrl, readingTimeMinutes: $readingTimeMinutes, tags: $tags, publishedAt: $publishedAt, isRead: $isRead, isFavorited: $isFavorited, category: $category, authorName: $authorName, thumbnailUrl: $thumbnailUrl, imageUrls: $imageUrls, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class $HealthEducationItemCopyWith<$Res>  {
  factory $HealthEducationItemCopyWith(HealthEducationItem value, $Res Function(HealthEducationItem) _then) = _$HealthEducationItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String summary, String content, EducationType type, String? imageUrl, String? videoUrl, int readingTimeMinutes, List<String> tags,@JsonKey(name: 'published_at') DateTime publishedAt, bool isRead, bool isFavorited, String? category, String? authorName, String? thumbnailUrl, List<String> imageUrls, DateTime? readAt
});




}
/// @nodoc
class _$HealthEducationItemCopyWithImpl<$Res>
    implements $HealthEducationItemCopyWith<$Res> {
  _$HealthEducationItemCopyWithImpl(this._self, this._then);

  final HealthEducationItem _self;
  final $Res Function(HealthEducationItem) _then;

/// Create a copy of HealthEducationItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? content = null,Object? type = null,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? readingTimeMinutes = null,Object? tags = null,Object? publishedAt = null,Object? isRead = null,Object? isFavorited = null,Object? category = freezed,Object? authorName = freezed,Object? thumbnailUrl = freezed,Object? imageUrls = null,Object? readAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EducationType,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,readingTimeMinutes: null == readingTimeMinutes ? _self.readingTimeMinutes : readingTimeMinutes // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrls: null == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthEducationItem].
extension HealthEducationItemPatterns on HealthEducationItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthEducationItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthEducationItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthEducationItem value)  $default,){
final _that = this;
switch (_that) {
case _HealthEducationItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthEducationItem value)?  $default,){
final _that = this;
switch (_that) {
case _HealthEducationItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  String content,  EducationType type,  String? imageUrl,  String? videoUrl,  int readingTimeMinutes,  List<String> tags, @JsonKey(name: 'published_at')  DateTime publishedAt,  bool isRead,  bool isFavorited,  String? category,  String? authorName,  String? thumbnailUrl,  List<String> imageUrls,  DateTime? readAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthEducationItem() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.content,_that.type,_that.imageUrl,_that.videoUrl,_that.readingTimeMinutes,_that.tags,_that.publishedAt,_that.isRead,_that.isFavorited,_that.category,_that.authorName,_that.thumbnailUrl,_that.imageUrls,_that.readAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  String content,  EducationType type,  String? imageUrl,  String? videoUrl,  int readingTimeMinutes,  List<String> tags, @JsonKey(name: 'published_at')  DateTime publishedAt,  bool isRead,  bool isFavorited,  String? category,  String? authorName,  String? thumbnailUrl,  List<String> imageUrls,  DateTime? readAt)  $default,) {final _that = this;
switch (_that) {
case _HealthEducationItem():
return $default(_that.id,_that.title,_that.summary,_that.content,_that.type,_that.imageUrl,_that.videoUrl,_that.readingTimeMinutes,_that.tags,_that.publishedAt,_that.isRead,_that.isFavorited,_that.category,_that.authorName,_that.thumbnailUrl,_that.imageUrls,_that.readAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String summary,  String content,  EducationType type,  String? imageUrl,  String? videoUrl,  int readingTimeMinutes,  List<String> tags, @JsonKey(name: 'published_at')  DateTime publishedAt,  bool isRead,  bool isFavorited,  String? category,  String? authorName,  String? thumbnailUrl,  List<String> imageUrls,  DateTime? readAt)?  $default,) {final _that = this;
switch (_that) {
case _HealthEducationItem() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.content,_that.type,_that.imageUrl,_that.videoUrl,_that.readingTimeMinutes,_that.tags,_that.publishedAt,_that.isRead,_that.isFavorited,_that.category,_that.authorName,_that.thumbnailUrl,_that.imageUrls,_that.readAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthEducationItem implements HealthEducationItem {
  const _HealthEducationItem({required this.id, required this.title, required this.summary, required this.content, required this.type, this.imageUrl, this.videoUrl, required this.readingTimeMinutes, final  List<String> tags = const [], @JsonKey(name: 'published_at') required this.publishedAt, this.isRead = false, this.isFavorited = false, this.category, this.authorName, this.thumbnailUrl, final  List<String> imageUrls = const [], this.readAt}): _tags = tags,_imageUrls = imageUrls;
  factory _HealthEducationItem.fromJson(Map<String, dynamic> json) => _$HealthEducationItemFromJson(json);

@override final  String id;
@override final  String title;
@override final  String summary;
@override final  String content;
@override final  EducationType type;
@override final  String? imageUrl;
@override final  String? videoUrl;
@override final  int readingTimeMinutes;
// 预计阅读时间（分钟）
 final  List<String> _tags;
// 预计阅读时间（分钟）
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey(name: 'published_at') final  DateTime publishedAt;
@override@JsonKey() final  bool isRead;
@override@JsonKey() final  bool isFavorited;
@override final  String? category;
@override final  String? authorName;
@override final  String? thumbnailUrl;
 final  List<String> _imageUrls;
@override@JsonKey() List<String> get imageUrls {
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageUrls);
}

@override final  DateTime? readAt;

/// Create a copy of HealthEducationItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthEducationItemCopyWith<_HealthEducationItem> get copyWith => __$HealthEducationItemCopyWithImpl<_HealthEducationItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthEducationItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthEducationItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.readingTimeMinutes, readingTimeMinutes) || other.readingTimeMinutes == readingTimeMinutes)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited)&&(identical(other.category, category) || other.category == category)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,content,type,imageUrl,videoUrl,readingTimeMinutes,const DeepCollectionEquality().hash(_tags),publishedAt,isRead,isFavorited,category,authorName,thumbnailUrl,const DeepCollectionEquality().hash(_imageUrls),readAt);

@override
String toString() {
  return 'HealthEducationItem(id: $id, title: $title, summary: $summary, content: $content, type: $type, imageUrl: $imageUrl, videoUrl: $videoUrl, readingTimeMinutes: $readingTimeMinutes, tags: $tags, publishedAt: $publishedAt, isRead: $isRead, isFavorited: $isFavorited, category: $category, authorName: $authorName, thumbnailUrl: $thumbnailUrl, imageUrls: $imageUrls, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class _$HealthEducationItemCopyWith<$Res> implements $HealthEducationItemCopyWith<$Res> {
  factory _$HealthEducationItemCopyWith(_HealthEducationItem value, $Res Function(_HealthEducationItem) _then) = __$HealthEducationItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String summary, String content, EducationType type, String? imageUrl, String? videoUrl, int readingTimeMinutes, List<String> tags,@JsonKey(name: 'published_at') DateTime publishedAt, bool isRead, bool isFavorited, String? category, String? authorName, String? thumbnailUrl, List<String> imageUrls, DateTime? readAt
});




}
/// @nodoc
class __$HealthEducationItemCopyWithImpl<$Res>
    implements _$HealthEducationItemCopyWith<$Res> {
  __$HealthEducationItemCopyWithImpl(this._self, this._then);

  final _HealthEducationItem _self;
  final $Res Function(_HealthEducationItem) _then;

/// Create a copy of HealthEducationItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? content = null,Object? type = null,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? readingTimeMinutes = null,Object? tags = null,Object? publishedAt = null,Object? isRead = null,Object? isFavorited = null,Object? category = freezed,Object? authorName = freezed,Object? thumbnailUrl = freezed,Object? imageUrls = null,Object? readAt = freezed,}) {
  return _then(_HealthEducationItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EducationType,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,readingTimeMinutes: null == readingTimeMinutes ? _self.readingTimeMinutes : readingTimeMinutes // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrls: null == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$DashboardState {

 HealthDataOverview? get healthData; List<RecoveryGoal> get recoveryGoals; List<HealthEducationItem> get educationItems; HealthScore? get healthScore; DateTime? get lastUpdated; bool get isRefreshing; String? get error;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&(identical(other.healthData, healthData) || other.healthData == healthData)&&const DeepCollectionEquality().equals(other.recoveryGoals, recoveryGoals)&&const DeepCollectionEquality().equals(other.educationItems, educationItems)&&(identical(other.healthScore, healthScore) || other.healthScore == healthScore)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,healthData,const DeepCollectionEquality().hash(recoveryGoals),const DeepCollectionEquality().hash(educationItems),healthScore,lastUpdated,isRefreshing,error);

@override
String toString() {
  return 'DashboardState(healthData: $healthData, recoveryGoals: $recoveryGoals, educationItems: $educationItems, healthScore: $healthScore, lastUpdated: $lastUpdated, isRefreshing: $isRefreshing, error: $error)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 HealthDataOverview? healthData, List<RecoveryGoal> recoveryGoals, List<HealthEducationItem> educationItems, HealthScore? healthScore, DateTime? lastUpdated, bool isRefreshing, String? error
});


$HealthDataOverviewCopyWith<$Res>? get healthData;$HealthScoreCopyWith<$Res>? get healthScore;

}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? healthData = freezed,Object? recoveryGoals = null,Object? educationItems = null,Object? healthScore = freezed,Object? lastUpdated = freezed,Object? isRefreshing = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
healthData: freezed == healthData ? _self.healthData : healthData // ignore: cast_nullable_to_non_nullable
as HealthDataOverview?,recoveryGoals: null == recoveryGoals ? _self.recoveryGoals : recoveryGoals // ignore: cast_nullable_to_non_nullable
as List<RecoveryGoal>,educationItems: null == educationItems ? _self.educationItems : educationItems // ignore: cast_nullable_to_non_nullable
as List<HealthEducationItem>,healthScore: freezed == healthScore ? _self.healthScore : healthScore // ignore: cast_nullable_to_non_nullable
as HealthScore?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthDataOverviewCopyWith<$Res>? get healthData {
    if (_self.healthData == null) {
    return null;
  }

  return $HealthDataOverviewCopyWith<$Res>(_self.healthData!, (value) {
    return _then(_self.copyWith(healthData: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthScoreCopyWith<$Res>? get healthScore {
    if (_self.healthScore == null) {
    return null;
  }

  return $HealthScoreCopyWith<$Res>(_self.healthScore!, (value) {
    return _then(_self.copyWith(healthScore: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardState value)  $default,){
final _that = this;
switch (_that) {
case _DashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HealthDataOverview? healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems,  HealthScore? healthScore,  DateTime? lastUpdated,  bool isRefreshing,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.healthScore,_that.lastUpdated,_that.isRefreshing,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HealthDataOverview? healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems,  HealthScore? healthScore,  DateTime? lastUpdated,  bool isRefreshing,  String? error)  $default,) {final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.healthScore,_that.lastUpdated,_that.isRefreshing,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HealthDataOverview? healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems,  HealthScore? healthScore,  DateTime? lastUpdated,  bool isRefreshing,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.healthScore,_that.lastUpdated,_that.isRefreshing,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardState extends DashboardState {
  const _DashboardState({this.healthData, final  List<RecoveryGoal> recoveryGoals = const [], final  List<HealthEducationItem> educationItems = const [], this.healthScore, this.lastUpdated, this.isRefreshing = false, this.error}): _recoveryGoals = recoveryGoals,_educationItems = educationItems,super._();
  

@override final  HealthDataOverview? healthData;
 final  List<RecoveryGoal> _recoveryGoals;
@override@JsonKey() List<RecoveryGoal> get recoveryGoals {
  if (_recoveryGoals is EqualUnmodifiableListView) return _recoveryGoals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recoveryGoals);
}

 final  List<HealthEducationItem> _educationItems;
@override@JsonKey() List<HealthEducationItem> get educationItems {
  if (_educationItems is EqualUnmodifiableListView) return _educationItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_educationItems);
}

@override final  HealthScore? healthScore;
@override final  DateTime? lastUpdated;
@override@JsonKey() final  bool isRefreshing;
@override final  String? error;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&(identical(other.healthData, healthData) || other.healthData == healthData)&&const DeepCollectionEquality().equals(other._recoveryGoals, _recoveryGoals)&&const DeepCollectionEquality().equals(other._educationItems, _educationItems)&&(identical(other.healthScore, healthScore) || other.healthScore == healthScore)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,healthData,const DeepCollectionEquality().hash(_recoveryGoals),const DeepCollectionEquality().hash(_educationItems),healthScore,lastUpdated,isRefreshing,error);

@override
String toString() {
  return 'DashboardState(healthData: $healthData, recoveryGoals: $recoveryGoals, educationItems: $educationItems, healthScore: $healthScore, lastUpdated: $lastUpdated, isRefreshing: $isRefreshing, error: $error)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 HealthDataOverview? healthData, List<RecoveryGoal> recoveryGoals, List<HealthEducationItem> educationItems, HealthScore? healthScore, DateTime? lastUpdated, bool isRefreshing, String? error
});


@override $HealthDataOverviewCopyWith<$Res>? get healthData;@override $HealthScoreCopyWith<$Res>? get healthScore;

}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? healthData = freezed,Object? recoveryGoals = null,Object? educationItems = null,Object? healthScore = freezed,Object? lastUpdated = freezed,Object? isRefreshing = null,Object? error = freezed,}) {
  return _then(_DashboardState(
healthData: freezed == healthData ? _self.healthData : healthData // ignore: cast_nullable_to_non_nullable
as HealthDataOverview?,recoveryGoals: null == recoveryGoals ? _self._recoveryGoals : recoveryGoals // ignore: cast_nullable_to_non_nullable
as List<RecoveryGoal>,educationItems: null == educationItems ? _self._educationItems : educationItems // ignore: cast_nullable_to_non_nullable
as List<HealthEducationItem>,healthScore: freezed == healthScore ? _self.healthScore : healthScore // ignore: cast_nullable_to_non_nullable
as HealthScore?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthDataOverviewCopyWith<$Res>? get healthData {
    if (_self.healthData == null) {
    return null;
  }

  return $HealthDataOverviewCopyWith<$Res>(_self.healthData!, (value) {
    return _then(_self.copyWith(healthData: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthScoreCopyWith<$Res>? get healthScore {
    if (_self.healthScore == null) {
    return null;
  }

  return $HealthScoreCopyWith<$Res>(_self.healthScore!, (value) {
    return _then(_self.copyWith(healthScore: value));
  });
}
}


/// @nodoc
mixin _$DashboardResponse {

 HealthDataOverview get healthData; List<RecoveryGoal> get recoveryGoals; List<HealthEducationItem> get educationItems;@JsonKey(name: 'last_updated') DateTime? get lastUpdated; HealthScore? get healthScore;
/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardResponseCopyWith<DashboardResponse> get copyWith => _$DashboardResponseCopyWithImpl<DashboardResponse>(this as DashboardResponse, _$identity);

  /// Serializes this DashboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardResponse&&(identical(other.healthData, healthData) || other.healthData == healthData)&&const DeepCollectionEquality().equals(other.recoveryGoals, recoveryGoals)&&const DeepCollectionEquality().equals(other.educationItems, educationItems)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.healthScore, healthScore) || other.healthScore == healthScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,healthData,const DeepCollectionEquality().hash(recoveryGoals),const DeepCollectionEquality().hash(educationItems),lastUpdated,healthScore);

@override
String toString() {
  return 'DashboardResponse(healthData: $healthData, recoveryGoals: $recoveryGoals, educationItems: $educationItems, lastUpdated: $lastUpdated, healthScore: $healthScore)';
}


}

/// @nodoc
abstract mixin class $DashboardResponseCopyWith<$Res>  {
  factory $DashboardResponseCopyWith(DashboardResponse value, $Res Function(DashboardResponse) _then) = _$DashboardResponseCopyWithImpl;
@useResult
$Res call({
 HealthDataOverview healthData, List<RecoveryGoal> recoveryGoals, List<HealthEducationItem> educationItems,@JsonKey(name: 'last_updated') DateTime? lastUpdated, HealthScore? healthScore
});


$HealthDataOverviewCopyWith<$Res> get healthData;$HealthScoreCopyWith<$Res>? get healthScore;

}
/// @nodoc
class _$DashboardResponseCopyWithImpl<$Res>
    implements $DashboardResponseCopyWith<$Res> {
  _$DashboardResponseCopyWithImpl(this._self, this._then);

  final DashboardResponse _self;
  final $Res Function(DashboardResponse) _then;

/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? healthData = null,Object? recoveryGoals = null,Object? educationItems = null,Object? lastUpdated = freezed,Object? healthScore = freezed,}) {
  return _then(_self.copyWith(
healthData: null == healthData ? _self.healthData : healthData // ignore: cast_nullable_to_non_nullable
as HealthDataOverview,recoveryGoals: null == recoveryGoals ? _self.recoveryGoals : recoveryGoals // ignore: cast_nullable_to_non_nullable
as List<RecoveryGoal>,educationItems: null == educationItems ? _self.educationItems : educationItems // ignore: cast_nullable_to_non_nullable
as List<HealthEducationItem>,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,healthScore: freezed == healthScore ? _self.healthScore : healthScore // ignore: cast_nullable_to_non_nullable
as HealthScore?,
  ));
}
/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthDataOverviewCopyWith<$Res> get healthData {
  
  return $HealthDataOverviewCopyWith<$Res>(_self.healthData, (value) {
    return _then(_self.copyWith(healthData: value));
  });
}/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthScoreCopyWith<$Res>? get healthScore {
    if (_self.healthScore == null) {
    return null;
  }

  return $HealthScoreCopyWith<$Res>(_self.healthScore!, (value) {
    return _then(_self.copyWith(healthScore: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardResponse].
extension DashboardResponsePatterns on DashboardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardResponse value)  $default,){
final _that = this;
switch (_that) {
case _DashboardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HealthDataOverview healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems, @JsonKey(name: 'last_updated')  DateTime? lastUpdated,  HealthScore? healthScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardResponse() when $default != null:
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.lastUpdated,_that.healthScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HealthDataOverview healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems, @JsonKey(name: 'last_updated')  DateTime? lastUpdated,  HealthScore? healthScore)  $default,) {final _that = this;
switch (_that) {
case _DashboardResponse():
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.lastUpdated,_that.healthScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HealthDataOverview healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems, @JsonKey(name: 'last_updated')  DateTime? lastUpdated,  HealthScore? healthScore)?  $default,) {final _that = this;
switch (_that) {
case _DashboardResponse() when $default != null:
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.lastUpdated,_that.healthScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardResponse implements DashboardResponse {
  const _DashboardResponse({required this.healthData, required final  List<RecoveryGoal> recoveryGoals, required final  List<HealthEducationItem> educationItems, @JsonKey(name: 'last_updated') this.lastUpdated, this.healthScore}): _recoveryGoals = recoveryGoals,_educationItems = educationItems;
  factory _DashboardResponse.fromJson(Map<String, dynamic> json) => _$DashboardResponseFromJson(json);

@override final  HealthDataOverview healthData;
 final  List<RecoveryGoal> _recoveryGoals;
@override List<RecoveryGoal> get recoveryGoals {
  if (_recoveryGoals is EqualUnmodifiableListView) return _recoveryGoals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recoveryGoals);
}

 final  List<HealthEducationItem> _educationItems;
@override List<HealthEducationItem> get educationItems {
  if (_educationItems is EqualUnmodifiableListView) return _educationItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_educationItems);
}

@override@JsonKey(name: 'last_updated') final  DateTime? lastUpdated;
@override final  HealthScore? healthScore;

/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardResponseCopyWith<_DashboardResponse> get copyWith => __$DashboardResponseCopyWithImpl<_DashboardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardResponse&&(identical(other.healthData, healthData) || other.healthData == healthData)&&const DeepCollectionEquality().equals(other._recoveryGoals, _recoveryGoals)&&const DeepCollectionEquality().equals(other._educationItems, _educationItems)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.healthScore, healthScore) || other.healthScore == healthScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,healthData,const DeepCollectionEquality().hash(_recoveryGoals),const DeepCollectionEquality().hash(_educationItems),lastUpdated,healthScore);

@override
String toString() {
  return 'DashboardResponse(healthData: $healthData, recoveryGoals: $recoveryGoals, educationItems: $educationItems, lastUpdated: $lastUpdated, healthScore: $healthScore)';
}


}

/// @nodoc
abstract mixin class _$DashboardResponseCopyWith<$Res> implements $DashboardResponseCopyWith<$Res> {
  factory _$DashboardResponseCopyWith(_DashboardResponse value, $Res Function(_DashboardResponse) _then) = __$DashboardResponseCopyWithImpl;
@override @useResult
$Res call({
 HealthDataOverview healthData, List<RecoveryGoal> recoveryGoals, List<HealthEducationItem> educationItems,@JsonKey(name: 'last_updated') DateTime? lastUpdated, HealthScore? healthScore
});


@override $HealthDataOverviewCopyWith<$Res> get healthData;@override $HealthScoreCopyWith<$Res>? get healthScore;

}
/// @nodoc
class __$DashboardResponseCopyWithImpl<$Res>
    implements _$DashboardResponseCopyWith<$Res> {
  __$DashboardResponseCopyWithImpl(this._self, this._then);

  final _DashboardResponse _self;
  final $Res Function(_DashboardResponse) _then;

/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? healthData = null,Object? recoveryGoals = null,Object? educationItems = null,Object? lastUpdated = freezed,Object? healthScore = freezed,}) {
  return _then(_DashboardResponse(
healthData: null == healthData ? _self.healthData : healthData // ignore: cast_nullable_to_non_nullable
as HealthDataOverview,recoveryGoals: null == recoveryGoals ? _self._recoveryGoals : recoveryGoals // ignore: cast_nullable_to_non_nullable
as List<RecoveryGoal>,educationItems: null == educationItems ? _self._educationItems : educationItems // ignore: cast_nullable_to_non_nullable
as List<HealthEducationItem>,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,healthScore: freezed == healthScore ? _self.healthScore : healthScore // ignore: cast_nullable_to_non_nullable
as HealthScore?,
  ));
}

/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthDataOverviewCopyWith<$Res> get healthData {
  
  return $HealthDataOverviewCopyWith<$Res>(_self.healthData, (value) {
    return _then(_self.copyWith(healthData: value));
  });
}/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthScoreCopyWith<$Res>? get healthScore {
    if (_self.healthScore == null) {
    return null;
  }

  return $HealthScoreCopyWith<$Res>(_self.healthScore!, (value) {
    return _then(_self.copyWith(healthScore: value));
  });
}
}


/// @nodoc
mixin _$UpdateEducationStatusRequest {

 String get itemId; bool get isRead; bool? get isFavorited;
/// Create a copy of UpdateEducationStatusRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateEducationStatusRequestCopyWith<UpdateEducationStatusRequest> get copyWith => _$UpdateEducationStatusRequestCopyWithImpl<UpdateEducationStatusRequest>(this as UpdateEducationStatusRequest, _$identity);

  /// Serializes this UpdateEducationStatusRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateEducationStatusRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,isRead,isFavorited);

@override
String toString() {
  return 'UpdateEducationStatusRequest(itemId: $itemId, isRead: $isRead, isFavorited: $isFavorited)';
}


}

/// @nodoc
abstract mixin class $UpdateEducationStatusRequestCopyWith<$Res>  {
  factory $UpdateEducationStatusRequestCopyWith(UpdateEducationStatusRequest value, $Res Function(UpdateEducationStatusRequest) _then) = _$UpdateEducationStatusRequestCopyWithImpl;
@useResult
$Res call({
 String itemId, bool isRead, bool? isFavorited
});




}
/// @nodoc
class _$UpdateEducationStatusRequestCopyWithImpl<$Res>
    implements $UpdateEducationStatusRequestCopyWith<$Res> {
  _$UpdateEducationStatusRequestCopyWithImpl(this._self, this._then);

  final UpdateEducationStatusRequest _self;
  final $Res Function(UpdateEducationStatusRequest) _then;

/// Create a copy of UpdateEducationStatusRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? isRead = null,Object? isFavorited = freezed,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isFavorited: freezed == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateEducationStatusRequest].
extension UpdateEducationStatusRequestPatterns on UpdateEducationStatusRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateEducationStatusRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateEducationStatusRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateEducationStatusRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateEducationStatusRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateEducationStatusRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateEducationStatusRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  bool isRead,  bool? isFavorited)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateEducationStatusRequest() when $default != null:
return $default(_that.itemId,_that.isRead,_that.isFavorited);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  bool isRead,  bool? isFavorited)  $default,) {final _that = this;
switch (_that) {
case _UpdateEducationStatusRequest():
return $default(_that.itemId,_that.isRead,_that.isFavorited);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  bool isRead,  bool? isFavorited)?  $default,) {final _that = this;
switch (_that) {
case _UpdateEducationStatusRequest() when $default != null:
return $default(_that.itemId,_that.isRead,_that.isFavorited);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateEducationStatusRequest implements UpdateEducationStatusRequest {
  const _UpdateEducationStatusRequest({required this.itemId, required this.isRead, this.isFavorited});
  factory _UpdateEducationStatusRequest.fromJson(Map<String, dynamic> json) => _$UpdateEducationStatusRequestFromJson(json);

@override final  String itemId;
@override final  bool isRead;
@override final  bool? isFavorited;

/// Create a copy of UpdateEducationStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateEducationStatusRequestCopyWith<_UpdateEducationStatusRequest> get copyWith => __$UpdateEducationStatusRequestCopyWithImpl<_UpdateEducationStatusRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateEducationStatusRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateEducationStatusRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,isRead,isFavorited);

@override
String toString() {
  return 'UpdateEducationStatusRequest(itemId: $itemId, isRead: $isRead, isFavorited: $isFavorited)';
}


}

/// @nodoc
abstract mixin class _$UpdateEducationStatusRequestCopyWith<$Res> implements $UpdateEducationStatusRequestCopyWith<$Res> {
  factory _$UpdateEducationStatusRequestCopyWith(_UpdateEducationStatusRequest value, $Res Function(_UpdateEducationStatusRequest) _then) = __$UpdateEducationStatusRequestCopyWithImpl;
@override @useResult
$Res call({
 String itemId, bool isRead, bool? isFavorited
});




}
/// @nodoc
class __$UpdateEducationStatusRequestCopyWithImpl<$Res>
    implements _$UpdateEducationStatusRequestCopyWith<$Res> {
  __$UpdateEducationStatusRequestCopyWithImpl(this._self, this._then);

  final _UpdateEducationStatusRequest _self;
  final $Res Function(_UpdateEducationStatusRequest) _then;

/// Create a copy of UpdateEducationStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? isRead = null,Object? isFavorited = freezed,}) {
  return _then(_UpdateEducationStatusRequest(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isFavorited: freezed == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$HealthScore {

 int get totalScore; Map<String, int> get categoryScores; String get level; String get description; List<String> get recommendations;@JsonKey(name: 'calculated_at') DateTime? get calculatedAt;
/// Create a copy of HealthScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthScoreCopyWith<HealthScore> get copyWith => _$HealthScoreCopyWithImpl<HealthScore>(this as HealthScore, _$identity);

  /// Serializes this HealthScore to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthScore&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&const DeepCollectionEquality().equals(other.categoryScores, categoryScores)&&(identical(other.level, level) || other.level == level)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.recommendations, recommendations)&&(identical(other.calculatedAt, calculatedAt) || other.calculatedAt == calculatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalScore,const DeepCollectionEquality().hash(categoryScores),level,description,const DeepCollectionEquality().hash(recommendations),calculatedAt);

@override
String toString() {
  return 'HealthScore(totalScore: $totalScore, categoryScores: $categoryScores, level: $level, description: $description, recommendations: $recommendations, calculatedAt: $calculatedAt)';
}


}

/// @nodoc
abstract mixin class $HealthScoreCopyWith<$Res>  {
  factory $HealthScoreCopyWith(HealthScore value, $Res Function(HealthScore) _then) = _$HealthScoreCopyWithImpl;
@useResult
$Res call({
 int totalScore, Map<String, int> categoryScores, String level, String description, List<String> recommendations,@JsonKey(name: 'calculated_at') DateTime? calculatedAt
});




}
/// @nodoc
class _$HealthScoreCopyWithImpl<$Res>
    implements $HealthScoreCopyWith<$Res> {
  _$HealthScoreCopyWithImpl(this._self, this._then);

  final HealthScore _self;
  final $Res Function(HealthScore) _then;

/// Create a copy of HealthScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalScore = null,Object? categoryScores = null,Object? level = null,Object? description = null,Object? recommendations = null,Object? calculatedAt = freezed,}) {
  return _then(_self.copyWith(
totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,categoryScores: null == categoryScores ? _self.categoryScores : categoryScores // ignore: cast_nullable_to_non_nullable
as Map<String, int>,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<String>,calculatedAt: freezed == calculatedAt ? _self.calculatedAt : calculatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthScore].
extension HealthScorePatterns on HealthScore {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthScore value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthScore() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthScore value)  $default,){
final _that = this;
switch (_that) {
case _HealthScore():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthScore value)?  $default,){
final _that = this;
switch (_that) {
case _HealthScore() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalScore,  Map<String, int> categoryScores,  String level,  String description,  List<String> recommendations, @JsonKey(name: 'calculated_at')  DateTime? calculatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthScore() when $default != null:
return $default(_that.totalScore,_that.categoryScores,_that.level,_that.description,_that.recommendations,_that.calculatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalScore,  Map<String, int> categoryScores,  String level,  String description,  List<String> recommendations, @JsonKey(name: 'calculated_at')  DateTime? calculatedAt)  $default,) {final _that = this;
switch (_that) {
case _HealthScore():
return $default(_that.totalScore,_that.categoryScores,_that.level,_that.description,_that.recommendations,_that.calculatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalScore,  Map<String, int> categoryScores,  String level,  String description,  List<String> recommendations, @JsonKey(name: 'calculated_at')  DateTime? calculatedAt)?  $default,) {final _that = this;
switch (_that) {
case _HealthScore() when $default != null:
return $default(_that.totalScore,_that.categoryScores,_that.level,_that.description,_that.recommendations,_that.calculatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthScore implements HealthScore {
  const _HealthScore({required this.totalScore, required final  Map<String, int> categoryScores, required this.level, required this.description, required final  List<String> recommendations, @JsonKey(name: 'calculated_at') this.calculatedAt}): _categoryScores = categoryScores,_recommendations = recommendations;
  factory _HealthScore.fromJson(Map<String, dynamic> json) => _$HealthScoreFromJson(json);

@override final  int totalScore;
 final  Map<String, int> _categoryScores;
@override Map<String, int> get categoryScores {
  if (_categoryScores is EqualUnmodifiableMapView) return _categoryScores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_categoryScores);
}

@override final  String level;
@override final  String description;
 final  List<String> _recommendations;
@override List<String> get recommendations {
  if (_recommendations is EqualUnmodifiableListView) return _recommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendations);
}

@override@JsonKey(name: 'calculated_at') final  DateTime? calculatedAt;

/// Create a copy of HealthScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthScoreCopyWith<_HealthScore> get copyWith => __$HealthScoreCopyWithImpl<_HealthScore>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthScoreToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthScore&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&const DeepCollectionEquality().equals(other._categoryScores, _categoryScores)&&(identical(other.level, level) || other.level == level)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._recommendations, _recommendations)&&(identical(other.calculatedAt, calculatedAt) || other.calculatedAt == calculatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalScore,const DeepCollectionEquality().hash(_categoryScores),level,description,const DeepCollectionEquality().hash(_recommendations),calculatedAt);

@override
String toString() {
  return 'HealthScore(totalScore: $totalScore, categoryScores: $categoryScores, level: $level, description: $description, recommendations: $recommendations, calculatedAt: $calculatedAt)';
}


}

/// @nodoc
abstract mixin class _$HealthScoreCopyWith<$Res> implements $HealthScoreCopyWith<$Res> {
  factory _$HealthScoreCopyWith(_HealthScore value, $Res Function(_HealthScore) _then) = __$HealthScoreCopyWithImpl;
@override @useResult
$Res call({
 int totalScore, Map<String, int> categoryScores, String level, String description, List<String> recommendations,@JsonKey(name: 'calculated_at') DateTime? calculatedAt
});




}
/// @nodoc
class __$HealthScoreCopyWithImpl<$Res>
    implements _$HealthScoreCopyWith<$Res> {
  __$HealthScoreCopyWithImpl(this._self, this._then);

  final _HealthScore _self;
  final $Res Function(_HealthScore) _then;

/// Create a copy of HealthScore
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalScore = null,Object? categoryScores = null,Object? level = null,Object? description = null,Object? recommendations = null,Object? calculatedAt = freezed,}) {
  return _then(_HealthScore(
totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,categoryScores: null == categoryScores ? _self._categoryScores : categoryScores // ignore: cast_nullable_to_non_nullable
as Map<String, int>,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,recommendations: null == recommendations ? _self._recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<String>,calculatedAt: freezed == calculatedAt ? _self.calculatedAt : calculatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
