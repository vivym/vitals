import 'package:flutter_test/flutter_test.dart';
import 'package:vitals/core/errors/app_error.dart';

void main() {
  group('AppError', () {
    test('should create network error correctly', () {
      const error = AppError.network(
        message: '网络连接失败',
        statusCode: 500,
      );

      expect(error, isA<NetworkError>());
      expect(error.message, '网络连接失败');

      error.when(
        network: (message, statusCode) {
          expect(message, '网络连接失败');
          expect(statusCode, 500);
        },
        validation: (message, field) => fail('Should not be validation error'),
        authentication: (message) => fail('Should not be authentication error'),
        unknown: (message, cause) => fail('Should not be unknown error'),
      );
    });

    test('should create validation error correctly', () {
      const error = AppError.validation(
        message: '邮箱格式不正确',
        field: 'email',
      );

      expect(error, isA<ValidationError>());
      expect(error.message, '邮箱格式不正确');

      error.when(
        network: (message, statusCode) => fail('Should not be network error'),
        validation: (message, field) {
          expect(message, '邮箱格式不正确');
          expect(field, 'email');
        },
        authentication: (message) => fail('Should not be authentication error'),
        unknown: (message, cause) => fail('Should not be unknown error'),
      );
    });

    test('should create authentication error correctly', () {
      const error = AppError.authentication(
        message: '认证失败',
      );

      expect(error, isA<AuthenticationError>());
      expect(error.message, '认证失败');
    });

    test('should create unknown error correctly', () {
      const error = AppError.unknown(
        message: '未知错误',
        cause: 'Exception',
      );

      expect(error, isA<UnknownError>());
      expect(error.message, '未知错误');

      error.when(
        network: (message, statusCode) => fail('Should not be network error'),
        validation: (message, field) => fail('Should not be validation error'),
        authentication: (message) => fail('Should not be authentication error'),
        unknown: (message, cause) {
          expect(message, '未知错误');
          expect(cause, 'Exception');
        },
      );
    });
  });

  group('Result', () {
    test('should create success result correctly', () {
      const data = 'test data';
      const result = Result<String, AppError>.success(data);

      expect(result, isA<Success<String, AppError>>());

      result.when(
        success: (successData) {
          expect(successData, data);
        },
        failure: (error) {
          fail('Should not call failure callback');
        },
      );
    });

    test('should create failure result correctly', () {
      const error = AppError.network(message: '网络错误');
      const result = Result<String, AppError>.failure(error);

      expect(result, isA<Failure<String, AppError>>());

      result.when(
        success: (data) {
          fail('Should not call success callback');
        },
        failure: (failureError) {
          expect(failureError, error);
        },
      );
    });

    test('should handle pattern matching correctly', () {
      const successResult = Result<String, AppError>.success('test data');
      const failureResult = Result<String, AppError>.failure(AppError.network(message: '网络错误'));

      var successCallbackCalled = false;
      var failureCallbackCalled = false;

      successResult.when(
        success: (data) {
          successCallbackCalled = true;
          expect(data, 'test data');
        },
        failure: (error) {
          fail('Should not call failure callback for success result');
        },
      );

      failureResult.when(
        success: (data) {
          fail('Should not call success callback for failure result');
        },
        failure: (error) {
          failureCallbackCalled = true;
          expect(error.message, '网络错误');
        },
      );

      expect(successCallbackCalled, true);
      expect(failureCallbackCalled, true);
    });
  });
}
