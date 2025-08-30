import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';

/// 请求生成报告用例
class RequestReportGenerationUseCase {
  final ReportsRepository _repository;

  RequestReportGenerationUseCase(this._repository);

  /// 执行请求生成报告
  Future<Result<void, AppError>> execute(String patientId, ReportType type) async {
    return await _repository.requestReportGeneration(patientId, type);
  }
}
