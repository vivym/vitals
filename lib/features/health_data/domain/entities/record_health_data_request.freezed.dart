// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_health_data_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecordHealthDataRequest {

 DateTime? get recordedAt; String? get notes;
/// Create a copy of RecordHealthDataRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordHealthDataRequestCopyWith<RecordHealthDataRequest> get copyWith => _$RecordHealthDataRequestCopyWithImpl<RecordHealthDataRequest>(this as RecordHealthDataRequest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordHealthDataRequest&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,recordedAt,notes);

@override
String toString() {
  return 'RecordHealthDataRequest(recordedAt: $recordedAt, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $RecordHealthDataRequestCopyWith<$Res>  {
  factory $RecordHealthDataRequestCopyWith(RecordHealthDataRequest value, $Res Function(RecordHealthDataRequest) _then) = _$RecordHealthDataRequestCopyWithImpl;
@useResult
$Res call({
 DateTime? recordedAt, String? notes
});




}
/// @nodoc
class _$RecordHealthDataRequestCopyWithImpl<$Res>
    implements $RecordHealthDataRequestCopyWith<$Res> {
  _$RecordHealthDataRequestCopyWithImpl(this._self, this._then);

  final RecordHealthDataRequest _self;
  final $Res Function(RecordHealthDataRequest) _then;

/// Create a copy of RecordHealthDataRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recordedAt = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecordHealthDataRequest].
extension RecordHealthDataRequestPatterns on RecordHealthDataRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _BloodPressureRequest value)?  bloodPressure,TResult Function( _HeartRateRequest value)?  heartRate,TResult Function( _WeightRequest value)?  weight,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BloodPressureRequest() when bloodPressure != null:
return bloodPressure(_that);case _HeartRateRequest() when heartRate != null:
return heartRate(_that);case _WeightRequest() when weight != null:
return weight(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _BloodPressureRequest value)  bloodPressure,required TResult Function( _HeartRateRequest value)  heartRate,required TResult Function( _WeightRequest value)  weight,}){
final _that = this;
switch (_that) {
case _BloodPressureRequest():
return bloodPressure(_that);case _HeartRateRequest():
return heartRate(_that);case _WeightRequest():
return weight(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _BloodPressureRequest value)?  bloodPressure,TResult? Function( _HeartRateRequest value)?  heartRate,TResult? Function( _WeightRequest value)?  weight,}){
final _that = this;
switch (_that) {
case _BloodPressureRequest() when bloodPressure != null:
return bloodPressure(_that);case _HeartRateRequest() when heartRate != null:
return heartRate(_that);case _WeightRequest() when weight != null:
return weight(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int systolic,  int diastolic,  int? heartRate,  DateTime? recordedAt,  String? notes)?  bloodPressure,TResult Function( int bpm,  DateTime? recordedAt,  String? notes)?  heartRate,TResult Function( double weight,  DateTime? recordedAt,  String? notes)?  weight,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BloodPressureRequest() when bloodPressure != null:
return bloodPressure(_that.systolic,_that.diastolic,_that.heartRate,_that.recordedAt,_that.notes);case _HeartRateRequest() when heartRate != null:
return heartRate(_that.bpm,_that.recordedAt,_that.notes);case _WeightRequest() when weight != null:
return weight(_that.weight,_that.recordedAt,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int systolic,  int diastolic,  int? heartRate,  DateTime? recordedAt,  String? notes)  bloodPressure,required TResult Function( int bpm,  DateTime? recordedAt,  String? notes)  heartRate,required TResult Function( double weight,  DateTime? recordedAt,  String? notes)  weight,}) {final _that = this;
switch (_that) {
case _BloodPressureRequest():
return bloodPressure(_that.systolic,_that.diastolic,_that.heartRate,_that.recordedAt,_that.notes);case _HeartRateRequest():
return heartRate(_that.bpm,_that.recordedAt,_that.notes);case _WeightRequest():
return weight(_that.weight,_that.recordedAt,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int systolic,  int diastolic,  int? heartRate,  DateTime? recordedAt,  String? notes)?  bloodPressure,TResult? Function( int bpm,  DateTime? recordedAt,  String? notes)?  heartRate,TResult? Function( double weight,  DateTime? recordedAt,  String? notes)?  weight,}) {final _that = this;
switch (_that) {
case _BloodPressureRequest() when bloodPressure != null:
return bloodPressure(_that.systolic,_that.diastolic,_that.heartRate,_that.recordedAt,_that.notes);case _HeartRateRequest() when heartRate != null:
return heartRate(_that.bpm,_that.recordedAt,_that.notes);case _WeightRequest() when weight != null:
return weight(_that.weight,_that.recordedAt,_that.notes);case _:
  return null;

}
}

}

/// @nodoc


