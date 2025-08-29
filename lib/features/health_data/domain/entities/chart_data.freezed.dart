// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChartData {

 List<DataPoint> get dataPoints; TimeRange get timeRange; double? get minValue; double? get maxValue; double? get averageValue; String? get trend;
/// Create a copy of ChartData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChartDataCopyWith<ChartData> get copyWith => _$ChartDataCopyWithImpl<ChartData>(this as ChartData, _$identity);

  /// Serializes this ChartData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChartData&&const DeepCollectionEquality().equals(other.dataPoints, dataPoints)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange)&&(identical(other.minValue, minValue) || other.minValue == minValue)&&(identical(other.maxValue, maxValue) || other.maxValue == maxValue)&&(identical(other.averageValue, averageValue) || other.averageValue == averageValue)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(dataPoints),timeRange,minValue,maxValue,averageValue,trend);

@override
String toString() {
  return 'ChartData(dataPoints: $dataPoints, timeRange: $timeRange, minValue: $minValue, maxValue: $maxValue, averageValue: $averageValue, trend: $trend)';
}


}

/// @nodoc
abstract mixin class $ChartDataCopyWith<$Res>  {
  factory $ChartDataCopyWith(ChartData value, $Res Function(ChartData) _then) = _$ChartDataCopyWithImpl;
@useResult
$Res call({
 List<DataPoint> dataPoints, TimeRange timeRange, double? minValue, double? maxValue, double? averageValue, String? trend
});




}
/// @nodoc
class _$ChartDataCopyWithImpl<$Res>
    implements $ChartDataCopyWith<$Res> {
  _$ChartDataCopyWithImpl(this._self, this._then);

  final ChartData _self;
  final $Res Function(ChartData) _then;

/// Create a copy of ChartData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dataPoints = null,Object? timeRange = null,Object? minValue = freezed,Object? maxValue = freezed,Object? averageValue = freezed,Object? trend = freezed,}) {
  return _then(_self.copyWith(
dataPoints: null == dataPoints ? _self.dataPoints : dataPoints // ignore: cast_nullable_to_non_nullable
as List<DataPoint>,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as TimeRange,minValue: freezed == minValue ? _self.minValue : minValue // ignore: cast_nullable_to_non_nullable
as double?,maxValue: freezed == maxValue ? _self.maxValue : maxValue // ignore: cast_nullable_to_non_nullable
as double?,averageValue: freezed == averageValue ? _self.averageValue : averageValue // ignore: cast_nullable_to_non_nullable
as double?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChartData].
extension ChartDataPatterns on ChartData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChartData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChartData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChartData value)  $default,){
final _that = this;
switch (_that) {
case _ChartData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChartData value)?  $default,){
final _that = this;
switch (_that) {
case _ChartData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DataPoint> dataPoints,  TimeRange timeRange,  double? minValue,  double? maxValue,  double? averageValue,  String? trend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChartData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DataPoint> dataPoints,  TimeRange timeRange,  double? minValue,  double? maxValue,  double? averageValue,  String? trend)  $default,) {final _that = this;
switch (_that) {
case _ChartData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DataPoint> dataPoints,  TimeRange timeRange,  double? minValue,  double? maxValue,  double? averageValue,  String? trend)?  $default,) {final _that = this;
switch (_that) {
case _ChartData() when $default != null:
return $default(_that.dataPoints,_that.timeRange,_that.minValue,_that.maxValue,_that.averageValue,_that.trend);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChartData implements ChartData {
  const _ChartData({required final  List<DataPoint> dataPoints, required this.timeRange, this.minValue, this.maxValue, this.averageValue, this.trend}): _dataPoints = dataPoints;
  factory _ChartData.fromJson(Map<String, dynamic> json) => _$ChartDataFromJson(json);

 final  List<DataPoint> _dataPoints;
@override List<DataPoint> get dataPoints {
  if (_dataPoints is EqualUnmodifiableListView) return _dataPoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataPoints);
}

@override final  TimeRange timeRange;
@override final  double? minValue;
@override final  double? maxValue;
@override final  double? averageValue;
@override final  String? trend;

/// Create a copy of ChartData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChartDataCopyWith<_ChartData> get copyWith => __$ChartDataCopyWithImpl<_ChartData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChartDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChartData&&const DeepCollectionEquality().equals(other._dataPoints, _dataPoints)&&(identical(other.timeRange, timeRange) || other.timeRange == timeRange)&&(identical(other.minValue, minValue) || other.minValue == minValue)&&(identical(other.maxValue, maxValue) || other.maxValue == maxValue)&&(identical(other.averageValue, averageValue) || other.averageValue == averageValue)&&(identical(other.trend, trend) || other.trend == trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_dataPoints),timeRange,minValue,maxValue,averageValue,trend);

@override
String toString() {
  return 'ChartData(dataPoints: $dataPoints, timeRange: $timeRange, minValue: $minValue, maxValue: $maxValue, averageValue: $averageValue, trend: $trend)';
}


}

/// @nodoc
abstract mixin class _$ChartDataCopyWith<$Res> implements $ChartDataCopyWith<$Res> {
  factory _$ChartDataCopyWith(_ChartData value, $Res Function(_ChartData) _then) = __$ChartDataCopyWithImpl;
@override @useResult
$Res call({
 List<DataPoint> dataPoints, TimeRange timeRange, double? minValue, double? maxValue, double? averageValue, String? trend
});




}
/// @nodoc
class __$ChartDataCopyWithImpl<$Res>
    implements _$ChartDataCopyWith<$Res> {
  __$ChartDataCopyWithImpl(this._self, this._then);

  final _ChartData _self;
  final $Res Function(_ChartData) _then;

/// Create a copy of ChartData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dataPoints = null,Object? timeRange = null,Object? minValue = freezed,Object? maxValue = freezed,Object? averageValue = freezed,Object? trend = freezed,}) {
  return _then(_ChartData(
dataPoints: null == dataPoints ? _self._dataPoints : dataPoints // ignore: cast_nullable_to_non_nullable
as List<DataPoint>,timeRange: null == timeRange ? _self.timeRange : timeRange // ignore: cast_nullable_to_non_nullable
as TimeRange,minValue: freezed == minValue ? _self.minValue : minValue // ignore: cast_nullable_to_non_nullable
as double?,maxValue: freezed == maxValue ? _self.maxValue : maxValue // ignore: cast_nullable_to_non_nullable
as double?,averageValue: freezed == averageValue ? _self.averageValue : averageValue // ignore: cast_nullable_to_non_nullable
as double?,trend: freezed == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DataPoint {

 DateTime get timestamp; double get value; double? get secondaryValue;// 用于血压的舒张压
 Map<String, dynamic>? get metadata;
/// Create a copy of DataPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataPointCopyWith<DataPoint> get copyWith => _$DataPointCopyWithImpl<DataPoint>(this as DataPoint, _$identity);

  /// Serializes this DataPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataPoint&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.value, value) || other.value == value)&&(identical(other.secondaryValue, secondaryValue) || other.secondaryValue == secondaryValue)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,value,secondaryValue,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'DataPoint(timestamp: $timestamp, value: $value, secondaryValue: $secondaryValue, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $DataPointCopyWith<$Res>  {
  factory $DataPointCopyWith(DataPoint value, $Res Function(DataPoint) _then) = _$DataPointCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, double value, double? secondaryValue, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$DataPointCopyWithImpl<$Res>
    implements $DataPointCopyWith<$Res> {
  _$DataPointCopyWithImpl(this._self, this._then);

  final DataPoint _self;
  final $Res Function(DataPoint) _then;

/// Create a copy of DataPoint
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


/// Adds pattern-matching-related methods to [DataPoint].
extension DataPointPatterns on DataPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataPoint value)  $default,){
final _that = this;
switch (_that) {
case _DataPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataPoint value)?  $default,){
final _that = this;
switch (_that) {
case _DataPoint() when $default != null:
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
case _DataPoint() when $default != null:
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
case _DataPoint():
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
case _DataPoint() when $default != null:
return $default(_that.timestamp,_that.value,_that.secondaryValue,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DataPoint implements DataPoint {
  const _DataPoint({required this.timestamp, required this.value, this.secondaryValue, final  Map<String, dynamic>? metadata}): _metadata = metadata;
  factory _DataPoint.fromJson(Map<String, dynamic> json) => _$DataPointFromJson(json);

@override final  DateTime timestamp;
@override final  double value;
@override final  double? secondaryValue;
// 用于血压的舒张压
 final  Map<String, dynamic>? _metadata;
// 用于血压的舒张压
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of DataPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataPointCopyWith<_DataPoint> get copyWith => __$DataPointCopyWithImpl<_DataPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataPoint&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.value, value) || other.value == value)&&(identical(other.secondaryValue, secondaryValue) || other.secondaryValue == secondaryValue)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,value,secondaryValue,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'DataPoint(timestamp: $timestamp, value: $value, secondaryValue: $secondaryValue, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$DataPointCopyWith<$Res> implements $DataPointCopyWith<$Res> {
  factory _$DataPointCopyWith(_DataPoint value, $Res Function(_DataPoint) _then) = __$DataPointCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, double value, double? secondaryValue, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$DataPointCopyWithImpl<$Res>
    implements _$DataPointCopyWith<$Res> {
  __$DataPointCopyWithImpl(this._self, this._then);

  final _DataPoint _self;
  final $Res Function(_DataPoint) _then;

/// Create a copy of DataPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? value = null,Object? secondaryValue = freezed,Object? metadata = freezed,}) {
  return _then(_DataPoint(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,secondaryValue: freezed == secondaryValue ? _self.secondaryValue : secondaryValue // ignore: cast_nullable_to_non_nullable
as double?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
