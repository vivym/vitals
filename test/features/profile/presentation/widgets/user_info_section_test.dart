import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/features/profile/presentation/widgets/user_info_section.dart';
import 'package:vitals/features/profile/data/models/user_profile.dart';

void main() {
  group('UserInfoSection', () {
    testWidgets('should display loading state when profile is null', (tester) async {
      // Given
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInfoSection(userProfile: null),
          ),
        ),
      );

      // Then
      expect(find.text('加载中...'), findsOneWidget);
    });

    testWidgets('should display user profile when available', (tester) async {
      // Given
      final userProfile = UserProfile(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
        email: 'wanggaonan@example.com',
        gender: Gender.male,
        birthDate: DateTime(1990, 5, 15),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInfoSection(userProfile: userProfile),
          ),
        ),
      );

      // Then
      expect(find.text('王高南'), findsOneWidget);
      expect(find.text('暂时无法查看'), findsOneWidget);
      expect(find.byIcon(Icons.more_horiz), findsOneWidget);
    });

    testWidgets('should show more options when more button is tapped', (tester) async {
      // Given
      final userProfile = UserProfile(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInfoSection(userProfile: userProfile),
          ),
        ),
      );

      // When
      await tester.tap(find.byIcon(Icons.more_horiz));
      await tester.pumpAndSettle();

      // Then
      expect(find.text('编辑资料'), findsOneWidget);
      expect(find.text('更换头像'), findsOneWidget);
      expect(find.text('退出登录'), findsOneWidget);
    });

    testWidgets('should display avatar placeholder when no avatar URL', (tester) async {
      // Given
      final userProfile = UserProfile(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInfoSection(userProfile: userProfile),
          ),
        ),
      );

      // Then
      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('should display avatar image when URL is available', (tester) async {
      // Given
      final userProfile = UserProfile(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
        avatarUrl: 'https://example.com/avatar.jpg',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInfoSection(userProfile: userProfile),
          ),
        ),
      );

      // Then
      expect(find.byType(CircleAvatar), findsOneWidget);
      // Note: NetworkImage testing requires additional setup
    });
  });
}
