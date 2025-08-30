import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitals/core/network/network_providers.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/datasources/auth_remote_datasource_impl.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/datasources/auth_local_datasource_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/login_usecase_impl.dart';
import '../../domain/usecases/auto_login_usecase.dart';
import '../../domain/usecases/auto_login_usecase_impl.dart';
import '../../domain/usecases/sign_patient_usecase.dart';
import '../../domain/usecases/check_patient_signed_usecase.dart';

part 'auth_providers.g.dart';

// =============================================================================
// 基础服务 Providers
// =============================================================================

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError('需要在main.dart中重写此Provider');
}

@Riverpod(keepAlive: true)
FlutterSecureStorage flutterSecureStorage(FlutterSecureStorageRef ref) {
  return const FlutterSecureStorage();
}

// ApiClient Provider 来自 core/network/network_providers.dart

// =============================================================================
// 数据源层 Providers
// =============================================================================

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSourceImpl(ref.read(apiClientProvider));
}

@Riverpod(keepAlive: true)
AuthLocalDataSource authLocalDataSource(AuthLocalDataSourceRef ref) {
  return AuthLocalDataSourceImpl(
    ref.read(sharedPreferencesProvider),
    ref.read(flutterSecureStorageProvider),
  );
}

// =============================================================================
// 仓库层 Providers
// =============================================================================

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    ref.read(authRemoteDataSourceProvider),
    ref.read(authLocalDataSourceProvider),
  );
}

// =============================================================================
// 用例层 Providers
// =============================================================================

@Riverpod(keepAlive: true)
LoginUseCase loginUseCase(LoginUseCaseRef ref) {
  return LoginUseCaseImpl(ref.read(authRepositoryProvider));
}

@Riverpod(keepAlive: true)
AutoLoginUseCase autoLoginUseCase(AutoLoginUseCaseRef ref) {
  return AutoLoginUseCaseImpl(ref.read(authRepositoryProvider));
}

@Riverpod(keepAlive: true)
SignPatientUseCase signPatientUseCase(SignPatientUseCaseRef ref) {
  return SignPatientUseCaseImpl(ref.read(authRepositoryProvider));
}

@Riverpod(keepAlive: true)
CheckPatientSignedUseCase checkPatientSignedUseCase(CheckPatientSignedUseCaseRef ref) {
  return CheckPatientSignedUseCaseImpl(ref.read(authRepositoryProvider));
}
