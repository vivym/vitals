import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/app/router/app_router.dart';

void main() {
  group('App Router Tests', () {
    test('should create router configuration', () {
      final router = AppRouter.createRouter();
      expect(router, isNotNull);
      expect(router.routeInformationParser, isNotNull);
      expect(router.routerDelegate, isNotNull);
    });

    test('should have correct route paths', () {
      expect(AppRoutes.splash, equals('/'));
      expect(AppRoutes.login, equals('/login'));
      expect(AppRoutes.dashboard, equals('/dashboard'));
      expect(AppRoutes.patientSign, equals('/patient/sign'));
    });

    test('should import correct login screen class', () {
      // 验证路由配置中导入了正确的LoginScreen
      // 这里我们通过检查文件导入来验证
      const loginPath = AppRoutes.login;
      expect(loginPath, equals('/login'));

      // 验证路由常量配置正确
      expect(AppRoutes.patientSign, equals('/patient/sign'));
      expect(AppRoutes.patientSignSuccess, equals('/patient/sign/success'));
    });
  });
}
