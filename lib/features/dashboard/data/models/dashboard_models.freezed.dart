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
 DateTime get recordedAt; double? get bmi; BMICategory? get bmiCategory; String? get trend;
/// Create a copy of WeightSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeightSummaryCopyWith<WeightSummary> get copyWith => _$WeightSummaryCopyWithImpl<WeightSummary>(this as WeightSummary, _$identity);

  /// Serializes this WeightSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeightSummary&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.bmiCategory, bmiCategory) || other.bmiCategory == bmiCategory)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weight,recordedAt,bmi,bmiCategory,trend);

@override
String toString() {
  return 'WeightSummary(weight: $weight, recordedAt: $recordedAt, bmi: $bmi, bmiCategory: $bmiCategory, trend: $trend)';
}


}

/// @nodoc
abstract mixin class $WeightSummaryCopyWith<$Res>  {
  factory $WeightSummaryCopyWith(WeightSummary value, $Res Function(WeightSummary) _then) = _$WeightSummaryCopyWithImpl;
@useResult
$Res call({
 double weight, DateTime recordedAt, double? bmi, BMICategory? bmiCategory, String? trend
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
@pragma('vm:prefer-inline') @override $Res call({Object? weight = null,Object? recordedAt = null,Object? bmi = freezed,Object? bmiCategory = freezed,Object? trend = freezed,}) {
  return _then(_self.copyWith(
weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,bmiCategory: freezed == bmiCategory ? _self.bmiCategory : bmiCategory // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double weight,  DateTime recordedAt,  double? bmi,  BMICategory? bmiCategory,  String? trend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeightSummary() when $default != null:
return $default(_that.weight,_that.recordedAt,_that.bmi,_that.bmiCategory,_that.trend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double weight,  DateTime recordedAt,  double? bmi,  BMICategory? bmiCategory,  String? trend)  $default,) {final _that = this;
switch (_that) {
case _WeightSummary():
return $default(_that.weight,_that.recordedAt,_that.bmi,_that.bmiCategory,_that.trend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double weight,  DateTime recordedAt,  double? bmi,  BMICategory? bmiCategory,  String? trend)?  $default,) {final _that = this;
switch (_that) {
case _WeightSummary() when $default != null:
return $default(_that.weight,_that.recordedAt,_that.bmi,_that.bmiCategory,_that.trend);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeightSummary implements WeightSummary {
  const _WeightSummary({required this.weight, required this.recordedAt, this.bmi, this.bmiCategory, this.trend});
  factory _WeightSummary.fromJson(Map<String, dynamic> json) => _$WeightSummaryFromJson(json);

@override final  double weight;
// 单位：kg
@override final  DateTime recordedAt;
@override final  double? bmi;
@override final  BMICategory? bmiCategory;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeightSummary&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.bmiCategory, bmiCategory) || other.bmiCategory == bmiCategory)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weight,recordedAt,bmi,bmiCategory,trend);

@override
String toString() {
  return 'WeightSummary(weight: $weight, recordedAt: $recordedAt, bmi: $bmi, bmiCategory: $bmiCategory, trend: $trend)';
}


}

/// @nodoc
abstract mixin class _$WeightSummaryCopyWith<$Res> implements $WeightSummaryCopyWith<$Res> {
  factory _$WeightSummaryCopyWith(_WeightSummary value, $Res Function(_WeightSummary) _then) = __$WeightSummaryCopyWithImpl;
@override @useResult
$Res call({
 double weight, DateTime recordedAt, double? bmi, BMICategory? bmiCategory, String? trend
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
@override @pragma('vm:prefer-inline') $Res call({Object? weight = null,Object? recordedAt = null,Object? bmi = freezed,Object? bmiCategory = freezed,Object? trend = freezed,}) {
  return _then(_WeightSummary(
weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,bmi: freezed == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double?,bmiCategory: freezed == bmiCategory ? _self.bmiCategory : bmiCategory // ignore: cast_nullable_to_non_nullable
as BMICategory?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StepsSummary {

 int get steps; DateTime get date; int? get goal; double? get calories; double? get distance;
/// Create a copy of StepsSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepsSummaryCopyWith<StepsSummary> get copyWith => _$StepsSummaryCopyWithImpl<StepsSummary>(this as StepsSummary, _$identity);

  /// Serializes this StepsSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepsSummary&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.date, date) || other.date == date)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,steps,date,goal,calories,distance);

@override
String toString() {
  return 'StepsSummary(steps: $steps, date: $date, goal: $goal, calories: $calories, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $StepsSummaryCopyWith<$Res>  {
  factory $StepsSummaryCopyWith(StepsSummary value, $Res Function(StepsSummary) _then) = _$StepsSummaryCopyWithImpl;
@useResult
$Res call({
 int steps, DateTime date, int? goal, double? calories, double? distance
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
@pragma('vm:prefer-inline') @override $Res call({Object? steps = null,Object? date = null,Object? goal = freezed,Object? calories = freezed,Object? distance = freezed,}) {
  return _then(_self.copyWith(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int steps,  DateTime date,  int? goal,  double? calories,  double? distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StepsSummary() when $default != null:
return $default(_that.steps,_that.date,_that.goal,_that.calories,_that.distance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int steps,  DateTime date,  int? goal,  double? calories,  double? distance)  $default,) {final _that = this;
switch (_that) {
case _StepsSummary():
return $default(_that.steps,_that.date,_that.goal,_that.calories,_that.distance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int steps,  DateTime date,  int? goal,  double? calories,  double? distance)?  $default,) {final _that = this;
switch (_that) {
case _StepsSummary() when $default != null:
return $default(_that.steps,_that.date,_that.goal,_that.calories,_that.distance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StepsSummary extends StepsSummary {
  const _StepsSummary({required this.steps, required this.date, this.goal, this.calories, this.distance}): super._();
  factory _StepsSummary.fromJson(Map<String, dynamic> json) => _$StepsSummaryFromJson(json);

@override final  int steps;
@override final  DateTime date;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepsSummary&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.date, date) || other.date == date)&&(identical(other.goal, goal) || other.goal == goal)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,steps,date,goal,calories,distance);

@override
String toString() {
  return 'StepsSummary(steps: $steps, date: $date, goal: $goal, calories: $calories, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$StepsSummaryCopyWith<$Res> implements $StepsSummaryCopyWith<$Res> {
  factory _$StepsSummaryCopyWith(_StepsSummary value, $Res Function(_StepsSummary) _then) = __$StepsSummaryCopyWithImpl;
@override @useResult
$Res call({
 int steps, DateTime date, int? goal, double? calories, double? distance
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
@override @pragma('vm:prefer-inline') $Res call({Object? steps = null,Object? date = null,Object? goal = freezed,Object? calories = freezed,Object? distance = freezed,}) {
  return _then(_StepsSummary(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as int?,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$RecoveryGoal {

 String get id; String get title; String get description; GoalType get type; double get targetValue; double get currentValue; String get unit;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate; GoalStatus get status;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of RecoveryGoal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecoveryGoalCopyWith<RecoveryGoal> get copyWith => _$RecoveryGoalCopyWithImpl<RecoveryGoal>(this as RecoveryGoal, _$identity);

  /// Serializes this RecoveryGoal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoveryGoal&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,type,targetValue,currentValue,unit,startDate,endDate,status,createdAt);

@override
String toString() {
  return 'RecoveryGoal(id: $id, title: $title, description: $description, type: $type, targetValue: $targetValue, currentValue: $currentValue, unit: $unit, startDate: $startDate, endDate: $endDate, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $RecoveryGoalCopyWith<$Res>  {
  factory $RecoveryGoalCopyWith(RecoveryGoal value, $Res Function(RecoveryGoal) _then) = _$RecoveryGoalCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, GoalType type, double targetValue, double currentValue, String unit,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate, GoalStatus status,@JsonKey(name: 'created_at') DateTime? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? type = null,Object? targetValue = null,Object? currentValue = null,Object? unit = null,Object? startDate = null,Object? endDate = null,Object? status = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GoalType,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  GoalType type,  double targetValue,  double currentValue,  String unit, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate,  GoalStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecoveryGoal() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.type,_that.targetValue,_that.currentValue,_that.unit,_that.startDate,_that.endDate,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  GoalType type,  double targetValue,  double currentValue,  String unit, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate,  GoalStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _RecoveryGoal():
return $default(_that.id,_that.title,_that.description,_that.type,_that.targetValue,_that.currentValue,_that.unit,_that.startDate,_that.endDate,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  GoalType type,  double targetValue,  double currentValue,  String unit, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate,  GoalStatus status, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _RecoveryGoal() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.type,_that.targetValue,_that.currentValue,_that.unit,_that.startDate,_that.endDate,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecoveryGoal extends RecoveryGoal {
  const _RecoveryGoal({required this.id, required this.title, required this.description, required this.type, required this.targetValue, required this.currentValue, required this.unit, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, this.status = GoalStatus.active, @JsonKey(name: 'created_at') this.createdAt}): super._();
  factory _RecoveryGoal.fromJson(Map<String, dynamic> json) => _$RecoveryGoalFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  GoalType type;
@override final  double targetValue;
@override final  double currentValue;
@override final  String unit;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime endDate;
@override@JsonKey() final  GoalStatus status;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecoveryGoal&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,type,targetValue,currentValue,unit,startDate,endDate,status,createdAt);

@override
String toString() {
  return 'RecoveryGoal(id: $id, title: $title, description: $description, type: $type, targetValue: $targetValue, currentValue: $currentValue, unit: $unit, startDate: $startDate, endDate: $endDate, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RecoveryGoalCopyWith<$Res> implements $RecoveryGoalCopyWith<$Res> {
  factory _$RecoveryGoalCopyWith(_RecoveryGoal value, $Res Function(_RecoveryGoal) _then) = __$RecoveryGoalCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, GoalType type, double targetValue, double currentValue, String unit,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate, GoalStatus status,@JsonKey(name: 'created_at') DateTime? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? type = null,Object? targetValue = null,Object? currentValue = null,Object? unit = null,Object? startDate = null,Object? endDate = null,Object? status = null,Object? createdAt = freezed,}) {
  return _then(_RecoveryGoal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GoalType,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as GoalStatus,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$HealthEducationItem {

 String get id; String get title; String get summary; String get content; EducationType get type; String? get imageUrl; String? get videoUrl; int get readingTime;// 预计阅读时间（分钟）
 List<String> get tags;@JsonKey(name: 'published_at') DateTime get publishedAt; bool get isRead; bool get isFavorited;
/// Create a copy of HealthEducationItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthEducationItemCopyWith<HealthEducationItem> get copyWith => _$HealthEducationItemCopyWithImpl<HealthEducationItem>(this as HealthEducationItem, _$identity);

  /// Serializes this HealthEducationItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthEducationItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.readingTime, readingTime) || other.readingTime == readingTime)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,content,type,imageUrl,videoUrl,readingTime,const DeepCollectionEquality().hash(tags),publishedAt,isRead,isFavorited);

@override
String toString() {
  return 'HealthEducationItem(id: $id, title: $title, summary: $summary, content: $content, type: $type, imageUrl: $imageUrl, videoUrl: $videoUrl, readingTime: $readingTime, tags: $tags, publishedAt: $publishedAt, isRead: $isRead, isFavorited: $isFavorited)';
}


}

/// @nodoc
abstract mixin class $HealthEducationItemCopyWith<$Res>  {
  factory $HealthEducationItemCopyWith(HealthEducationItem value, $Res Function(HealthEducationItem) _then) = _$HealthEducationItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String summary, String content, EducationType type, String? imageUrl, String? videoUrl, int readingTime, List<String> tags,@JsonKey(name: 'published_at') DateTime publishedAt, bool isRead, bool isFavorited
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? content = null,Object? type = null,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? readingTime = null,Object? tags = null,Object? publishedAt = null,Object? isRead = null,Object? isFavorited = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EducationType,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,readingTime: null == readingTime ? _self.readingTime : readingTime // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  String content,  EducationType type,  String? imageUrl,  String? videoUrl,  int readingTime,  List<String> tags, @JsonKey(name: 'published_at')  DateTime publishedAt,  bool isRead,  bool isFavorited)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthEducationItem() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.content,_that.type,_that.imageUrl,_that.videoUrl,_that.readingTime,_that.tags,_that.publishedAt,_that.isRead,_that.isFavorited);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  String content,  EducationType type,  String? imageUrl,  String? videoUrl,  int readingTime,  List<String> tags, @JsonKey(name: 'published_at')  DateTime publishedAt,  bool isRead,  bool isFavorited)  $default,) {final _that = this;
switch (_that) {
case _HealthEducationItem():
return $default(_that.id,_that.title,_that.summary,_that.content,_that.type,_that.imageUrl,_that.videoUrl,_that.readingTime,_that.tags,_that.publishedAt,_that.isRead,_that.isFavorited);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String summary,  String content,  EducationType type,  String? imageUrl,  String? videoUrl,  int readingTime,  List<String> tags, @JsonKey(name: 'published_at')  DateTime publishedAt,  bool isRead,  bool isFavorited)?  $default,) {final _that = this;
switch (_that) {
case _HealthEducationItem() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.content,_that.type,_that.imageUrl,_that.videoUrl,_that.readingTime,_that.tags,_that.publishedAt,_that.isRead,_that.isFavorited);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthEducationItem implements HealthEducationItem {
  const _HealthEducationItem({required this.id, required this.title, required this.summary, required this.content, required this.type, this.imageUrl, this.videoUrl, required this.readingTime, final  List<String> tags = const [], @JsonKey(name: 'published_at') required this.publishedAt, this.isRead = false, this.isFavorited = false}): _tags = tags;
  factory _HealthEducationItem.fromJson(Map<String, dynamic> json) => _$HealthEducationItemFromJson(json);

@override final  String id;
@override final  String title;
@override final  String summary;
@override final  String content;
@override final  EducationType type;
@override final  String? imageUrl;
@override final  String? videoUrl;
@override final  int readingTime;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthEducationItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.readingTime, readingTime) || other.readingTime == readingTime)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,summary,content,type,imageUrl,videoUrl,readingTime,const DeepCollectionEquality().hash(_tags),publishedAt,isRead,isFavorited);

@override
String toString() {
  return 'HealthEducationItem(id: $id, title: $title, summary: $summary, content: $content, type: $type, imageUrl: $imageUrl, videoUrl: $videoUrl, readingTime: $readingTime, tags: $tags, publishedAt: $publishedAt, isRead: $isRead, isFavorited: $isFavorited)';
}


}

/// @nodoc
abstract mixin class _$HealthEducationItemCopyWith<$Res> implements $HealthEducationItemCopyWith<$Res> {
  factory _$HealthEducationItemCopyWith(_HealthEducationItem value, $Res Function(_HealthEducationItem) _then) = __$HealthEducationItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String summary, String content, EducationType type, String? imageUrl, String? videoUrl, int readingTime, List<String> tags,@JsonKey(name: 'published_at') DateTime publishedAt, bool isRead, bool isFavorited
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? content = null,Object? type = null,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? readingTime = null,Object? tags = null,Object? publishedAt = null,Object? isRead = null,Object? isFavorited = null,}) {
  return _then(_HealthEducationItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EducationType,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,readingTime: null == readingTime ? _self.readingTime : readingTime // ignore: cast_nullable_to_non_nullable
as int,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$DashboardState {

 HealthDataOverview? get healthData; List<RecoveryGoal> get recoveryGoals; List<HealthEducationItem> get educationItems; bool get isLoading; bool get isRefreshing; String? get error;@JsonKey(name: 'last_updated') DateTime? get lastUpdated;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&(identical(other.healthData, healthData) || other.healthData == healthData)&&const DeepCollectionEquality().equals(other.recoveryGoals, recoveryGoals)&&const DeepCollectionEquality().equals(other.educationItems, educationItems)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.error, error) || other.error == error)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}


@override
int get hashCode => Object.hash(runtimeType,healthData,const DeepCollectionEquality().hash(recoveryGoals),const DeepCollectionEquality().hash(educationItems),isLoading,isRefreshing,error,lastUpdated);

@override
String toString() {
  return 'DashboardState(healthData: $healthData, recoveryGoals: $recoveryGoals, educationItems: $educationItems, isLoading: $isLoading, isRefreshing: $isRefreshing, error: $error, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 HealthDataOverview? healthData, List<RecoveryGoal> recoveryGoals, List<HealthEducationItem> educationItems, bool isLoading, bool isRefreshing, String? error,@JsonKey(name: 'last_updated') DateTime? lastUpdated
});


$HealthDataOverviewCopyWith<$Res>? get healthData;

}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? healthData = freezed,Object? recoveryGoals = null,Object? educationItems = null,Object? isLoading = null,Object? isRefreshing = null,Object? error = freezed,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
healthData: freezed == healthData ? _self.healthData : healthData // ignore: cast_nullable_to_non_nullable
as HealthDataOverview?,recoveryGoals: null == recoveryGoals ? _self.recoveryGoals : recoveryGoals // ignore: cast_nullable_to_non_nullable
as List<RecoveryGoal>,educationItems: null == educationItems ? _self.educationItems : educationItems // ignore: cast_nullable_to_non_nullable
as List<HealthEducationItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HealthDataOverview? healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems,  bool isLoading,  bool isRefreshing,  String? error, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.isLoading,_that.isRefreshing,_that.error,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HealthDataOverview? healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems,  bool isLoading,  bool isRefreshing,  String? error, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.isLoading,_that.isRefreshing,_that.error,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HealthDataOverview? healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems,  bool isLoading,  bool isRefreshing,  String? error, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.isLoading,_that.isRefreshing,_that.error,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardState extends DashboardState {
  const _DashboardState({this.healthData, final  List<RecoveryGoal> recoveryGoals = const [], final  List<HealthEducationItem> educationItems = const [], this.isLoading = false, this.isRefreshing = false, this.error, @JsonKey(name: 'last_updated') this.lastUpdated}): _recoveryGoals = recoveryGoals,_educationItems = educationItems,super._();
  

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

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isRefreshing;
@override final  String? error;
@override@JsonKey(name: 'last_updated') final  DateTime? lastUpdated;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&(identical(other.healthData, healthData) || other.healthData == healthData)&&const DeepCollectionEquality().equals(other._recoveryGoals, _recoveryGoals)&&const DeepCollectionEquality().equals(other._educationItems, _educationItems)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.error, error) || other.error == error)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}


@override
int get hashCode => Object.hash(runtimeType,healthData,const DeepCollectionEquality().hash(_recoveryGoals),const DeepCollectionEquality().hash(_educationItems),isLoading,isRefreshing,error,lastUpdated);

@override
String toString() {
  return 'DashboardState(healthData: $healthData, recoveryGoals: $recoveryGoals, educationItems: $educationItems, isLoading: $isLoading, isRefreshing: $isRefreshing, error: $error, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 HealthDataOverview? healthData, List<RecoveryGoal> recoveryGoals, List<HealthEducationItem> educationItems, bool isLoading, bool isRefreshing, String? error,@JsonKey(name: 'last_updated') DateTime? lastUpdated
});


@override $HealthDataOverviewCopyWith<$Res>? get healthData;

}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? healthData = freezed,Object? recoveryGoals = null,Object? educationItems = null,Object? isLoading = null,Object? isRefreshing = null,Object? error = freezed,Object? lastUpdated = freezed,}) {
  return _then(_DashboardState(
healthData: freezed == healthData ? _self.healthData : healthData // ignore: cast_nullable_to_non_nullable
as HealthDataOverview?,recoveryGoals: null == recoveryGoals ? _self._recoveryGoals : recoveryGoals // ignore: cast_nullable_to_non_nullable
as List<RecoveryGoal>,educationItems: null == educationItems ? _self._educationItems : educationItems // ignore: cast_nullable_to_non_nullable
as List<HealthEducationItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
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
}
}


/// @nodoc
mixin _$DashboardResponse {

 HealthDataOverview get healthData; List<RecoveryGoal> get recoveryGoals; List<HealthEducationItem> get educationItems;@JsonKey(name: 'last_updated') DateTime? get lastUpdated;
/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardResponseCopyWith<DashboardResponse> get copyWith => _$DashboardResponseCopyWithImpl<DashboardResponse>(this as DashboardResponse, _$identity);

  /// Serializes this DashboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardResponse&&(identical(other.healthData, healthData) || other.healthData == healthData)&&const DeepCollectionEquality().equals(other.recoveryGoals, recoveryGoals)&&const DeepCollectionEquality().equals(other.educationItems, educationItems)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,healthData,const DeepCollectionEquality().hash(recoveryGoals),const DeepCollectionEquality().hash(educationItems),lastUpdated);

@override
String toString() {
  return 'DashboardResponse(healthData: $healthData, recoveryGoals: $recoveryGoals, educationItems: $educationItems, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $DashboardResponseCopyWith<$Res>  {
  factory $DashboardResponseCopyWith(DashboardResponse value, $Res Function(DashboardResponse) _then) = _$DashboardResponseCopyWithImpl;
@useResult
$Res call({
 HealthDataOverview healthData, List<RecoveryGoal> recoveryGoals, List<HealthEducationItem> educationItems,@JsonKey(name: 'last_updated') DateTime? lastUpdated
});


$HealthDataOverviewCopyWith<$Res> get healthData;

}
/// @nodoc
class _$DashboardResponseCopyWithImpl<$Res>
    implements $DashboardResponseCopyWith<$Res> {
  _$DashboardResponseCopyWithImpl(this._self, this._then);

  final DashboardResponse _self;
  final $Res Function(DashboardResponse) _then;

/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? healthData = null,Object? recoveryGoals = null,Object? educationItems = null,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
healthData: null == healthData ? _self.healthData : healthData // ignore: cast_nullable_to_non_nullable
as HealthDataOverview,recoveryGoals: null == recoveryGoals ? _self.recoveryGoals : recoveryGoals // ignore: cast_nullable_to_non_nullable
as List<RecoveryGoal>,educationItems: null == educationItems ? _self.educationItems : educationItems // ignore: cast_nullable_to_non_nullable
as List<HealthEducationItem>,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HealthDataOverview healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardResponse() when $default != null:
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HealthDataOverview healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _DashboardResponse():
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HealthDataOverview healthData,  List<RecoveryGoal> recoveryGoals,  List<HealthEducationItem> educationItems, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _DashboardResponse() when $default != null:
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardResponse implements DashboardResponse {
  const _DashboardResponse({required this.healthData, required final  List<RecoveryGoal> recoveryGoals, required final  List<HealthEducationItem> educationItems, @JsonKey(name: 'last_updated') this.lastUpdated}): _recoveryGoals = recoveryGoals,_educationItems = educationItems;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardResponse&&(identical(other.healthData, healthData) || other.healthData == healthData)&&const DeepCollectionEquality().equals(other._recoveryGoals, _recoveryGoals)&&const DeepCollectionEquality().equals(other._educationItems, _educationItems)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,healthData,const DeepCollectionEquality().hash(_recoveryGoals),const DeepCollectionEquality().hash(_educationItems),lastUpdated);

@override
String toString() {
  return 'DashboardResponse(healthData: $healthData, recoveryGoals: $recoveryGoals, educationItems: $educationItems, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$DashboardResponseCopyWith<$Res> implements $DashboardResponseCopyWith<$Res> {
  factory _$DashboardResponseCopyWith(_DashboardResponse value, $Res Function(_DashboardResponse) _then) = __$DashboardResponseCopyWithImpl;
@override @useResult
$Res call({
 HealthDataOverview healthData, List<RecoveryGoal> recoveryGoals, List<HealthEducationItem> educationItems,@JsonKey(name: 'last_updated') DateTime? lastUpdated
});


@override $HealthDataOverviewCopyWith<$Res> get healthData;

}
/// @nodoc
class __$DashboardResponseCopyWithImpl<$Res>
    implements _$DashboardResponseCopyWith<$Res> {
  __$DashboardResponseCopyWithImpl(this._self, this._then);

  final _DashboardResponse _self;
  final $Res Function(_DashboardResponse) _then;

/// Create a copy of DashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? healthData = null,Object? recoveryGoals = null,Object? educationItems = null,Object? lastUpdated = freezed,}) {
  return _then(_DashboardResponse(
healthData: null == healthData ? _self.healthData : healthData // ignore: cast_nullable_to_non_nullable
as HealthDataOverview,recoveryGoals: null == recoveryGoals ? _self._recoveryGoals : recoveryGoals // ignore: cast_nullable_to_non_nullable
as List<RecoveryGoal>,educationItems: null == educationItems ? _self._educationItems : educationItems // ignore: cast_nullable_to_non_nullable
as List<HealthEducationItem>,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

// dart format on
