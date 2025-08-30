import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/app/router/app_router.dart';

void main() {
  group('AppRouter', () {
    test('公开路由列表应该包含正确的路径', () {
      // Arrange & Act
      final publicRoutes = AppRouter.publicRoutes;

      // Assert
      expect(publicRoutes, contains('/'));
      expect(publicRoutes, contains('/login'));
      expect(publicRoutes, contains('/auth/success'));
      expect(publicRoutes, isNot(contains('/dashboard')));
      expect(publicRoutes, isNot(contains('/profile')));
    });

    test('createRouter方法可以正常创建路由器', () {
      // Act
      final router = AppRouter.createRouter();

      // Assert
      expect(router, isNotNull);
      expect(router.routeInformationProvider, isNotNull);
      expect(router.routerDelegate, isNotNull);
    });

    test('createRouter可以接受容器参数', () {
      // Act
      final router = AppRouter.createRouter(null);

      // Assert
      expect(router, isNotNull);
    });
  });
}
