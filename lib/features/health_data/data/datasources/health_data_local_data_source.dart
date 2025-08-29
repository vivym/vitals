import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';

// 健康数据本地数据源
abstract class HealthDataLocalDataSource {
  // 获取缓存的血压记录
  Future<List<BloodPressureRecord>> getCachedBloodPressureRecords(
    String patientId,
  );

  // 缓存血压记录
  Future<void> cacheBloodPressureRecords(
    String patientId,
    List<BloodPressureRecord> records,
  );

  // 清除缓存
  Future<void> clearCache(String patientId);
}
