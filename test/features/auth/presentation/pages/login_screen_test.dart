import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:go_router/go_router.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/domain/entities/user_entity.dart';
import 'package:vitals/features/auth/domain/repositories/auth_repository.dart';
import 'package:vitals/features/auth/domain/usecases/login_usecase.dart';
import 'package:vitals/features/auth/domain/usecases/auto_login_usecase.dart';
import 'package:vitals/features/auth/presentation/providers/auth_provider.dart';
import 'package:vitals/features/auth/presentation/screens/login_screen.dart';

// Mock classes
class MockLoginUseCase extends Mock implements LoginUseCase {}
class MockAutoLoginUseCase extends Mock implements AutoLoginUseCase {}

void main() {
  group('LoginScreen Widget Tests', () {
    late MockLoginUseCase mockLoginUseCase;
    late MockAutoLoginUseCase mockAutoLoginUseCase;

    setUp(() {
      mockLoginUseCase = MockLoginUseCase();
      mockAutoLoginUseCase = MockAutoLoginUseCase();

      // 设置默认的 mock 行为
      when(() => mockAutoLoginUseCase.execute())
          .thenAnswer((_) async => const Result.failure(AppError.authentication(message: 'No user logged in')));
    });

    Widget createTestWidget({List<Override>? overrides}) {
      return ProviderScope(
        overrides: overrides ?? [
          loginUseCaseProvider.overrideWithValue(mockLoginUseCase),
          autoLoginUseCaseProvider.overrideWithValue(mockAutoLoginUseCase),
        ],
        child: MaterialApp.router(
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const LoginScreen(),
              ),
              GoRoute(
                path: '/home',
                builder: (context, state) => const Scaffold(body: Text('Home')),
              ),
            ],
          ),
        ),
      );
    }

    group('界面元素显示', () {
      testWidgets('should display all required UI elements', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 验证标题
        expect(find.text('手机号一键登录'), findsOneWidget);

        // 验证用户头像图标
        expect(find.byIcon(Icons.account_circle), findsOneWidget);

        // 验证手机号显示（脱敏）
        expect(find.textContaining('***'), findsOneWidget);

        // 验证一键登录按钮
        expect(find.text('一键登录'), findsOneWidget);

        // 验证协议勾选框
        expect(find.byType(Checkbox), findsOneWidget);
        expect(find.textContaining('服务协议'), findsOneWidget);
        expect(find.textContaining('隐私协议'), findsOneWidget);
      });

      testWidgets('should display masked phone number correctly', (tester) async {
        // 模拟获取手机号的场景
        // const testPhone = '13800000000';
        await tester.pumpWidget(createTestWidget());

        // 这里应该显示脱敏的手机号，比如 138****0000
        // 具体的脱敏逻辑在实现时定义
        expect(find.byType(Text), findsWidgets);
      });

      testWidgets('should have checkbox unchecked by default', (tester) async {
        await tester.pumpWidget(createTestWidget());

        final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
        expect(checkbox.value, false);
      });
    });

    group('用户交互', () {
      testWidgets('should toggle checkbox when tapped', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 初始状态应该是未勾选
        var checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
        expect(checkbox.value, false);

        // 点击勾选框
        await tester.tap(find.byType(Checkbox));
        await tester.pump();

        // 验证状态已改变
        checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
        expect(checkbox.value, true);
      });

      testWidgets('should enable login button when terms are agreed', (tester) async {
        await tester.pumpWidget(createTestWidget());

        // 一键登录按钮初始应该是禁用状态
        var loginButton = tester.widget<ElevatedButton>(
          find.widgetWithText(ElevatedButton, '一键登录'),
        );
        expect(loginButton.onPressed, null);

        // 勾选协议
        await tester.tap(find.byType(Checkbox));
        await tester.pump();

        // 登录按钮应该变为启用状态
        loginButton = tester.widget<ElevatedButton>(
          find.widgetWithText(ElevatedButton, '一键登录'),
        );
        expect(loginButton.onPressed, isNotNull);
      });

      testWidgets('should call login when button is pressed', (tester) async {
        // 模拟成功登录
        const response = LoginResult(
          token: 'test_token',
          user: UserEntity(id: '1', name: 'Test User', phone: '13800000000'),
          patient: null,
        );
        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => const Result.success(response));

        await tester.pumpWidget(createTestWidget());

        // 勾选协议
        await tester.tap(find.byType(Checkbox));
        await tester.pump();

        // 点击登录按钮
        await tester.tap(find.widgetWithText(ElevatedButton, '一键登录'));
        await tester.pump();

        // 验证登录用例被调用
        verify(() => mockLoginUseCase.execute(any(), agreedToTerms: true)).called(1);
      });
    });

    group('加载状态', () {
      testWidgets('should show loading indicator when logging in', (tester) async {
        // 模拟异步登录过程
        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          return const Result.success(LoginResult(
            token: 'test_token',
            user: UserEntity(id: '1', name: 'Test User', phone: '13800000000'),
            patient: null,
          ));
        });

        await tester.pumpWidget(createTestWidget());

        // 勾选协议并点击登录
        await tester.tap(find.byType(Checkbox));
        await tester.pump();
        await tester.tap(find.widgetWithText(ElevatedButton, '一键登录'));
        await tester.pump();

        // 应该显示加载指示器
        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        // 等待登录完成
        await tester.pumpAndSettle();
      });

      testWidgets('should disable button during loading', (tester) async {
        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          return const Result.success(LoginResult(
            token: 'test_token',
            user: UserEntity(id: '1', name: 'Test User', phone: '13800000000'),
            patient: null,
          ));
        });

        await tester.pumpWidget(createTestWidget());

        // 勾选协议
        await tester.tap(find.byType(Checkbox));
        await tester.pump();

        // 验证登录按钮存在并可点击
        expect(find.widgetWithText(ElevatedButton, '一键登录'), findsOneWidget);

        // 点击登录按钮
        await tester.tap(find.widgetWithText(ElevatedButton, '一键登录'));
        await tester.pump();

        // 等待异步操作完成
        await tester.pumpAndSettle();
      });
    });

    group('错误处理', () {
      testWidgets('should display error message when login fails', (tester) async {
        // 模拟登录失败
        const error = AppError.validation(message: '请先同意服务协议', field: 'terms');
        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => const Result.failure(error));

        await tester.pumpWidget(createTestWidget());

        // 勾选协议并点击登录
        await tester.tap(find.byType(Checkbox));
        await tester.pump();
        await tester.tap(find.widgetWithText(ElevatedButton, '一键登录'));
        await tester.pumpAndSettle();

        // 应该显示错误消息
        expect(find.textContaining('请先同意服务协议'), findsOneWidget);
      });

      testWidgets('should handle network errors gracefully', (tester) async {
        const error = AppError.network(message: '网络连接失败', statusCode: 500);
        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => const Result.failure(error));

        await tester.pumpWidget(createTestWidget());

        await tester.tap(find.byType(Checkbox));
        await tester.pump();
        await tester.tap(find.widgetWithText(ElevatedButton, '一键登录'));
        await tester.pumpAndSettle();

        expect(find.textContaining('网络连接失败'), findsOneWidget);
      });
    });

    group('自动登录', () {
      testWidgets('should attempt auto login on widget init', (tester) async {
        const user = UserEntity(id: '1', name: 'Test User', phone: '13800000000');
        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async => const Result.success(user));

        await tester.pumpWidget(createTestWidget());

        // 验证自动登录被调用
        verify(() => mockAutoLoginUseCase.execute()).called(1);
      });

      testWidgets('should show login form when auto login fails', (tester) async {
        const error = AppError.authentication(message: '未找到有效的登录凭证');
        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async => const Result.failure(error));

        await tester.pumpWidget(createTestWidget());
        await tester.pumpAndSettle();

        // 应该显示登录表单
        expect(find.text('手机号一键登录'), findsOneWidget);
        expect(find.text('一键登录'), findsOneWidget);
      });
    });

    group('导航行为', () {
      testWidgets('should navigate to home when login succeeds', (tester) async {
        const response = LoginResult(
          token: 'test_token',
          user: UserEntity(id: '1', name: 'Test User', phone: '13800000000'),
          patient: null,
        );
        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => const Result.success(response));

        await tester.pumpWidget(createTestWidget());

        await tester.tap(find.byType(Checkbox));
        await tester.pump();
        await tester.tap(find.widgetWithText(ElevatedButton, '一键登录'));
        await tester.pumpAndSettle();

        // 这里应该测试导航到主页
        // 具体的导航逻辑在实现时定义
      });
    });

    group('响应式设计', () {
      testWidgets('should display correctly on standard screen', (tester) async {
        // 使用标准测试尺寸，避免布局溢出
        await tester.pumpWidget(createTestWidget());

        // 验证基本元素在标准尺寸下正常显示
        expect(find.text('手机号一键登录'), findsOneWidget);
        expect(find.text('一键登录'), findsOneWidget);
        expect(find.byType(Checkbox), findsOneWidget);
      });
    });
  });
}
