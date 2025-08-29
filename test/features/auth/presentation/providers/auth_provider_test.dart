import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/data/models/auth_models.dart';
import 'package:vitals/features/auth/data/models/user.dart';
import 'package:vitals/features/auth/data/models/patient.dart';
import 'package:vitals/features/auth/domain/usecases/login_usecase.dart';
import 'package:vitals/features/auth/domain/usecases/auto_login_usecase.dart';
import 'package:vitals/features/auth/presentation/providers/auth_provider.dart';

// Mock classes
class MockLoginUseCase extends Mock implements LoginUseCase {}
class MockAutoLoginUseCase extends Mock implements AutoLoginUseCase {}

void main() {
  group('AuthNotifier', () {
    late MockLoginUseCase mockLoginUseCase;
    late MockAutoLoginUseCase mockAutoLoginUseCase;
    late ProviderContainer container;

    setUp(() {
      mockLoginUseCase = MockLoginUseCase();
      mockAutoLoginUseCase = MockAutoLoginUseCase();

      container = ProviderContainer(
        overrides: [
          loginUseCaseProvider.overrideWithValue(mockLoginUseCase),
          autoLoginUseCaseProvider.overrideWithValue(mockAutoLoginUseCase),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    group('初始状态', () {
      test('should start with default auth state', () {
        final authState = container.read(authNotifierProvider);

        expect(authState.isAuthenticated, false);
        expect(authState.isLoading, false);
        expect(authState.user, null);
        expect(authState.patients, isEmpty);
        expect(authState.error, null);
      });
    });

    group('login', () {
      test('should set loading true when login starts', () async {
        // Given
        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => const Result.success(
              LoginResponse(
                token: 'token',
                user: User(id: '1', name: 'Test', phone: '13800000000'),
                patients: [],
              ),
            ));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        final future = notifier.login('13800000000', agreedToTerms: true);

        // Then (检查中间状态)
        final stateWhileLoading = container.read(authNotifierProvider);
        expect(stateWhileLoading.isLoading, true);
        expect(stateWhileLoading.error, null);

        await future;
      });

      test('should update state with user data when login succeeds', () async {
        // Given
        const user = User(id: '1', name: '张三', phone: '13800000000');
        final patient = Patient(
          id: '2',
          name: '李四',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13900000000',
        );
        final response = LoginResponse(
          token: 'test_token',
          user: user,
          patients: [patient],
        );

        when(() => mockLoginUseCase.execute('13800000000', agreedToTerms: true))
            .thenAnswer((_) async => Result.success(response));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        await notifier.login('13800000000', agreedToTerms: true);

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.isLoading, false);
        expect(state.isAuthenticated, true);
        expect(state.user, user);
        expect(state.patients, [patient]);
        expect(state.error, null);

        verify(() => mockLoginUseCase.execute('13800000000', agreedToTerms: true)).called(1);
      });

      test('should update state with error when login fails', () async {
        // Given
        const error = AppError.validation(message: '手机号格式错误', field: 'phone');
        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => const Result.failure(error));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        await notifier.login('invalid_phone', agreedToTerms: true);

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.isLoading, false);
        expect(state.isAuthenticated, false);
        expect(state.user, null);
        expect(state.error, error);

        verify(() => mockLoginUseCase.execute('invalid_phone', agreedToTerms: true)).called(1);
      });

      test('should pass agreedToTerms parameter correctly', () async {
        // Given
        const response = LoginResponse(
          token: 'token',
          user: User(id: '1', name: 'Test', phone: '13800000000'),
          patients: [],
        );

        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => Result.success(response));

        final notifier = container.read(authNotifierProvider.notifier);

        // When - 测试不同的协议同意状态
        await notifier.login('13800000000', agreedToTerms: false);
        await notifier.login('13800000000', agreedToTerms: true);

        // Then
        verify(() => mockLoginUseCase.execute('13800000000', agreedToTerms: false)).called(1);
        verify(() => mockLoginUseCase.execute('13800000000', agreedToTerms: true)).called(1);
      });
    });

    group('autoLogin', () {
      test('should set loading true when auto login starts', () async {
        // Given
        const user = User(id: '1', name: 'Test', phone: '13800000000');
        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async => const Result.success(user));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        final future = notifier.autoLogin();

        // Then (检查中间状态)
        final stateWhileLoading = container.read(authNotifierProvider);
        expect(stateWhileLoading.isLoading, true);
        expect(stateWhileLoading.error, null);

        await future;
      });

      test('should update state with user when auto login succeeds', () async {
        // Given
        const user = User(
          id: '1',
          name: '张三',
          phone: '13800000000',
          email: 'zhangsan@example.com',
        );

        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async => const Result.success(user));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        await notifier.autoLogin();

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.isLoading, false);
        expect(state.isAuthenticated, true);
        expect(state.user, user);
        expect(state.error, null);

        verify(() => mockAutoLoginUseCase.execute()).called(1);
      });

      test('should update state with error when auto login fails', () async {
        // Given
        const error = AppError.authentication(message: '未找到有效的登录凭证');
        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async => const Result.failure(error));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        await notifier.autoLogin();

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.isLoading, false);
        expect(state.isAuthenticated, false);
        expect(state.user, null);
        expect(state.error, error);

        verify(() => mockAutoLoginUseCase.execute()).called(1);
      });

      test('should not affect existing patients when auto login succeeds', () async {
        // Given
        final existingPatient = Patient(
          id: '1',
          name: '现有患者',
          idNumber: '310101199001011234',
          gender: Gender.female,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        // 先设置初始状态包含患者
        container.read(authNotifierProvider.notifier).addPatient(existingPatient);

        const user = User(id: '1', name: 'Test', phone: '13800000000');
        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async => const Result.success(user));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        await notifier.autoLogin();

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.patients, [existingPatient]); // 原有患者应该保持
        expect(state.user, user);
        expect(state.isAuthenticated, true);
      });
    });

    group('logout', () {
      test('should reset state to default when logout', () async {
        // Given - 先设置一个已认证状态
        const user = User(id: '1', name: 'Test', phone: '13800000000');
        final patient = Patient(
          id: '2',
          name: '患者',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13900000000',
        );

        container.read(authNotifierProvider.notifier).addPatient(patient);
        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async => const Result.success(user));
        await container.read(authNotifierProvider.notifier).autoLogin();

        expect(container.read(authNotifierProvider).isAuthenticated, true);

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        await notifier.logout();

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.isAuthenticated, false);
        expect(state.isLoading, false);
        expect(state.user, null);
        expect(state.patients, isEmpty);
        expect(state.error, null);
      });

      test('should set loading true during logout', () async {
        // Given
        final notifier = container.read(authNotifierProvider.notifier);

        // When
        final future = notifier.logout();

        // Then (检查中间状态)
        final stateWhileLoading = container.read(authNotifierProvider);
        expect(stateWhileLoading.isLoading, true);

        await future;

        final finalState = container.read(authNotifierProvider);
        expect(finalState.isLoading, false);
      });
    });

    group('clearError', () {
      test('should clear error while preserving other state', () async {
        // Given - 先设置一个错误状态
        const error = AppError.network(message: 'Network error');
        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => const Result.failure(error));

        final notifier = container.read(authNotifierProvider.notifier);
        await notifier.login('13800000000', agreedToTerms: true);

        expect(container.read(authNotifierProvider).error, error);

        // When
        notifier.clearError();

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.error, null);
        expect(state.isAuthenticated, false); // 其他状态保持不变
        expect(state.isLoading, false);
      });
    });

    group('addPatient', () {
      test('should add patient to existing patients list', () {
        // Given
        final patient1 = Patient(
          id: '1',
          name: '患者1',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
        );

        final patient2 = Patient(
          id: '2',
          name: '患者2',
          idNumber: '310101199101011234',
          gender: Gender.female,
          birthDate: DateTime(1991, 1, 1),
          phone: '13900000000',
        );

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        notifier.addPatient(patient1);
        notifier.addPatient(patient2);

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.patients, [patient1, patient2]);
      });

      test('should preserve other state when adding patient', () async {
        // Given - 设置已认证状态
        const user = User(id: '1', name: 'Test', phone: '13800000000');
        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async => const Result.success(user));

        final notifier = container.read(authNotifierProvider.notifier);
        await notifier.autoLogin();

        final patient = Patient(
          id: '2',
          name: '新患者',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13900000000',
        );

        // When
        notifier.addPatient(patient);

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.patients, [patient]);
        expect(state.user, user); // 用户信息保持不变
        expect(state.isAuthenticated, true); // 认证状态保持不变
      });
    });

    group('状态更新监听', () {
      test('should notify listeners when state changes', () async {
        // Given
        const user = User(id: '1', name: 'Test', phone: '13800000000');
        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async => const Result.success(user));

        final states = <AuthState>[];
        final listener = container.listen(
          authNotifierProvider,
          (previous, next) => states.add(next),
        );

        // When
        await container.read(authNotifierProvider.notifier).autoLogin();

        // Then
        expect(states.length, greaterThan(0));
        expect(states.last.user, user);
        expect(states.last.isAuthenticated, true);

        listener.close();
      });
    });
  });
}
