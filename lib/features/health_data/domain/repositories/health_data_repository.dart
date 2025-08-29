import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/chart_data.dart';
import 'package:vitals/features/health_data/domain/entities/record_health_data_request.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart';

// 健康数据仓库接口
abstract class HealthDataRepository {
  // 获取血压记录
  Future<Result<List<BloodPressureRecord>, AppError>> getBloodPressureRecords(
    String patientId, {
    TimeRange? range,
    bool forceRefresh = false,
  });

  // 添加血压记录
  Future<Result<BloodPressureRecord, AppError>> addBloodPressureRecord(
    String patientId,
    RecordHealthDataRequest request,
  );

  // 获取图表数据
  Future<Result<ChartData, AppError>> getBloodPressureChartData(
    String patientId,
    TimeRange range,
  );
}
