import '../models/user_profile.dart';
import '../models/app_settings.dart';
import '../models/connected_device.dart';

/// 个人中心本地数据源
abstract class ProfileLocalDataSource {
  Future<AppSettings?> getCachedAppSettings();
  Future<void> cacheAppSettings(AppSettings settings);

  Future<UserProfile?> getCachedUserProfile();
  Future<void> cacheUserProfile(UserProfile profile);

  Future<List<ConnectedDevice>?> getCachedConnectedDevices();
  Future<void> cacheConnectedDevices(List<ConnectedDevice> devices);

  Future<void> clearCache();
}
