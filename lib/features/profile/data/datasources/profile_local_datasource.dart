import '../models/user_profile.dart';
import '../models/app_settings.dart';

/// 个人中心本地数据源
abstract class ProfileLocalDataSource {
  Future<AppSettings?> getAppSettings();
  Future<void> saveAppSettings(AppSettings settings);

  Future<UserProfile?> getCachedUserProfile();
  Future<void> cacheUserProfile(UserProfile profile);

  Future<void> clearCachedData();
}
