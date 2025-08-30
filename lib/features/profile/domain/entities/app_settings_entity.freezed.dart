// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppSettingsEntity {

 AppThemeMode get themeMode; Language get language; bool get notificationsEnabled; bool get healthDataNotifications; bool get medicationReminders; bool get deviceConnectionAlerts; SyncFrequency get dataSyncFrequency; bool get autoBackup; bool get biometricAuthEnabled; bool get crashReportingEnabled; bool get analyticsEnabled; DateTime? get lastBackupAt; DateTime? get updatedAt;
/// Create a copy of AppSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsEntityCopyWith<AppSettingsEntity> get copyWith => _$AppSettingsEntityCopyWithImpl<AppSettingsEntity>(this as AppSettingsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettingsEntity&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.language, language) || other.language == language)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.healthDataNotifications, healthDataNotifications) || other.healthDataNotifications == healthDataNotifications)&&(identical(other.medicationReminders, medicationReminders) || other.medicationReminders == medicationReminders)&&(identical(other.deviceConnectionAlerts, deviceConnectionAlerts) || other.deviceConnectionAlerts == deviceConnectionAlerts)&&(identical(other.dataSyncFrequency, dataSyncFrequency) || other.dataSyncFrequency == dataSyncFrequency)&&(identical(other.autoBackup, autoBackup) || other.autoBackup == autoBackup)&&(identical(other.biometricAuthEnabled, biometricAuthEnabled) || other.biometricAuthEnabled == biometricAuthEnabled)&&(identical(other.crashReportingEnabled, crashReportingEnabled) || other.crashReportingEnabled == crashReportingEnabled)&&(identical(other.analyticsEnabled, analyticsEnabled) || other.analyticsEnabled == analyticsEnabled)&&(identical(other.lastBackupAt, lastBackupAt) || other.lastBackupAt == lastBackupAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,language,notificationsEnabled,healthDataNotifications,medicationReminders,deviceConnectionAlerts,dataSyncFrequency,autoBackup,biometricAuthEnabled,crashReportingEnabled,analyticsEnabled,lastBackupAt,updatedAt);

