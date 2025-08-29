import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import '../../data/models/auth_models.dart';
import '../../data/models/user.dart';
import '../../data/models/patient.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/auto_login_usecase.dart';
import 'auth_providers.dart';

export 'auth_providers.dart';

part 'auth_provider.g.dart';

/// 认证状态通知器
/// 管理用户认证状态，包括登录、登出、自动登录等
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    return const AuthState();
  }

  /// 用户登录
  Future<void> login(String phone, {bool agreedToTerms = false}) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final loginUseCase = ref.read(loginUseCaseProvider);
      final result = await loginUseCase.execute(phone, agreedToTerms: agreedToTerms);

      result.when(
        success: (response) {
          state = state.copyWith(
            isLoading: false,
            user: response.user,
            patients: response.patients,
            isAuthenticated: true,
          );
        },
        failure: (error) {
          state = state.copyWith(
            isLoading: false,
            error: error,
            isAuthenticated: false,
          );
        },
      );
    } catch (e) {
      // 确保在任何异常情况下都清除加载状态
      state = state.copyWith(
        isLoading: false,
        error: AppError.unknown(message: '登录过程中发生未知错误: $e'),
        isAuthenticated: false,
      );
    }
  }

  /// 自动登录
  Future<void> autoLogin({bool silent = false}) async {
    if (!silent) {
      state = state.copyWith(isLoading: true, error: null);
    }

    final autoLoginUseCase = ref.read(autoLoginUseCaseProvider);
    final result = await autoLoginUseCase.execute();

    result.when(
      success: (user) {
        state = state.copyWith(
          isLoading: false,
          user: user,
          isAuthenticated: true,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error,
          isAuthenticated: false,
        );
      },
    );
  }

  /// 用户登出
  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    // TODO: 调用登出用例
    await Future.delayed(const Duration(milliseconds: 100)); // 模拟API调用

    state = const AuthState();
  }

  /// 清除错误状态
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// 添加患者到当前状态
  void addPatient(Patient patient) {
    final updatedPatients = [...state.patients, patient];
    state = state.copyWith(patients: updatedPatients);
  }
}


