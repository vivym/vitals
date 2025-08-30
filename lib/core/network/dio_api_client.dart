import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/app_constants.dart';
import '../errors/app_error.dart';
import 'api_client.dart';

/// 基于 Dio 的 API 客户端实现
class DioApiClient implements ApiClient {
  late final Dio _dio;
  final FlutterSecureStorage _secureStorage;
  final List<Function(Map<String, dynamic>)> _requestInterceptors = [];
  final List<Function(dynamic)> _responseInterceptors = [];
  final List<Function(dynamic)> _errorInterceptors = [];

  DioApiClient({
    required String baseUrl,
    FlutterSecureStorage? secureStorage,
  }) : _secureStorage = secureStorage ?? const FlutterSecureStorage() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: AppConstants.apiTimeout,
      receiveTimeout: AppConstants.apiTimeout,
      sendTimeout: AppConstants.apiTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    _setupInterceptors();
  }

  @override
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data as T;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data as T;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data as T;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data as T;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<T> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data as T;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  @override
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }

  @override
  void setTimeout(Duration timeout) {
    _dio.options.connectTimeout = timeout;
    _dio.options.receiveTimeout = timeout;
    _dio.options.sendTimeout = timeout;
  }

  @override
  void addRequestInterceptor(Function(Map<String, dynamic>) interceptor) {
    _requestInterceptors.add(interceptor);
  }

  @override
  void addResponseInterceptor(Function(dynamic) interceptor) {
    _responseInterceptors.add(interceptor);
  }

  @override
  void addErrorInterceptor(Function(dynamic) interceptor) {
    _errorInterceptors.add(interceptor);
  }

  /// 设置拦截器
  void _setupInterceptors() {
    // 请求拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // 自动添加认证token
        final token = await _getStoredToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        // 执行自定义请求拦截器
        for (final interceptor in _requestInterceptors) {
          interceptor(options.data ?? {});
        }

        handler.next(options);
      },
      onResponse: (response, handler) {
        // 执行自定义响应拦截器
        for (final interceptor in _responseInterceptors) {
          interceptor(response.data);
        }

        handler.next(response);
      },
      onError: (error, handler) async {
        // 执行自定义错误拦截器
        for (final interceptor in _errorInterceptors) {
          interceptor(error);
        }

        // 处理认证失败
        if (error.response?.statusCode == 401) {
          await _handleAuthFailure();
        }

        handler.next(error);
      },
    ));
  }

  /// 获取存储的认证token
  Future<String?> _getStoredToken() async {
    return await _secureStorage.read(key: AppConstants.keyAuthToken);
  }

  /// 处理认证失败
  Future<void> _handleAuthFailure() async {
    // 清除本地存储的token
    await _secureStorage.delete(key: AppConstants.keyAuthToken);

    // 这里可以触发全局的认证失败事件
    // 比如跳转到登录页面
  }

  /// 处理Dio错误
  AppError _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppError.network(
          message: '请求超时，请检查网络连接',
          statusCode: error.response?.statusCode,
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? '请求失败';

        switch (statusCode) {
          case 400:
            return AppError.validation(
              field: 'request',
              message: message,
            );
          case 401:
            return AppError.authentication(message: message);
          case 403:
            return AppError.authentication(message: '没有权限访问该资源');
          case 404:
            return AppError.network(message: '请求的资源不存在');
          case 500:
            return AppError.network(message: '服务器内部错误');
          default:
            return AppError.network(
              message: message,
              statusCode: statusCode,
            );
        }

      case DioExceptionType.cancel:
        return AppError.network(message: '请求已取消');

      case DioExceptionType.connectionError:
        return AppError.network(message: '网络连接失败，请检查网络设置');

      case DioExceptionType.badCertificate:
        return AppError.network(message: 'SSL证书验证失败');

      case DioExceptionType.unknown:
        return AppError.unknown(
          message: error.message ?? '未知错误',
          cause: error,
        );
    }
  }
}
