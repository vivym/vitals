import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';

/// 标记报告已读用例
class MarkReportAsReadUseCase {
  final ReportsRepository _repository;

  MarkReportAsReadUseCase(this._repository);

  /// 执行标记报告已读
  Future<Result<void, AppError>> execute(String reportId) async {
    return await _repository.markReportAsRead(reportId);
  }
}

