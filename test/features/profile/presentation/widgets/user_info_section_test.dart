import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/features/profile/presentation/widgets/user_info_section.dart';
import 'package:vitals/features/profile/domain/entities/user_profile_entity.dart';

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
      const userProfile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
        email: 'wanggaonan@example.com',
        gender: Gender.male,
        birthDate: null,
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
      expect(find.text('13800000000'), findsOneWidget);
      expect(find.byIcon(Icons.edit_outlined), findsOneWidget);
    });

    testWidgets('should call onEditProfile when edit button is tapped', (tester) async {
      // Given
      bool editPressed = false;
      const userProfile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInfoSection(
              userProfile: userProfile,
              onEditProfile: () => editPressed = true,
            ),
          ),
        ),
      );

      // When
      await tester.tap(find.byIcon(Icons.edit_outlined));
      await tester.pumpAndSettle();

      // Then
      expect(editPressed, true);
    });

    testWidgets('should display avatar placeholder when no avatar URL', (tester) async {
      // Given
      const userProfile = UserProfileEntity(
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

    testWidgets('should display age when birth date is available', (tester) async {
      // Given
      final userProfile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
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
      expect(find.textContaining('岁'), findsOneWidget);
    });

    testWidgets('should display gender information', (tester) async {
      // Given
      const userProfile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
        gender: Gender.male,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInfoSection(userProfile: userProfile),
          ),
        ),
      );

      // Then
      expect(find.text('男'), findsOneWidget);
      expect(find.byIcon(Icons.male), findsOneWidget);
    });

    testWidgets('should display female gender correctly', (tester) async {
      // Given
      const userProfile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
        gender: Gender.female,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInfoSection(userProfile: userProfile),
          ),
        ),
      );

      // Then
      expect(find.text('女'), findsOneWidget);
      expect(find.byIcon(Icons.female), findsOneWidget);
    });

    testWidgets('should show incomplete profile warning', (tester) async {
      // Given - profile missing gender and birth date
      const userProfile = UserProfileEntity(
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
      expect(find.text('资料待完善'), findsOneWidget);
      expect(find.byIcon(Icons.warning_outlined), findsOneWidget);
    });

    testWidgets('should not show warning for complete profile', (tester) async {
      // Given - complete profile
      final userProfile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
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
      expect(find.text('资料待完善'), findsNothing);
    });

    testWidgets('should display display name correctly', (tester) async {
      // Given - profile with empty name should show phone
      const userProfile = UserProfileEntity(
        id: 'user_1',
        name: '',
        phone: '13800000000',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInfoSection(userProfile: userProfile),
          ),
        ),
      );

      // Then - should display phone as name since name is empty
      final nameFinders = find.text('13800000000');
      expect(nameFinders, findsWidgets); // Should find both display name and phone number
    });

    testWidgets('should display avatar image when URL is available', (tester) async {
      // Given - 使用一个不会触发网络请求的URL
      const userProfile = UserProfileEntity(
        id: 'user_1',
        name: '王高南',
        phone: '13800000000',
        avatarUrl: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserInfoSection(userProfile: userProfile),
          ),
        ),
      );

      // Then - 只测试CircleAvatar是否存在，不测试图片加载
      expect(find.byType(CircleAvatar), findsOneWidget);
    }, skip: true);
  });
}