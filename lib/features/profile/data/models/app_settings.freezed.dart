// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

// 通知设置
 bool get notificationsEnabled; bool get medicationReminders; bool get healthDataReminders; bool get marketingNotifications;// 隐私设置
 bool get dataSharingConsent; bool get analyticsEnabled; bool get crashReportingEnabled;// 界面设置
 ThemeMode get themeMode;@JsonKey(fromJson: _localeFromJson, toJson: _localeToJson) Locale get locale; double get fontSize;// 健康数据设置
 bool get autoSyncDevices;@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) TimeOfDay get reminderTime; int get dataRetentionDays;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.medicationReminders, medicationReminders) || other.medicationReminders == medicationReminders)&&(identical(other.healthDataReminders, healthDataReminders) || other.healthDataReminders == healthDataReminders)&&(identical(other.marketingNotifications, marketingNotifications) || other.marketingNotifications == marketingNotifications)&&(identical(other.dataSharingConsent, dataSharingConsent) || other.dataSharingConsent == dataSharingConsent)&&(identical(other.analyticsEnabled, analyticsEnabled) || other.analyticsEnabled == analyticsEnabled)&&(identical(other.crashReportingEnabled, crashReportingEnabled) || other.crashReportingEnabled == crashReportingEnabled)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.autoSyncDevices, autoSyncDevices) || other.autoSyncDevices == autoSyncDevices)&&(identical(other.reminderTime, reminderTime) || other.reminderTime == reminderTime)&&(identical(other.dataRetentionDays, dataRetentionDays) || other.dataRetentionDays == dataRetentionDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notificationsEnabled,medicationReminders,healthDataReminders,marketingNotifications,dataSharingConsent,analyticsEnabled,crashReportingEnabled,themeMode,locale,fontSize,autoSyncDevices,reminderTime,dataRetentionDays);

