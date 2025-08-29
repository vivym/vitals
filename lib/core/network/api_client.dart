/// API 客户端接口
/// 定义了网络请求的基本方法
abstract class ApiClient {
  /// GET 请求
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// POST 请求
  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// PUT 请求
  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// DELETE 请求
  Future<T> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// PATCH 请求
  Future<T> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  /// 设置基础URL
  void setBaseUrl(String baseUrl);

  /// 设置认证token
  void setAuthToken(String token);

  /// 清除认证token
  void clearAuthToken();

  /// 设置请求超时时间
  void setTimeout(Duration timeout);

  /// 添加请求拦截器
  void addRequestInterceptor(Function(Map<String, dynamic>) interceptor);

  /// 添加响应拦截器
  void addResponseInterceptor(Function(dynamic) interceptor);

  /// 添加错误拦截器
  void addErrorInterceptor(Function(dynamic) interceptor);
}
