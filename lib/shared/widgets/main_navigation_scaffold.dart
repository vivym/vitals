import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/navigation_constants.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/dashboard/presentation/providers/dashboard_notifier.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/health_data/presentation/screens/health_data_demo_page.dart';
import '../../features/reports/presentation/screens/reports_list_page.dart';
import '../providers/current_user_provider.dart';

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
    // 在这里直接检查currentUser状态
    print('🔍 _ProfilePageContent.build() - 检查currentUser');
    final currentUser = ref.watch(currentUserProvider);
    print('🔍 _ProfilePageContent - currentUser: $currentUser');
    print('🔍 _ProfilePageContent - ref hashCode: ${ref.hashCode}');

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
      body: const ProfileScreen(),
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