@override
String toString() {
  return 'AppSettingsEntity(themeMode: $themeMode, language: $language, notificationsEnabled: $notificationsEnabled, healthDataNotifications: $healthDataNotifications, medicationReminders: $medicationReminders, deviceConnectionAlerts: $deviceConnectionAlerts, dataSyncFrequency: $dataSyncFrequency, autoBackup: $autoBackup, biometricAuthEnabled: $biometricAuthEnabled, crashReportingEnabled: $crashReportingEnabled, analyticsEnabled: $analyticsEnabled, lastBackupAt: $lastBackupAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AppSettingsEntityCopyWith<$Res>  {
  factory $AppSettingsEntityCopyWith(AppSettingsEntity value, $Res Function(AppSettingsEntity) _then) = _$AppSettingsEntityCopyWithImpl;
@useResult
$Res call({
 AppThemeMode themeMode, Language language, bool notificationsEnabled, bool healthDataNotifications, bool medicationReminders, bool deviceConnectionAlerts, SyncFrequency dataSyncFrequency, bool autoBackup, bool biometricAuthEnabled, bool crashReportingEnabled, bool analyticsEnabled, DateTime? lastBackupAt, DateTime? updatedAt
});




}
/// @nodoc
class _$AppSettingsEntityCopyWithImpl<$Res>
    implements $AppSettingsEntityCopyWith<$Res> {
  _$AppSettingsEntityCopyWithImpl(this._self, this._then);

  final AppSettingsEntity _self;
  final $Res Function(AppSettingsEntity) _then;

/// Create a copy of AppSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? language = null,Object? notificationsEnabled = null,Object? healthDataNotifications = null,Object? medicationReminders = null,Object? deviceConnectionAlerts = null,Object? dataSyncFrequency = null,Object? autoBackup = null,Object? biometricAuthEnabled = null,Object? crashReportingEnabled = null,Object? analyticsEnabled = null,Object? lastBackupAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,healthDataNotifications: null == healthDataNotifications ? _self.healthDataNotifications : healthDataNotifications // ignore: cast_nullable_to_non_nullable
as bool,medicationReminders: null == medicationReminders ? _self.medicationReminders : medicationReminders // ignore: cast_nullable_to_non_nullable
as bool,deviceConnectionAlerts: null == deviceConnectionAlerts ? _self.deviceConnectionAlerts : deviceConnectionAlerts // ignore: cast_nullable_to_non_nullable
as bool,dataSyncFrequency: null == dataSyncFrequency ? _self.dataSyncFrequency : dataSyncFrequency // ignore: cast_nullable_to_non_nullable
as SyncFrequency,autoBackup: null == autoBackup ? _self.autoBackup : autoBackup // ignore: cast_nullable_to_non_nullable
as bool,biometricAuthEnabled: null == biometricAuthEnabled ? _self.biometricAuthEnabled : biometricAuthEnabled // ignore: cast_nullable_to_non_nullable
as bool,crashReportingEnabled: null == crashReportingEnabled ? _self.crashReportingEnabled : crashReportingEnabled // ignore: cast_nullable_to_non_nullable
as bool,analyticsEnabled: null == analyticsEnabled ? _self.analyticsEnabled : analyticsEnabled // ignore: cast_nullable_to_non_nullable
as bool,lastBackupAt: freezed == lastBackupAt ? _self.lastBackupAt : lastBackupAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettingsEntity].
extension AppSettingsEntityPatterns on AppSettingsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettingsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettingsEntity value)  $default,){
final _that = this;
switch (_that) {
case _AppSettingsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettingsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppThemeMode themeMode,  Language language,  bool notificationsEnabled,  bool healthDataNotifications,  bool medicationReminders,  bool deviceConnectionAlerts,  SyncFrequency dataSyncFrequency,  bool autoBackup,  bool biometricAuthEnabled,  bool crashReportingEnabled,  bool analyticsEnabled,  DateTime? lastBackupAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettingsEntity() when $default != null:
return $default(_that.themeMode,_that.language,_that.notificationsEnabled,_that.healthDataNotifications,_that.medicationReminders,_that.deviceConnectionAlerts,_that.dataSyncFrequency,_that.autoBackup,_that.biometricAuthEnabled,_that.crashReportingEnabled,_that.analyticsEnabled,_that.lastBackupAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppThemeMode themeMode,  Language language,  bool notificationsEnabled,  bool healthDataNotifications,  bool medicationReminders,  bool deviceConnectionAlerts,  SyncFrequency dataSyncFrequency,  bool autoBackup,  bool biometricAuthEnabled,  bool crashReportingEnabled,  bool analyticsEnabled,  DateTime? lastBackupAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AppSettingsEntity():
return $default(_that.themeMode,_that.language,_that.notificationsEnabled,_that.healthDataNotifications,_that.medicationReminders,_that.deviceConnectionAlerts,_that.dataSyncFrequency,_that.autoBackup,_that.biometricAuthEnabled,_that.crashReportingEnabled,_that.analyticsEnabled,_that.lastBackupAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppThemeMode themeMode,  Language language,  bool notificationsEnabled,  bool healthDataNotifications,  bool medicationReminders,  bool deviceConnectionAlerts,  SyncFrequency dataSyncFrequency,  bool autoBackup,  bool biometricAuthEnabled,  bool crashReportingEnabled,  bool analyticsEnabled,  DateTime? lastBackupAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AppSettingsEntity() when $default != null:
return $default(_that.themeMode,_that.language,_that.notificationsEnabled,_that.healthDataNotifications,_that.medicationReminders,_that.deviceConnectionAlerts,_that.dataSyncFrequency,_that.autoBackup,_that.biometricAuthEnabled,_that.crashReportingEnabled,_that.analyticsEnabled,_that.lastBackupAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _AppSettingsEntity extends AppSettingsEntity {
  const _AppSettingsEntity({this.themeMode = AppThemeMode.system, this.language = Language.system, this.notificationsEnabled = true, this.healthDataNotifications = true, this.medicationReminders = true, this.deviceConnectionAlerts = true, this.dataSyncFrequency = SyncFrequency.daily, this.autoBackup = true, this.biometricAuthEnabled = false, this.crashReportingEnabled = true, this.analyticsEnabled = true, this.lastBackupAt, this.updatedAt}): super._();
  

@override@JsonKey() final  AppThemeMode themeMode;
@override@JsonKey() final  Language language;
@override@JsonKey() final  bool notificationsEnabled;
@override@JsonKey() final  bool healthDataNotifications;
@override@JsonKey() final  bool medicationReminders;
@override@JsonKey() final  bool deviceConnectionAlerts;
@override@JsonKey() final  SyncFrequency dataSyncFrequency;
@override@JsonKey() final  bool autoBackup;
@override@JsonKey() final  bool biometricAuthEnabled;
@override@JsonKey() final  bool crashReportingEnabled;
@override@JsonKey() final  bool analyticsEnabled;
@override final  DateTime? lastBackupAt;
@override final  DateTime? updatedAt;

/// Create a copy of AppSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsEntityCopyWith<_AppSettingsEntity> get copyWith => __$AppSettingsEntityCopyWithImpl<_AppSettingsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettingsEntity&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.language, language) || other.language == language)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.healthDataNotifications, healthDataNotifications) || other.healthDataNotifications == healthDataNotifications)&&(identical(other.medicationReminders, medicationReminders) || other.medicationReminders == medicationReminders)&&(identical(other.deviceConnectionAlerts, deviceConnectionAlerts) || other.deviceConnectionAlerts == deviceConnectionAlerts)&&(identical(other.dataSyncFrequency, dataSyncFrequency) || other.dataSyncFrequency == dataSyncFrequency)&&(identical(other.autoBackup, autoBackup) || other.autoBackup == autoBackup)&&(identical(other.biometricAuthEnabled, biometricAuthEnabled) || other.biometricAuthEnabled == biometricAuthEnabled)&&(identical(other.crashReportingEnabled, crashReportingEnabled) || other.crashReportingEnabled == crashReportingEnabled)&&(identical(other.analyticsEnabled, analyticsEnabled) || other.analyticsEnabled == analyticsEnabled)&&(identical(other.lastBackupAt, lastBackupAt) || other.lastBackupAt == lastBackupAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,themeMode,language,notificationsEnabled,healthDataNotifications,medicationReminders,deviceConnectionAlerts,dataSyncFrequency,autoBackup,biometricAuthEnabled,crashReportingEnabled,analyticsEnabled,lastBackupAt,updatedAt);

@override
String toString() {
  return 'AppSettingsEntity(themeMode: $themeMode, language: $language, notificationsEnabled: $notificationsEnabled, healthDataNotifications: $healthDataNotifications, medicationReminders: $medicationReminders, deviceConnectionAlerts: $deviceConnectionAlerts, dataSyncFrequency: $dataSyncFrequency, autoBackup: $autoBackup, biometricAuthEnabled: $biometricAuthEnabled, crashReportingEnabled: $crashReportingEnabled, analyticsEnabled: $analyticsEnabled, lastBackupAt: $lastBackupAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsEntityCopyWith<$Res> implements $AppSettingsEntityCopyWith<$Res> {
  factory _$AppSettingsEntityCopyWith(_AppSettingsEntity value, $Res Function(_AppSettingsEntity) _then) = __$AppSettingsEntityCopyWithImpl;
@override @useResult
$Res call({
 AppThemeMode themeMode, Language language, bool notificationsEnabled, bool healthDataNotifications, bool medicationReminders, bool deviceConnectionAlerts, SyncFrequency dataSyncFrequency, bool autoBackup, bool biometricAuthEnabled, bool crashReportingEnabled, bool analyticsEnabled, DateTime? lastBackupAt, DateTime? updatedAt
});




}
/// @nodoc
class __$AppSettingsEntityCopyWithImpl<$Res>
    implements _$AppSettingsEntityCopyWith<$Res> {
  __$AppSettingsEntityCopyWithImpl(this._self, this._then);

  final _AppSettingsEntity _self;
  final $Res Function(_AppSettingsEntity) _then;

/// Create a copy of AppSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? language = null,Object? notificationsEnabled = null,Object? healthDataNotifications = null,Object? medicationReminders = null,Object? deviceConnectionAlerts = null,Object? dataSyncFrequency = null,Object? autoBackup = null,Object? biometricAuthEnabled = null,Object? crashReportingEnabled = null,Object? analyticsEnabled = null,Object? lastBackupAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AppSettingsEntity(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Language,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,healthDataNotifications: null == healthDataNotifications ? _self.healthDataNotifications : healthDataNotifications // ignore: cast_nullable_to_non_nullable
as bool,medicationReminders: null == medicationReminders ? _self.medicationReminders : medicationReminders // ignore: cast_nullable_to_non_nullable
as bool,deviceConnectionAlerts: null == deviceConnectionAlerts ? _self.deviceConnectionAlerts : deviceConnectionAlerts // ignore: cast_nullable_to_non_nullable
as bool,dataSyncFrequency: null == dataSyncFrequency ? _self.dataSyncFrequency : dataSyncFrequency // ignore: cast_nullable_to_non_nullable
as SyncFrequency,autoBackup: null == autoBackup ? _self.autoBackup : autoBackup // ignore: cast_nullable_to_non_nullable
as bool,biometricAuthEnabled: null == biometricAuthEnabled ? _self.biometricAuthEnabled : biometricAuthEnabled // ignore: cast_nullable_to_non_nullable
as bool,crashReportingEnabled: null == crashReportingEnabled ? _self.crashReportingEnabled : crashReportingEnabled // ignore: cast_nullable_to_non_nullable
as bool,analyticsEnabled: null == analyticsEnabled ? _self.analyticsEnabled : analyticsEnabled // ignore: cast_nullable_to_non_nullable
as bool,lastBackupAt: freezed == lastBackupAt ? _self.lastBackupAt : lastBackupAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
