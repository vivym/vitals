// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
  medicationReminders: json['medicationReminders'] as bool? ?? true,
  healthDataReminders: json['healthDataReminders'] as bool? ?? true,
  marketingNotifications: json['marketingNotifications'] as bool? ?? false,
  dataSharingConsent: json['dataSharingConsent'] as bool? ?? true,
  analyticsEnabled: json['analyticsEnabled'] as bool? ?? false,
  crashReportingEnabled: json['crashReportingEnabled'] as bool? ?? true,
  themeMode:
      $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
      ThemeMode.system,
  locale: json['locale'] == null
      ? const Locale('zh', 'CN')
      : _localeFromJson(json['locale'] as String),
  fontSize: (json['fontSize'] as num?)?.toDouble() ?? 1.0,
  autoSyncDevices: json['autoSyncDevices'] as bool? ?? true,
  reminderTime: json['reminderTime'] == null
      ? const TimeOfDay(hour: 8, minute: 0)
      : _timeOfDayFromJson(json['reminderTime'] as String),
  dataRetentionDays: (json['dataRetentionDays'] as num?)?.toInt() ?? 7,
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'notificationsEnabled': instance.notificationsEnabled,
      'medicationReminders': instance.medicationReminders,
      'healthDataReminders': instance.healthDataReminders,
      'marketingNotifications': instance.marketingNotifications,
      'dataSharingConsent': instance.dataSharingConsent,
      'analyticsEnabled': instance.analyticsEnabled,
      'crashReportingEnabled': instance.crashReportingEnabled,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
      'locale': _localeToJson(instance.locale),
      'fontSize': instance.fontSize,
      'autoSyncDevices': instance.autoSyncDevices,
      'reminderTime': _timeOfDayToJson(instance.reminderTime),
      'dataRetentionDays': instance.dataRetentionDays,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
