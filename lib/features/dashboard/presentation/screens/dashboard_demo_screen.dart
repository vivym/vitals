import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/health_score_card.dart';
import '../widgets/health_data_overview_section.dart';
import '../widgets/recovery_goals_section.dart';
import '../widgets/health_education_section.dart';
import '../widgets/quick_actions_section.dart';
import '../../data/models/dashboard_models.dart';

/// 首页演示页面
class DashboardDemoScreen extends ConsumerWidget {
  const DashboardDemoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页模块演示'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 健康评分卡片
            const HealthScoreCard(),
            const SizedBox(height: 24),

            // 健康数据概览
            HealthDataOverviewSection(data: _getMockHealthData()),
            const SizedBox(height: 24),

            // 康复目标
            RecoveryGoalsSection(goals: _getMockRecoveryGoals()),
            const SizedBox(height: 24),

            // 健康宣教
            HealthEducationSection(items: _getMockEducationItems()),
            const SizedBox(height: 24),

            // 快速操作
            const QuickActionsSection(),
          ],
        ),
      ),
    );
  }

  /// 获取模拟健康数据
  HealthDataOverview _getMockHealthData() {
    return HealthDataOverview(
      bloodPressure: BloodPressureSummary(
        systolic: 128,
        diastolic: 82,
        recordedAt: DateTime.now().subtract(const Duration(hours: 2)),
        level: BloodPressureLevel.elevated,
        trend: 'stable',
      ),
      heartRate: HeartRateSummary(
        bpm: 72,
        recordedAt: DateTime.now().subtract(const Duration(hours: 1)),
        zone: HeartRateZone.resting,
        trend: 'stable',
      ),
      weight: WeightSummary(
        weight: 68.5,
        recordedAt: DateTime.now().subtract(const Duration(days: 1)),
        bmi: 22.3,
        category: BMICategory.normal,
        trend: 'falling',
      ),
      steps: StepsSummary(
        steps: 7832,
        recordedAt: DateTime.now(),
        goal: 10000,
        calories: 324.5,
        distance: 5.8,
      ),
      lastUpdated: DateTime.now(),
    );
  }

  /// 获取模拟康复目标
  List<RecoveryGoal> _getMockRecoveryGoals() {
    return [
      RecoveryGoal(
        id: 'goal_1',
        title: '血压控制目标',
        description: '维持血压在正常范围内',
        type: GoalType.bloodPressure,
        targetValue: 120,
        currentValue: 128,
        unit: 'mmHg',
        deadline: DateTime.now().add(const Duration(days: 60)),
        status: GoalStatus.active,
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        updatedAt: DateTime.now(),
      ),
      RecoveryGoal(
        id: 'goal_2',
        title: '每日步数目标',
        description: '每天走路10000步',
        type: GoalType.exercise,
        targetValue: 10000,
        currentValue: 7832,
        unit: '步',
        deadline: DateTime.now().add(const Duration(days: 20)),
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        updatedAt: DateTime.now(),
        status: GoalStatus.active,
      ),
      RecoveryGoal(
        id: 'goal_3',
        title: '胆固醇控制',
        description: '控制低密度脂蛋白水平',
        type: GoalType.cholesterol,
        targetValue: 1.8,
        currentValue: 2.1,
        unit: 'mmol/L',
        deadline: DateTime.now().add(const Duration(days: 90)),
        createdAt: DateTime.now().subtract(const Duration(days: 45)),
        updatedAt: DateTime.now(),
        status: GoalStatus.active,
      ),
      RecoveryGoal(
        id: 'goal_4',
        title: '用药依从性',
        description: '按时服用降压药物',
        type: GoalType.medication,
        targetValue: 90,
        currentValue: 85,
        unit: '%',
        deadline: DateTime.now().add(const Duration(days: 30)),
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
        updatedAt: DateTime.now(),
        status: GoalStatus.active,
      ),
    ];
  }

  /// 获取模拟健康教育内容
  List<HealthEducationItem> _getMockEducationItems() {
    return [
      HealthEducationItem(
        id: 'edu_1',
        title: '为什么要测动态血压？有什么注意事项',
        summary: '动态血压监测是诊断高血压的重要手段，了解其原理和注意事项对准确诊断至关重要',
        content: '动态血压监测的详细内容...',
        type: EducationType.article,
        imageUrl: 'https://example.com/images/dynamic-bp.jpg',
        readingTimeMinutes: 8,
        tags: ['血压', '监测', '注意事项'],
        publishedAt: DateTime.now().subtract(const Duration(days: 2)),
        isRead: false,
        isFavorited: false,
        category: '血压管理',
        authorName: '心血管专家',
        thumbnailUrl: 'https://example.com/images/dynamic-bp.jpg',
      ),
      HealthEducationItem(
        id: 'edu_2',
        title: '低盐饮食与选购',
        summary: '合理的低盐饮食对控制血压有重要作用，学会正确选购低盐食品',
        content: '低盐饮食指南和选购技巧...',
        type: EducationType.video,
        videoUrl: 'https://example.com/videos/low-salt-diet.mp4',
        readingTimeMinutes: 12,
        tags: ['饮食', '低盐', '选购'],
        publishedAt: DateTime.now().subtract(const Duration(days: 5)),
        isRead: true,
        isFavorited: true,
        category: '饮食指导',
        authorName: '营养师',
        thumbnailUrl: 'https://example.com/images/low-salt-diet.jpg',
      ),
      HealthEducationItem(
        id: 'edu_3',
        title: '高血压患者的运动指南',
        summary: '科学运动有助于控制血压，了解适合的运动方式和强度',
        content: '高血压患者运动指南...',
        type: EducationType.article,
        imageUrl: 'https://example.com/images/exercise-guide.jpg',
        readingTimeMinutes: 10,
        tags: ['运动', '高血压', '健康'],
        publishedAt: DateTime.now().subtract(const Duration(days: 7)),
        isRead: false,
        isFavorited: false,
        category: '运动指导',
        authorName: '运动康复师',
        thumbnailUrl: 'https://example.com/images/exercise-guide.jpg',
      ),
    ];
  }
}
