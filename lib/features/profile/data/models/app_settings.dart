import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

/// 应用设置
@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    // 通知设置
    @Default(true) bool notificationsEnabled,
    @Default(true) bool medicationReminders,
    @Default(true) bool healthDataReminders,
    @Default(false) bool marketingNotifications,

    // 隐私设置
    @Default(true) bool dataSharingConsent,
    @Default(false) bool analyticsEnabled,
    @Default(true) bool crashReportingEnabled,

    // 界面设置
    @Default(ThemeMode.system) ThemeMode themeMode,
    @JsonKey(fromJson: _localeFromJson, toJson: _localeToJson)
    @Default(Locale('zh', 'CN')) Locale locale,
    @Default(1.0) double fontSize,

    // 健康数据设置
    @Default(true) bool autoSyncDevices,
    @JsonKey(fromJson: _timeOfDayFromJson, toJson: _timeOfDayToJson)
    @Default(TimeOfDay(hour: 8, minute: 0)) TimeOfDay reminderTime,
    @Default(7) int dataRetentionDays,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}

// 自定义序列化方法
Locale _localeFromJson(String json) {
  final parts = json.split('_');
  if (parts.length == 2) {
    return Locale(parts[0], parts[1]);
  }
  return const Locale('zh', 'CN');
}

String _localeToJson(Locale locale) {
  return '${locale.languageCode}_${locale.countryCode}';
}

TimeOfDay _timeOfDayFromJson(String json) {
  final parts = json.split(':');
  if (parts.length == 2) {
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
  return const TimeOfDay(hour: 8, minute: 0);
}

String _timeOfDayToJson(TimeOfDay time) {
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}
