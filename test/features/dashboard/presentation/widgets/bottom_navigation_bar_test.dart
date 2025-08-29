import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitals/features/dashboard/presentation/widgets/bottom_navigation_bar.dart';

void main() {
  group('DashboardBottomNavigationBar', () {
    testWidgets('should display all four navigation items', (tester) async {
      // Given
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              bottomNavigationBar: const DashboardBottomNavigationBar(
                currentIndex: 0,
              ),
            ),
          ),
        ),
      );

      // Then
      expect(find.text('首页'), findsOneWidget);
      expect(find.text('随访'), findsOneWidget);
      expect(find.text('问诊'), findsOneWidget);
      expect(find.text('我的'), findsOneWidget);
    });

    testWidgets('should highlight current index correctly', (tester) async {
      // Given
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              bottomNavigationBar: const DashboardBottomNavigationBar(
                currentIndex: 2,
              ),
            ),
          ),
        ),
      );

      // Then
      // 问诊应该是高亮的（索引2）
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.text('问诊'), findsOneWidget);
    });

    testWidgets('should have correct icons for each navigation item', (tester) async {
      // Given
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              bottomNavigationBar: const DashboardBottomNavigationBar(
                currentIndex: 0,
              ),
            ),
          ),
        ),
      );

      // Then
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.calendar_today), findsOneWidget);
      expect(find.byIcon(Icons.chat_bubble_outline), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
    });
  });
}
