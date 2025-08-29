// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MedicationReminder {

 String get id; String get patientId; String get medicationName; String get dosage;@JsonKey(fromJson: _timeOfDayListFromJson, toJson: _timeOfDayListToJson) List<TimeOfDay> get scheduledTimes; List<int> get weekdays;// 1-7 表示周一到周日
 DateTime? get startDate; DateTime? get endDate; bool get isActive; String? get notes;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of MedicationReminder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MedicationReminderCopyWith<MedicationReminder> get copyWith => _$MedicationReminderCopyWithImpl<MedicationReminder>(this as MedicationReminder, _$identity);

  /// Serializes this MedicationReminder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MedicationReminder&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&const DeepCollectionEquality().equals(other.scheduledTimes, scheduledTimes)&&const DeepCollectionEquality().equals(other.weekdays, weekdays)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,medicationName,dosage,const DeepCollectionEquality().hash(scheduledTimes),const DeepCollectionEquality().hash(weekdays),startDate,endDate,isActive,notes,createdAt);

@override
String toString() {
  return 'MedicationReminder(id: $id, patientId: $patientId, medicationName: $medicationName, dosage: $dosage, scheduledTimes: $scheduledTimes, weekdays: $weekdays, startDate: $startDate, endDate: $endDate, isActive: $isActive, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MedicationReminderCopyWith<$Res>  {
  factory $MedicationReminderCopyWith(MedicationReminder value, $Res Function(MedicationReminder) _then) = _$MedicationReminderCopyWithImpl;
@useResult
$Res call({
 String id, String patientId, String medicationName, String dosage,@JsonKey(fromJson: _timeOfDayListFromJson, toJson: _timeOfDayListToJson) List<TimeOfDay> scheduledTimes, List<int> weekdays, DateTime? startDate, DateTime? endDate, bool isActive, String? notes,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$MedicationReminderCopyWithImpl<$Res>
    implements $MedicationReminderCopyWith<$Res> {
  _$MedicationReminderCopyWithImpl(this._self, this._then);

  final MedicationReminder _self;
  final $Res Function(MedicationReminder) _then;

/// Create a copy of MedicationReminder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? medicationName = null,Object? dosage = null,Object? scheduledTimes = null,Object? weekdays = null,Object? startDate = freezed,Object? endDate = freezed,Object? isActive = null,Object? notes = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,scheduledTimes: null == scheduledTimes ? _self.scheduledTimes : scheduledTimes // ignore: cast_nullable_to_non_nullable
as List<TimeOfDay>,weekdays: null == weekdays ? _self.weekdays : weekdays // ignore: cast_nullable_to_non_nullable
as List<int>,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MedicationReminder].
extension MedicationReminderPatterns on MedicationReminder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MedicationReminder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MedicationReminder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MedicationReminder value)  $default,){
final _that = this;
switch (_that) {
case _MedicationReminder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MedicationReminder value)?  $default,){
final _that = this;
switch (_that) {
case _MedicationReminder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String patientId,  String medicationName,  String dosage, @JsonKey(fromJson: _timeOfDayListFromJson, toJson: _timeOfDayListToJson)  List<TimeOfDay> scheduledTimes,  List<int> weekdays,  DateTime? startDate,  DateTime? endDate,  bool isActive,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MedicationReminder() when $default != null:
return $default(_that.id,_that.patientId,_that.medicationName,_that.dosage,_that.scheduledTimes,_that.weekdays,_that.startDate,_that.endDate,_that.isActive,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String patientId,  String medicationName,  String dosage, @JsonKey(fromJson: _timeOfDayListFromJson, toJson: _timeOfDayListToJson)  List<TimeOfDay> scheduledTimes,  List<int> weekdays,  DateTime? startDate,  DateTime? endDate,  bool isActive,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _MedicationReminder():
return $default(_that.id,_that.patientId,_that.medicationName,_that.dosage,_that.scheduledTimes,_that.weekdays,_that.startDate,_that.endDate,_that.isActive,_that.notes,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String patientId,  String medicationName,  String dosage, @JsonKey(fromJson: _timeOfDayListFromJson, toJson: _timeOfDayListToJson)  List<TimeOfDay> scheduledTimes,  List<int> weekdays,  DateTime? startDate,  DateTime? endDate,  bool isActive,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MedicationReminder() when $default != null:
return $default(_that.id,_that.patientId,_that.medicationName,_that.dosage,_that.scheduledTimes,_that.weekdays,_that.startDate,_that.endDate,_that.isActive,_that.notes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MedicationReminder extends MedicationReminder {
  const _MedicationReminder({required this.id, required this.patientId, required this.medicationName, required this.dosage, @JsonKey(fromJson: _timeOfDayListFromJson, toJson: _timeOfDayListToJson) required final  List<TimeOfDay> scheduledTimes, required final  List<int> weekdays, this.startDate, this.endDate, this.isActive = true, this.notes, @JsonKey(name: 'created_at') this.createdAt}): _scheduledTimes = scheduledTimes,_weekdays = weekdays,super._();
  factory _MedicationReminder.fromJson(Map<String, dynamic> json) => _$MedicationReminderFromJson(json);

@override final  String id;
@override final  String patientId;
@override final  String medicationName;
@override final  String dosage;
 final  List<TimeOfDay> _scheduledTimes;
@override@JsonKey(fromJson: _timeOfDayListFromJson, toJson: _timeOfDayListToJson) List<TimeOfDay> get scheduledTimes {
  if (_scheduledTimes is EqualUnmodifiableListView) return _scheduledTimes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scheduledTimes);
}

 final  List<int> _weekdays;
@override List<int> get weekdays {
  if (_weekdays is EqualUnmodifiableListView) return _weekdays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekdays);
}

// 1-7 表示周一到周日
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override@JsonKey() final  bool isActive;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of MedicationReminder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MedicationReminderCopyWith<_MedicationReminder> get copyWith => __$MedicationReminderCopyWithImpl<_MedicationReminder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MedicationReminderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MedicationReminder&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&const DeepCollectionEquality().equals(other._scheduledTimes, _scheduledTimes)&&const DeepCollectionEquality().equals(other._weekdays, _weekdays)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,medicationName,dosage,const DeepCollectionEquality().hash(_scheduledTimes),const DeepCollectionEquality().hash(_weekdays),startDate,endDate,isActive,notes,createdAt);

@override
String toString() {
  return 'MedicationReminder(id: $id, patientId: $patientId, medicationName: $medicationName, dosage: $dosage, scheduledTimes: $scheduledTimes, weekdays: $weekdays, startDate: $startDate, endDate: $endDate, isActive: $isActive, notes: $notes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MedicationReminderCopyWith<$Res> implements $MedicationReminderCopyWith<$Res> {
  factory _$MedicationReminderCopyWith(_MedicationReminder value, $Res Function(_MedicationReminder) _then) = __$MedicationReminderCopyWithImpl;
@override @useResult
$Res call({
 String id, String patientId, String medicationName, String dosage,@JsonKey(fromJson: _timeOfDayListFromJson, toJson: _timeOfDayListToJson) List<TimeOfDay> scheduledTimes, List<int> weekdays, DateTime? startDate, DateTime? endDate, bool isActive, String? notes,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$MedicationReminderCopyWithImpl<$Res>
    implements _$MedicationReminderCopyWith<$Res> {
  __$MedicationReminderCopyWithImpl(this._self, this._then);

  final _MedicationReminder _self;
  final $Res Function(_MedicationReminder) _then;

/// Create a copy of MedicationReminder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? medicationName = null,Object? dosage = null,Object? scheduledTimes = null,Object? weekdays = null,Object? startDate = freezed,Object? endDate = freezed,Object? isActive = null,Object? notes = freezed,Object? createdAt = freezed,}) {
  return _then(_MedicationReminder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,scheduledTimes: null == scheduledTimes ? _self._scheduledTimes : scheduledTimes // ignore: cast_nullable_to_non_nullable
as List<TimeOfDay>,weekdays: null == weekdays ? _self._weekdays : weekdays // ignore: cast_nullable_to_non_nullable
as List<int>,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
