import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/data/providers/reports_providers.dart';

part 'share_report_usecase.g.dart';

/// 分享报告用例
@riverpod
class ShareReportUseCase extends _$ShareReportUseCase {
  @override
  Future<Result<String, AppError>> build() async {
    throw UnimplementedError();
  }

  /// 执行分享报告
  Future<Result<String, AppError>> execute(
    String reportId,
    ShareMethod method,
  ) async {
    final repository = ref.read(reportsRepositoryProvider);
    return await repository.shareReport(reportId, method);
  }
}

