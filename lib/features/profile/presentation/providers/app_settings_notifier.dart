import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:vitals/core/errors/app_error.dart';
import '../../domain/entities/app_settings_entity.dart';
import '../mappers/theme_mode_mapper.dart';
import 'profile_providers.dart';

part 'app_settings_notifier.g.dart';

/// 应用设置状态管理
@riverpod
class AppSettingsNotifier extends _$AppSettingsNotifier {
  @override
  AsyncValue<AppSettingsEntity> build() {
    _loadSettings();
    return const AsyncValue.loading();
  }

  /// 获取Flutter的ThemeMode（用于UI显示）
  ThemeMode? get currentThemeMode {
    return state.whenOrNull(
      data: (settings) => ThemeModeMapper.toMaterial(settings.themeMode),
    );
  }

  void updateSettings(AppSettingsEntity settings) {
    state = AsyncValue.data(settings);
    _saveSettings(settings);
  }

  void toggleNotifications(bool enabled) {
    state.whenData((currentSettings) {
      final updatedSettings = currentSettings.copyWith(notificationsEnabled: enabled);
      state = AsyncValue.data(updatedSettings);
      _saveSettings(updatedSettings);
    });
  }

  void changeTheme(ThemeMode themeMode) {
    state.whenData((currentSettings) {
      // 使用转换器将Flutter的ThemeMode转换为Domain的AppThemeMode
      final appThemeMode = ThemeModeMapper.fromMaterial(themeMode);
      final updatedSettings = currentSettings.copyWith(themeMode: appThemeMode);
      state = AsyncValue.data(updatedSettings);
      _saveSettings(updatedSettings);
    });
  }

  Future<void> _loadSettings() async {
    final usecase = ref.read(manageAppSettingsUsecaseProvider);
    final result = await usecase.getAppSettings('user_id'); // TODO: 获取实际用户ID

    result.when(
      success: (settings) => state = AsyncValue.data(settings),
      failure: (error) => state = AsyncValue.error(error, StackTrace.current),
    );
  }

  Future<void> _saveSettings(AppSettingsEntity settings) async {
    final usecase = ref.read(manageAppSettingsUsecaseProvider);
    await usecase.updateAppSettings('user_id', settings); // TODO: 获取实际用户ID
  }
}
