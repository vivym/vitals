import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dashboard_notifier.dart';
import '../widgets/health_score_card.dart';
import '../widgets/health_data_overview_section.dart';
import '../widgets/recovery_goals_section.dart';
import '../widgets/health_education_section.dart';
import '../widgets/quick_actions_section.dart';
import '../widgets/loading_view.dart';
import '../widgets/error_view.dart';
import '../widgets/empty_state_view.dart';

/// 首页内容组件 - 不包含AppBar和BottomNavigationBar
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardNotifierProvider);

    return RefreshIndicator(
      onRefresh: () => ref.read(dashboardNotifierProvider.notifier).refresh(),
      child: dashboardState.when(
        loading: () => const LoadingView(),
        error: (error, stackTrace) => ErrorView(
          error: error,
          onRetry: () => ref.read(dashboardNotifierProvider.notifier).refresh(),
        ),
        data: (state) => DashboardContent(state: state),
      ),
    );
  }
}

/// 首页内容组件
class DashboardContent extends ConsumerWidget {
  const DashboardContent({super.key, required this.state});

  final DashboardState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (state.healthData == null && state.recoveryGoals.isEmpty && state.educationItems.isEmpty) {
      return const EmptyStateView();
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // 健康评分卡片
        const HealthScoreCard(),

        const SizedBox(height: 16),

        // 健康数据概览
        if (state.healthData != null) ...[
          HealthDataOverviewSection(data: state.healthData!),
          const SizedBox(height: 16),
        ],

        // 康复目标
        if (state.recoveryGoals.isNotEmpty) ...[
          RecoveryGoalsSection(goals: state.recoveryGoals),
          const SizedBox(height: 16),
        ],

        // 健康宣教
        if (state.educationItems.isNotEmpty) ...[
          HealthEducationSection(items: state.educationItems),
          const SizedBox(height: 16),
        ],

        // 快速操作
        const QuickActionsSection(),
      ],
    );
  }
}
