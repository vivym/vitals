import 'package:flutter/material.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

/// 健康报告卡片
class ReportCard extends StatelessWidget {
  final HealthReport report;
  final VoidCallback onTap;
  final VoidCallback onMarkAsRead;
  final VoidCallback onShare;

  const ReportCard({
    super.key,
    required this.report,
    required this.onTap,
    required this.onMarkAsRead,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 标题和状态
              Row(
                children: [
                  Expanded(
                    child: Text(
                      report.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _buildStatusChip(context),
                ],
              ),

              const SizedBox(height: 8),

              // 描述
              Text(
                report.description,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 12),

              // 底部信息
              Row(
                children: [
                  // 生成时间
                  Icon(
                    Icons.schedule,
                    size: 16,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _formatDate(report.generatedAt ?? report.createdAt ?? DateTime.now()),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),

                  const Spacer(),

                  // 操作按钮
                  if (report.status == ReportStatus.ready) ...[
                    IconButton(
                      onPressed: onMarkAsRead,
                      icon: Icon(
                        report.isRead ? Icons.check_circle : Icons.check_circle_outline,
                        color: report.isRead
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.outline,
                      ),
                      tooltip: report.isRead ? '已读' : '标记已读',
                    ),
                    IconButton(
                      onPressed: onShare,
                      icon: Icon(
                        Icons.share,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      tooltip: '分享',
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    Color color;
    String text;
    IconData icon;

    switch (report.status) {
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
