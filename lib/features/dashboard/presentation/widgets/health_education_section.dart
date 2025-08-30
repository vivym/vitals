import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/dashboard_models.dart';
import '../providers/dashboard_notifier.dart';

/// 健康宣教区域
class HealthEducationSection extends ConsumerWidget {
  const HealthEducationSection({super.key, required this.items});

  final List<HealthEducationItem> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '学习和运动任务',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
              onPressed: () => context.go('/education'),
              child: const Text('查看更多'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...items.take(3).map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: HealthEducationCard(item: item),
        )),
      ],
    );
  }
}

/// 健康教育卡片
class HealthEducationCard extends ConsumerWidget {
  const HealthEducationCard({super.key, required this.item});

  final HealthEducationItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: InkWell(
        onTap: () {
          // 标记为已读
          if (!item.isRead) {
            ref.read(dashboardNotifierProvider.notifier)
                .markEducationAsRead(item.id);
          }

          // 跳转到详情页
          context.go('/education/${item.id}');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // 类型图标
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  item.type.icon,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),

              const SizedBox(width: 12),

              // 内容
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: item.isRead ? FontWeight.normal : FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.summary,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${item.readingTimeMinutes}分钟阅读',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const Spacer(),
                        if (!item.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              // 收藏按钮
              IconButton(
                icon: Icon(
                  item.isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: item.isFavorited ? Colors.red : null,
                ),
                onPressed: () => ref
                    .read(dashboardNotifierProvider.notifier)
                    .toggleEducationFavorite(item.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
