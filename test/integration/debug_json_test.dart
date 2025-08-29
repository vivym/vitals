import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/core/network/mock_api_client.dart';
import 'package:vitals/features/auth/data/models/auth_models.dart';
import 'package:vitals/features/auth/data/models/user.dart';
import 'package:vitals/features/auth/data/models/patient.dart';

void main() {
  group('JSON Parsing Debug Tests', () {
    test('should parse mock response step by step', () {
      // 1. 获取原始Mock数据
      final mockData = MockDataConfig.all['/auth/mock-login'] as Map<String, dynamic>;
      print('原始Mock数据: $mockData');

      // 2. 获取data部分
      final responseData = mockData['data'] as Map<String, dynamic>;
      print('响应数据部分: $responseData');

      // 3. 检查各个字段
      print('Token: ${responseData['token']} (${responseData['token'].runtimeType})');
      print('User: ${responseData['user']} (${responseData['user'].runtimeType})');
      print('Patients: ${responseData['patients']} (${responseData['patients'].runtimeType})');

      // 4. 尝试解析User
      final userJson = responseData['user'] as Map<String, dynamic>;
      print('User JSON: $userJson');

      try {
        final user = User.fromJson(userJson);
        print('User解析成功: $user');
      } catch (e, stackTrace) {
        print('User解析失败: $e');
        print('Stack trace: $stackTrace');
      }

      // 5. 尝试解析Patients
      final patientsJson = responseData['patients'] as List<dynamic>;
      print('Patients JSON: $patientsJson');

      try {
        final patients = patientsJson
            .map((e) => Patient.fromJson(e as Map<String, dynamic>))
            .toList();
        print('Patients解析成功: $patients');
      } catch (e, stackTrace) {
        print('Patients解析失败: $e');
        print('Stack trace: $stackTrace');
      }

      // 6. 尝试解析完整的LoginResponse
      try {
        final loginResponse = LoginResponse.fromJson(responseData);
        print('LoginResponse解析成功: $loginResponse');
      } catch (e, stackTrace) {
        print('LoginResponse解析失败: $e');
        print('Stack trace: $stackTrace');
      }
    });
  });
}
