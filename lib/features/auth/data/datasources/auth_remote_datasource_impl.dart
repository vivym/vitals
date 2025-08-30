import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/core/network/api_client.dart';
import 'auth_remote_datasource.dart';
import '../models/auth_models.dart';
import '../models/patient.dart';
import '../models/user.dart';

/// 认证远程数据源实现
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/auth/mock-login',
        data: request.toJson(),
      );

      // 处理Mock API响应格式：{ success: true, data: {...}, message: "..." }
      if (response['success'] == true && response['data'] != null) {
        return LoginResponse.fromJson(response['data'] as Map<String, dynamic>);
      } else {
        throw AppError.network(message: response['message'] ?? '登录失败');
      }
    } catch (e) {
      throw _handleApiError(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _apiClient.post('/auth/logout');
    } catch (e) {
      // 登出错误不阻断流程，仅记录日志
      // Logger.warning('Logout API failed', e);
    }
  }

  @override
  Future<User> getCurrentUser() async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>('/auth/user');

      // 处理Mock API响应格式：{ success: true, data: {...}, message: "..." }
      if (response['success'] == true && response['data'] != null) {
        return User.fromJson(response['data'] as Map<String, dynamic>);
      } else {
        throw AppError.network(message: response['message'] ?? '获取用户信息失败');
      }
    } catch (e) {
      throw _handleApiError(e);
    }
  }

  @override
  Future<Patient?> getPatient() async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>('/auth/patient');

      // 处理Mock API响应格式：{ success: true, data: {...}, message: "..." }
      if (response['success'] == true && response['data'] != null) {
        return Patient.fromJson(response['data'] as Map<String, dynamic>);
      } else {
        // 没有患者时返回null，不抛出错误
        return null;
      }
    } catch (e) {
      throw _handleApiError(e);
    }
  }

  @override
  Future<Patient> signPatient(SignPatientRequest request) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        '/auth/patient/sign',
        data: request.toJson(),
      );

      // 处理Mock API响应格式：{ success: true, data: {...}, message: "..." }
      if (response['success'] == true && response['data'] != null) {
        return Patient.fromJson(response['data'] as Map<String, dynamic>);
      } else {
        throw AppError.network(message: response['message'] ?? '患者签约失败');
      }
    } catch (e) {
      throw _handleApiError(e);
    }
  }

  AppError _handleApiError(dynamic error) {
    // 简化的错误处理，实际项目中会更复杂
    return AppError.network(message: error.toString());
  }
}
