import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

part 'reports_state.freezed.dart';

// 报告列表状态
@freezed
abstract class ReportsState with _$ReportsState {
  const factory ReportsState({
    @Default([]) List<HealthReport> reports,
    @Default(ReportType.recoveryMonthly) ReportType selectedType,
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    String? error,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
  }) = _ReportsState;

  const ReportsState._();

  List<HealthReport> get filteredReports =>
      reports.where((report) => report.type == selectedType).toList();

  List<HealthReport> get readyReports =>
      reports.where((report) => report.status == ReportStatus.ready).toList();

  List<HealthReport> get unreadReports =>
      readyReports.where((report) => !report.isRead).toList();
}

// 报告详情状态
@freezed
abstract class ReportDetailState with _$ReportDetailState {
  const factory ReportDetailState({
    HealthReport? report,
    @Default(WebViewState()) WebViewState webViewState,
    @Default(false) bool isSharing,
    String? shareError,
    @Default([]) List<ReportShareRecord> shareHistory,
  }) = _ReportDetailState;
}
