import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/navigation_constants.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/dashboard/presentation/providers/dashboard_notifier.dart';
import '../../features/profile/presentation/providers/profile_notifier.dart';
import '../../features/health_data/presentation/screens/health_data_demo_page.dart';
import '../../features/reports/presentation/screens/reports_list_page.dart';

import '../../features/dashboard/presentation/widgets/loading_view.dart';
import '../../features/dashboard/presentation/widgets/error_view.dart';

/// 主导航脚手架，包含固定的底部导航栏和可滑动的页面内容
class MainNavigationScaffold extends ConsumerStatefulWidget {
  const MainNavigationScaffold({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  ConsumerState<MainNavigationScaffold> createState() => _MainNavigationScaffoldState();
}

class _MainNavigationScaffoldState extends ConsumerState<MainNavigationScaffold>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage: _currentIndex);

    // 监听路由变化，自动切换到对应的页面索引
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updatePageIndexFromRoute();
    });
  }

  @override
  void didUpdateWidget(MainNavigationScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != oldWidget.currentIndex) {
      _navigateToPage(widget.currentIndex);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
      // 去掉动画，直接跳转到目标页面
      _pageController.jumpToPage(index);
    }
  }

  /// 根据当前路由更新页面索引
  void _updatePageIndexFromRoute() {
    final currentLocation = GoRouterState.of(context).matchedLocation;
    int targetIndex = 0;

    switch (currentLocation) {
      case '/dashboard':
        targetIndex = 0;
        break;
      case '/health-data':
        targetIndex = 1;
        break;
      case '/reports':
        targetIndex = 2;
        break;
      case '/profile':
        targetIndex = 3;
        break;
      default:
        targetIndex = 0;
    }

    if (targetIndex != _currentIndex) {
      _navigateToPage(targetIndex);
    }
  }

  void _onBottomNavTap(int index) {
    // 立即切换到对应页面，然后更新路由
    _navigateToPage(index);

    // 更新路由以保持URL同步
    switch (index) {
      case NavigationIndices.dashboard:
        context.go('/dashboard');
        break;
      case NavigationIndices.healthData:
        context.go('/health-data');
        break;
      case NavigationIndices.reports:
        context.go('/reports');
        break;
      case NavigationIndices.profile:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // 禁用手势滑动，只允许程序控制
        children: const [
          // 移除各页面的AppBar和BottomNavigationBar，只保留内容
          _DashboardPageContent(),
          _HealthDataPageContent(),
          _ReportsPageContent(),
          _ProfilePageContent(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onBottomNavTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(NavigationIcons.dashboard),
            label: NavigationLabels.dashboard,
          ),
          BottomNavigationBarItem(
            icon: Icon(NavigationIcons.healthData),
            label: NavigationLabels.healthData,
          ),
          BottomNavigationBarItem(
            icon: Icon(NavigationIcons.reports),
            label: NavigationLabels.reports,
          ),
          BottomNavigationBarItem(
            icon: Icon(NavigationIcons.profile),
            label: NavigationLabels.profile,
          ),
        ],
      ),
    );
  }
}

/// 首页内容（不包含AppBar和BottomNavigationBar）
class _DashboardPageContent extends ConsumerWidget {
  const _DashboardPageContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('王高南'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {}, // 暂时为空函数
            child: const Text('我的方案', style: TextStyle(color: Colors.white)),
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
    );
  }
}

/// 健康数据页面内容
class _HealthDataPageContent extends StatelessWidget {
  const _HealthDataPageContent();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _HealthDataAppBar(),
      body: HealthDataDemoPage(),
    );
  }
}

/// 报告页面内容
class _ReportsPageContent extends StatelessWidget {
  const _ReportsPageContent();

  @override
  Widget build(BuildContext context) {
    return const ReportsListPage();
  }
}

/// 个人中心页面内容
class _ProfilePageContent extends ConsumerWidget {
  const _ProfilePageContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('个人中心'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.go('/profile/settings'),
          ),
        ],
      ),
      body: profileState.when(
        loading: () => const LoadingView(),
        error: (error, _) => ErrorView(
          error: error,
          onRetry: () => ref.read(profileNotifierProvider.notifier).refresh(),
        ),
        data: (state) => _ProfileContentWidget(state: state),
      ),
    );
  }
}

/// 健康数据页面的AppBar
class _HealthDataAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HealthDataAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('健康数据'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// 个人中心内容组件
class _ProfileContentWidget extends StatelessWidget {
  const _ProfileContentWidget({required this.state});

  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // 刷新数据
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 用户信息头部
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 40),
                ),
                SizedBox(height: 12),
                Text(
                  '张三',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '13800000000',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 快捷功能
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '快捷功能',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _QuickActionItem(icon: Icons.favorite, label: '我的收藏'),
                    _QuickActionItem(icon: Icons.history, label: '就诊记录'),
                    _QuickActionItem(icon: Icons.message, label: '消息中心'),
                    _QuickActionItem(icon: Icons.settings, label: '设置'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 功能列表
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              children: [
                _FunctionListItem(icon: Icons.person, title: '个人资料'),
                _FunctionListItem(icon: Icons.people, title: '就诊人管理'),
                _FunctionListItem(icon: Icons.devices, title: '智能设备'),
                _FunctionListItem(icon: Icons.medical_services, title: '我的服务'),
                _FunctionListItem(icon: Icons.assessment, title: '专项评估'),
                _FunctionListItem(icon: Icons.medication, title: '用药提醒'),
                _FunctionListItem(icon: Icons.help, title: '帮助与反馈'),
                _FunctionListItem(icon: Icons.info, title: '关于'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 快捷操作项
class _QuickActionItem extends StatelessWidget {
  const _QuickActionItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

/// 功能列表项
class _FunctionListItem extends StatelessWidget {
  const _FunctionListItem({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // 处理点击事件
      },
    );
  }
}
