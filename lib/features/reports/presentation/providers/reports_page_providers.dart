import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/entities/reports_state.dart';
import 'package:vitals/features/reports/presentation/providers/usecase_providers.dart';

part 'reports_page_providers.g.dart';

/// 报告页面状态管理
@riverpod
class ReportsPageNotifier extends _$ReportsPageNotifier {
  @override
  ReportsState build() {
    return const ReportsState();
  }

  /// 加载报告列表
  Future<void> loadReports(String patientId, {bool forceRefresh = false}) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final getReportsUseCase = ref.read(getReportsUseCaseProvider);
      final result = await getReportsUseCase.execute(patientId, forceRefresh: forceRefresh);

      result.when(
        success: (reports) {
          state = state.copyWith(
            reports: reports,
            isLoading: false,
            error: null,
          );
        },
        failure: (error) {
          state = state.copyWith(
            isLoading: false,
            error: error.message,
          );
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: '加载报告失败: $e',
      );
    }
  }

  /// 设置选中的报告类型
  void setSelectedType(ReportType? type) {
    state = state.copyWith(selectedType: type);
  }

  /// 标记报告为已读
  Future<void> markReportAsRead(String reportId) async {
    try {
      final useCase = ref.read(markReportAsReadUseCaseProvider);
      final result = await useCase.execute(reportId);

      result.when(
        success: (_) {
          // 更新本地状态
          final updatedReports = state.reports.map((report) {
            if (report.id == reportId) {
              return report.copyWith(isRead: true);
            }
            return report;
          }).toList();

          state = state.copyWith(reports: updatedReports);
        },
        failure: (error) {
          // 可以显示错误提示
          state = state.copyWith(error: '标记已读失败: ${error.message}');
        },
      );
    } catch (e) {
      state = state.copyWith(error: '标记已读失败: $e');
    }
  }

  /// 分享报告
  Future<String?> shareReport(String reportId, ShareMethod method) async {
    try {
      final useCase = ref.read(shareReportUseCaseProvider);
      final result = await useCase.execute(reportId, method);

      return result.when(
        success: (shareLink) => shareLink,
        failure: (error) {
          state = state.copyWith(error: '分享失败: ${error.message}');
          return null;
        },
      );
    } catch (e) {
      state = state.copyWith(error: '分享失败: $e');
      return null;
    }
  }

  /// 请求生成新报告
  Future<void> requestReportGeneration(String patientId, ReportType type) async {
    try {
      final useCase = ref.read(requestReportGenerationUseCaseProvider);
      final result = await useCase.execute(patientId, type);

      result.when(
        success: (_) {
          // 重新加载报告列表
          loadReports(patientId, forceRefresh: true);
        },
        failure: (error) {
          state = state.copyWith(error: '请求生成报告失败: ${error.message}');
        },
      );
    } catch (e) {
      state = state.copyWith(error: '请求生成报告失败: $e');
    }
  }

  /// 清除错误信息
  void clearError() {
    state = state.copyWith(error: null);
  }
}
