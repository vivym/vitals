// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_entry_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataEntryState {

 int? get systolic; int? get diastolic; int? get heartRate; double? get weight; DateTime? get recordedAt; String? get notes; Map<String, String> get validationErrors; bool get isSubmitting;
/// Create a copy of DataEntryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataEntryStateCopyWith<DataEntryState> get copyWith => _$DataEntryStateCopyWithImpl<DataEntryState>(this as DataEntryState, _$identity);

  /// Serializes this DataEntryState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataEntryState&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.validationErrors, validationErrors)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,systolic,diastolic,heartRate,weight,recordedAt,notes,const DeepCollectionEquality().hash(validationErrors),isSubmitting);

@override
String toString() {
  return 'DataEntryState(systolic: $systolic, diastolic: $diastolic, heartRate: $heartRate, weight: $weight, recordedAt: $recordedAt, notes: $notes, validationErrors: $validationErrors, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class $DataEntryStateCopyWith<$Res>  {
  factory $DataEntryStateCopyWith(DataEntryState value, $Res Function(DataEntryState) _then) = _$DataEntryStateCopyWithImpl;
@useResult
$Res call({
 int? systolic, int? diastolic, int? heartRate, double? weight, DateTime? recordedAt, String? notes, Map<String, String> validationErrors, bool isSubmitting
});




}
/// @nodoc
class _$DataEntryStateCopyWithImpl<$Res>
    implements $DataEntryStateCopyWith<$Res> {
  _$DataEntryStateCopyWithImpl(this._self, this._then);

  final DataEntryState _self;
  final $Res Function(DataEntryState) _then;

/// Create a copy of DataEntryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? systolic = freezed,Object? diastolic = freezed,Object? heartRate = freezed,Object? weight = freezed,Object? recordedAt = freezed,Object? notes = freezed,Object? validationErrors = null,Object? isSubmitting = null,}) {
  return _then(_self.copyWith(
systolic: freezed == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int?,diastolic: freezed == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,validationErrors: null == validationErrors ? _self.validationErrors : validationErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DataEntryState].
extension DataEntryStatePatterns on DataEntryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataEntryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataEntryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataEntryState value)  $default,){
final _that = this;
switch (_that) {
case _DataEntryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataEntryState value)?  $default,){
final _that = this;
switch (_that) {
case _DataEntryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? systolic,  int? diastolic,  int? heartRate,  double? weight,  DateTime? recordedAt,  String? notes,  Map<String, String> validationErrors,  bool isSubmitting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataEntryState() when $default != null:
return $default(_that.systolic,_that.diastolic,_that.heartRate,_that.weight,_that.recordedAt,_that.notes,_that.validationErrors,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? systolic,  int? diastolic,  int? heartRate,  double? weight,  DateTime? recordedAt,  String? notes,  Map<String, String> validationErrors,  bool isSubmitting)  $default,) {final _that = this;
switch (_that) {
case _DataEntryState():
return $default(_that.systolic,_that.diastolic,_that.heartRate,_that.weight,_that.recordedAt,_that.notes,_that.validationErrors,_that.isSubmitting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? systolic,  int? diastolic,  int? heartRate,  double? weight,  DateTime? recordedAt,  String? notes,  Map<String, String> validationErrors,  bool isSubmitting)?  $default,) {final _that = this;
switch (_that) {
case _DataEntryState() when $default != null:
return $default(_that.systolic,_that.diastolic,_that.heartRate,_that.weight,_that.recordedAt,_that.notes,_that.validationErrors,_that.isSubmitting);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DataEntryState extends DataEntryState {
  const _DataEntryState({this.systolic, this.diastolic, this.heartRate, this.weight, this.recordedAt, this.notes, final  Map<String, String> validationErrors = const {}, this.isSubmitting = false}): _validationErrors = validationErrors,super._();
  factory _DataEntryState.fromJson(Map<String, dynamic> json) => _$DataEntryStateFromJson(json);

@override final  int? systolic;
@override final  int? diastolic;
@override final  int? heartRate;
@override final  double? weight;
@override final  DateTime? recordedAt;
@override final  String? notes;
 final  Map<String, String> _validationErrors;
@override@JsonKey() Map<String, String> get validationErrors {
  if (_validationErrors is EqualUnmodifiableMapView) return _validationErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_validationErrors);
}

@override@JsonKey() final  bool isSubmitting;

/// Create a copy of DataEntryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataEntryStateCopyWith<_DataEntryState> get copyWith => __$DataEntryStateCopyWithImpl<_DataEntryState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataEntryStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataEntryState&&(identical(other.systolic, systolic) || other.systolic == systolic)&&(identical(other.diastolic, diastolic) || other.diastolic == diastolic)&&(identical(other.heartRate, heartRate) || other.heartRate == heartRate)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._validationErrors, _validationErrors)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,systolic,diastolic,heartRate,weight,recordedAt,notes,const DeepCollectionEquality().hash(_validationErrors),isSubmitting);

@override
String toString() {
  return 'DataEntryState(systolic: $systolic, diastolic: $diastolic, heartRate: $heartRate, weight: $weight, recordedAt: $recordedAt, notes: $notes, validationErrors: $validationErrors, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class _$DataEntryStateCopyWith<$Res> implements $DataEntryStateCopyWith<$Res> {
  factory _$DataEntryStateCopyWith(_DataEntryState value, $Res Function(_DataEntryState) _then) = __$DataEntryStateCopyWithImpl;
@override @useResult
$Res call({
 int? systolic, int? diastolic, int? heartRate, double? weight, DateTime? recordedAt, String? notes, Map<String, String> validationErrors, bool isSubmitting
});




}
/// @nodoc
class __$DataEntryStateCopyWithImpl<$Res>
    implements _$DataEntryStateCopyWith<$Res> {
  __$DataEntryStateCopyWithImpl(this._self, this._then);

  final _DataEntryState _self;
  final $Res Function(_DataEntryState) _then;

/// Create a copy of DataEntryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? systolic = freezed,Object? diastolic = freezed,Object? heartRate = freezed,Object? weight = freezed,Object? recordedAt = freezed,Object? notes = freezed,Object? validationErrors = null,Object? isSubmitting = null,}) {
  return _then(_DataEntryState(
systolic: freezed == systolic ? _self.systolic : systolic // ignore: cast_nullable_to_non_nullable
as int?,diastolic: freezed == diastolic ? _self.diastolic : diastolic // ignore: cast_nullable_to_non_nullable
as int?,heartRate: freezed == heartRate ? _self.heartRate : heartRate // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,validationErrors: null == validationErrors ? _self._validationErrors : validationErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