@override
String toString() {
  return 'AppSettings(notificationsEnabled: $notificationsEnabled, medicationReminders: $medicationReminders, healthDataReminders: $healthDataReminders, marketingNotifications: $marketingNotifications, dataSharingConsent: $dataSharingConsent, analyticsEnabled: $analyticsEnabled, crashReportingEnabled: $crashReportingEnabled, themeMode: $themeMode, locale: $locale, fontSize: $fontSize, autoSyncDevices: $autoSyncDevices, reminderTime: $reminderTime, dataRetentionDays: $dataRetentionDays)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 bool notificationsEnabled, bool medicationReminders, bool healthDataReminders, bool marketingNotifications, bool dataSharingConsent, bool analyticsEnabled, bool crashReportingEnabled, ThemeMode themeMode,@JsonKey(fromJson: _localeFromJson, toJson: _localeToJson) Locale locale, double fontSize, bool autoSyncDevices,@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) TimeOfDay reminderTime, int dataRetentionDays
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notificationsEnabled = null,Object? medicationReminders = null,Object? healthDataReminders = null,Object? marketingNotifications = null,Object? dataSharingConsent = null,Object? analyticsEnabled = null,Object? crashReportingEnabled = null,Object? themeMode = null,Object? locale = null,Object? fontSize = null,Object? autoSyncDevices = null,Object? reminderTime = null,Object? dataRetentionDays = null,}) {
  return _then(_self.copyWith(
notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,medicationReminders: null == medicationReminders ? _self.medicationReminders : medicationReminders // ignore: cast_nullable_to_non_nullable
as bool,healthDataReminders: null == healthDataReminders ? _self.healthDataReminders : healthDataReminders // ignore: cast_nullable_to_non_nullable
as bool,marketingNotifications: null == marketingNotifications ? _self.marketingNotifications : marketingNotifications // ignore: cast_nullable_to_non_nullable
as bool,dataSharingConsent: null == dataSharingConsent ? _self.dataSharingConsent : dataSharingConsent // ignore: cast_nullable_to_non_nullable
as bool,analyticsEnabled: null == analyticsEnabled ? _self.analyticsEnabled : analyticsEnabled // ignore: cast_nullable_to_non_nullable
as bool,crashReportingEnabled: null == crashReportingEnabled ? _self.crashReportingEnabled : crashReportingEnabled // ignore: cast_nullable_to_non_nullable
as bool,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double,autoSyncDevices: null == autoSyncDevices ? _self.autoSyncDevices : autoSyncDevices // ignore: cast_nullable_to_non_nullable
as bool,reminderTime: null == reminderTime ? _self.reminderTime : reminderTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,dataRetentionDays: null == dataRetentionDays ? _self.dataRetentionDays : dataRetentionDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool notificationsEnabled,  bool medicationReminders,  bool healthDataReminders,  bool marketingNotifications,  bool dataSharingConsent,  bool analyticsEnabled,  bool crashReportingEnabled,  ThemeMode themeMode, @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)  Locale locale,  double fontSize,  bool autoSyncDevices, @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)  TimeOfDay reminderTime,  int dataRetentionDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.notificationsEnabled,_that.medicationReminders,_that.healthDataReminders,_that.marketingNotifications,_that.dataSharingConsent,_that.analyticsEnabled,_that.crashReportingEnabled,_that.themeMode,_that.locale,_that.fontSize,_that.autoSyncDevices,_that.reminderTime,_that.dataRetentionDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool notificationsEnabled,  bool medicationReminders,  bool healthDataReminders,  bool marketingNotifications,  bool dataSharingConsent,  bool analyticsEnabled,  bool crashReportingEnabled,  ThemeMode themeMode, @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)  Locale locale,  double fontSize,  bool autoSyncDevices, @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)  TimeOfDay reminderTime,  int dataRetentionDays)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.notificationsEnabled,_that.medicationReminders,_that.healthDataReminders,_that.marketingNotifications,_that.dataSharingConsent,_that.analyticsEnabled,_that.crashReportingEnabled,_that.themeMode,_that.locale,_that.fontSize,_that.autoSyncDevices,_that.reminderTime,_that.dataRetentionDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool notificationsEnabled,  bool medicationReminders,  bool healthDataReminders,  bool marketingNotifications,  bool dataSharingConsent,  bool analyticsEnabled,  bool crashReportingEnabled,  ThemeMode themeMode, @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)  Locale locale,  double fontSize,  bool autoSyncDevices, @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)  TimeOfDay reminderTime,  int dataRetentionDays)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.notificationsEnabled,_that.medicationReminders,_that.healthDataReminders,_that.marketingNotifications,_that.dataSharingConsent,_that.analyticsEnabled,_that.crashReportingEnabled,_that.themeMode,_that.locale,_that.fontSize,_that.autoSyncDevices,_that.reminderTime,_that.dataRetentionDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
  const _AppSettings({this.notificationsEnabled = true, this.medicationReminders = true, this.healthDataReminders = true, this.marketingNotifications = false, this.dataSharingConsent = true, this.analyticsEnabled = false, this.crashReportingEnabled = true, this.themeMode = ThemeMode.system, @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson) this.locale = const Locale('zh', 'CN'), this.fontSize = 1.0, this.autoSyncDevices = true, @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) this.reminderTime = const TimeOfDay(hour: 8, minute: 0), this.dataRetentionDays = 7});
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

