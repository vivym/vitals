import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 快速操作区域
class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '快速操作',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.0,
          children: [
            QuickActionButton(
              icon: Icons.add_chart,
              label: '记录数据',
              onTap: () => context.go('/health-data/record'),
            ),
            QuickActionButton(
              icon: Icons.medical_services,
              label: '预约问诊',
              onTap: () => context.go('/consultation'),
            ),
            QuickActionButton(
              icon: Icons.calendar_today,
              label: '随访计划',
              onTap: () => context.go('/follow-up'),
            ),
            QuickActionButton(
              icon: Icons.help_outline,
              label: '健康咨询',
              onTap: () => context.go('/help'),
            ),
          ],
        ),
      ],
    );
  }
}

/// 快速操作按钮
class QuickActionButton extends StatelessWidget {
  const QuickActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
