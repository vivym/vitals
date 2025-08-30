import 'package:flutter/material.dart' as flutter;
import '../models/user_profile.dart' as user_profile;
import '../models/connected_device.dart' as connected_device;
import '../models/app_settings.dart' as app_settings;
import '../models/profile_state.dart';
import '../../domain/entities/user_profile_entity.dart';
import '../../domain/entities/connected_device_entity.dart';
import '../../domain/entities/app_settings_entity.dart';
import '../../domain/entities/profile_entity.dart';

/// Profile数据映射器
class ProfileMappers {

  // User Profile 映射
  static UserProfileEntity userProfileModelToEntity(user_profile.UserProfile model) {
    return UserProfileEntity(
      id: model.id,
      name: model.name,
      phone: model.phone,
      email: model.email,
      avatarUrl: model.avatarUrl,
      gender: model.gender != null ? _genderFromModel(model.gender!) : null,
      birthDate: model.birthDate,
      address: model.address,
      emergencyContact: model.emergencyContact,
      emergencyContactPhone: model.emergencyContactPhone,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static user_profile.UserProfile userProfileEntityToModel(UserProfileEntity entity) {
    return user_profile.UserProfile(
      id: entity.id,
      name: entity.name,
      phone: entity.phone,
      email: entity.email,
      avatarUrl: entity.avatarUrl,
      gender: entity.gender != null ? _genderToModel(entity.gender!) : null,
      birthDate: entity.birthDate,
      address: entity.address,
      emergencyContact: entity.emergencyContact,
      emergencyContactPhone: entity.emergencyContactPhone,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // Connected Device 映射
  static ConnectedDeviceEntity connectedDeviceModelToEntity(connected_device.ConnectedDevice model) {
    return ConnectedDeviceEntity(
      id: model.id,
      name: model.name,
      type: _deviceTypeFromModel(model.type),
      status: _deviceStatusFromModel(model.status),
      lastSyncAt: model.lastSync,
      connectedAt: model.connectedAt,
    );
  }

  static connected_device.ConnectedDevice connectedDeviceEntityToModel(ConnectedDeviceEntity entity) {
    return connected_device.ConnectedDevice(
      id: entity.id,
      name: entity.name,
      type: _deviceTypeToModel(entity.type),
      status: _deviceStatusToModel(entity.status),
      lastSync: entity.lastSyncAt,
      connectedAt: entity.connectedAt,
    );
  }

  // App Settings 映射
  static AppSettingsEntity appSettingsModelToEntity(app_settings.AppSettings model) {
    return AppSettingsEntity(
      themeMode: _themeModeFromModel(model.themeMode),
      language: _languageFromLocale(model.locale),
      notificationsEnabled: model.notificationsEnabled,
      healthDataNotifications: model.healthDataReminders,
      medicationReminders: model.medicationReminders,
      deviceConnectionAlerts: model.notificationsEnabled, // 使用通知设置作为设备连接警报
      dataSyncFrequency: model.autoSyncDevices ? SyncFrequency.realtime : SyncFrequency.manual,
      autoBackup: true, // 默认值，现有模型没有这个字段
      biometricAuthEnabled: false, // 默认值，现有模型没有这个字段
      crashReportingEnabled: model.crashReportingEnabled,
      analyticsEnabled: model.analyticsEnabled,
    );
  }

  static app_settings.AppSettings appSettingsEntityToModel(AppSettingsEntity entity) {
    return app_settings.AppSettings(
      themeMode: _themeModeToModel(entity.themeMode),
      locale: _languageToLocale(entity.language),
      notificationsEnabled: entity.notificationsEnabled,
      healthDataReminders: entity.healthDataNotifications,
      medicationReminders: entity.medicationReminders,
      autoSyncDevices: entity.dataSyncFrequency != SyncFrequency.manual,
      crashReportingEnabled: entity.crashReportingEnabled,
      analyticsEnabled: entity.analyticsEnabled,
    );
  }

  // Profile 聚合映射
  static ProfileEntity profileStateToEntity(ProfileState state) {
    return ProfileEntity(
      userProfile: state.userProfile != null
          ? userProfileModelToEntity(state.userProfile!)
          : null,
      connectedDevices: state.connectedDevices
          .map(connectedDeviceModelToEntity)
          .toList(),
      settings: state.settings != null
          ? appSettingsModelToEntity(state.settings!)
          : const AppSettingsEntity(),
      lastUpdatedAt: DateTime.now(),
    );
  }

  // 私有映射方法

  // Gender 映射
  static Gender _genderFromModel(user_profile.Gender modelGender) {
    switch (modelGender) {
      case user_profile.Gender.male:
        return Gender.male;
      case user_profile.Gender.female:
        return Gender.female;
      case user_profile.Gender.other:
        return Gender.other;
    }
  }

  static user_profile.Gender _genderToModel(Gender entityGender) {
    switch (entityGender) {
      case Gender.male:
        return user_profile.Gender.male;
      case Gender.female:
        return user_profile.Gender.female;
      case Gender.other:
        return user_profile.Gender.other;
    }
  }

  // DeviceType 映射
  static DeviceType _deviceTypeFromModel(connected_device.DeviceType modelType) {
    switch (modelType) {
      case connected_device.DeviceType.bloodPressureMonitor:
        return DeviceType.bloodPressureMonitor;
      case connected_device.DeviceType.glucoseMeter:
        return DeviceType.glucoseMeter;
      case connected_device.DeviceType.huaweiHealth:
        return DeviceType.smartWatch;
      case connected_device.DeviceType.xiaomiHealth:
        return DeviceType.fitnessTracker;
      case connected_device.DeviceType.appleHealth:
        return DeviceType.smartWatch;
    }
  }

  static connected_device.DeviceType _deviceTypeToModel(DeviceType entityType) {
    switch (entityType) {
      case DeviceType.bloodPressureMonitor:
        return connected_device.DeviceType.bloodPressureMonitor;
      case DeviceType.glucoseMeter:
        return connected_device.DeviceType.glucoseMeter;
      case DeviceType.smartWatch:
        return connected_device.DeviceType.appleHealth;
      case DeviceType.fitnessTracker:
        return connected_device.DeviceType.xiaomiHealth;
      case DeviceType.smartScale:
        return connected_device.DeviceType.huaweiHealth; // 映射到华为健康
      case DeviceType.other:
        return connected_device.DeviceType.huaweiHealth; // 默认映射
    }
  }

  // DeviceStatus 映射
  static DeviceStatus _deviceStatusFromModel(connected_device.DeviceStatus modelStatus) {
    switch (modelStatus) {
      case connected_device.DeviceStatus.connected:
        return DeviceStatus.connected;
      case connected_device.DeviceStatus.disconnected:
        return DeviceStatus.disconnected;
      case connected_device.DeviceStatus.syncing:
        return DeviceStatus.connecting;
      case connected_device.DeviceStatus.error:
        return DeviceStatus.error;
    }
  }

  static connected_device.DeviceStatus _deviceStatusToModel(DeviceStatus entityStatus) {
    switch (entityStatus) {
      case DeviceStatus.connected:
        return connected_device.DeviceStatus.connected;
      case DeviceStatus.disconnected:
        return connected_device.DeviceStatus.disconnected;
      case DeviceStatus.connecting:
        return connected_device.DeviceStatus.syncing;
      case DeviceStatus.error:
        return connected_device.DeviceStatus.error;
    }
  }

  // AppThemeMode 映射
  static AppThemeMode _themeModeFromModel(flutter.ThemeMode modelMode) {
    switch (modelMode) {
      case flutter.ThemeMode.system:
        return AppThemeMode.system;
      case flutter.ThemeMode.light:
        return AppThemeMode.light;
      case flutter.ThemeMode.dark:
        return AppThemeMode.dark;
    }
  }

  static flutter.ThemeMode _themeModeToModel(AppThemeMode entityMode) {
    switch (entityMode) {
      case AppThemeMode.system:
        return flutter.ThemeMode.system;
      case AppThemeMode.light:
        return flutter.ThemeMode.light;
      case AppThemeMode.dark:
        return flutter.ThemeMode.dark;
    }
  }

  // Language 映射 (现有模型使用Locale)
  static Language _languageFromLocale(flutter.Locale locale) {
    if (locale.languageCode == 'zh') {
      return Language.chinese;
    } else if (locale.languageCode == 'en') {
      return Language.english;
    } else {
      return Language.system;
    }
  }

  static flutter.Locale _languageToLocale(Language language) {
    switch (language) {
      case Language.system:
        return const flutter.Locale('zh', 'CN');
      case Language.chinese:
        return const flutter.Locale('zh', 'CN');
      case Language.english:
        return const flutter.Locale('en', 'US');
    }
  }


}
