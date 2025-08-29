/// 应用常量定义
class AppConstants {
  // 应用信息
  static const String appName = 'Vitals Health';
  static const String appVersion = '1.0.0';

  // API 配置
  static const String apiBaseUrl = 'https://api.vitals.example.com';
  static const Duration apiTimeout = Duration(seconds: 30);

  // 缓存配置
  static const Duration shortCacheDuration = Duration(minutes: 5);
  static const Duration longCacheDuration = Duration(hours: 1);

  // 本地存储键名
  static const String keyAuthToken = 'auth_token';
  static const String keyUserProfile = 'user_profile';
  static const String keyAppSettings = 'app_settings';

  // 分页配置
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // 文件上传配置
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'webp'];

  // 通知配置
  static const String notificationChannelId = 'vitals_notifications';
  static const String notificationChannelName = '健康提醒';
  static const String notificationChannelDescription = '健康数据提醒和用药提醒';
}

/// 环境配置
enum Environment {
  development,
  staging,
  production,
}

/// 主题模式
enum AppThemeMode {
  light,
  dark,
  system,
}

/// 语言配置
enum AppLocale {
  zhCN,
  enUS,
}

extension AppLocaleExtension on AppLocale {
  String get languageCode {
    switch (this) {
      case AppLocale.zhCN:
        return 'zh';
      case AppLocale.enUS:
        return 'en';
    }
  }

  String get countryCode {
    switch (this) {
      case AppLocale.zhCN:
        return 'CN';
      case AppLocale.enUS:
        return 'US';
    }
  }

  String get displayName {
    switch (this) {
      case AppLocale.zhCN:
        return '简体中文';
      case AppLocale.enUS:
        return 'English';
    }
  }
}
