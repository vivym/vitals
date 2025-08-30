// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardEntity {

 HealthDataOverviewEntity get healthData; List<RecoveryGoalEntity> get recoveryGoals; List<HealthEducationItemEntity> get educationItems; HealthScoreEntity? get healthScore; DateTime? get lastUpdated;
/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardEntityCopyWith<DashboardEntity> get copyWith => _$DashboardEntityCopyWithImpl<DashboardEntity>(this as DashboardEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardEntity&&(identical(other.healthData, healthData) || other.healthData == healthData)&&const DeepCollectionEquality().equals(other.recoveryGoals, recoveryGoals)&&const DeepCollectionEquality().equals(other.educationItems, educationItems)&&(identical(other.healthScore, healthScore) || other.healthScore == healthScore)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}


@override
int get hashCode => Object.hash(runtimeType,healthData,const DeepCollectionEquality().hash(recoveryGoals),const DeepCollectionEquality().hash(educationItems),healthScore,lastUpdated);

@override
String toString() {
  return 'DashboardEntity(healthData: $healthData, recoveryGoals: $recoveryGoals, educationItems: $educationItems, healthScore: $healthScore, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $DashboardEntityCopyWith<$Res>  {
  factory $DashboardEntityCopyWith(DashboardEntity value, $Res Function(DashboardEntity) _then) = _$DashboardEntityCopyWithImpl;
@useResult
$Res call({
 HealthDataOverviewEntity healthData, List<RecoveryGoalEntity> recoveryGoals, List<HealthEducationItemEntity> educationItems, HealthScoreEntity? healthScore, DateTime? lastUpdated
});


$HealthDataOverviewEntityCopyWith<$Res> get healthData;$HealthScoreEntityCopyWith<$Res>? get healthScore;

}
/// @nodoc
class _$DashboardEntityCopyWithImpl<$Res>
    implements $DashboardEntityCopyWith<$Res> {
  _$DashboardEntityCopyWithImpl(this._self, this._then);

  final DashboardEntity _self;
  final $Res Function(DashboardEntity) _then;

/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? healthData = null,Object? recoveryGoals = null,Object? educationItems = null,Object? healthScore = freezed,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
healthData: null == healthData ? _self.healthData : healthData // ignore: cast_nullable_to_non_nullable
as HealthDataOverviewEntity,recoveryGoals: null == recoveryGoals ? _self.recoveryGoals : recoveryGoals // ignore: cast_nullable_to_non_nullable
as List<RecoveryGoalEntity>,educationItems: null == educationItems ? _self.educationItems : educationItems // ignore: cast_nullable_to_non_nullable
as List<HealthEducationItemEntity>,healthScore: freezed == healthScore ? _self.healthScore : healthScore // ignore: cast_nullable_to_non_nullable
as HealthScoreEntity?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthDataOverviewEntityCopyWith<$Res> get healthData {
  
  return $HealthDataOverviewEntityCopyWith<$Res>(_self.healthData, (value) {
    return _then(_self.copyWith(healthData: value));
  });
}/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthScoreEntityCopyWith<$Res>? get healthScore {
    if (_self.healthScore == null) {
    return null;
  }

  return $HealthScoreEntityCopyWith<$Res>(_self.healthScore!, (value) {
    return _then(_self.copyWith(healthScore: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardEntity].
extension DashboardEntityPatterns on DashboardEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardEntity value)  $default,){
final _that = this;
switch (_that) {
case _DashboardEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HealthDataOverviewEntity healthData,  List<RecoveryGoalEntity> recoveryGoals,  List<HealthEducationItemEntity> educationItems,  HealthScoreEntity? healthScore,  DateTime? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardEntity() when $default != null:
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.healthScore,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HealthDataOverviewEntity healthData,  List<RecoveryGoalEntity> recoveryGoals,  List<HealthEducationItemEntity> educationItems,  HealthScoreEntity? healthScore,  DateTime? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _DashboardEntity():
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.healthScore,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HealthDataOverviewEntity healthData,  List<RecoveryGoalEntity> recoveryGoals,  List<HealthEducationItemEntity> educationItems,  HealthScoreEntity? healthScore,  DateTime? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _DashboardEntity() when $default != null:
return $default(_that.healthData,_that.recoveryGoals,_that.educationItems,_that.healthScore,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardEntity extends DashboardEntity {
  const _DashboardEntity({required this.healthData, required final  List<RecoveryGoalEntity> recoveryGoals, required final  List<HealthEducationItemEntity> educationItems, this.healthScore, this.lastUpdated}): _recoveryGoals = recoveryGoals,_educationItems = educationItems,super._();
  

@override final  HealthDataOverviewEntity healthData;
 final  List<RecoveryGoalEntity> _recoveryGoals;
@override List<RecoveryGoalEntity> get recoveryGoals {
  if (_recoveryGoals is EqualUnmodifiableListView) return _recoveryGoals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recoveryGoals);
}

 final  List<HealthEducationItemEntity> _educationItems;
@override List<HealthEducationItemEntity> get educationItems {
  if (_educationItems is EqualUnmodifiableListView) return _educationItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_educationItems);
}

@override final  HealthScoreEntity? healthScore;
@override final  DateTime? lastUpdated;

/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardEntityCopyWith<_DashboardEntity> get copyWith => __$DashboardEntityCopyWithImpl<_DashboardEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardEntity&&(identical(other.healthData, healthData) || other.healthData == healthData)&&const DeepCollectionEquality().equals(other._recoveryGoals, _recoveryGoals)&&const DeepCollectionEquality().equals(other._educationItems, _educationItems)&&(identical(other.healthScore, healthScore) || other.healthScore == healthScore)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}


@override
int get hashCode => Object.hash(runtimeType,healthData,const DeepCollectionEquality().hash(_recoveryGoals),const DeepCollectionEquality().hash(_educationItems),healthScore,lastUpdated);

@override
String toString() {
  return 'DashboardEntity(healthData: $healthData, recoveryGoals: $recoveryGoals, educationItems: $educationItems, healthScore: $healthScore, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$DashboardEntityCopyWith<$Res> implements $DashboardEntityCopyWith<$Res> {
  factory _$DashboardEntityCopyWith(_DashboardEntity value, $Res Function(_DashboardEntity) _then) = __$DashboardEntityCopyWithImpl;
@override @useResult
$Res call({
 HealthDataOverviewEntity healthData, List<RecoveryGoalEntity> recoveryGoals, List<HealthEducationItemEntity> educationItems, HealthScoreEntity? healthScore, DateTime? lastUpdated
});


@override $HealthDataOverviewEntityCopyWith<$Res> get healthData;@override $HealthScoreEntityCopyWith<$Res>? get healthScore;

}
/// @nodoc
class __$DashboardEntityCopyWithImpl<$Res>
    implements _$DashboardEntityCopyWith<$Res> {
  __$DashboardEntityCopyWithImpl(this._self, this._then);

  final _DashboardEntity _self;
  final $Res Function(_DashboardEntity) _then;

/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? healthData = null,Object? recoveryGoals = null,Object? educationItems = null,Object? healthScore = freezed,Object? lastUpdated = freezed,}) {
  return _then(_DashboardEntity(
healthData: null == healthData ? _self.healthData : healthData // ignore: cast_nullable_to_non_nullable
as HealthDataOverviewEntity,recoveryGoals: null == recoveryGoals ? _self._recoveryGoals : recoveryGoals // ignore: cast_nullable_to_non_nullable
as List<RecoveryGoalEntity>,educationItems: null == educationItems ? _self._educationItems : educationItems // ignore: cast_nullable_to_non_nullable
as List<HealthEducationItemEntity>,healthScore: freezed == healthScore ? _self.healthScore : healthScore // ignore: cast_nullable_to_non_nullable
as HealthScoreEntity?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthDataOverviewEntityCopyWith<$Res> get healthData {
  
  return $HealthDataOverviewEntityCopyWith<$Res>(_self.healthData, (value) {
    return _then(_self.copyWith(healthData: value));
  });
}/// Create a copy of DashboardEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthScoreEntityCopyWith<$Res>? get healthScore {
    if (_self.healthScore == null) {
    return null;
  }

  return $HealthScoreEntityCopyWith<$Res>(_self.healthScore!, (value) {
    return _then(_self.copyWith(healthScore: value));
  });
}
}

/// @nodoc
mixin _$HealthScoreEntity {

 int get totalScore; Map<String, int> get categoryScores; HealthScoreLevel get level; String get description; List<String> get recommendations; DateTime? get calculatedAt;
/// Create a copy of HealthScoreEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthScoreEntityCopyWith<HealthScoreEntity> get copyWith => _$HealthScoreEntityCopyWithImpl<HealthScoreEntity>(this as HealthScoreEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthScoreEntity&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&const DeepCollectionEquality().equals(other.categoryScores, categoryScores)&&(identical(other.level, level) || other.level == level)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.recommendations, recommendations)&&(identical(other.calculatedAt, calculatedAt) || other.calculatedAt == calculatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,totalScore,const DeepCollectionEquality().hash(categoryScores),level,description,const DeepCollectionEquality().hash(recommendations),calculatedAt);

@override
String toString() {
  return 'HealthScoreEntity(totalScore: $totalScore, categoryScores: $categoryScores, level: $level, description: $description, recommendations: $recommendations, calculatedAt: $calculatedAt)';
}


}

/// @nodoc
abstract mixin class $HealthScoreEntityCopyWith<$Res>  {
  factory $HealthScoreEntityCopyWith(HealthScoreEntity value, $Res Function(HealthScoreEntity) _then) = _$HealthScoreEntityCopyWithImpl;
@useResult
$Res call({
 int totalScore, Map<String, int> categoryScores, HealthScoreLevel level, String description, List<String> recommendations, DateTime? calculatedAt
});




}
/// @nodoc
class _$HealthScoreEntityCopyWithImpl<$Res>
    implements $HealthScoreEntityCopyWith<$Res> {
  _$HealthScoreEntityCopyWithImpl(this._self, this._then);

  final HealthScoreEntity _self;
  final $Res Function(HealthScoreEntity) _then;

/// Create a copy of HealthScoreEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalScore = null,Object? categoryScores = null,Object? level = null,Object? description = null,Object? recommendations = null,Object? calculatedAt = freezed,}) {
  return _then(_self.copyWith(
totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,categoryScores: null == categoryScores ? _self.categoryScores : categoryScores // ignore: cast_nullable_to_non_nullable
as Map<String, int>,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as HealthScoreLevel,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,recommendations: null == recommendations ? _self.recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<String>,calculatedAt: freezed == calculatedAt ? _self.calculatedAt : calculatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthScoreEntity].
extension HealthScoreEntityPatterns on HealthScoreEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthScoreEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthScoreEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthScoreEntity value)  $default,){
final _that = this;
switch (_that) {
case _HealthScoreEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthScoreEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HealthScoreEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalScore,  Map<String, int> categoryScores,  HealthScoreLevel level,  String description,  List<String> recommendations,  DateTime? calculatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthScoreEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalScore,  Map<String, int> categoryScores,  HealthScoreLevel level,  String description,  List<String> recommendations,  DateTime? calculatedAt)  $default,) {final _that = this;
switch (_that) {
case _HealthScoreEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalScore,  Map<String, int> categoryScores,  HealthScoreLevel level,  String description,  List<String> recommendations,  DateTime? calculatedAt)?  $default,) {final _that = this;
switch (_that) {
case _HealthScoreEntity() when $default != null:
return $default(_that.totalScore,_that.categoryScores,_that.level,_that.description,_that.recommendations,_that.calculatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _HealthScoreEntity extends HealthScoreEntity {
  const _HealthScoreEntity({required this.totalScore, required final  Map<String, int> categoryScores, required this.level, required this.description, required final  List<String> recommendations, this.calculatedAt}): _categoryScores = categoryScores,_recommendations = recommendations,super._();
  

@override final  int totalScore;
 final  Map<String, int> _categoryScores;
@override Map<String, int> get categoryScores {
  if (_categoryScores is EqualUnmodifiableMapView) return _categoryScores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_categoryScores);
}

@override final  HealthScoreLevel level;
@override final  String description;
 final  List<String> _recommendations;
@override List<String> get recommendations {
  if (_recommendations is EqualUnmodifiableListView) return _recommendations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendations);
}

@override final  DateTime? calculatedAt;

/// Create a copy of HealthScoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthScoreEntityCopyWith<_HealthScoreEntity> get copyWith => __$HealthScoreEntityCopyWithImpl<_HealthScoreEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthScoreEntity&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&const DeepCollectionEquality().equals(other._categoryScores, _categoryScores)&&(identical(other.level, level) || other.level == level)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._recommendations, _recommendations)&&(identical(other.calculatedAt, calculatedAt) || other.calculatedAt == calculatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,totalScore,const DeepCollectionEquality().hash(_categoryScores),level,description,const DeepCollectionEquality().hash(_recommendations),calculatedAt);

@override
String toString() {
  return 'HealthScoreEntity(totalScore: $totalScore, categoryScores: $categoryScores, level: $level, description: $description, recommendations: $recommendations, calculatedAt: $calculatedAt)';
}


}

/// @nodoc
abstract mixin class _$HealthScoreEntityCopyWith<$Res> implements $HealthScoreEntityCopyWith<$Res> {
  factory _$HealthScoreEntityCopyWith(_HealthScoreEntity value, $Res Function(_HealthScoreEntity) _then) = __$HealthScoreEntityCopyWithImpl;
@override @useResult
$Res call({
 int totalScore, Map<String, int> categoryScores, HealthScoreLevel level, String description, List<String> recommendations, DateTime? calculatedAt
});




}
/// @nodoc
class __$HealthScoreEntityCopyWithImpl<$Res>
    implements _$HealthScoreEntityCopyWith<$Res> {
  __$HealthScoreEntityCopyWithImpl(this._self, this._then);

  final _HealthScoreEntity _self;
  final $Res Function(_HealthScoreEntity) _then;

/// Create a copy of HealthScoreEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalScore = null,Object? categoryScores = null,Object? level = null,Object? description = null,Object? recommendations = null,Object? calculatedAt = freezed,}) {
  return _then(_HealthScoreEntity(
totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,categoryScores: null == categoryScores ? _self._categoryScores : categoryScores // ignore: cast_nullable_to_non_nullable
as Map<String, int>,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as HealthScoreLevel,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,recommendations: null == recommendations ? _self._recommendations : recommendations // ignore: cast_nullable_to_non_nullable
as List<String>,calculatedAt: freezed == calculatedAt ? _self.calculatedAt : calculatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
