import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';

/// 分享报告用例
class ShareReportUseCase {
  final ReportsRepository _repository;

  ShareReportUseCase(this._repository);

  /// 执行分享报告
  Future<Result<String, AppError>> execute(
    String reportId,
    ShareMethod method, {
    String? recipientInfo,
  }) async {
    return await _repository.shareReport(
      reportId,
      method,
      recipientInfo: recipientInfo,
    );
  }
}

