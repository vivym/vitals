import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

/// 应用错误类型
/// 使用 Union Types 实现类型安全的错误处理
@freezed
sealed class AppError with _$AppError {
  const factory AppError.network({
    required String message,
    int? statusCode,
  }) = NetworkError;

  const factory AppError.validation({
    required String field,
    required String message,
  }) = ValidationError;

  const factory AppError.authentication({
    required String message,
  }) = AuthenticationError;

  const factory AppError.unknown({
    required String message,
    Object? cause,
  }) = UnknownError;
}

/// 结果类型（类似 Rust 的 Result）
@freezed
sealed class Result<T, E> with _$Result<T, E> {
  const factory Result.success(T data) = Success<T, E>;
  const factory Result.failure(E error) = Failure<T, E>;
}

/// Result 类型扩展方法
extension ResultExtensions<T, E> on Result<T, E> {
  /// 是否为成功状态
  bool get isSuccess => this is Success<T, E>;

  /// 是否为失败状态
  bool get isFailure => this is Failure<T, E>;

  /// 获取成功数据，失败时抛出异常
  T get data => when(
        success: (data) => data,
        failure: (error) => throw error as Object,
      );

  /// 获取错误，成功时抛出异常
  E get error => when(
        success: (data) => throw StateError('Result is success'),
        failure: (error) => error,
      );

  /// 映射成功值
  Result<R, E> map<R>(R Function(T) mapper) {
    return when(
      success: (data) => Result.success(mapper(data)),
      failure: (error) => Result.failure(error),
    );
  }

  /// 映射错误值
  Result<T, R> mapError<R>(R Function(E) mapper) {
    return when(
      success: (data) => Result.success(data),
      failure: (error) => Result.failure(mapper(error)),
    );
  }

  /// 链式调用（flatMap）
  Result<R, E> then<R>(Result<R, E> Function(T) mapper) {
    return when(
      success: (data) => mapper(data),
      failure: (error) => Result.failure(error),
    );
  }

  /// 类型转换
  Result<R, E> cast<R>() {
    return when(
      success: (data) => Result.success(data as R),
      failure: (error) => Result.failure(error),
    );
  }
}