class _BloodPressureRequest implements RecordHealthDataRequest {
  const _BloodPressureRequest({required this.systolic, required this.diastolic, this.heartRate, this.recordedAt, this.notes});
  

 final  int systolic;
 final  int diastolic;
 final  int? heartRate;
@override final  DateTime? recordedAt;
@override final  String? notes;

/// Create a copy of RecordHealthDataRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BloodPressureRequestCopyWith<_BloodPressureRequest> get copyWith => __$BloodPressureRequestCopyWithImpl<_BloodPressureRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodPressureRequest&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,systolic,diastolic,heartRate,recordedAt,notes);

@override
String toString() {
  return 'RecordHealthDataRequest.bloodPressure(systolic: $systolic, diastolic: $diastolic, heartRate: $heartRate, recordedAt: $recordedAt, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$BloodPressureRequestCopyWith<$Res> implements $RecordHealthDataRequestCopyWith<$Res> {
  factory _$BloodPressureRequestCopyWith(_BloodPressureRequest value, $Res Function(_BloodPressureRequest) _then) = __$BloodPressureRequestCopyWithImpl;
@override @useResult
$Res call({
 int systolic, int diastolic, int? heartRate, DateTime? recordedAt, String? notes
});




}
/// @nodoc
class __$BloodPressureRequestCopyWithImpl<$Res>
    implements _$BloodPressureRequestCopyWith<$Res> {
  __$BloodPressureRequestCopyWithImpl(this._self, this._then);

  final _BloodPressureRequest _self;
  final $Res Function(_BloodPressureRequest) _then;

/// Create a copy of RecordHealthDataRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? systolic = null,Object? diastolic = null,Object? heartRate = freezed,Object? recordedAt = freezed,Object? notes = freezed,}) {
  return _then(_BloodPressureRequest(
systolic: null == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int,diastolic: null == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _HeartRateRequest implements RecordHealthDataRequest {
  const _HeartRateRequest({required this.bpm, this.recordedAt, this.notes});
  

 final  int bpm;
@override final  DateTime? recordedAt;
@override final  String? notes;

/// Create a copy of RecordHealthDataRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeartRateRequestCopyWith<_HeartRateRequest> get copyWith => __$HeartRateRequestCopyWithImpl<_HeartRateRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeartRateRequest&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,bpm,recordedAt,notes);

@override
String toString() {
  return 'RecordHealthDataRequest.heartRate(bpm: $bpm, recordedAt: $recordedAt, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$HeartRateRequestCopyWith<$Res> implements $RecordHealthDataRequestCopyWith<$Res> {
  factory _$HeartRateRequestCopyWith(_HeartRateRequest value, $Res Function(_HeartRateRequest) _then) = __$HeartRateRequestCopyWithImpl;
@override @useResult
$Res call({
 int bpm, DateTime? recordedAt, String? notes
});




}
/// @nodoc
class __$HeartRateRequestCopyWithImpl<$Res>
    implements _$HeartRateRequestCopyWith<$Res> {
  __$HeartRateRequestCopyWithImpl(this._self, this._then);

  final _HeartRateRequest _self;
  final $Res Function(_HeartRateRequest) _then;

/// Create a copy of RecordHealthDataRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bpm = null,Object? recordedAt = freezed,Object? notes = freezed,}) {
  return _then(_HeartRateRequest(
bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _WeightRequest implements RecordHealthDataRequest {
  const _WeightRequest({required this.weight, this.recordedAt, this.notes});
  

 final  double weight;
@override final  DateTime? recordedAt;
@override final  String? notes;

/// Create a copy of RecordHealthDataRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeightRequestCopyWith<_WeightRequest> get copyWith => __$WeightRequestCopyWithImpl<_WeightRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeightRequest&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.notes, notes) || other.notes == notes));
}


@override
int get hashCode => Object.hash(runtimeType,weight,recordedAt,notes);

@override
String toString() {
  return 'RecordHealthDataRequest.weight(weight: $weight, recordedAt: $recordedAt, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$WeightRequestCopyWith<$Res> implements $RecordHealthDataRequestCopyWith<$Res> {
  factory _$WeightRequestCopyWith(_WeightRequest value, $Res Function(_WeightRequest) _then) = __$WeightRequestCopyWithImpl;
@override @useResult
$Res call({
 double weight, DateTime? recordedAt, String? notes
});




}
/// @nodoc
class __$WeightRequestCopyWithImpl<$Res>
    implements _$WeightRequestCopyWith<$Res> {
  __$WeightRequestCopyWithImpl(this._self, this._then);

  final _WeightRequest _self;
  final $Res Function(_WeightRequest) _then;

/// Create a copy of RecordHealthDataRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weight = null,Object? recordedAt = freezed,Object? notes = freezed,}) {
  return _then(_WeightRequest(
weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
