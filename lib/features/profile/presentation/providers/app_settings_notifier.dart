import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:vitals/core/errors/app_error.dart';
import '../../data/models/app_settings.dart';
import '../../data/providers/profile_providers.dart';

part 'app_settings_notifier.g.dart';

/// 应用设置状态管理
@riverpod
class AppSettingsNotifier extends _$AppSettingsNotifier {
  @override
  AsyncValue<AppSettings> build() {
    _loadSettings();
    return const AsyncValue.loading();
  }

  void updateSettings(AppSettings settings) {
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
      final updatedSettings = currentSettings.copyWith(themeMode: themeMode);
      state = AsyncValue.data(updatedSettings);
      _saveSettings(updatedSettings);
    });
  }

  Future<void> _loadSettings() async {
    final repository = ref.read(profileRepositoryProvider);
    final result = await repository.getAppSettings();

    result.when(
      success: (settings) => state = AsyncValue.data(settings),
      failure: (error) => state = AsyncValue.error(error, StackTrace.current),
    );
  }

  Future<void> _saveSettings(AppSettings settings) async {
    final repository = ref.read(profileRepositoryProvider);
    await repository.saveAppSettings(settings);
  }
}
