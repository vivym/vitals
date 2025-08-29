import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

/// 本地数据源实现
class ReportsLocalDataSourceImpl implements ReportsLocalDataSource {
  final SharedPreferences _prefs;

  ReportsLocalDataSourceImpl(this._prefs);

  @override
  Future<List<HealthReport>?> getCachedReports(String patientId) async {
    final key = 'reports_$patientId';
    final jsonString = _prefs.getString(key);

    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => HealthReport.fromJson(json)).toList();
    }

    return null;
  }

  @override
  Future<void> cacheReports(String patientId, List<HealthReport> reports) async {
    final key = 'reports_$patientId';
    final jsonString = jsonEncode(reports.map((r) => r.toJson()).toList());
    await _prefs.setString(key, jsonString);
  }

  @override
  Future<List<String>> getReadReportIds() async {
    return _prefs.getStringList('read_report_ids') ?? [];
  }

  @override
  Future<void> markReportAsRead(String reportId) async {
    final readIds = await getReadReportIds();
    if (!readIds.contains(reportId)) {
      readIds.add(reportId);
      await _prefs.setStringList('read_report_ids', readIds);
    }
  }
}
