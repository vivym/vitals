import 'dart:async';
import 'dart:convert';
import 'dart:math';
import '../errors/app_error.dart';
import 'api_client.dart';

/// Mock API 客户端实现
/// 用于测试和开发阶段，模拟网络请求
class MockApiClient implements ApiClient {
  final Map<String, dynamic> _mockData;
  final Duration _delay;
  final bool _enableRandomErrors;
  final Random _random = Random();

  MockApiClient({
    required Map<String, dynamic> mockData,
    Duration delay = const Duration(milliseconds: 500),
    bool enableRandomErrors = false,
  }) : _mockData = mockData,
       _delay = delay,
       _enableRandomErrors = enableRandomErrors;

  @override
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    return await _simulateRequest<T>(() => _getMockData(path, queryParameters));
  }

  @override
  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    return await _simulateRequest<T>(() => _getMockData(path, queryParameters, data));
  }

  @override
  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    return await _simulateRequest<T>(() => _getMockData(path, queryParameters, data));
  }

  @override
  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    return await _simulateRequest<T>(() => _getMockData(path, queryParameters));
  }

  @override
  Future<T> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    return await _simulateRequest<T>(() => _getMockData(path, queryParameters, data));
  }

  @override
  void setBaseUrl(String baseUrl) {
    // Mock 实现不需要设置基础URL
  }

  @override
  void setAuthToken(String token) {
    // Mock 实现不需要设置认证token
  }

  @override
  void clearAuthToken() {
    // Mock 实现不需要清除认证token
  }

  @override
  void setTimeout(Duration timeout) {
    // Mock 实现不需要设置超时时间
  }

  @override
  void addRequestInterceptor(Function(Map<String, dynamic>) interceptor) {
    // Mock 实现不需要请求拦截器
  }

  @override
  void addResponseInterceptor(Function(dynamic) interceptor) {
    // Mock 实现不需要响应拦截器
  }

  @override
  void addErrorInterceptor(Function(dynamic) interceptor) {
    // Mock 实现不需要错误拦截器
  }

  /// 模拟网络请求
  Future<T> _simulateRequest<T>(T Function() dataProvider) async {
    // 模拟网络延迟
    await Future.delayed(_delay);

    // 模拟随机错误
    if (_enableRandomErrors && _random.nextDouble() < 0.1) {
      throw _generateRandomError();
    }

    try {
      final data = dataProvider();
      return data;
    } catch (e) {
      throw AppError.unknown(
        message: 'Mock数据获取失败: $e',
        cause: e,
      );
    }
  }

  /// 获取Mock数据
  T _getMockData<T>(
    String path,
    Map<String, dynamic>? queryParameters, [
    dynamic requestData,
  ]) {
    // 根据路径查找对应的Mock数据
    final pathData = _mockData[path];
    if (pathData != null) {
      return pathData as T;
    }

    // 尝试根据路径模式匹配
    final matchedPath = _findMatchingPath(path);
    if (matchedPath != null) {
      final data = _mockData[matchedPath];
      if (data != null) {
        return _processMockData(data, queryParameters, requestData) as T;
      }
    }

    // 返回默认数据
    return _getDefaultMockData<T>(path);
  }

  /// 查找匹配的路径
  String? _findMatchingPath(String path) {
    for (final key in _mockData.keys) {
      if (_isPathMatch(key, path)) {
        return key;
      }
    }
    return null;
  }

  /// 检查路径是否匹配
  bool _isPathMatch(String pattern, String path) {
    // 简单的路径匹配逻辑
    if (pattern == path) return true;

    // 支持通配符匹配
    if (pattern.contains('*')) {
      final regex = RegExp(pattern.replaceAll('*', '.*'));
      return regex.hasMatch(path);
    }

    // 支持参数匹配
    if (pattern.contains('{') && pattern.contains('}')) {
      final regex = RegExp(pattern.replaceAll(RegExp(r'\{[^}]+\}'), '[^/]+'));
      return regex.hasMatch(path);
    }

    return false;
  }

  /// 处理Mock数据
  dynamic _processMockData(
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dynamic requestData,
  ) {
    if (data is Map<String, dynamic>) {
      // 处理查询参数
      if (queryParameters != null) {
        data = Map<String, dynamic>.from(data);
        data['queryParams'] = queryParameters;
      }

      // 处理请求数据
      if (requestData != null) {
        data = Map<String, dynamic>.from(data);
        data['requestData'] = requestData;
      }
    }

    return data;
  }

  /// 获取默认Mock数据
  T _getDefaultMockData<T>(String path) {
    // 根据路径类型返回不同的默认数据
    if (path.contains('/auth')) {
      return _getDefaultAuthData() as T;
    } else if (path.contains('/users')) {
      return _getDefaultUserData() as T;
    } else if (path.contains('/health')) {
      return _getDefaultHealthData() as T;
    } else {
      return _getGenericData() as T;
    }
  }

  /// 获取默认认证数据
  Map<String, dynamic> _getDefaultAuthData() {
    return {
      'success': true,
      'data': {
        'token': 'mock_token_${DateTime.now().millisecondsSinceEpoch}',
        'user': {
          'id': 'user_1',
          'name': '测试用户',
          'phone': '13800000000',
        },
      },
      'message': '登录成功',
    };
  }

  /// 获取默认用户数据
  Map<String, dynamic> _getDefaultUserData() {
    return {
      'success': true,
      'data': {
        'id': 'user_1',
        'name': '测试用户',
        'phone': '13800000000',
        'email': 'test@example.com',
      },
    };
  }

  /// 获取默认健康数据
  Map<String, dynamic> _getDefaultHealthData() {
    return {
      'success': true,
      'data': {
        'bloodPressure': {
          'systolic': 120,
          'diastolic': 80,
          'recordedAt': DateTime.now().toIso8601String(),
        },
        'heartRate': {
          'bpm': 72,
          'recordedAt': DateTime.now().toIso8601String(),
        },
      },
    };
  }

  /// 获取通用数据
  Map<String, dynamic> _getGenericData() {
    return {
      'success': true,
      'data': null,
      'message': '操作成功',
    };
  }

  /// 生成随机错误
  AppError _generateRandomError() {
    final errors = [
      AppError.network(message: '网络连接失败'),
      AppError.validation(field: 'data', message: '数据验证失败'),
      AppError.authentication(message: '认证失败'),
      AppError.unknown(message: '未知错误'),
    ];

    return errors[_random.nextInt(errors.length)];
  }
}

