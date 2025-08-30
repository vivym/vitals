import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_entity.freezed.dart';

/// 主题模式枚举（Domain层独立定义）
enum AppThemeMode {
  system,
  light,
  dark;

  String get label {
    switch (this) {
      case AppThemeMode.system:
        return '跟随系统';
      case AppThemeMode.light:
        return '浅色模式';
      case AppThemeMode.dark:
        return '深色模式';
    }
  }
}

/// 语言设置枚举
enum Language {
  system,
  chinese,
  english;

  String get label {
    switch (this) {
      case Language.system:
        return '跟随系统';
      case Language.chinese:
        return '中文';
      case Language.english:
        return 'English';
    }
  }

  String get code {
    switch (this) {
      case Language.system:
        return 'system';
      case Language.chinese:
        return 'zh';
      case Language.english:
        return 'en';
    }
  }
}

/// 数据同步频率枚举
enum SyncFrequency {
  manual,
  realtime,
  hourly,
  daily;

  String get label {
    switch (this) {
      case SyncFrequency.manual:
        return '手动同步';
      case SyncFrequency.realtime:
        return '实时同步';
      case SyncFrequency.hourly:
        return '每小时';
      case SyncFrequency.daily:
        return '每天';
    }
  }
}

/// 应用设置领域实体
@freezed
abstract class AppSettingsEntity with _$AppSettingsEntity {
  const factory AppSettingsEntity({
    @Default(AppThemeMode.system) AppThemeMode themeMode,
    @Default(Language.system) Language language,
    @Default(true) bool notificationsEnabled,
    @Default(true) bool healthDataNotifications,
    @Default(true) bool medicationReminders,
    @Default(true) bool deviceConnectionAlerts,
    @Default(SyncFrequency.daily) SyncFrequency dataSyncFrequency,
    @Default(true) bool autoBackup,
    @Default(false) bool biometricAuthEnabled,
    @Default(true) bool crashReportingEnabled,
    @Default(true) bool analyticsEnabled,
    DateTime? lastBackupAt,
    DateTime? updatedAt,
  }) = _AppSettingsEntity;

  const AppSettingsEntity._();

  /// 是否启用了任何通知
  bool get hasAnyNotificationEnabled =>
      notificationsEnabled &&
      (healthDataNotifications || medicationReminders || deviceConnectionAlerts);

  /// 是否启用了隐私保护功能
  bool get hasPrivacyFeaturesEnabled =>
      biometricAuthEnabled || !analyticsEnabled || !crashReportingEnabled;

  /// 获取数据同步描述
  String get syncDescription {
    if (dataSyncFrequency == SyncFrequency.manual) {
      return '需要手动同步数据';
    }
    return '数据将${dataSyncFrequency.label}同步';
  }

  /// 获取备份状态描述
  String get backupStatusDescription {
    if (!autoBackup) return '未启用自动备份';
    if (lastBackupAt == null) return '从未备份';

    final now = DateTime.now();
    final diff = now.difference(lastBackupAt!);

    if (diff.inHours < 24) {
      return '今天已备份';
    } else if (diff.inDays == 1) {
      return '昨天备份';
    } else {
      return '${diff.inDays}天前备份';
    }
  }
}
