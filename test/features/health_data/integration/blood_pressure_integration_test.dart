import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitals/features/health_data/presentation/pages/blood_pressure_screen.dart';

void main() {
  group('BloodPressureScreen Integration Tests', () {
    testWidgets('should display loading state initially', (tester) async {
      // Given
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: BloodPressureScreen(),
          ),
        ),
      );

      // Then
      expect(find.text('血压详情'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show add record button', (tester) async {
      // Given
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: BloodPressureScreen(),
          ),
        ),
      );

      // Then
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should show refresh button in app bar', (tester) async {
      // Given
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: BloodPressureScreen(),
          ),
        ),
      );

      // Then
      expect(find.byIcon(Icons.refresh), findsOneWidget);
    });
  });
}
