import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/data/providers/reports_providers.dart';

part 'mark_report_as_read_usecase.g.dart';

/// 标记报告已读用例
@riverpod
class MarkReportAsReadUseCase extends _$MarkReportAsReadUseCase {
  @override
  Future<Result<void, AppError>> build() async {
    throw UnimplementedError();
  }

  /// 执行标记报告已读
  Future<Result<void, AppError>> execute(String reportId) async {
    final repository = ref.read(reportsRepositoryProvider);
    return await repository.markReportAsRead(reportId);
  }
}

