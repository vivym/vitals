import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource.dart';
import 'package:vitals/features/reports/data/models/health_report_model.dart';

/// 健康报告本地数据源实现
/// 使用SharedPreferences存储数据
class ReportsLocalDataSourceImpl implements ReportsLocalDataSource {
  final SharedPreferences _sharedPreferences;

  // 缓存过期时间：30分钟
  static const Duration _cacheExpirationDuration = Duration(minutes: 30);

  ReportsLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<List<HealthReportModel>?> getCachedReports(String patientId) async {
    try {
      final key = 'cached_reports_$patientId';
      final cachedData = _sharedPreferences.getString(key);

      if (cachedData == null) {
        return null;
      }

      final jsonList = jsonDecode(cachedData) as List<dynamic>;
      final reports = jsonList
          .map((json) => HealthReportModel.fromJson(json as Map<String, dynamic>))
          .toList();

      return reports;
    } catch (e) {
      // 如果解析失败，返回null
      return null;
    }
  }

  @override
  Future<void> cacheReports(String patientId, List<HealthReportModel> reports) async {
    final key = 'cached_reports_$patientId';
    final timestampKey = 'cached_reports_timestamp_$patientId';

    final reportsJson = reports.map((report) => report.toJson()).toList();
    final encodedData = jsonEncode(reportsJson);

    await Future.wait([
      _sharedPreferences.setString(key, encodedData),
      _sharedPreferences.setInt(timestampKey, DateTime.now().millisecondsSinceEpoch),
    ]);
  }

  @override
  Future<List<String>> getReadReportIds() async {
    final readIds = _sharedPreferences.getStringList('read_report_ids');
    return readIds ?? [];
  }

  @override
  Future<void> markReportAsRead(String reportId) async {
    final existingReadIds = await getReadReportIds();

    if (!existingReadIds.contains(reportId)) {
      existingReadIds.add(reportId);
    }

    await _sharedPreferences.setStringList('read_report_ids', existingReadIds);
  }

  /// 检查缓存是否过期
  bool isCacheExpired(String patientId) {
    final timestampKey = 'cached_reports_timestamp_$patientId';
    final timestamp = _sharedPreferences.getInt(timestampKey);

    if (timestamp == null) {
      return true;
    }

    final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final now = DateTime.now();

    return now.difference(cacheTime) > _cacheExpirationDuration;
  }

  /// 清除特定患者的缓存
  Future<void> clearCache(String patientId) async {
    final key = 'cached_reports_$patientId';
    final timestampKey = 'cached_reports_timestamp_$patientId';

    await Future.wait([
      _sharedPreferences.remove(key),
      _sharedPreferences.remove(timestampKey),
    ]);
  }

  /// 清除所有缓存
  Future<void> clearAllCache() async {
    final keys = _sharedPreferences.getKeys();
    final cacheKeys = keys.where((key) =>
        key.startsWith('cached_reports_') ||
        key == 'read_report_ids'
    ).toList();

    for (final key in cacheKeys) {
      await _sharedPreferences.remove(key);
    }
  }
}