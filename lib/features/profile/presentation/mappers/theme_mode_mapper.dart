import 'package:flutter/material.dart' as material;
import '../../domain/entities/app_settings_entity.dart';

/// 主题模式转换器
/// 用于在Domain层的AppThemeMode和Presentation层的material.ThemeMode之间转换
class ThemeModeMapper {
  /// 将Domain层的AppThemeMode转换为Flutter的ThemeMode
  static material.ThemeMode toMaterial(AppThemeMode appThemeMode) {
    switch (appThemeMode) {
      case AppThemeMode.system:
        return material.ThemeMode.system;
      case AppThemeMode.light:
        return material.ThemeMode.light;
      case AppThemeMode.dark:
        return material.ThemeMode.dark;
    }
  }

  /// 将Flutter的ThemeMode转换为Domain层的AppThemeMode
  static AppThemeMode fromMaterial(material.ThemeMode themeMode) {
    switch (themeMode) {
      case material.ThemeMode.system:
        return AppThemeMode.system;
      case material.ThemeMode.light:
        return AppThemeMode.light;
      case material.ThemeMode.dark:
        return AppThemeMode.dark;
    }
  }
}
