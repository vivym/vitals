import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/entities/reports_state.dart';
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
          // 报告信息头部
          _buildReportHeader(context, report),

          // WebView内容
          Expanded(
            child: _buildWebView(context, report),
          ),
        ],
      ),
    );
  }

  Widget _buildReportHeader(BuildContext context, HealthReport report) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 标题和状态
          Row(
            children: [
              Expanded(
                child: Text(
                  report.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _buildStatusChip(context, report.status),
            ],
          ),

          const SizedBox(height: 8),

          // 描述
          Text(
            report.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          const SizedBox(height: 12),

          // 元信息
          Row(
            children: [
              Icon(
                Icons.schedule,
                size: 16,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(width: 4),
              Text(
                                 '生成时间: ${_formatDate(report.generatedAt ?? report.createdAt ?? DateTime.now())}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),

              const Spacer(),

              if (report.status == ReportStatus.ready && !report.isRead)
                ElevatedButton.icon(
                  onPressed: () => _markAsRead(context),
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text('标记已读'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, ReportStatus status) {
    Color color;
    String text;
    IconData icon;

    switch (status) {
      case ReportStatus.ready:
        color = Theme.of(context).colorScheme.primary;
        text = '已就绪';
        icon = Icons.check_circle;
        break;
      case ReportStatus.generating:
        color = Theme.of(context).colorScheme.secondary;
        text = '生成中';
        icon = Icons.hourglass_empty;
        break;
      case ReportStatus.failed:
        color = Theme.of(context).colorScheme.error;
        text = '生成失败';
        icon = Icons.error;
        break;
      default:
        color = Theme.of(context).colorScheme.outline;
        text = '未知';
        icon = Icons.help;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebView(BuildContext context, HealthReport report) {
    if (report.status != ReportStatus.ready) {
      return _buildStatusMessage(context, report.status);
    }

    if (report.reportUrl == null || report.reportUrl!.isEmpty) {
      return _buildErrorMessage(context, '报告链接无效');
    }

    return WebViewWidget(
      controller: WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(report.reportUrl!)),
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

  void _markAsRead(BuildContext context) {
    // TODO: 实现标记已读功能，需要访问ref
    // 显示确认信息，应该在UI中显示而不是使用SnackBar
    // 这里需要通过状态管理来处理标记已读的反馈
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

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return '今天';
    } else if (difference.inDays == 1) {
      return '昨天';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}天前';
    } else {
      return '${date.month}月${date.day}日';
    }
  }
}
