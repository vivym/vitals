import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';

/// 获取报告列表用例
class GetReportsUseCase {
  final ReportsRepository _repository;

  GetReportsUseCase(this._repository);

  /// 执行获取报告列表
  Future<Result<List<HealthReport>, AppError>> execute(
    String patientId, {
    bool forceRefresh = false,
  }) async {
    return await _repository.getReports(patientId, forceRefresh: forceRefresh);
  }
}
