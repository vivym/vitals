import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitals/features/health_data/data/datasources/health_data_local_data_source.dart';
import 'package:vitals/features/health_data/data/models/health_data_models.dart';

// 本地数据源 - 缓存和离线支持
class HealthDataLocalDataSourceImpl implements HealthDataLocalDataSource {
  final SharedPreferences _prefs;

  HealthDataLocalDataSourceImpl(this._prefs);

  @override
  Future<List<BloodPressureRecordModel>> getCachedBloodPressureRecords(
    String patientId,
  ) async {
    final key = 'bp_records_$patientId';
    final jsonString = _prefs.getString(key);

    if (jsonString != null) {
      try {
        final List<dynamic> jsonList = jsonDecode(jsonString);
        return jsonList.map((json) => BloodPressureRecordModel.fromJson(json)).toList();
      } catch (e) {
        // 如果解析失败，清除缓存
        await _prefs.remove(key);
        return [];
      }
    }

    return [];
  }

  @override
  Future<void> cacheBloodPressureRecords(
    String patientId,
    List<BloodPressureRecordModel> records,
  ) async {
    final key = 'bp_records_$patientId';
    final jsonString = jsonEncode(records.map((r) => r.toJson()).toList());
    await _prefs.setString(key, jsonString);
  }

  @override
  Future<void> clearCache(String patientId) async {
    final key = 'bp_records_$patientId';
    await _prefs.remove(key);
  }
}
