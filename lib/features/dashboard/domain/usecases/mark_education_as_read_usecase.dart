import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/app_error.dart';
import '../../data/repositories/dashboard_repository.dart';
import '../../data/providers/dashboard_providers.dart';

part 'mark_education_as_read_usecase.g.dart';

/// 标记教育内容为已读用例
@riverpod
class MarkEducationAsReadUseCase extends _$MarkEducationAsReadUseCase {
  @override
  void build() {}

  /// 执行标记教育内容为已读
  Future<Result<void, AppError>> execute(String itemId) async {
    final repository = ref.read(dashboardRepositoryProvider);
    return await repository.markEducationAsRead(itemId);
  }
}
