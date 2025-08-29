// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_pressure_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BloodPressureRecord {

 String get id; String get patientId; int get systolic; int get diastolic; DateTime get recordedAt; int? get heartRate; String? get notes; BloodPressureLevel? get level; MeasurementSource? get source;
/// Create a copy of BloodPressureRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodPressureRecordCopyWith<BloodPressureRecord> get copyWith => _$BloodPressureRecordCopyWithImpl<BloodPressureRecord>(this as BloodPressureRecord, _$identity);

  /// Serializes this BloodPressureRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodPressureRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.level, level) || other.level == level)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,systolic,diastolic,recordedAt,heartRate,notes,level,source);

@override
String toString() {
  return 'BloodPressureRecord(id: $id, patientId: $patientId, systolic: $systolic, diastolic: $diastolic, recordedAt: $recordedAt, heartRate: $heartRate, notes: $notes, level: $level, source: $source)';
}


}

/// @nodoc
abstract mixin class $BloodPressureRecordCopyWith<$Res>  {
  factory $BloodPressureRecordCopyWith(BloodPressureRecord value, $Res Function(BloodPressureRecord) _then) = _$BloodPressureRecordCopyWithImpl;
@useResult
$Res call({
 String id, String patientId, int systolic, int diastolic, DateTime recordedAt, int? heartRate, String? notes, BloodPressureLevel? level, MeasurementSource? source
});




}
/// @nodoc
class _$BloodPressureRecordCopyWithImpl<$Res>
    implements $BloodPressureRecordCopyWith<$Res> {
  _$BloodPressureRecordCopyWithImpl(this._self, this._then);

  final BloodPressureRecord _self;
  final $Res Function(BloodPressureRecord) _then;

/// Create a copy of BloodPressureRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? systolic = null,Object? diastolic = null,Object? recordedAt = null,Object? heartRate = freezed,Object? notes = freezed,Object? level = freezed,Object? source = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,systolic: null == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int,diastolic: null == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as BloodPressureLevel?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as MeasurementSource?,
  ));
}

}


/// Adds pattern-matching-related methods to [BloodPressureRecord].
extension BloodPressureRecordPatterns on BloodPressureRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BloodPressureRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BloodPressureRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BloodPressureRecord value)  $default,){
final _that = this;
switch (_that) {
case _BloodPressureRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BloodPressureRecord value)?  $default,){
final _that = this;
switch (_that) {
case _BloodPressureRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String patientId,  int systolic,  int diastolic,  DateTime recordedAt,  int? heartRate,  String? notes,  BloodPressureLevel? level,  MeasurementSource? source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BloodPressureRecord() when $default != null:
return $default(_that.id,_that.patientId,_that.systolic,_that.diastolic,_that.recordedAt,_that.heartRate,_that.notes,_that.level,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String patientId,  int systolic,  int diastolic,  DateTime recordedAt,  int? heartRate,  String? notes,  BloodPressureLevel? level,  MeasurementSource? source)  $default,) {final _that = this;
switch (_that) {
case _BloodPressureRecord():
return $default(_that.id,_that.patientId,_that.systolic,_that.diastolic,_that.recordedAt,_that.heartRate,_that.notes,_that.level,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String patientId,  int systolic,  int diastolic,  DateTime recordedAt,  int? heartRate,  String? notes,  BloodPressureLevel? level,  MeasurementSource? source)?  $default,) {final _that = this;
switch (_that) {
case _BloodPressureRecord() when $default != null:
return $default(_that.id,_that.patientId,_that.systolic,_that.diastolic,_that.recordedAt,_that.heartRate,_that.notes,_that.level,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BloodPressureRecord extends BloodPressureRecord {
  const _BloodPressureRecord({required this.id, required this.patientId, required this.systolic, required this.diastolic, required this.recordedAt, this.heartRate, this.notes, this.level, this.source}): super._();
  factory _BloodPressureRecord.fromJson(Map<String, dynamic> json) => _$BloodPressureRecordFromJson(json);

@override final  String id;
@override final  String patientId;
@override final  int systolic;
@override final  int diastolic;
@override final  DateTime recordedAt;
@override final  int? heartRate;
@override final  String? notes;
@override final  BloodPressureLevel? level;
@override final  MeasurementSource? source;

/// Create a copy of BloodPressureRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BloodPressureRecordCopyWith<_BloodPressureRecord> get copyWith => __$BloodPressureRecordCopyWithImpl<_BloodPressureRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BloodPressureRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodPressureRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.level, level) || other.level == level)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,systolic,diastolic,recordedAt,heartRate,notes,level,source);

@override
String toString() {
  return 'BloodPressureRecord(id: $id, patientId: $patientId, systolic: $systolic, diastolic: $diastolic, recordedAt: $recordedAt, heartRate: $heartRate, notes: $notes, level: $level, source: $source)';
}


}

/// @nodoc
abstract mixin class _$BloodPressureRecordCopyWith<$Res> implements $BloodPressureRecordCopyWith<$Res> {
  factory _$BloodPressureRecordCopyWith(_BloodPressureRecord value, $Res Function(_BloodPressureRecord) _then) = __$BloodPressureRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String patientId, int systolic, int diastolic, DateTime recordedAt, int? heartRate, String? notes, BloodPressureLevel? level, MeasurementSource? source
});




}
/// @nodoc
class __$BloodPressureRecordCopyWithImpl<$Res>
    implements _$BloodPressureRecordCopyWith<$Res> {
  __$BloodPressureRecordCopyWithImpl(this._self, this._then);

  final _BloodPressureRecord _self;
  final $Res Function(_BloodPressureRecord) _then;

/// Create a copy of BloodPressureRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? systolic = null,Object? diastolic = null,Object? recordedAt = null,Object? heartRate = freezed,Object? notes = freezed,Object? level = freezed,Object? source = freezed,}) {
  return _then(_BloodPressureRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,systolic: null == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int,diastolic: null == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as BloodPressureLevel?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as MeasurementSource?,
  ));
}


}

// dart format on
