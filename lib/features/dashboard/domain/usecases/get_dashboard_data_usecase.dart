import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/app_error.dart';
import '../../data/models/dashboard_models.dart';
import '../../data/repositories/dashboard_repository.dart';
import '../../data/providers/dashboard_providers.dart';

part 'get_dashboard_data_usecase.g.dart';

/// 获取首页数据用例
@riverpod
class GetDashboardDataUseCase extends _$GetDashboardDataUseCase {
  @override
  void build() {}

  /// 执行获取首页数据
  Future<Result<DashboardResponse, AppError>> execute(
    String patientId, {
    bool forceRefresh = false,
  }) async {
    final repository = ref.read(dashboardRepositoryProvider);
    return await repository.getDashboardData(
      patientId,
      forceRefresh: forceRefresh,
    );
  }
}
