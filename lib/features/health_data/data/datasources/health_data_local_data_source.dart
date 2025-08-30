import '../models/health_data_models.dart';

// 健康数据本地数据源接口
abstract class HealthDataLocalDataSource {
  // 获取缓存的血压记录
  Future<List<BloodPressureRecordModel>> getCachedBloodPressureRecords(
    String patientId,
  );

  // 缓存血压记录
  Future<void> cacheBloodPressureRecords(
    String patientId,
    List<BloodPressureRecordModel> records,
  );

  // 清除缓存
  Future<void> clearCache(String patientId);
}
