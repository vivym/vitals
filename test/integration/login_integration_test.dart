import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/core/network/mock_api_client.dart';

void main() {
  group('Login Integration Test', () {
    test('should test mock api client directly', () async {
      // 创建Mock API客户端
      final mockApiClient = MockApiClient(
        mockData: MockDataConfig.all,
        delay: const Duration(milliseconds: 100),
        enableRandomErrors: false,
      );

      // 直接测试API调用
      try {
        final response = await mockApiClient.post<Map<String, dynamic>>(
          '/auth/mock-login',
          data: {'phone': '13800000000', 'agreedToTerms': true},
        );

        print('API响应: $response');
        expect(response, isNotNull);
        expect(response['success'], isTrue);
        expect(response['data'], isNotNull);
        expect(response['data']['token'], 'mock_auth_token');
      } catch (e, stackTrace) {
        print('API调用失败: $e');
        print('Stack trace: $stackTrace');
        rethrow;
      }
    });

    test('should show actual mock data structure', () {
      // 验证Mock数据配置
      final mockData = MockDataConfig.all;
      print('Mock数据配置:');
      for (final entry in mockData.entries) {
        print('  ${entry.key}: ${entry.value}');
      }

      // 验证登录路径存在
      expect(mockData.containsKey('/auth/mock-login'), isTrue,
          reason: '应该包含登录路径');

      final loginData = mockData['/auth/mock-login'];
      expect(loginData, isNotNull);
      expect(loginData['success'], isTrue);
      expect(loginData['data'], isNotNull);
      expect(loginData['data']['token'], isNotNull);
      expect(loginData['data']['user'], isNotNull);
    });
  });
}
