import '../models/health_data_models.dart';

// 健康数据远程数据源接口
abstract class HealthDataRemoteDataSource {
  // 获取血压记录
  Future<List<BloodPressureRecordModel>> getBloodPressureRecords(
    String patientId, {
    TimeRangeModel? range,
  });

  // 添加血压记录
  Future<BloodPressureRecordModel> addBloodPressureRecord(
    String patientId,
    RecordHealthDataRequestModel request,
  );

  // 获取图表数据
  Future<ChartDataModel> getBloodPressureChartData(
    String patientId,
    TimeRangeModel range,
  );
}
