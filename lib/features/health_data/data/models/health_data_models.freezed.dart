// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_data_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BloodPressureRecordModel {

 String get id; String get patientId; int get systolic; int get diastolic; DateTime get recordedAt; int? get heartRate; String? get notes; BloodPressureLevelModel? get level; MeasurementSourceModel? get source; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of BloodPressureRecordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodPressureRecordModelCopyWith<BloodPressureRecordModel> get copyWith => _$BloodPressureRecordModelCopyWithImpl<BloodPressureRecordModel>(this as BloodPressureRecordModel, _$identity);

  /// Serializes this BloodPressureRecordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodPressureRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.level, level) || other.level == level)&&(identical(other.source, source) || other.source == source)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,systolic,diastolic,recordedAt,heartRate,notes,level,source,createdAt,updatedAt);

@override
String toString() {
  return 'BloodPressureRecordModel(id: $id, patientId: $patientId, systolic: $systolic, diastolic: $diastolic, recordedAt: $recordedAt, heartRate: $heartRate, notes: $notes, level: $level, source: $source, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BloodPressureRecordModelCopyWith<$Res>  {
  factory $BloodPressureRecordModelCopyWith(BloodPressureRecordModel value, $Res Function(BloodPressureRecordModel) _then) = _$BloodPressureRecordModelCopyWithImpl;
@useResult
$Res call({
 String id, String patientId, int systolic, int diastolic, DateTime recordedAt, int? heartRate, String? notes, BloodPressureLevelModel? level, MeasurementSourceModel? source, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$BloodPressureRecordModelCopyWithImpl<$Res>
    implements $BloodPressureRecordModelCopyWith<$Res> {
  _$BloodPressureRecordModelCopyWithImpl(this._self, this._then);

  final BloodPressureRecordModel _self;
  final $Res Function(BloodPressureRecordModel) _then;

/// Create a copy of BloodPressureRecordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? systolic = null,Object? diastolic = null,Object? recordedAt = null,Object? heartRate = freezed,Object? notes = freezed,Object? level = freezed,Object? source = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,systolic: null == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int,diastolic: null == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as BloodPressureLevelModel?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as MeasurementSourceModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [BloodPressureRecordModel].
extension BloodPressureRecordModelPatterns on BloodPressureRecordModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BloodPressureRecordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BloodPressureRecordModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BloodPressureRecordModel value)  $default,){
final _that = this;
switch (_that) {
case _BloodPressureRecordModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BloodPressureRecordModel value)?  $default,){
final _that = this;
switch (_that) {
case _BloodPressureRecordModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String patientId,  int systolic,  int diastolic,  DateTime recordedAt,  int? heartRate,  String? notes,  BloodPressureLevelModel? level,  MeasurementSourceModel? source,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BloodPressureRecordModel() when $default != null:
return $default(_that.id,_that.patientId,_that.systolic,_that.diastolic,_that.recordedAt,_that.heartRate,_that.notes,_that.level,_that.source,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String patientId,  int systolic,  int diastolic,  DateTime recordedAt,  int? heartRate,  String? notes,  BloodPressureLevelModel? level,  MeasurementSourceModel? source,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BloodPressureRecordModel():
return $default(_that.id,_that.patientId,_that.systolic,_that.diastolic,_that.recordedAt,_that.heartRate,_that.notes,_that.level,_that.source,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String patientId,  int systolic,  int diastolic,  DateTime recordedAt,  int? heartRate,  String? notes,  BloodPressureLevelModel? level,  MeasurementSourceModel? source,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BloodPressureRecordModel() when $default != null:
return $default(_that.id,_that.patientId,_that.systolic,_that.diastolic,_that.recordedAt,_that.heartRate,_that.notes,_that.level,_that.source,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _BloodPressureRecordModel implements BloodPressureRecordModel {
  const _BloodPressureRecordModel({required this.id, required this.patientId, required this.systolic, required this.diastolic, required this.recordedAt, this.heartRate, this.notes, this.level, this.source, this.createdAt, this.updatedAt});
  factory _BloodPressureRecordModel.fromJson(Map<String, dynamic> json) => _$BloodPressureRecordModelFromJson(json);

@override final  String id;
@override final  String patientId;
@override final  int systolic;
@override final  int diastolic;
@override final  DateTime recordedAt;
@override final  int? heartRate;
@override final  String? notes;
@override final  BloodPressureLevelModel? level;
@override final  MeasurementSourceModel? source;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of BloodPressureRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BloodPressureRecordModelCopyWith<_BloodPressureRecordModel> get copyWith => __$BloodPressureRecordModelCopyWithImpl<_BloodPressureRecordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BloodPressureRecordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodPressureRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.level, level) || other.level == level)&&(identical(other.source, source) || other.source == source)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,systolic,diastolic,recordedAt,heartRate,notes,level,source,createdAt,updatedAt);

@override
String toString() {
  return 'BloodPressureRecordModel(id: $id, patientId: $patientId, systolic: $systolic, diastolic: $diastolic, recordedAt: $recordedAt, heartRate: $heartRate, notes: $notes, level: $level, source: $source, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BloodPressureRecordModelCopyWith<$Res> implements $BloodPressureRecordModelCopyWith<$Res> {
  factory _$BloodPressureRecordModelCopyWith(_BloodPressureRecordModel value, $Res Function(_BloodPressureRecordModel) _then) = __$BloodPressureRecordModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String patientId, int systolic, int diastolic, DateTime recordedAt, int? heartRate, String? notes, BloodPressureLevelModel? level, MeasurementSourceModel? source, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$BloodPressureRecordModelCopyWithImpl<$Res>
    implements _$BloodPressureRecordModelCopyWith<$Res> {
  __$BloodPressureRecordModelCopyWithImpl(this._self, this._then);

  final _BloodPressureRecordModel _self;
  final $Res Function(_BloodPressureRecordModel) _then;

/// Create a copy of BloodPressureRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? systolic = null,Object? diastolic = null,Object? recordedAt = null,Object? heartRate = freezed,Object? notes = freezed,Object? level = freezed,Object? source = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BloodPressureRecordModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,systolic: null == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int,diastolic: null == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as BloodPressureLevelModel?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as MeasurementSourceModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DataPointModel {

 DateTime get timestamp; double get value; double? get secondaryValue; Map<String, dynamic>? get metadata;
/// Create a copy of DataPointModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataPointModelCopyWith<DataPointModel> get copyWith => _$DataPointModelCopyWithImpl<DataPointModel>(this as DataPointModel, _$identity);

  /// Serializes this DataPointModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataPointModel&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.value, value) || other.value == value)&&(identical(other.secondaryValue, secondaryValue) || other.secondaryValue == secondaryValue)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,value,secondaryValue,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'DataPointModel(timestamp: $timestamp, value: $value, secondaryValue: $secondaryValue, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $DataPointModelCopyWith<$Res>  {
  factory $DataPointModelCopyWith(DataPointModel value, $Res Function(DataPointModel) _then) = _$DataPointModelCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, double value, double? secondaryValue, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$DataPointModelCopyWithImpl<$Res>
    implements $DataPointModelCopyWith<$Res> {
  _$DataPointModelCopyWithImpl(this._self, this._then);

  final DataPointModel _self;
  final $Res Function(DataPointModel) _then;

/// Create a copy of DataPointModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? value = null,Object? secondaryValue = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,secondaryValue: freezed == secondaryValue ? _self.secondaryValue : secondaryValue // ignore: cast_nullable_to_non_nullable
as double?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DataPointModel].
extension DataPointModelPatterns on DataPointModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataPointModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataPointModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataPointModel value)  $default,){
final _that = this;
switch (_that) {
case _DataPointModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataPointModel value)?  $default,){
final _that = this;
switch (_that) {
case _DataPointModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime timestamp,  double value,  double? secondaryValue,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataPointModel() when $default != null:
return $default(_that.timestamp,_that.value,_that.secondaryValue,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime timestamp,  double value,  double? secondaryValue,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _DataPointModel():
return $default(_that.timestamp,_that.value,_that.secondaryValue,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime timestamp,  double value,  double? secondaryValue,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _DataPointModel() when $default != null:
return $default(_that.timestamp,_that.value,_that.secondaryValue,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _DataPointModel implements DataPointModel {
  const _DataPointModel({required this.timestamp, required this.value, this.secondaryValue, final  Map<String, dynamic>? metadata}): _metadata = metadata;
  factory _DataPointModel.fromJson(Map<String, dynamic> json) => _$DataPointModelFromJson(json);

@override final  DateTime timestamp;
@override final  double value;
@override final  double? secondaryValue;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of DataPointModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataPointModelCopyWith<_DataPointModel> get copyWith => __$DataPointModelCopyWithImpl<_DataPointModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataPointModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataPointModel&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.value, value) || other.value == value)&&(identical(other.secondaryValue, secondaryValue) || other.secondaryValue == secondaryValue)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,value,secondaryValue,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'DataPointModel(timestamp: $timestamp, value: $value, secondaryValue: $secondaryValue, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$DataPointModelCopyWith<$Res> implements $DataPointModelCopyWith<$Res> {
  factory _$DataPointModelCopyWith(_DataPointModel value, $Res Function(_DataPointModel) _then) = __$DataPointModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, double value, double? secondaryValue, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$DataPointModelCopyWithImpl<$Res>
    implements _$DataPointModelCopyWith<$Res> {
  __$DataPointModelCopyWithImpl(this._self, this._then);

  final _DataPointModel _self;
  final $Res Function(_DataPointModel) _then;

/// Create a copy of DataPointModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? value = null,Object? secondaryValue = freezed,Object? metadata = freezed,}) {
  return _then(_DataPointModel(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,secondaryValue: freezed == secondaryValue ? _self.secondaryValue : secondaryValue // ignore: cast_nullable_to_non_nullable
as double?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$ChartDataModel {

 List<DataPointModel> get dataPoints; TimeRangeModel get timeRange; double? get minValue; double? get maxValue; double? get averageValue; String? get trend;
/// Create a copy of ChartDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartDataModelCopyWith<ChartDataModel> get copyWith => _$ChartDataModelCopyWithImpl<ChartDataModel>(this as ChartDataModel, _$identity);

  /// Serializes this ChartDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartDataModel&&const DeepCollectionEquality().equals(other.dataPoints, dataPoints)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange)&&(identical(other.minValue, minValue) || other.minValue == minValue)&&(identical(other.maxValue, maxValue) || other.maxValue == maxValue)&&(identical(other.averageValue, averageValue) || other.averageValue == averageValue)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(dataPoints),timeRange,minValue,maxValue,averageValue,trend);

@override
String toString() {
  return 'ChartDataModel(dataPoints: $dataPoints, timeRange: $timeRange, minValue: $minValue, maxValue: $maxValue, averageValue: $averageValue, trend: $trend)';
}


}

/// @nodoc
abstract mixin class $ChartDataModelCopyWith<$Res>  {
  factory $ChartDataModelCopyWith(ChartDataModel value, $Res Function(ChartDataModel) _then) = _$ChartDataModelCopyWithImpl;
@useResult
$Res call({
 List<DataPointModel> dataPoints, TimeRangeModel timeRange, double? minValue, double? maxValue, double? averageValue, String? trend
});




}
/// @nodoc
class _$ChartDataModelCopyWithImpl<$Res>
    implements $ChartDataModelCopyWith<$Res> {
  _$ChartDataModelCopyWithImpl(this._self, this._then);

  final ChartDataModel _self;
  final $Res Function(ChartDataModel) _then;

/// Create a copy of ChartDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dataPoints = null,Object? timeRange = null,Object? minValue = freezed,Object? maxValue = freezed,Object? averageValue = freezed,Object? trend = freezed,}) {
  return _then(_self.copyWith(
dataPoints: null == dataPoints ? _self.dataPoints : dataPoints // ignore: cast_nullable_to_non_nullable
as List<DataPointModel>,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as TimeRangeModel,minValue: freezed == minValue ? _self.minValue : minValue // ignore: cast_nullable_to_non_nullable
as double?,maxValue: freezed == maxValue ? _self.maxValue : maxValue // ignore: cast_nullable_to_non_nullable
as double?,averageValue: freezed == averageValue ? _self.averageValue : averageValue // ignore: cast_nullable_to_non_nullable
as double?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartDataModel].
extension ChartDataModelPatterns on ChartDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartDataModel value)  $default,){
final _that = this;
switch (_that) {
case _ChartDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChartDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DataPointModel> dataPoints,  TimeRangeModel timeRange,  double? minValue,  double? maxValue,  double? averageValue,  String? trend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartDataModel() when $default != null:
return $default(_that.dataPoints,_that.timeRange,_that.minValue,_that.maxValue,_that.averageValue,_that.trend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DataPointModel> dataPoints,  TimeRangeModel timeRange,  double? minValue,  double? maxValue,  double? averageValue,  String? trend)  $default,) {final _that = this;
switch (_that) {
case _ChartDataModel():
return $default(_that.dataPoints,_that.timeRange,_that.minValue,_that.maxValue,_that.averageValue,_that.trend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DataPointModel> dataPoints,  TimeRangeModel timeRange,  double? minValue,  double? maxValue,  double? averageValue,  String? trend)?  $default,) {final _that = this;
switch (_that) {
case _ChartDataModel() when $default != null:
return $default(_that.dataPoints,_that.timeRange,_that.minValue,_that.maxValue,_that.averageValue,_that.trend);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ChartDataModel implements ChartDataModel {
  const _ChartDataModel({required final  List<DataPointModel> dataPoints, required this.timeRange, this.minValue, this.maxValue, this.averageValue, this.trend}): _dataPoints = dataPoints;
  factory _ChartDataModel.fromJson(Map<String, dynamic> json) => _$ChartDataModelFromJson(json);

 final  List<DataPointModel> _dataPoints;
@override List<DataPointModel> get dataPoints {
  if (_dataPoints is EqualUnmodifiableListView) return _dataPoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataPoints);
}

@override final  TimeRangeModel timeRange;
@override final  double? minValue;
@override final  double? maxValue;
@override final  double? averageValue;
@override final  String? trend;

/// Create a copy of ChartDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartDataModelCopyWith<_ChartDataModel> get copyWith => __$ChartDataModelCopyWithImpl<_ChartDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChartDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartDataModel&&const DeepCollectionEquality().equals(other._dataPoints, _dataPoints)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange)&&(identical(other.minValue, minValue) || other.minValue == minValue)&&(identical(other.maxValue, maxValue) || other.maxValue == maxValue)&&(identical(other.averageValue, averageValue) || other.averageValue == averageValue)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_dataPoints),timeRange,minValue,maxValue,averageValue,trend);

@override
String toString() {
  return 'ChartDataModel(dataPoints: $dataPoints, timeRange: $timeRange, minValue: $minValue, maxValue: $maxValue, averageValue: $averageValue, trend: $trend)';
}


}

/// @nodoc
abstract mixin class _$ChartDataModelCopyWith<$Res> implements $ChartDataModelCopyWith<$Res> {
  factory _$ChartDataModelCopyWith(_ChartDataModel value, $Res Function(_ChartDataModel) _then) = __$ChartDataModelCopyWithImpl;
@override @useResult
$Res call({
 List<DataPointModel> dataPoints, TimeRangeModel timeRange, double? minValue, double? maxValue, double? averageValue, String? trend
});




}
/// @nodoc
class __$ChartDataModelCopyWithImpl<$Res>
    implements _$ChartDataModelCopyWith<$Res> {
  __$ChartDataModelCopyWithImpl(this._self, this._then);

  final _ChartDataModel _self;
  final $Res Function(_ChartDataModel) _then;

/// Create a copy of ChartDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dataPoints = null,Object? timeRange = null,Object? minValue = freezed,Object? maxValue = freezed,Object? averageValue = freezed,Object? trend = freezed,}) {
  return _then(_ChartDataModel(
dataPoints: null == dataPoints ? _self._dataPoints : dataPoints // ignore: cast_nullable_to_non_nullable
as List<DataPointModel>,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as TimeRangeModel,minValue: freezed == minValue ? _self.minValue : minValue // ignore: cast_nullable_to_non_nullable
as double?,maxValue: freezed == maxValue ? _self.maxValue : maxValue // ignore: cast_nullable_to_non_nullable
as double?,averageValue: freezed == averageValue ? _self.averageValue : averageValue // ignore: cast_nullable_to_non_nullable
as double?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RecordHealthDataRequestModel {

 int? get systolic; int? get diastolic; int? get heartRate; double? get weight; DateTime? get recordedAt; String? get notes; MeasurementSourceModel? get source;
/// Create a copy of RecordHealthDataRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordHealthDataRequestModelCopyWith<RecordHealthDataRequestModel> get copyWith => _$RecordHealthDataRequestModelCopyWithImpl<RecordHealthDataRequestModel>(this as RecordHealthDataRequestModel, _$identity);

  /// Serializes this RecordHealthDataRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordHealthDataRequestModel&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,systolic,diastolic,heartRate,weight,recordedAt,notes,source);

@override
String toString() {
  return 'RecordHealthDataRequestModel(systolic: $systolic, diastolic: $diastolic, heartRate: $heartRate, weight: $weight, recordedAt: $recordedAt, notes: $notes, source: $source)';
}


}

/// @nodoc
abstract mixin class $RecordHealthDataRequestModelCopyWith<$Res>  {
  factory $RecordHealthDataRequestModelCopyWith(RecordHealthDataRequestModel value, $Res Function(RecordHealthDataRequestModel) _then) = _$RecordHealthDataRequestModelCopyWithImpl;
@useResult
$Res call({
 int? systolic, int? diastolic, int? heartRate, double? weight, DateTime? recordedAt, String? notes, MeasurementSourceModel? source
});




}
/// @nodoc
class _$RecordHealthDataRequestModelCopyWithImpl<$Res>
    implements $RecordHealthDataRequestModelCopyWith<$Res> {
  _$RecordHealthDataRequestModelCopyWithImpl(this._self, this._then);

  final RecordHealthDataRequestModel _self;
  final $Res Function(RecordHealthDataRequestModel) _then;

/// Create a copy of RecordHealthDataRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? systolic = freezed,Object? diastolic = freezed,Object? heartRate = freezed,Object? weight = freezed,Object? recordedAt = freezed,Object? notes = freezed,Object? source = freezed,}) {
  return _then(_self.copyWith(
systolic: freezed == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int?,diastolic: freezed == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as MeasurementSourceModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecordHealthDataRequestModel].
extension RecordHealthDataRequestModelPatterns on RecordHealthDataRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecordHealthDataRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecordHealthDataRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecordHealthDataRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _RecordHealthDataRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecordHealthDataRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecordHealthDataRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? systolic,  int? diastolic,  int? heartRate,  double? weight,  DateTime? recordedAt,  String? notes,  MeasurementSourceModel? source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecordHealthDataRequestModel() when $default != null:
return $default(_that.systolic,_that.diastolic,_that.heartRate,_that.weight,_that.recordedAt,_that.notes,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? systolic,  int? diastolic,  int? heartRate,  double? weight,  DateTime? recordedAt,  String? notes,  MeasurementSourceModel? source)  $default,) {final _that = this;
switch (_that) {
case _RecordHealthDataRequestModel():
return $default(_that.systolic,_that.diastolic,_that.heartRate,_that.weight,_that.recordedAt,_that.notes,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? systolic,  int? diastolic,  int? heartRate,  double? weight,  DateTime? recordedAt,  String? notes,  MeasurementSourceModel? source)?  $default,) {final _that = this;
switch (_that) {
case _RecordHealthDataRequestModel() when $default != null:
return $default(_that.systolic,_that.diastolic,_that.heartRate,_that.weight,_that.recordedAt,_that.notes,_that.source);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _RecordHealthDataRequestModel implements RecordHealthDataRequestModel {
  const _RecordHealthDataRequestModel({this.systolic, this.diastolic, this.heartRate, this.weight, this.recordedAt, this.notes, this.source});
  factory _RecordHealthDataRequestModel.fromJson(Map<String, dynamic> json) => _$RecordHealthDataRequestModelFromJson(json);

@override final  int? systolic;
@override final  int? diastolic;
@override final  int? heartRate;
@override final  double? weight;
@override final  DateTime? recordedAt;
@override final  String? notes;
@override final  MeasurementSourceModel? source;

/// Create a copy of RecordHealthDataRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecordHealthDataRequestModelCopyWith<_RecordHealthDataRequestModel> get copyWith => __$RecordHealthDataRequestModelCopyWithImpl<_RecordHealthDataRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecordHealthDataRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecordHealthDataRequestModel&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,systolic,diastolic,heartRate,weight,recordedAt,notes,source);

@override
String toString() {
  return 'RecordHealthDataRequestModel(systolic: $systolic, diastolic: $diastolic, heartRate: $heartRate, weight: $weight, recordedAt: $recordedAt, notes: $notes, source: $source)';
}


}

/// @nodoc
abstract mixin class _$RecordHealthDataRequestModelCopyWith<$Res> implements $RecordHealthDataRequestModelCopyWith<$Res> {
  factory _$RecordHealthDataRequestModelCopyWith(_RecordHealthDataRequestModel value, $Res Function(_RecordHealthDataRequestModel) _then) = __$RecordHealthDataRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int? systolic, int? diastolic, int? heartRate, double? weight, DateTime? recordedAt, String? notes, MeasurementSourceModel? source
});




}
/// @nodoc
class __$RecordHealthDataRequestModelCopyWithImpl<$Res>
    implements _$RecordHealthDataRequestModelCopyWith<$Res> {
  __$RecordHealthDataRequestModelCopyWithImpl(this._self, this._then);

  final _RecordHealthDataRequestModel _self;
  final $Res Function(_RecordHealthDataRequestModel) _then;

/// Create a copy of RecordHealthDataRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? systolic = freezed,Object? diastolic = freezed,Object? heartRate = freezed,Object? weight = freezed,Object? recordedAt = freezed,Object? notes = freezed,Object? source = freezed,}) {
  return _then(_RecordHealthDataRequestModel(
systolic: freezed == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int?,diastolic: freezed == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as MeasurementSourceModel?,
  ));
}


}


/// @nodoc
mixin _$BloodPressureDataResponse {

 List<BloodPressureRecordModel> get records; ChartDataModel? get chartData; Map<String, dynamic>? get metadata;
/// Create a copy of BloodPressureDataResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodPressureDataResponseCopyWith<BloodPressureDataResponse> get copyWith => _$BloodPressureDataResponseCopyWithImpl<BloodPressureDataResponse>(this as BloodPressureDataResponse, _$identity);

  /// Serializes this BloodPressureDataResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodPressureDataResponse&&const DeepCollectionEquality().equals(other.records, records)&&(identical(other.chartData, chartData) || other.chartData == chartData)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(records),chartData,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'BloodPressureDataResponse(records: $records, chartData: $chartData, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $BloodPressureDataResponseCopyWith<$Res>  {
  factory $BloodPressureDataResponseCopyWith(BloodPressureDataResponse value, $Res Function(BloodPressureDataResponse) _then) = _$BloodPressureDataResponseCopyWithImpl;
@useResult
$Res call({
 List<BloodPressureRecordModel> records, ChartDataModel? chartData, Map<String, dynamic>? metadata
});


$ChartDataModelCopyWith<$Res>? get chartData;

}
/// @nodoc
class _$BloodPressureDataResponseCopyWithImpl<$Res>
    implements $BloodPressureDataResponseCopyWith<$Res> {
  _$BloodPressureDataResponseCopyWithImpl(this._self, this._then);

  final BloodPressureDataResponse _self;
  final $Res Function(BloodPressureDataResponse) _then;

/// Create a copy of BloodPressureDataResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? records = null,Object? chartData = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<BloodPressureRecordModel>,chartData: freezed == chartData ? _self.chartData : chartData // ignore: cast_nullable_to_non_nullable
as ChartDataModel?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of BloodPressureDataResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartDataModelCopyWith<$Res>? get chartData {
    if (_self.chartData == null) {
    return null;
  }

  return $ChartDataModelCopyWith<$Res>(_self.chartData!, (value) {
    return _then(_self.copyWith(chartData: value));
  });
}
}


/// Adds pattern-matching-related methods to [BloodPressureDataResponse].
extension BloodPressureDataResponsePatterns on BloodPressureDataResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BloodPressureDataResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BloodPressureDataResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BloodPressureDataResponse value)  $default,){
final _that = this;
switch (_that) {
case _BloodPressureDataResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BloodPressureDataResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BloodPressureDataResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BloodPressureRecordModel> records,  ChartDataModel? chartData,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BloodPressureDataResponse() when $default != null:
return $default(_that.records,_that.chartData,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BloodPressureRecordModel> records,  ChartDataModel? chartData,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _BloodPressureDataResponse():
return $default(_that.records,_that.chartData,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BloodPressureRecordModel> records,  ChartDataModel? chartData,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _BloodPressureDataResponse() when $default != null:
return $default(_that.records,_that.chartData,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _BloodPressureDataResponse implements BloodPressureDataResponse {
  const _BloodPressureDataResponse({required final  List<BloodPressureRecordModel> records, this.chartData, final  Map<String, dynamic>? metadata}): _records = records,_metadata = metadata;
  factory _BloodPressureDataResponse.fromJson(Map<String, dynamic> json) => _$BloodPressureDataResponseFromJson(json);

 final  List<BloodPressureRecordModel> _records;
@override List<BloodPressureRecordModel> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}

@override final  ChartDataModel? chartData;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of BloodPressureDataResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BloodPressureDataResponseCopyWith<_BloodPressureDataResponse> get copyWith => __$BloodPressureDataResponseCopyWithImpl<_BloodPressureDataResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BloodPressureDataResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodPressureDataResponse&&const DeepCollectionEquality().equals(other._records, _records)&&(identical(other.chartData, chartData) || other.chartData == chartData)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_records),chartData,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'BloodPressureDataResponse(records: $records, chartData: $chartData, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$BloodPressureDataResponseCopyWith<$Res> implements $BloodPressureDataResponseCopyWith<$Res> {
  factory _$BloodPressureDataResponseCopyWith(_BloodPressureDataResponse value, $Res Function(_BloodPressureDataResponse) _then) = __$BloodPressureDataResponseCopyWithImpl;
@override @useResult
$Res call({
 List<BloodPressureRecordModel> records, ChartDataModel? chartData, Map<String, dynamic>? metadata
});


@override $ChartDataModelCopyWith<$Res>? get chartData;

}
/// @nodoc
class __$BloodPressureDataResponseCopyWithImpl<$Res>
    implements _$BloodPressureDataResponseCopyWith<$Res> {
  __$BloodPressureDataResponseCopyWithImpl(this._self, this._then);

  final _BloodPressureDataResponse _self;
  final $Res Function(_BloodPressureDataResponse) _then;

/// Create a copy of BloodPressureDataResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? records = null,Object? chartData = freezed,Object? metadata = freezed,}) {
  return _then(_BloodPressureDataResponse(
records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<BloodPressureRecordModel>,chartData: freezed == chartData ? _self.chartData : chartData // ignore: cast_nullable_to_non_nullable
as ChartDataModel?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of BloodPressureDataResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChartDataModelCopyWith<$Res>? get chartData {
    if (_self.chartData == null) {
    return null;
  }

  return $ChartDataModelCopyWith<$Res>(_self.chartData!, (value) {
    return _then(_self.copyWith(chartData: value));
  });
}
}

// dart format on
