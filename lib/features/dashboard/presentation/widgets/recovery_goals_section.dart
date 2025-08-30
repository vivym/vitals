import 'package:flutter/material.dart';
import '../../data/models/dashboard_models.dart';

/// 康复目标区域
class RecoveryGoalsSection extends StatelessWidget {
  const RecoveryGoalsSection({super.key, required this.goals});

  final List<RecoveryGoal> goals;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '我的康复目标',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
              onPressed: () {}, // 空函数，保持按钮外观但无功能
              child: const Text('查看全部'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...goals.take(4).map((goal) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: RecoveryGoalCard(goal: goal),
        )),
      ],
    );
  }
}

/// 康复目标卡片
class RecoveryGoalCard extends StatelessWidget {
  const RecoveryGoalCard({super.key, required this.goal});

  final RecoveryGoal goal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  goal.type.icon,
                  color: goal.type.color,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    goal.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                if (goal.isCompleted)
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: goal.progress.clamp(0.0, 1.0),
              backgroundColor: goal.type.color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation(goal.type.color),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '目标: ${goal.targetValue.toStringAsFixed(0)} ${goal.unit}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '进行中',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
