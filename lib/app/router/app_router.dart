import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_constants.dart';
import '../../features/auth/presentation/pages/login_screen.dart' as auth_pages;
import '../../features/auth/presentation/pages/patient_sign_screen.dart' as auth_pages;
import '../../features/auth/presentation/pages/patient_sign_success_screen.dart' as auth_pages;
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

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
    return GoRouter(
      initialLocation: AppRoutes.splash,
      debugLogDiagnostics: true,
      redirect: (context, state) {
        // 如果没有提供container，跳过重定向
        if (container == null) return null;

        final authState = container.read(authNotifierProvider);
        final currentLocation = state.matchedLocation;

        // 如果正在加载，显示启动页
        if (authState.isLoading) {
          return currentLocation == AppRoutes.splash ? null : AppRoutes.splash;
        }

        // 检查是否为公开路由
        final isPublicRoute = publicRoutes.contains(currentLocation);

        if (authState.isAuthenticated) {
          // 已认证但未签约患者 - 强制跳转到签约页面
          if (authState.requiresPatientSign &&
              currentLocation != AppRoutes.patientSign &&
              currentLocation != AppRoutes.patientSignSuccess) {
            return AppRoutes.patientSign;
          }

          // 已认证用户访问登录页，重定向到首页
          if (currentLocation == AppRoutes.login) {
            return AppRoutes.dashboard;
          }

          return null;
        } else {
          // 未认证用户只能访问公开路由
          if (!isPublicRoute) {
            return AppRoutes.login;
          }
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
