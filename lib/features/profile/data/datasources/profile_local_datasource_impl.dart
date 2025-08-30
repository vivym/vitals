import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_profile.dart';
import '../models/app_settings.dart';
import '../models/connected_device.dart';
import 'profile_local_datasource.dart';

/// 个人中心本地数据源实现
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  ProfileLocalDataSourceImpl(this._prefs, this._secureStorage);

  @override
  Future<AppSettings?> getCachedAppSettings() async {
    final settingsJson = _prefs.getString('app_settings');
    if (settingsJson != null) {
      try {
        return AppSettings.fromJson(jsonDecode(settingsJson));
      } catch (e) {
        // 如果解析失败，返回默认设置
        return null;
      }
    }
    return null;
  }

  @override
  Future<void> cacheAppSettings(AppSettings settings) async {
    await _prefs.setString('app_settings', jsonEncode(settings.toJson()));
  }

  @override
  Future<UserProfile?> getCachedUserProfile() async {
    final profileJson = _prefs.getString('user_profile');
    if (profileJson != null) {
      try {
        return UserProfile.fromJson(jsonDecode(profileJson));
      } catch (e) {
        // 如果解析失败，返回null
        return null;
      }
    }
    return null;
  }

  @override
  Future<void> cacheUserProfile(UserProfile profile) async {
    await _prefs.setString('user_profile', jsonEncode(profile.toJson()));
  }

  @override
  Future<List<ConnectedDevice>?> getCachedConnectedDevices() async {
    final devicesJson = _prefs.getString('connected_devices');
    if (devicesJson != null) {
      try {
        final List<dynamic> devicesList = jsonDecode(devicesJson);
        return devicesList
            .map((json) => ConnectedDevice.fromJson(json))
            .toList();
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<void> cacheConnectedDevices(List<ConnectedDevice> devices) async {
    final devicesJson = jsonEncode(devices.map((device) => device.toJson()).toList());
    await _prefs.setString('connected_devices', devicesJson);
  }

  @override
  Future<void> clearCache() async {
    await Future.wait([
      _prefs.remove('user_profile'),
      _prefs.remove('app_settings'),
      _prefs.remove('connected_devices'),
    ]);
  }
}
