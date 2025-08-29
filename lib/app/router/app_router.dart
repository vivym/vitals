import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_constants.dart';
import '../../features/auth/presentation/pages/login_screen.dart' as auth_pages;
import '../../features/auth/presentation/pages/create_patient_screen.dart' as auth_pages;
import '../../features/auth/presentation/pages/success_screen.dart' as auth_pages;
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';

/// 路由路径常量
class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const profile = '/profile';
  static const healthData = '/health-data';
  static const reports = '/reports';
  static const patients = '/patients';
  static const createPatient = '/patients/create';
  static const patientCreateSuccess = '/patients/create/success';

  // 认证相关路由
  static const auth = '/auth';
  static const authSuccess = '/auth/success';
}

/// 应用路由配置
class AppRouter {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: AppRoutes.splash,
      debugLogDiagnostics: true,
      redirect: (context, state) {
        // 获取认证状态
        final container = ProviderScope.containerOf(context);
        final authState = container.read(authNotifierProvider);

        // 如果已认证，重定向到首页
        if (authState.isAuthenticated) {
          return AppRoutes.dashboard;
        }

        // 如果未认证且不在登录页，重定向到登录页
        if (!authState.isAuthenticated && state.matchedLocation != AppRoutes.login) {
          return AppRoutes.login;
        }

        return null;
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

        // 首页
        GoRoute(
          path: AppRoutes.dashboard,
          builder: (context, state) => const DashboardScreen(),
        ),

        // 个人中心
        GoRoute(
          path: AppRoutes.profile,
          builder: (context, state) => const ProfileScreen(),
        ),

        // 健康数据
        GoRoute(
          path: AppRoutes.healthData,
          builder: (context, state) => const HealthDataScreen(),
        ),

        // 健康报告
        GoRoute(
          path: AppRoutes.reports,
          builder: (context, state) => const ReportsScreen(),
        ),

        // 就诊人管理
        GoRoute(
          path: AppRoutes.patients,
          builder: (context, state) => const PatientsScreen(),
        ),

        // 创建就诊人
        GoRoute(
          path: AppRoutes.createPatient,
          builder: (context, state) => const auth_pages.CreatePatientScreen(),
        ),

        // 就诊人创建成功
        GoRoute(
          path: AppRoutes.patientCreateSuccess,
          builder: (context, state) => const auth_pages.SuccessScreen(),
        ),
      ],
    );
  }
}

/// 占位页面组件（临时使用）
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('启动页'),
      ),
    );
  }
}



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('个人中心'),
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
