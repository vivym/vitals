import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/features/reports/domain/usecases/get_reports_usecase.dart';
import 'package:vitals/features/reports/domain/usecases/mark_report_as_read_usecase.dart';
import 'package:vitals/features/reports/domain/usecases/request_report_generation_usecase.dart';
import 'package:vitals/features/reports/domain/usecases/share_report_usecase.dart';
import 'package:vitals/features/reports/presentation/providers/reports_providers.dart';

part 'usecase_providers.g.dart';

/// 获取报告列表用例提供者
@riverpod
GetReportsUseCase getReportsUseCase(GetReportsUseCaseRef ref) {
  final repository = ref.read(reportsRepositoryProvider);
  return GetReportsUseCase(repository);
}

/// 标记报告为已读用例提供者
@riverpod
MarkReportAsReadUseCase markReportAsReadUseCase(MarkReportAsReadUseCaseRef ref) {
  final repository = ref.read(reportsRepositoryProvider);
  return MarkReportAsReadUseCase(repository);
}

/// 分享报告用例提供者
@riverpod
ShareReportUseCase shareReportUseCase(ShareReportUseCaseRef ref) {
  final repository = ref.read(reportsRepositoryProvider);
  return ShareReportUseCase(repository);
}

/// 请求生成报告用例提供者
@riverpod
RequestReportGenerationUseCase requestReportGenerationUseCase(RequestReportGenerationUseCaseRef ref) {
  final repository = ref.read(reportsRepositoryProvider);
  return RequestReportGenerationUseCase(repository);
}
