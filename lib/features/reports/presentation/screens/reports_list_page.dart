import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/entities/reports_state.dart';
import 'package:vitals/features/reports/presentation/providers/reports_page_providers.dart';
import 'package:vitals/features/reports/presentation/widgets/report_card.dart';
import 'package:vitals/features/reports/presentation/widgets/report_filter_chip.dart';
import 'package:vitals/features/reports/presentation/screens/report_detail_page.dart';

/// 健康报告列表页面
class ReportsListPage extends HookConsumerWidget {
  const ReportsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsState = ref.watch(reportsPageNotifierProvider);
    final notifier = ref.read(reportsPageNotifierProvider.notifier);

    // 模拟患者ID，实际应用中应该从用户信息获取
    const patientId = 'patient_1';

    // 页面加载时获取报告列表
    useEffect(() {
      Future(() {
        notifier.loadReports(patientId);
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('健康报告'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // 过滤器
          _buildFilterSection(context, ref, reportsState),

          // 内容区域
          Expanded(
            child: _buildContent(context, reportsState, notifier, patientId),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showGenerateReportDialog(context, ref, patientId),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context, WidgetRef ref, ReportsState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '报告类型',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ReportFilterChip(
                  label: '全部',
                  isSelected: state.selectedType == null,
                  onTap: () => ref.read(reportsPageNotifierProvider.notifier).setSelectedType(null),
                ),
                const SizedBox(width: 8),
                ReportFilterChip(
                  label: '康复月报',
                  isSelected: state.selectedType == ReportType.recoveryMonthly,
                  onTap: () => ref.read(reportsPageNotifierProvider.notifier).setSelectedType(ReportType.recoveryMonthly),
                ),
                const SizedBox(width: 8),
                ReportFilterChip(
                  label: '健康评估',
                  isSelected: state.selectedType == ReportType.healthAssessment,
                  onTap: () => ref.read(reportsPageNotifierProvider.notifier).setSelectedType(ReportType.healthAssessment),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, ReportsState state, ReportsPageNotifier notifier, String patientId) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return _buildErrorState(context, state.error!, notifier, patientId);
    }

    if (state.reports.isEmpty) {
      return _buildEmptyState(context);
    }

    return _buildReportsList(context, state, notifier);
  }

  Widget _buildErrorState(BuildContext context, String error, ReportsPageNotifier notifier, String patientId) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            error,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => notifier.loadReports(patientId, forceRefresh: true),
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.description_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            '暂无健康报告',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            '点击下方按钮生成新的健康报告',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildReportsList(BuildContext context, ReportsState state, ReportsPageNotifier notifier) {
    final filteredReports = state.filteredReports;

    return RefreshIndicator(
      onRefresh: () => notifier.loadReports('patient_1', forceRefresh: true),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredReports.length,
        itemBuilder: (context, index) {
          final report = filteredReports[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: ReportCard(
              report: report,
              onTap: () => _openReportDetail(context, report),
              onMarkAsRead: () => notifier.markReportAsRead(report.id),
              onShare: () => notifier.shareReport(report.id, ShareMethod.wechat),
            ),
          );
        },
      ),
    );
  }

  void _openReportDetail(BuildContext context, HealthReport report) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportDetailPage(reportId: report.id),
      ),
    );
  }



  void _showGenerateReportDialog(BuildContext context, WidgetRef ref, String patientId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('生成新报告'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('康复月报'),
              onTap: () {
                Navigator.pop(context);
                ref.read(reportsPageNotifierProvider.notifier).requestReportGeneration(
                  patientId,
                  ReportType.recoveryMonthly,
                );
                // TODO: 通过状态管理显示成功信息，不使用SnackBar
              },
            ),
            ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: const Text('健康评估'),
              onTap: () {
                Navigator.pop(context);
                ref.read(reportsPageNotifierProvider.notifier).requestReportGeneration(
                  patientId,
                  ReportType.healthAssessment,
                );
                // TODO: 通过状态管理显示成功信息，不使用SnackBar
              },
            ),
          ],
        ),
      ),
    );
  }
}
