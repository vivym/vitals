import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/health_data/data/datasources/health_data_local_data_source.dart';
import 'package:vitals/features/health_data/data/datasources/health_data_remote_data_source.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/chart_data.dart';
import 'package:vitals/features/health_data/domain/entities/record_health_data_request.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart';
import 'package:vitals/features/health_data/domain/repositories/health_data_repository.dart';

// 健康数据仓库
class HealthDataRepositoryImpl implements HealthDataRepository {
  final HealthDataRemoteDataSource _remoteDataSource;
  final HealthDataLocalDataSource _localDataSource;

  HealthDataRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<List<BloodPressureRecord>, AppError>> getBloodPressureRecords(
    String patientId, {
    TimeRange? range,
    bool forceRefresh = false,
  }) async {
    try {
      // 离线优先策略
      if (!forceRefresh) {
        final cachedRecords = await _localDataSource
            .getCachedBloodPressureRecords(patientId);

        if (cachedRecords.isNotEmpty) {
          return Result.success(cachedRecords);
        }
      }

      // 从远程获取数据
      final remoteRecords = await _remoteDataSource
          .getBloodPressureRecords(patientId, range: range);

      // 缓存到本地
      await _localDataSource.cacheBloodPressureRecords(patientId, remoteRecords);

      return Result.success(remoteRecords);
    } catch (e) {
      // 网络错误时返回缓存数据
      final cachedRecords = await _localDataSource
          .getCachedBloodPressureRecords(patientId);

      if (cachedRecords.isNotEmpty) {
        return Result.success(cachedRecords);
      }

      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<BloodPressureRecord, AppError>> addBloodPressureRecord(
    String patientId,
    RecordHealthDataRequest request,
  ) async {
    try {
      final record = await _remoteDataSource
          .addBloodPressureRecord(patientId, request);

      // 更新本地缓存
      final cachedRecords = await _localDataSource
          .getCachedBloodPressureRecords(patientId);
      cachedRecords.insert(0, record);
      await _localDataSource.cacheBloodPressureRecords(patientId, cachedRecords);

      return Result.success(record);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  @override
  Future<Result<ChartData, AppError>> getBloodPressureChartData(
    String patientId,
    TimeRange range,
  ) async {
    try {
      final chartData = await _remoteDataSource
          .getBloodPressureChartData(patientId, range);
      return Result.success(chartData);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }
}
