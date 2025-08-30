import '../../../../core/errors/app_error.dart';
import '../entities/app_settings_entity.dart';
import '../repositories/profile_repository.dart';

/// 应用设置管理用例

class ManageAppSettingsUsecase {
  final ProfileRepository _repository;

  ManageAppSettingsUsecase(this._repository);

  /// 获取应用设置
  Future<Result<AppSettingsEntity, AppError>> getAppSettings(String userId) async {
    try {
      return await _repository.getAppSettings(userId);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '获取应用设置失败: ${e.toString()}'),
      );
    }
  }

  /// 更新应用设置
  Future<Result<AppSettingsEntity, AppError>> updateAppSettings(
    String userId,
    AppSettingsEntity settings,
  ) async {
    try {
      // 验证设置
      final validationResult = _validateSettings(settings);
      if (validationResult.isFailure) {
        return validationResult.cast<AppSettingsEntity>();
      }

      return await _repository.updateAppSettings(userId, settings);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '更新应用设置失败: ${e.toString()}'),
      );
    }
  }

  /// 切换主题模式
  Future<Result<AppSettingsEntity, AppError>> updateThemeMode(
    String userId,
    AppThemeMode themeMode,
  ) async {
    try {
      final currentSettingsResult = await _repository.getAppSettings(userId);
      if (currentSettingsResult.isFailure) {
        return currentSettingsResult;
      }

      final currentSettings = currentSettingsResult.data;
      final updatedSettings = currentSettings.copyWith(
        themeMode: themeMode,
        updatedAt: DateTime.now(),
      );

      return await _repository.updateAppSettings(userId, updatedSettings);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '切换主题模式失败: ${e.toString()}'),
      );
    }
  }

  /// 切换通知设置
  Future<Result<AppSettingsEntity, AppError>> updateNotificationSettings(
    String userId, {
    bool? notificationsEnabled,
    bool? healthDataNotifications,
    bool? medicationReminders,
    bool? deviceConnectionAlerts,
  }) async {
    try {
      final currentSettingsResult = await _repository.getAppSettings(userId);
      if (currentSettingsResult.isFailure) {
        return currentSettingsResult;
      }

      final currentSettings = currentSettingsResult.data;
      final updatedSettings = currentSettings.copyWith(
        notificationsEnabled: notificationsEnabled ?? currentSettings.notificationsEnabled,
        healthDataNotifications: healthDataNotifications ?? currentSettings.healthDataNotifications,
        medicationReminders: medicationReminders ?? currentSettings.medicationReminders,
        deviceConnectionAlerts: deviceConnectionAlerts ?? currentSettings.deviceConnectionAlerts,
        updatedAt: DateTime.now(),
      );

      return await _repository.updateAppSettings(userId, updatedSettings);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '更新通知设置失败: ${e.toString()}'),
      );
    }
  }

  /// 更新数据同步设置
  Future<Result<AppSettingsEntity, AppError>> updateDataSyncSettings(
    String userId, {
    SyncFrequency? syncFrequency,
    bool? autoBackup,
  }) async {
    try {
      final currentSettingsResult = await _repository.getAppSettings(userId);
      if (currentSettingsResult.isFailure) {
        return currentSettingsResult;
      }

      final currentSettings = currentSettingsResult.data;
      final updatedSettings = currentSettings.copyWith(
        dataSyncFrequency: syncFrequency ?? currentSettings.dataSyncFrequency,
        autoBackup: autoBackup ?? currentSettings.autoBackup,
        updatedAt: DateTime.now(),
      );

      return await _repository.updateAppSettings(userId, updatedSettings);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '更新数据同步设置失败: ${e.toString()}'),
      );
    }
  }

  /// 更新安全设置
  Future<Result<AppSettingsEntity, AppError>> updateSecuritySettings(
    String userId, {
    bool? biometricAuthEnabled,
    bool? crashReportingEnabled,
    bool? analyticsEnabled,
  }) async {
    try {
      final currentSettingsResult = await _repository.getAppSettings(userId);
      if (currentSettingsResult.isFailure) {
        return currentSettingsResult;
      }

      final currentSettings = currentSettingsResult.data;
      final updatedSettings = currentSettings.copyWith(
        biometricAuthEnabled: biometricAuthEnabled ?? currentSettings.biometricAuthEnabled,
        crashReportingEnabled: crashReportingEnabled ?? currentSettings.crashReportingEnabled,
        analyticsEnabled: analyticsEnabled ?? currentSettings.analyticsEnabled,
        updatedAt: DateTime.now(),
      );

      return await _repository.updateAppSettings(userId, updatedSettings);
    } catch (e) {
      return Result.failure(
        AppError.unknown(message: '更新安全设置失败: ${e.toString()}'),
      );
    }
  }

  /// 验证设置
  Result<void, AppError> _validateSettings(AppSettingsEntity settings) {
    // 基本验证 - 目前设置都有默认值，不需要特殊验证
    return const Result.success(null);
  }
}
