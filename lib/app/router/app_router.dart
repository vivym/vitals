import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/screens/login_screen.dart' as auth_pages;
import '../../features/auth/presentation/screens/patient_sign_screen.dart' as auth_pages;
import '../../features/auth/presentation/screens/patient_sign_success_screen.dart' as auth_pages;
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/health_data/presentation/screens/blood_pressure_screen.dart';

import '../../shared/widgets/main_navigation_scaffold.dart';

/// 路由路径常量
class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const profile = '/profile';
  static const healthData = '/health-data';
  static const reports = '/reports';
  static const patients = '/patients';
  static const patientSign = '/patient/sign';           // 改名：患者签约
  static const patientSignSuccess = '/patient/sign/success';  // 改名：签约成功

  // 认证相关路由
  static const auth = '/auth';
  static const authSuccess = '/auth/success';
}

/// 应用路由配置
class AppRouter {
  /// 公开路由列表（不需要认证）
  static const List<String> publicRoutes = [
    AppRoutes.splash,
    AppRoutes.login,
    AppRoutes.authSuccess,
  ];

    static GoRouter createRouter([ProviderContainer? container]) {
    // 创建一个 ChangeNotifier 来监听认证状态变化
    final authStateNotifier = container != null
        ? _AuthStateNotifier(container)
        : null;



    return GoRouter(
      initialLocation: AppRoutes.splash,
      debugLogDiagnostics: true,
      refreshListenable: authStateNotifier,
      redirect: (context, state) {
        // 如果没有提供container，跳过重定向
        if (container == null) {
          print('⚠️ 路由重定向：container为null，跳过重定向');
          return null;
        }

        final authState = container.read(authNotifierProvider);
        final currentLocation = state.matchedLocation;

        print('🧭 路由重定向检查 [${DateTime.now().millisecondsSinceEpoch}]:');
        print('   - 当前位置: $currentLocation');
        print('   - 认证状态: isAuthenticated=${authState.isAuthenticated}, isLoading=${authState.isLoading}');
        print('   - 患者状态: hasSignedPatient=${authState.hasSignedPatient}, requiresPatientSign=${authState.requiresPatientSign}');

        // 如果正在加载，显示启动页
        if (authState.isLoading) {
          print('⏳ 正在加载中，保持在启动页');
          return currentLocation == AppRoutes.splash ? null : AppRoutes.splash;
        }

        // 检查是否为公开路由
        final isPublicRoute = publicRoutes.contains(currentLocation);
        print('   - 是否为公开路由: $isPublicRoute');

        if (authState.isAuthenticated) {
          print('✅ 用户已认证');

          // 已认证但未签约患者 - 强制跳转到签约页面
          if (authState.requiresPatientSign &&
              currentLocation != AppRoutes.patientSign &&
              currentLocation != AppRoutes.patientSignSuccess) {
            print('🏥 重定向到患者签约页面');
            return AppRoutes.patientSign;
          }

          // 已认证用户访问启动页或登录页，重定向到首页
          if (currentLocation == AppRoutes.splash || currentLocation == AppRoutes.login) {
            print('🏠 重定向到首页');
            return AppRoutes.dashboard;
          }

          print('✅ 保持当前路由');
          return null;
        } else {
          print('❌ 用户未认证');

          // 未认证用户只能访问公开路由
          if (!isPublicRoute) {
            print('🔐 重定向到登录页');
            return AppRoutes.login;
          }

          print('✅ 保持当前路由');
          return null;
        }
      },
      routes: [
        // 启动页
        GoRoute(
          path: AppRoutes.splash,
          builder: (context, state) => const SplashScreen(),
        ),

        // 登录页
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => const auth_pages.LoginScreen(),
        ),

        // 主导航页面 - 所有底部导航页面共享同一个实例
        GoRoute(
          path: AppRoutes.dashboard,
          builder: (context, state) => const MainNavigationScaffold(currentIndex: 0),
          routes: [
            // 血压详情页面作为子路由
            GoRoute(
              path: 'health-data/blood-pressure',
              builder: (context, state) => const BloodPressureScreen(),
            ),
          ],
        ),

        // 其他底部导航页面重定向到主导航页面
        GoRoute(
          path: AppRoutes.healthData,
          redirect: (context, state) => AppRoutes.dashboard,
        ),

        GoRoute(
          path: AppRoutes.reports,
          redirect: (context, state) => AppRoutes.dashboard,
        ),

        GoRoute(
          path: AppRoutes.profile,
          redirect: (context, state) => AppRoutes.dashboard,
        ),

        // 就诊人管理
        GoRoute(
          path: AppRoutes.patients,
          builder: (context, state) => const PatientsScreen(),
        ),

        // 患者签约页面
        GoRoute(
          path: AppRoutes.patientSign,
          builder: (context, state) => const auth_pages.PatientSignScreen(),
          redirect: (context, state) {
            // 防止已经有患者的用户访问签约页面
            if (container != null) {
              final authState = container.read(authNotifierProvider);
              if (authState.hasSignedPatient) {
                return AppRoutes.dashboard;
              }
            }
            return null;
          },
        ),

        // 签约成功页面
        GoRoute(
          path: AppRoutes.patientSignSuccess,
          builder: (context, state) => const auth_pages.PatientSignSuccessScreen(),
        ),
      ],
    );
  }
}

/// 启动页面组件
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print('🚀 SplashScreen initState 被调用');
    // 应用启动时触发自动登录检查
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('🎯 PostFrameCallback 执行，准备调用自动登录');
      _checkAutoLogin();
    });
  }

  Future<void> _checkAutoLogin() async {
    print('🔍 开始自动登录检查');
    final authNotifier = ref.read(authNotifierProvider.notifier);
    await authNotifier.autoLogin();
    print('✅ 自动登录检查完成');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.health_and_safety,
              size: 80,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(height: 24),
            Text(
              '健康管理',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '专业的健康数据管理平台',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.onPrimary,
                ),
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthDataScreen extends StatelessWidget {
  const HealthDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('健康数据'),
      ),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('健康报告'),
      ),
    );
  }
}

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('就诊人管理'),
      ),
    );
  }
}

/// 认证状态监听器，用于触发路由刷新
class _AuthStateNotifier extends ChangeNotifier {
  final ProviderContainer _container;
  late final ProviderSubscription _subscription;

  _AuthStateNotifier(this._container) {
    // 监听认证状态变化
    _subscription = _container.listen(
      authNotifierProvider,
      (previous, next) {
        print('🔄 认证状态变化，触发路由刷新');
        print('   - 之前: isAuthenticated=${previous?.isAuthenticated}, isLoading=${previous?.isLoading}');
        print('   - 现在: isAuthenticated=${next.isAuthenticated}, isLoading=${next.isLoading}');
        notifyListeners(); // 触发 GoRouter 重新执行 redirect
      },
    );
  }

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}


