import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/health_data/data/datasources/health_data_local_data_source.dart';
import 'package:vitals/features/health_data/data/datasources/health_data_remote_data_source.dart';
import 'package:vitals/features/health_data/data/models/health_data_models.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart';
import 'package:vitals/features/health_data/domain/entities/chart_data.dart';
import 'package:vitals/features/health_data/domain/entities/record_health_data_request.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart';
import 'package:vitals/features/health_data/domain/repositories/health_data_repository.dart';

// 健康数据仓库实现
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
        final cachedModels = await _localDataSource
            .getCachedBloodPressureRecords(patientId);

        if (cachedModels.isNotEmpty) {
          final entities = cachedModels
              .map((model) => _mapBloodPressureModelToEntity(model))
              .toList();
          return Result.success(entities);
        }
      }

      // 转换TimeRange到Model
      final rangeModel = range != null ? _mapTimeRangeToModel(range) : null;

      // 从远程获取数据
      final remoteModels = await _remoteDataSource
          .getBloodPressureRecords(patientId, range: rangeModel);

      // 缓存到本地
      await _localDataSource.cacheBloodPressureRecords(patientId, remoteModels);

      // 转换为Domain实体
      final entities = remoteModels
          .map((model) => _mapBloodPressureModelToEntity(model))
          .toList();

      return Result.success(entities);
    } catch (e) {
      // 网络错误时返回缓存数据
      final cachedModels = await _localDataSource
          .getCachedBloodPressureRecords(patientId);

      if (cachedModels.isNotEmpty) {
        final entities = cachedModels
            .map((model) => _mapBloodPressureModelToEntity(model))
            .toList();
        return Result.success(entities);
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
      // 转换请求到Model
      final requestModel = _mapRecordRequestToModel(request);

      final recordModel = await _remoteDataSource
          .addBloodPressureRecord(patientId, requestModel);

      // 更新本地缓存
      final cachedModels = await _localDataSource
          .getCachedBloodPressureRecords(patientId);
      cachedModels.insert(0, recordModel);
      await _localDataSource.cacheBloodPressureRecords(patientId, cachedModels);

      // 转换为Domain实体
      final entity = _mapBloodPressureModelToEntity(recordModel);
      return Result.success(entity);
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
      final rangeModel = _mapTimeRangeToModel(range);
      final chartDataModel = await _remoteDataSource
          .getBloodPressureChartData(patientId, rangeModel);

      final chartEntity = _mapChartDataModelToEntity(chartDataModel);
      return Result.success(chartEntity);
    } catch (e) {
      return Result.failure(AppError.network(message: e.toString()));
    }
  }

  // =============================================================================
  // 数据转换方法
  // =============================================================================

  // 血压记录：Model -> Entity
  BloodPressureRecord _mapBloodPressureModelToEntity(BloodPressureRecordModel model) {
    return BloodPressureRecord(
      id: model.id,
      patientId: model.patientId,
      systolic: model.systolic,
      diastolic: model.diastolic,
      recordedAt: model.recordedAt,
      heartRate: model.heartRate,
      notes: model.notes,
      level: model.level != null ? _mapBloodPressureLevelModelToEntity(model.level!) : null,
      source: model.source != null ? _mapMeasurementSourceModelToEntity(model.source!) : null,
    );
  }

  // 血压水平：Model -> Entity
  BloodPressureLevel _mapBloodPressureLevelModelToEntity(BloodPressureLevelModel model) {
    switch (model) {
      case BloodPressureLevelModel.normal:
        return BloodPressureLevel.normal;
      case BloodPressureLevelModel.elevated:
        return BloodPressureLevel.elevated;
      case BloodPressureLevelModel.stage1:
        return BloodPressureLevel.stage1;
      case BloodPressureLevelModel.stage2:
        return BloodPressureLevel.stage2;
      case BloodPressureLevelModel.crisis:
        return BloodPressureLevel.crisis;
    }
  }

  // 测量来源：Model -> Entity
  MeasurementSource _mapMeasurementSourceModelToEntity(MeasurementSourceModel model) {
    switch (model) {
      case MeasurementSourceModel.manual:
        return MeasurementSource.manual;
      case MeasurementSourceModel.device:
        return MeasurementSource.device;
      case MeasurementSourceModel.import:
        return MeasurementSource.import;
    }
  }

  // 时间范围：Entity -> Model
  TimeRangeModel _mapTimeRangeToModel(TimeRange entity) {
    switch (entity) {
      case TimeRange.week:
        return TimeRangeModel.week;
      case TimeRange.month:
        return TimeRangeModel.month;
      case TimeRange.all:
        return TimeRangeModel.all;
    }
  }

  // 图表数据：Model -> Entity
  ChartData _mapChartDataModelToEntity(ChartDataModel model) {
    return ChartData(
      dataPoints: model.dataPoints
          .map((pointModel) => _mapDataPointModelToEntity(pointModel))
          .toList(),
      timeRange: _mapTimeRangeModelToEntity(model.timeRange),
      minValue: model.minValue,
      maxValue: model.maxValue,
      averageValue: model.averageValue,
      trend: model.trend,
    );
  }

  // 数据点：Model -> Entity
  DataPoint _mapDataPointModelToEntity(DataPointModel model) {
    return DataPoint(
      timestamp: model.timestamp,
      value: model.value,
      secondaryValue: model.secondaryValue,
      metadata: model.metadata,
    );
  }

  // 时间范围：Model -> Entity
  TimeRange _mapTimeRangeModelToEntity(TimeRangeModel model) {
    switch (model) {
      case TimeRangeModel.week:
        return TimeRange.week;
      case TimeRangeModel.month:
        return TimeRange.month;
      case TimeRangeModel.all:
        return TimeRange.all;
    }
  }

  // 记录请求：Entity -> Model
  RecordHealthDataRequestModel _mapRecordRequestToModel(RecordHealthDataRequest entity) {
    return entity.when(
      bloodPressure: (systolic, diastolic, heartRate, recordedAt, notes) {
        return RecordHealthDataRequestModel(
          systolic: systolic,
          diastolic: diastolic,
          heartRate: heartRate,
          recordedAt: recordedAt,
          notes: notes,
          source: MeasurementSourceModel.manual,
        );
      },
      heartRate: (bpm, recordedAt, notes) {
        return RecordHealthDataRequestModel(
          heartRate: bpm,
          recordedAt: recordedAt,
          notes: notes,
          source: MeasurementSourceModel.manual,
        );
      },
      weight: (weight, recordedAt, notes) {
        return RecordHealthDataRequestModel(
          weight: weight,
          recordedAt: recordedAt,
          notes: notes,
          source: MeasurementSourceModel.manual,
        );
      },
    );
  }
}