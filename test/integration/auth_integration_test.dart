import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitals/core/network/mock_api_client.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:vitals/features/auth/data/datasources/auth_local_datasource_impl.dart';
import 'package:vitals/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:vitals/features/auth/domain/usecases/login_usecase_impl.dart';

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
  group('Authentication Integration Tests', () {
    test('should successfully complete login flow with correct mock response', () async {
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

      // 5. 执行登录
      final result = await loginUseCase.execute(
        '13800000000',
        agreedToTerms: true,
      );

      // 6. 验证结果
      if (result.isSuccess) {
        final loginResponse = result.data!;
        print('登录成功！用户: ${loginResponse.user.name}');
        expect(loginResponse.token, 'mock_auth_token');
        expect(loginResponse.user.name, '张三');
        expect(loginResponse.user.phone, '13800000000');
        expect(loginResponse.patients, isNotEmpty);

        // 验证本地存储
        final savedToken = await flutterSecureStorage.read(key: 'auth_token');
        expect(savedToken, 'mock_auth_token');
      } else {
        print('登录失败的详细错误: ${result.error}');
        print('错误类型: ${result.error.runtimeType}');
        fail('登录失败: ${result.error}');
      }
    });

    test('should handle validation errors correctly', () async {
      // 测试验证错误
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

      final loginUseCase = LoginUseCaseImpl(repository);

      // 测试无效手机号
      final result = await loginUseCase.execute(
        '123',  // 无效手机号
        agreedToTerms: true,
      );

      expect(result.isFailure, isTrue);
      expect(result.error.toString(), contains('手机号'));
    });

    test('should handle terms not agreed error', () async {
      // 测试未同意协议的错误
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

      final loginUseCase = LoginUseCaseImpl(repository);

      // 测试未同意协议
      final result = await loginUseCase.execute(
        '13800000000',
        agreedToTerms: false,  // 未同意协议
      );

      expect(result.isFailure, isTrue);
      expect(result.error.toString(), contains('协议'));
    });
  });
}


