import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/dashboard_notifier.dart';
import '../../data/models/dashboard_models.dart';
import '../widgets/health_score_card.dart';
import '../widgets/health_data_overview_section.dart';
import '../widgets/recovery_goals_section.dart';
import '../widgets/health_education_section.dart';
import '../widgets/quick_actions_section.dart';
import '../widgets/loading_view.dart';
import '../widgets/error_view.dart';
import '../widgets/empty_state_view.dart';
import '../widgets/bottom_navigation_bar.dart';

/// 首页主屏幕
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardNotifierProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // 浅灰色背景
      appBar: AppBar(
        title: const Text('王高南'),
        centerTitle: true, // 标题居中
        backgroundColor: Colors.white, // 白色header
        foregroundColor: Colors.black, // 黑色文字
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // 刷新图标也设为黑色
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(dashboardNotifierProvider.notifier).refresh(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(dashboardNotifierProvider.notifier).refresh(),
        child: dashboardState.when(
          loading: () => const LoadingView(),
          error: (error, stackTrace) => ErrorView(
            error: error,
            onRetry: () => ref.read(dashboardNotifierProvider.notifier).refresh(),
          ),
          data: (state) => DashboardContent(state: state),
        ),
      ),
      bottomNavigationBar: const DashboardBottomNavigationBar(currentIndex: 0),
    );
  }
}

/// 首页内容组件
class DashboardContent extends ConsumerWidget {
  const DashboardContent({super.key, required this.state});

  final DashboardState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (state.isEmpty) {
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
        if (state.activeGoals.isNotEmpty) ...[
          RecoveryGoalsSection(goals: state.activeGoals),
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
