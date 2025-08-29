import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../constants/app_constants.dart';
import 'api_client.dart';
import 'dio_api_client.dart';
import 'mock_api_client.dart';

part 'network_providers.g.dart';

/// 环境配置Provider
@riverpod
Environment currentEnvironment(CurrentEnvironmentRef ref) {
  // 根据编译常量或配置文件确定环境
  // 这里可以根据需要从环境变量或配置文件读取
  return Environment.development;
}

/// API客户端Provider
@riverpod
ApiClient apiClient(ApiClientRef ref) {
  final environment = ref.watch(currentEnvironmentProvider);

  switch (environment) {
    case Environment.development:
      return MockApiClient(
        mockData: MockDataConfig.all,
        delay: const Duration(milliseconds: 800),
        enableRandomErrors: false,
      );
    case Environment.staging:
    case Environment.production:
      return DioApiClient(baseUrl: AppConstants.apiBaseUrl);
  }
}

/// 网络配置Provider
@riverpod
ApiClient networkConfig(NetworkConfigRef ref) {
  final apiClient = ref.read(apiClientProvider);

  // 设置请求超时
  apiClient.setTimeout(AppConstants.apiTimeout);

  // 添加全局请求拦截器
  apiClient.addRequestInterceptor((data) {
    // 记录请求日志
    print('Request: $data');
  });

  // 添加全局响应拦截器
  apiClient.addResponseInterceptor((data) {
    // 记录响应日志
    print('Response: $data');
  });

  // 添加全局错误拦截器
  apiClient.addErrorInterceptor((error) {
    // 记录错误日志
    print('Error: $error');
  });

  return apiClient;
}

/// 网络配置管理Provider
@riverpod
class NetworkConfigNotifier extends _$NetworkConfigNotifier {
  @override
  void build() {
    // 初始化网络配置
    _setupNetworkConfig();
  }

  void _setupNetworkConfig() {
    final apiClient = ref.read(apiClientProvider);

    // 设置请求超时
    apiClient.setTimeout(AppConstants.apiTimeout);

    // 添加全局请求拦截器
    apiClient.addRequestInterceptor((data) {
      // 记录请求日志
      print('Request: $data');
    });

    // 添加全局响应拦截器
    apiClient.addResponseInterceptor((data) {
      // 记录响应日志
      print('Response: $data');
    });

    // 添加全局错误拦截器
    apiClient.addErrorInterceptor((error) {
      // 记录错误日志
      print('Error: $error');
    });
  }

  /// 设置认证token
  void setAuthToken(String token) {
    final apiClient = ref.read(apiClientProvider);
    apiClient.setAuthToken(token);
  }

  /// 清除认证token
  void clearAuthToken() {
    final apiClient = ref.read(apiClientProvider);
    apiClient.clearAuthToken();
  }

  /// 切换环境
  void switchEnvironment(Environment environment) {
    // 这里可以实现动态切换环境的逻辑
    // 需要重新创建API客户端实例
    ref.invalidate(apiClientProvider);
  }
}
