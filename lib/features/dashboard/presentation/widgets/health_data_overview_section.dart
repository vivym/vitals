import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/dashboard_models.dart';
import 'health_data_card.dart';

/// 健康数据概览区域
class HealthDataOverviewSection extends StatelessWidget {
  const HealthDataOverviewSection({super.key, required this.data});

  final HealthDataOverview data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '健康数据',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
              onPressed: () => context.go('/health-data'),
              child: const Text('查看更多'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.1,
          children: [
            if (data.bloodPressure != null)
              BloodPressureCard(data: data.bloodPressure!),
            if (data.heartRate != null)
              HeartRateCard(data: data.heartRate!),
            if (data.weight != null)
              WeightCard(data: data.weight!),
            if (data.steps != null)
              StepsCard(data: data.steps!),
          ],
        ),
      ],
    );
  }
}

/// 血压卡片
class BloodPressureCard extends StatelessWidget {
  const BloodPressureCard({super.key, required this.data});

  final BloodPressureSummary data;

  @override
  Widget build(BuildContext context) {
    return HealthDataCard(
      icon: Icons.favorite,
      title: '血压',
      value: '${data.systolic}/${data.diastolic}',
      unit: 'mmHg',
      subtitle: data.level?.label ?? '',
      color: data.level?.color ?? Theme.of(context).primaryColor,
      onTap: () => context.go('/health-data/blood-pressure'),
    );
  }
}

/// 心率卡片
class HeartRateCard extends StatelessWidget {
  const HeartRateCard({super.key, required this.data});

  final HeartRateSummary data;

  @override
  Widget build(BuildContext context) {
    return HealthDataCard(
      icon: Icons.favorite,
      title: '心率',
      value: '${data.bpm}',
      unit: '次/分',
      subtitle: data.zone?.label ?? '',
      color: data.zone?.color ?? Theme.of(context).primaryColor,
      onTap: () => context.go('/health-data/heart-rate'),
    );
  }
}

/// 体重卡片
class WeightCard extends StatelessWidget {
  const WeightCard({super.key, required this.data});

  final WeightSummary data;

  @override
  Widget build(BuildContext context) {
    return HealthDataCard(
      icon: Icons.monitor_weight,
      title: '体重',
      value: '${data.weight.toStringAsFixed(1)}',
      unit: 'kg',
      subtitle: data.bmiCategory?.label ?? '',
      color: data.bmiCategory?.color ?? Theme.of(context).primaryColor,
      onTap: () => context.go('/health-data/weight'),
    );
  }
}

/// 步数卡片
class StepsCard extends StatelessWidget {
  const StepsCard({super.key, required this.data});

  final StepsSummary data;

  @override
  Widget build(BuildContext context) {
    return HealthDataCard(
      icon: Icons.directions_walk,
      title: '步数',
      value: '${data.steps}',
      unit: '步',
      subtitle: data.goal != null ? '目标: ${data.goal}步' : '',
      color: Theme.of(context).primaryColor,
      onTap: () => context.go('/health-data/steps'),
    );
  }
}
