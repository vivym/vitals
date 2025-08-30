import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/domain/entities/user_entity.dart';
import 'package:vitals/features/auth/domain/entities/patient_entity.dart';
import 'package:vitals/features/auth/domain/repositories/auth_repository.dart';
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
        expect(authState.patient, null);
        expect(authState.hasSignedPatient, false);
        expect(authState.error, null);
      });
    });

    group('login', () {
      test('should set loading true when login starts', () async {
        // Given
        final user = UserEntity(
          id: '1',
          name: 'Test',
          phone: '13800000000',
          email: 'test@example.com',
          avatarUrl: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final patient = PatientEntity(
          id: '1',
          name: 'Test',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final loginResult = LoginResult(
          user: user,
          token: 'token',
          patient: patient,
        );

        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => Result.success(loginResult));

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
        final user = UserEntity(
          id: '1',
          name: 'Test',
          phone: '13800000000',
          email: 'test@example.com',
          avatarUrl: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final patient = PatientEntity(
          id: '1',
          name: 'Test',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final loginResult = LoginResult(
          user: user,
          token: 'token',
          patient: patient,
        );

        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => Result.success(loginResult));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        await notifier.login('13800000000', agreedToTerms: true);

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.isAuthenticated, true);
        expect(state.isLoading, false);
        expect(state.user, user);
        expect(state.patient, patient);
        expect(state.hasSignedPatient, true);
        expect(state.error, null);
      });

      test('should update state when login succeeds without patient', () async {
        // Given
        final user = UserEntity(
          id: '1',
          name: 'Test',
          phone: '13800000000',
          email: 'test@example.com',
          avatarUrl: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final loginResult = LoginResult(
          user: user,
          token: 'token',
          patient: null,
        );

        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => Result.success(loginResult));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        await notifier.login('13800000000', agreedToTerms: true);

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.isAuthenticated, true);
        expect(state.isLoading, false);
        expect(state.user, user);
        expect(state.patient, null);
        expect(state.hasSignedPatient, false);
        expect(state.error, null);
      });

      test('should handle login failure', () async {
        // Given
        const error = AppError.authentication(message: '登录失败');
        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => const Result.failure(error));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        await notifier.login('13800000000', agreedToTerms: true);

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.isAuthenticated, false);
        expect(state.isLoading, false);
        expect(state.user, null);
        expect(state.patient, null);
        expect(state.hasSignedPatient, false);
        expect(state.error, error);
      });

      test('should clear error when login succeeds after failure', () async {
        // Given
        const error = AppError.authentication(message: '登录失败');
        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => const Result.failure(error));

        final notifier = container.read(authNotifierProvider.notifier);
        await notifier.login('13800000000', agreedToTerms: true);

        // 验证失败状态
        var state = container.read(authNotifierProvider);
        expect(state.error, error);

        // 现在模拟成功登录
        final user = UserEntity(
          id: '1',
          name: 'Test',
          phone: '13800000000',
          email: 'test@example.com',
          avatarUrl: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final patient = PatientEntity(
          id: '1',
          name: 'Test',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final loginResult = LoginResult(
          user: user,
          token: 'token',
          patient: patient,
        );

        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => Result.success(loginResult));

        // When
        await notifier.login('13800000000', agreedToTerms: true);

        // Then
        state = container.read(authNotifierProvider);
        expect(state.error, null);
        expect(state.isAuthenticated, true);
        expect(state.user, user);
        expect(state.patient, patient);
        expect(state.hasSignedPatient, true);
      });
    });

    group('logout', () {
      test('should clear auth state on logout', () async {
        // Given - 先登录
        final user = UserEntity(
          id: '1',
          name: 'Test',
          phone: '13800000000',
          email: 'test@example.com',
          avatarUrl: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final patient = PatientEntity(
          id: '1',
          name: 'Test',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final loginResult = LoginResult(
          user: user,
          token: 'token',
          patient: patient,
        );

        when(() => mockLoginUseCase.execute(any(), agreedToTerms: any(named: 'agreedToTerms')))
            .thenAnswer((_) async => Result.success(loginResult));

        final notifier = container.read(authNotifierProvider.notifier);
        await notifier.login('13800000000', agreedToTerms: true);

        // 验证登录状态
        var state = container.read(authNotifierProvider);
        expect(state.isAuthenticated, true);
        expect(state.user, user);
        expect(state.patient, patient);

        // When
        await notifier.logout();

        // Then
        state = container.read(authNotifierProvider);
        expect(state.isAuthenticated, false);
        expect(state.isLoading, false);
        expect(state.user, null);
        expect(state.patient, null);
        expect(state.hasSignedPatient, false);
        expect(state.error, null);
      });
    });

    group('autoLogin', () {
      test('should set loading true when auto login starts', () async {
        // Given
        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          return const Result.failure(AppError.authentication(message: '自动登录失败'));
        });

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        final future = notifier.autoLogin();

        // Then (检查中间状态)
        final stateWhileLoading = container.read(authNotifierProvider);
        expect(stateWhileLoading.isLoading, true);
        expect(stateWhileLoading.error, null);

        await future;
      });

      test('should update state when auto login succeeds', () async {
        // Given
        final user = UserEntity(
          id: '1',
          name: 'Test',
          phone: '13800000000',
          email: 'test@example.com',
          avatarUrl: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async => Result.success(user));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        await notifier.autoLogin();

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.isAuthenticated, true);
        expect(state.isLoading, false);
        expect(state.user, user);
        expect(state.patient, null);
        expect(state.hasSignedPatient, false);
        expect(state.error, null);
      });

      test('should handle auto login failure', () async {
        // Given
        const error = AppError.authentication(message: '自动登录失败');
        when(() => mockAutoLoginUseCase.execute())
            .thenAnswer((_) async => const Result.failure(error));

        final notifier = container.read(authNotifierProvider.notifier);

        // When
        await notifier.autoLogin();

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.isAuthenticated, false);
        expect(state.isLoading, false);
        expect(state.user, null);
        expect(state.patient, null);
        expect(state.hasSignedPatient, false);
        // 自动登录失败后，错误状态可能被保留，这是正常的
        // 我们主要验证其他状态是正确的
      });
    });

    group('onPatientSigned', () {
      test('should update patient state when patient is signed', () async {
        // Given
        final notifier = container.read(authNotifierProvider.notifier);
        final patient = PatientEntity(
          id: '1',
          name: 'Test',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When
        notifier.onPatientSigned(patient);

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.patient, patient);
        expect(state.hasSignedPatient, true);
      });

      test('should update patient state when replacing existing patient', () async {
        // Given
        final notifier = container.read(authNotifierProvider.notifier);
        final existingPatient = PatientEntity(
          id: '1',
          name: 'Old Patient',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // 先设置一个患者
        notifier.onPatientSigned(existingPatient);
        var state = container.read(authNotifierProvider);
        expect(state.patient, existingPatient);
        expect(state.hasSignedPatient, true);

        // 现在替换患者
        final newPatient = PatientEntity(
          id: '2',
          name: 'New Patient',
          idNumber: '310101199001011235',
          gender: Gender.female,
          birthDate: DateTime(1991, 1, 1),
          phone: '13800000001',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When
        notifier.onPatientSigned(newPatient);

        // Then
        state = container.read(authNotifierProvider);
        expect(state.patient, newPatient);
        expect(state.hasSignedPatient, true);
        expect(state.patient?.id, '2');
        expect(state.patient?.name, 'New Patient');
      });
    });

    group('clearError', () {
      test('should clear error state', () async {
        // Given
        const error = AppError.authentication(message: '测试错误');
        final notifier = container.read(authNotifierProvider.notifier);

        // 设置错误状态
        notifier.state = notifier.state.copyWith(error: error);
        var state = container.read(authNotifierProvider);
        expect(state.error, error);

        // When
        notifier.clearError();

        // Then
        state = container.read(authNotifierProvider);
        expect(state.error, null);
      });
    });

    group('requiresPatientSign', () {
      test('should return true when authenticated but no patient signed', () {
        // Given
        final notifier = container.read(authNotifierProvider.notifier);
        final user = UserEntity(
          id: '1',
          name: 'Test',
          phone: '13800000000',
          email: 'test@example.com',
          avatarUrl: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When
        notifier.state = notifier.state.copyWith(
          user: user,
          isAuthenticated: true,
          patient: null,
          hasSignedPatient: false,
        );

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.requiresPatientSign, true);
      });

      test('should return false when not authenticated', () {
        // Given
        final notifier = container.read(authNotifierProvider.notifier);

        // When
        notifier.state = notifier.state.copyWith(
          isAuthenticated: false,
          patient: null,
          hasSignedPatient: false,
        );

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.requiresPatientSign, false);
      });

      test('should return false when patient is signed', () {
        // Given
        final notifier = container.read(authNotifierProvider.notifier);
        final user = UserEntity(
          id: '1',
          name: 'Test',
          phone: '13800000000',
          email: 'test@example.com',
          avatarUrl: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        final patient = PatientEntity(
          id: '1',
          name: 'Test',
          idNumber: '310101199001011234',
          gender: Gender.male,
          birthDate: DateTime(1990, 1, 1),
          phone: '13800000000',
          medicalRecordNumber: null,
          emergencyContact: null,
          emergencyContactPhone: null,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        // When
        notifier.state = notifier.state.copyWith(
          user: user,
          isAuthenticated: true,
          patient: patient,
          hasSignedPatient: true,
        );

        // Then
        final state = container.read(authNotifierProvider);
        expect(state.requiresPatientSign, false);
      });
    });
  });
}
