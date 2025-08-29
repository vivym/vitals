import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/dashboard_models.dart';
import 'dashboard_local_datasource.dart';

/// 本地数据源实现
class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  final SharedPreferences _prefs;

  static const String _keyDashboardPrefix = 'dashboard_';
  static const String _keyReadEducation = 'read_education_ids';
  static const String _keyFavoritedEducation = 'favorited_education_ids';

  DashboardLocalDataSourceImpl(this._prefs);

  @override
  Future<DashboardResponse?> getCachedDashboard(String patientId) async {
    try {
      final key = '$_keyDashboardPrefix$patientId';
      final jsonString = _prefs.getString(key);

      if (jsonString != null) {
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        return DashboardResponse.fromJson(json);
      }

      return null;
    } catch (e) {
      // 使用print进行调试，生产环境应该使用proper logging
      print('Failed to get cached dashboard: $e');
      return null;
    }
  }

  @override
  Future<void> cacheDashboard(String patientId, DashboardResponse data) async {
    try {
      final key = '$_keyDashboardPrefix$patientId';
      final jsonString = jsonEncode(data.toJson());
      await _prefs.setString(key, jsonString);
    } catch (e) {
      print('Failed to cache dashboard: $e');
    }
  }

  @override
  Future<void> clearCache(String patientId) async {
    try {
      final key = '$_keyDashboardPrefix$patientId';
      await _prefs.remove(key);
    } catch (e) {
      print('Failed to clear cache: $e');
    }
  }

  @override
  Future<List<String>> getReadEducationIds() async {
    return _prefs.getStringList(_keyReadEducation) ?? [];
  }

  @override
  Future<void> markEducationAsRead(String itemId) async {
    final readIds = await getReadEducationIds();
    if (!readIds.contains(itemId)) {
      readIds.add(itemId);
      await _prefs.setStringList(_keyReadEducation, readIds);
    }
  }

  @override
  Future<List<String>> getFavoritedEducationIds() async {
    return _prefs.getStringList(_keyFavoritedEducation) ?? [];
  }

  @override
  Future<void> toggleEducationFavorite(String itemId, bool isFavorited) async {
    final favoritedIds = await getFavoritedEducationIds();

    if (isFavorited && !favoritedIds.contains(itemId)) {
      favoritedIds.add(itemId);
    } else if (!isFavorited) {
      favoritedIds.remove(itemId);
    }

    await _prefs.setStringList(_keyFavoritedEducation, favoritedIds);
  }
}