// 通知设置
@override@JsonKey() final  bool notificationsEnabled;
@override@JsonKey() final  bool medicationReminders;
@override@JsonKey() final  bool healthDataReminders;
@override@JsonKey() final  bool marketingNotifications;
// 隐私设置
@override@JsonKey() final  bool dataSharingConsent;
@override@JsonKey() final  bool analyticsEnabled;
@override@JsonKey() final  bool crashReportingEnabled;
// 界面设置
@override@JsonKey() final  ThemeMode themeMode;
@override@JsonKey(fromJson: _localeFromJson, toJson: _localeToJson) final  Locale locale;
@override@JsonKey() final  double fontSize;
// 健康数据设置
@override@JsonKey() final  bool autoSyncDevices;
@override@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) final  TimeOfDay reminderTime;
@override@JsonKey() final  int dataRetentionDays;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.medicationReminders, medicationReminders) || other.medicationReminders == medicationReminders)&&(identical(other.healthDataReminders, healthDataReminders) || other.healthDataReminders == healthDataReminders)&&(identical(other.marketingNotifications, marketingNotifications) || other.marketingNotifications == marketingNotifications)&&(identical(other.dataSharingConsent, dataSharingConsent) || other.dataSharingConsent == dataSharingConsent)&&(identical(other.analyticsEnabled, analyticsEnabled) || other.analyticsEnabled == analyticsEnabled)&&(identical(other.crashReportingEnabled, crashReportingEnabled) || other.crashReportingEnabled == crashReportingEnabled)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.autoSyncDevices, autoSyncDevices) || other.autoSyncDevices == autoSyncDevices)&&(identical(other.reminderTime, reminderTime) || other.reminderTime == reminderTime)&&(identical(other.dataRetentionDays, dataRetentionDays) || other.dataRetentionDays == dataRetentionDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,notificationsEnabled,medicationReminders,healthDataReminders,marketingNotifications,dataSharingConsent,analyticsEnabled,crashReportingEnabled,themeMode,locale,fontSize,autoSyncDevices,reminderTime,dataRetentionDays);

@override
String toString() {
  return 'AppSettings(notificationsEnabled: $notificationsEnabled, medicationReminders: $medicationReminders, healthDataReminders: $healthDataReminders, marketingNotifications: $marketingNotifications, dataSharingConsent: $dataSharingConsent, analyticsEnabled: $analyticsEnabled, crashReportingEnabled: $crashReportingEnabled, themeMode: $themeMode, locale: $locale, fontSize: $fontSize, autoSyncDevices: $autoSyncDevices, reminderTime: $reminderTime, dataRetentionDays: $dataRetentionDays)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool notificationsEnabled, bool medicationReminders, bool healthDataReminders, bool marketingNotifications, bool dataSharingConsent, bool analyticsEnabled, bool crashReportingEnabled, ThemeMode themeMode,@JsonKey(fromJson: _localeFromJson, toJson: _localeToJson) Locale locale, double fontSize, bool autoSyncDevices,@JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson) TimeOfDay reminderTime, int dataRetentionDays
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notificationsEnabled = null,Object? medicationReminders = null,Object? healthDataReminders = null,Object? marketingNotifications = null,Object? dataSharingConsent = null,Object? analyticsEnabled = null,Object? crashReportingEnabled = null,Object? themeMode = null,Object? locale = null,Object? fontSize = null,Object? autoSyncDevices = null,Object? reminderTime = null,Object? dataRetentionDays = null,}) {
  return _then(_AppSettings(
notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,medicationReminders: null == medicationReminders ? _self.medicationReminders : medicationReminders // ignore: cast_nullable_to_non_nullable
as bool,healthDataReminders: null == healthDataReminders ? _self.healthDataReminders : healthDataReminders // ignore: cast_nullable_to_non_nullable
as bool,marketingNotifications: null == marketingNotifications ? _self.marketingNotifications : marketingNotifications // ignore: cast_nullable_to_non_nullable
as bool,dataSharingConsent: null == dataSharingConsent ? _self.dataSharingConsent : dataSharingConsent // ignore: cast_nullable_to_non_nullable
as bool,analyticsEnabled: null == analyticsEnabled ? _self.analyticsEnabled : analyticsEnabled // ignore: cast_nullable_to_non_nullable
as bool,crashReportingEnabled: null == crashReportingEnabled ? _self.crashReportingEnabled : crashReportingEnabled // ignore: cast_nullable_to_non_nullable
as bool,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double,autoSyncDevices: null == autoSyncDevices ? _self.autoSyncDevices : autoSyncDevices // ignore: cast_nullable_to_non_nullable
as bool,reminderTime: null == reminderTime ? _self.reminderTime : reminderTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,dataRetentionDays: null == dataRetentionDays ? _self.dataRetentionDays : dataRetentionDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
