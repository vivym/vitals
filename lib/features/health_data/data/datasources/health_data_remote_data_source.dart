import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/chart_data.dart';
import 'package:vitals/features/health_data/domain/entities/record_health_data_request.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart';

// 健康数据远程数据源
abstract class HealthDataRemoteDataSource {
  // 获取血压记录
  Future<List<BloodPressureRecord>> getBloodPressureRecords(
    String patientId, {
    TimeRange? range,
  });

  // 添加血压记录
  Future<BloodPressureRecord> addBloodPressureRecord(
    String patientId,
    RecordHealthDataRequest request,
  );

  // 获取图表数据
  Future<ChartData> getBloodPressureChartData(
    String patientId,
    TimeRange range,
  );
}
