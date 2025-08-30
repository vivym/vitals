import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource.dart';
import 'package:vitals/features/reports/data/datasources/reports_remote_datasource.dart';
import 'package:vitals/features/reports/data/mappers/health_report_mapper.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';

/// 健康报告仓库实现
class ReportsRepositoryImpl implements ReportsRepository {
  final ReportsRemoteDataSource _remoteDataSource;
  final ReportsLocalDataSource _localDataSource;

  ReportsRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<List<HealthReport>, AppError>> getReports(
    String patientId, {
    bool forceRefresh = false,
  }) async {
    try {
      // 尝试从本地缓存获取
      final cachedReportModels = await _localDataSource.getCachedReports(patientId);

      if (!forceRefresh && cachedReportModels != null) {
        // 转换为领域实体并合并已读状态
        final readIds = await _localDataSource.getReadReportIds();
        final reportsWithReadStatus = cachedReportModels.map((model) {
          final entity = HealthReportMapper.toEntity(model);
          return entity.copyWith(isRead: readIds.contains(entity.id));
        }).toList();

        return Result.success(reportsWithReadStatus);
      }

      // 从远程获取数据
      final remoteReportModels = await _remoteDataSource.getReports(patientId);

      // 缓存到本地
      await _localDataSource.cacheReports(patientId, remoteReportModels);

      // 转换为领域实体并合并已读状态
      final readIds = await _localDataSource.getReadReportIds();
      final reportsWithReadStatus = remoteReportModels.map((model) {
        final entity = HealthReportMapper.toEntity(model);
        return entity.copyWith(isRead: readIds.contains(entity.id));
      }).toList();

      return Result.success(reportsWithReadStatus);
    } catch (e) {
      // 如果远程获取失败，尝试返回缓存数据
      final cachedReportModels = await _localDataSource.getCachedReports(patientId);
      if (cachedReportModels != null) {
        final readIds = await _localDataSource.getReadReportIds();
        final reportsWithReadStatus = cachedReportModels.map((model) {
          final entity = HealthReportMapper.toEntity(model);
          return entity.copyWith(isRead: readIds.contains(entity.id));
        }).toList();

        return Result.success(reportsWithReadStatus);
      }

      return Result.failure(AppError.network(message: '获取报告失败: $e'));
    }
  }

  @override
  Future<Result<HealthReport, AppError>> getReportById(String reportId) async {
    try {
      final reportModel = await _remoteDataSource.getReportById(reportId);
      final reportEntity = HealthReportMapper.toEntity(reportModel);
      return Result.success(reportEntity);
    } catch (e) {
      return Result.failure(AppError.network(message: '获取报告详情失败: $e'));
    }
  }

  @override
  Future<Result<void, AppError>> markReportAsRead(String reportId) async {
    try {
      // 同时更新本地和远程
      await Future.wait([
        _localDataSource.markReportAsRead(reportId),
        _remoteDataSource.markReportAsRead(reportId),
      ]);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: '标记已读失败: $e'));
    }
  }

  @override
  Future<Result<String, AppError>> shareReport(
    String reportId,
    ShareMethod method, {
    String? recipientInfo,
  }) async {
    try {
      final shareLink = await _remoteDataSource.generateShareLink(reportId);
      await _remoteDataSource.recordShare(reportId, method, recipientInfo);
      return Result.success(shareLink);
    } catch (e) {
      return Result.failure(AppError.network(message: '分享报告失败: $e'));
    }
  }

  @override
  Future<Result<void, AppError>> requestReportGeneration(
    String patientId,
    ReportType type,
  ) async {
    try {
      await _remoteDataSource.requestReportGeneration(patientId, type);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(AppError.network(message: '请求生成报告失败: $e'));
    }
  }
}
