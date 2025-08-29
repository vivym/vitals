import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vitals/features/reports/presentation/pages/reports_list_page.dart';

void main() {
  group('ReportsListPage', () {
    Widget createTestWidget() {
      return ProviderScope(
        child: const MaterialApp(
          home: ReportsListPage(),
        ),
      );
    }

    testWidgets('should display basic page structure', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      expect(find.text('健康报告'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });

    testWidgets('should display filter section', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      // 检查是否有过滤器相关的UI元素
      expect(find.text('全部'), findsOneWidget);
      expect(find.text('康复月报'), findsOneWidget);
      expect(find.text('健康评估'), findsOneWidget);
    });

    testWidgets('should display floating action button', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should handle empty state gracefully', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      // 页面应该能够正常渲染，即使没有数据
      expect(find.byType(ReportsListPage), findsOneWidget);
    });

    testWidgets('should display filter chips with correct labels', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      expect(find.text('全部'), findsOneWidget);
      expect(find.text('康复月报'), findsOneWidget);
      expect(find.text('健康评估'), findsOneWidget);
      expect(find.text('运动处方'), findsOneWidget);
      expect(find.text('营养建议'), findsOneWidget);
    });

    testWidgets('should have correct app bar styling', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.title, isA<Text>());
      expect(appBar.backgroundColor, isNotNull);
    });

    testWidgets('should have floating action button with correct icon', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Then
      final fab = tester.widget<FloatingActionButton>(find.byType(FloatingActionButton));
      expect(fab.child, isA<Icon>());
      final icon = fab.child as Icon;
      expect(icon.icon, Icons.add);
    });
  });
}
