import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitals/core/network/mock_api_client.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:vitals/features/auth/data/datasources/auth_local_datasource_impl.dart';
import 'package:vitals/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:vitals/features/auth/domain/usecases/login_usecase_impl.dart';
import 'package:vitals/features/auth/domain/usecases/auto_login_usecase_impl.dart';

// Mock Flutter Secure Storage for testing
class MockFlutterSecureStorage implements FlutterSecureStorage {
  final Map<String, String> _storage = {};

  @override
  Future<bool> containsKey({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) async {
    return _storage.containsKey(key);
  }

  @override
  Future<void> delete({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) async {
    _storage.remove(key);
  }

  @override
  Future<void> deleteAll({IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) async {
    _storage.clear();
  }

  @override
  Future<String?> read({required String key, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) async {
    return _storage[key];
  }

  @override
  Future<Map<String, String>> readAll({IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) async {
    return Map.from(_storage);
  }

  @override
  Future<void> write({required String key, required String? value, IOSOptions? iOptions, AndroidOptions? aOptions, LinuxOptions? lOptions, WebOptions? webOptions, MacOsOptions? mOptions, WindowsOptions? wOptions}) async {
    if (value != null) {
      _storage[key] = value;
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

void main() {
  group('Auto Login Integration Tests', () {
    test('should complete full login and auto-login cycle', () async {
      // 0. 初始化Flutter绑定
      TestWidgetsFlutterBinding.ensureInitialized();

      // 1. 设置依赖
      SharedPreferences.setMockInitialValues({});
      final sharedPreferences = await SharedPreferences.getInstance();
      final flutterSecureStorage = MockFlutterSecureStorage();

      final mockApiClient = MockApiClient(
        mockData: MockDataConfig.all,
        delay: const Duration(milliseconds: 50),
        enableRandomErrors: false,
      );

      // 2. 创建数据源
      final remoteDataSource = AuthRemoteDataSourceImpl(mockApiClient);
      final localDataSource = AuthLocalDataSourceImpl(
        sharedPreferences,
        flutterSecureStorage,
      );

      // 3. 创建仓库
      final repository = AuthRepositoryImpl(
        remoteDataSource,
        localDataSource,
      );

      // 4. 创建用例
      final loginUseCase = LoginUseCaseImpl(repository);
      final autoLoginUseCase = AutoLoginUseCaseImpl(repository);

      // 5. 执行登录
      final loginResult = await loginUseCase.execute(
        '13800000000',
        agreedToTerms: true,
      );

      // 6. 验证登录成功
      if (loginResult.isSuccess) {
        final loginResponse = loginResult.data!;
        print('首次登录成功！用户: ${loginResponse.user.name}');
        expect(loginResponse.user.name, '张三');

        // 验证本地存储
        final savedToken = await flutterSecureStorage.read(key: 'auth_token');
        expect(savedToken, 'mock_auth_token');
      } else {
        fail('首次登录失败: ${loginResult.error}');
      }

      // 7. 模拟应用重启，执行自动登录
      print('开始测试自动登录...');
      final autoLoginResult = await autoLoginUseCase.execute();

      // 8. 验证自动登录成功
      if (autoLoginResult.isSuccess) {
        final user = autoLoginResult.data!;
        print('自动登录成功！用户: ${user.name}');
        expect(user.name, '张三');
        expect(user.phone, '13800000000');
      } else {
        print('自动登录失败的详细错误: ${autoLoginResult.error}');
        fail('自动登录失败: ${autoLoginResult.error}');
      }
    });

    test('should handle auto-login when no auth token exists', () async {
      // 测试没有认证信息时的自动登录
      TestWidgetsFlutterBinding.ensureInitialized();

      SharedPreferences.setMockInitialValues({});
      final sharedPreferences = await SharedPreferences.getInstance();
      final flutterSecureStorage = MockFlutterSecureStorage();

      final mockApiClient = MockApiClient(
        mockData: MockDataConfig.all,
        delay: const Duration(milliseconds: 50),
        enableRandomErrors: false,
      );

      final remoteDataSource = AuthRemoteDataSourceImpl(mockApiClient);
      final localDataSource = AuthLocalDataSourceImpl(
        sharedPreferences,
        flutterSecureStorage,
      );

      final repository = AuthRepositoryImpl(
        remoteDataSource,
        localDataSource,
      );

      final autoLoginUseCase = AutoLoginUseCaseImpl(repository);

      // 执行自动登录（没有保存的认证信息）
      final result = await autoLoginUseCase.execute();

      // 应该失败
      expect(result.isFailure, isTrue);
      expect(result.error.toString(), contains('未找到有效的登录凭证'));
    });
  });
}
