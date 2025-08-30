import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/entities/patient_entity.dart';
import 'auth_providers.dart';

export 'auth_providers.dart';

part 'auth_provider.g.dart';
part 'auth_provider.freezed.dart';

/// 认证状态 - 直接在 Provider 中定义
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    UserEntity? user,
    PatientEntity? patient,
    String? token,
    @Default(false) bool isAuthenticated,
    @Default(false) bool isLoading,
    @Default(false) bool hasAgreedToTerms,
    @Default(false) bool hasSignedPatient,
    AppError? error,
  }) = _AuthState;

  const AuthState._();

  bool get hasError => error != null;
  bool get isReady => !isLoading && error == null;
  bool get canLogin => hasAgreedToTerms && isReady;
  bool get requiresPatientSign => isAuthenticated && !hasSignedPatient;
}

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
        success: (loginResult) {
          state = state.copyWith(
            isLoading: false,
            user: loginResult.user,
            patient: loginResult.patient,           // 单个患者
            token: loginResult.token,
            isAuthenticated: true,
            hasSignedPatient: loginResult.patient != null,  // 检查是否已签约
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
    print('🔑 开始自动登录流程');

    if (!silent) {
      print('📝 设置 isLoading = true');
      state = state.copyWith(isLoading: true, error: null);
    }

    try {
      print('🔍 执行自动登录用例');
      final autoLoginUseCase = ref.read(autoLoginUseCaseProvider);
      final userResult = await autoLoginUseCase.execute();

      await userResult.when(
        success: (user) async {
          print('✅ 自动登录成功，用户: ${user.name} (${user.phone})');

          // 获取患者信息
          print('🔍 获取患者信息');
          final authRepository = ref.read(authRepositoryProvider);
          final patientResult = await authRepository.getPatient();

          PatientEntity? patient;
          bool hasSignedPatient = false;

          patientResult.when(
            success: (patientData) {
              patient = patientData;
              hasSignedPatient = patientData != null;
              print('🏥 患者信息: ${patientData != null ? '已签约 - ${patientData.name}' : '未签约'}');
            },
            failure: (error) {
              // 患者信息获取失败，可能还没有签约患者
              patient = null;
              hasSignedPatient = false;
              print('⚠️ 获取患者信息失败: ${error.message}');
            },
          );

          print('📝 更新认证状态: isAuthenticated=true, hasSignedPatient=$hasSignedPatient, isLoading=false');
          state = state.copyWith(
            isLoading: false,
            user: user,
            patient: patient,
            isAuthenticated: true,
            hasSignedPatient: hasSignedPatient,
          );
        },
        failure: (error) async {
          print('❌ 自动登录失败: ${error.message}');
          print('📝 更新认证状态: isAuthenticated=false, isLoading=false');
          state = state.copyWith(
            isLoading: false,
            error: error,
            isAuthenticated: false,
          );
        },
      );
    } catch (e) {
      print('💥 自动登录异常: $e');
      state = state.copyWith(
        isLoading: false,
        error: AppError.unknown(message: '自动登录失败: $e'),
        isAuthenticated: false,
      );
    }

    print('🏁 自动登录流程完成，最终状态: $state');
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

  /// 患者签约成功后更新状态
  void onPatientSigned(PatientEntity patient) {
    state = state.copyWith(
      patient: patient,
      hasSignedPatient: true,
    );
  }
}
