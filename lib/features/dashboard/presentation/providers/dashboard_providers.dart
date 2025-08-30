import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../domain/usecases/get_dashboard_data_usecase.dart';
import '../../domain/usecases/get_education_items_usecase.dart';
import '../../domain/usecases/mark_education_as_read_usecase.dart';
import '../../domain/usecases/toggle_education_favorite_usecase.dart';
import '../../domain/usecases/calculate_health_score_usecase.dart';
import '../../data/repositories/dashboard_repository_impl.dart';
import '../../data/datasources/dashboard_remote_datasource.dart';
import '../../data/datasources/dashboard_remote_datasource_mock.dart';
import '../../data/datasources/dashboard_local_datasource.dart';
import '../../data/datasources/dashboard_local_datasource_impl.dart';
import '../../../../features/auth/presentation/providers/auth_providers.dart';

part 'dashboard_providers.g.dart';

// =============================================================================
// 数据源层 Providers
// =============================================================================

@Riverpod(keepAlive: true)
DashboardRemoteDataSource dashboardRemoteDataSource(Ref ref) {
  // 开发环境使用Mock数据源
  return DashboardRemoteDataSourceMock();
}

@Riverpod(keepAlive: true)
DashboardLocalDataSource dashboardLocalDataSource(Ref ref) {
  return DashboardLocalDataSourceImpl(
    ref.read(sharedPreferencesProvider),
  );
}

// =============================================================================
// 仓库层 Providers
// =============================================================================

@Riverpod(keepAlive: true)
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  return DashboardRepositoryImpl(
    ref.read(dashboardRemoteDataSourceProvider),
    ref.read(dashboardLocalDataSourceProvider),
  );
}

// =============================================================================
// 用例层 Providers
// =============================================================================

@Riverpod(keepAlive: true)
GetDashboardDataUseCase getDashboardDataUseCase(GetDashboardDataUseCaseRef ref) {
  return GetDashboardDataUseCaseImpl(
    ref.read(dashboardRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GetEducationItemsUseCase getEducationItemsUseCase(GetEducationItemsUseCaseRef ref) {
  return GetEducationItemsUseCaseImpl(
    ref.read(dashboardRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
MarkEducationAsReadUseCase markEducationAsReadUseCase(MarkEducationAsReadUseCaseRef ref) {
  return MarkEducationAsReadUseCaseImpl(
    ref.read(dashboardRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
ToggleEducationFavoriteUseCase toggleEducationFavoriteUseCase(ToggleEducationFavoriteUseCaseRef ref) {
  return ToggleEducationFavoriteUseCaseImpl(
    ref.read(dashboardRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
CalculateHealthScoreUseCase calculateHealthScoreUseCase(CalculateHealthScoreUseCaseRef ref) {
  return CalculateHealthScoreUseCaseImpl(
    ref.read(dashboardRepositoryProvider),
  );
}