/// Mock数据配置
class MockDataConfig {
  static const Map<String, dynamic> auth = {
    '/auth/mock-login': {
      'success': true,
      'data': {
        'token': 'mock_auth_token',
        'user': {
          'id': 'user_1',
          'name': '张三',
          'phone': '13800000000',
          'email': 'zhangsan@example.com',
        },
        'patients': [
          {
            'id': 'patient_1',
            'name': '张三',
            'id_number': '310101199001011234',
            'gender': 1,
            'birth_date': '1990-01-01',
            'phone': '13800000000',
          },
        ],
      },
      'message': '登录成功',
    },

    // 获取当前用户信息
    '/auth/user': {
      'success': true,
      'data': {
        'id': 'user_1',
        'name': '张三',
        'phone': '13800000000',
        'email': 'zhangsan@example.com',
      },
      'message': '获取用户信息成功',
    },

    // 获取患者列表
    '/auth/patients': {
      'success': true,
      'data': [
        {
          'id': 'patient_1',
          'name': '张三',
          'id_number': '310101199001011234',
          'gender': 1,
          'birth_date': '1990-01-01',
          'phone': '13800000000',
        },
      ],
      'message': '获取患者列表成功',
    },
  };

  static const Map<String, dynamic> users = {
    '/users/profile': {
      'success': true,
      'data': {
        'id': 'user_1',
        'name': '张三',
        'phone': '13800000000',
        'email': 'zhangsan@example.com',
        'avatarUrl': 'https://example.com/avatar.jpg',
      },
    },
  };

  static const Map<String, dynamic> health = {
    '/health/dashboard': {
      'success': true,
      'data': {
        'bloodPressure': {
          'systolic': 128,
          'diastolic': 82,
          'level': 2,
          'trend': 'stable',
        },
        'heartRate': {
          'bpm': 72,
          'zone': 1,
          'trend': 'stable',
        },
        'weight': {
          'weight': 68.5,
          'bmi': 22.3,
          'category': 2,
          'trend': 'falling',
        },
        'steps': {
          'steps': 7832,
          'goal': 10000,
          'calories': 324.5,
          'distance': 5.8,
        },
      },
    },
  };

  /// 获取所有Mock数据
  static Map<String, dynamic> get all => {
    ...auth,
    ...users,
    ...health,
  };
}
