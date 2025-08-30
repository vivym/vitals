import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/presentation/providers/reports_page_providers.dart';

/// 健康报告详情页面
class ReportDetailPage extends HookConsumerWidget {
  final String reportId;

  const ReportDetailPage({
    super.key,
    required this.reportId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsState = ref.watch(reportsPageNotifierProvider);
    final report = reportsState.reports.firstWhere(
      (r) => r.id == reportId,
      orElse: () => throw Exception('报告不存在'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(report.title),
        actions: [
          IconButton(
            onPressed: () => _showShareDialog(context, ref, report),
            icon: const Icon(Icons.share),
            tooltip: '分享',
          ),
        ],
      ),
      body: Column(
        children: [
          // // 报告信息头部
          // _buildReportHeader(context, report),

          // WebView内容
          Expanded(
            child: _buildWebView(context, report),
          ),
        ],
      ),
    );
  }

  Widget _buildWebView(BuildContext context, HealthReport report) {
    if (report.status != ReportStatus.ready) {
      return _buildStatusMessage(context, report.status);
    }

    if (report.reportUrl.isEmpty) {
      return _buildErrorMessage(context, '报告链接无效');
    }

    return WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(report.reportUrl)),
    );
  }

  Widget _buildStatusMessage(BuildContext context, ReportStatus status) {
    String message;
    IconData icon;
    Color color;

    switch (status) {
      case ReportStatus.generating:
        message = '报告正在生成中，请稍候...';
        icon = Icons.hourglass_empty;
        color = Theme.of(context).colorScheme.secondary;
        break;
      case ReportStatus.failed:
        message = '报告生成失败，请重试';
        icon = Icons.error;
        color = Theme.of(context).colorScheme.error;
        break;
      default:
        message = '报告状态未知';
        icon = Icons.help;
        color = Theme.of(context).colorScheme.outline;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: color,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorMessage(BuildContext context, String message) {
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
            message,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showShareDialog(BuildContext context, WidgetRef ref, HealthReport report) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('分享报告'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.wechat),
              title: const Text('微信'),
              onTap: () async {
                Navigator.pop(context);
                final shareLink = await ref.read(reportsPageNotifierProvider.notifier).shareReport(
                  report.id,
                  ShareMethod.wechat,
                );
                if (shareLink != null) {
                  // TODO: 通过状态管理显示成功信息，不使用SnackBar
                  // 应该在页面中添加成功状态显示
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('邮件'),
              onTap: () async {
                Navigator.pop(context);
                final shareLink = await ref.read(reportsPageNotifierProvider.notifier).shareReport(
                  report.id,
                  ShareMethod.email,
                );
                if (shareLink != null) {
                  // TODO: 通过状态管理显示成功信息，不使用SnackBar
                  // 应该在页面中添加成功状态显示
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('复制链接'),
              onTap: () async {
                Navigator.pop(context);
                final shareLink = await ref.read(reportsPageNotifierProvider.notifier).shareReport(
                  report.id,
                  ShareMethod.link,
                );
                if (shareLink != null) {
                  // TODO: 通过状态管理显示成功信息，不使用SnackBar
                  // 应该在页面中添加成功状态显示
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
