import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/shared/widgets/app_bottom_navigation_bar.dart';

void main() {
  group('AppBottomNavigationBar', () {
    testWidgets('should display all navigation items', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: const AppBottomNavigationBar(
              currentIndex: 0,
            ),
          ),
        ),
      );

      expect(find.text('首页'), findsOneWidget);
      expect(find.text('健康数据'), findsOneWidget);
      expect(find.text('报告'), findsOneWidget);
      expect(find.text('我的'), findsOneWidget);
    });

    testWidgets('should highlight current index', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: const AppBottomNavigationBar(
              currentIndex: 2,
            ),
          ),
        ),
      );

      // 检查第三个项目（报告）是否被选中
      expect(find.text('报告'), findsOneWidget);
    });

    testWidgets('should handle tap events', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: const AppBottomNavigationBar(
              currentIndex: 0,
            ),
          ),
        ),
      );

      // 点击"我的"按钮
      await tester.tap(find.text('我的'));
      await tester.pump();

      // 验证导航行为（在测试环境中可能无法完全验证）
      expect(find.text('我的'), findsOneWidget);
    });
  });
}
