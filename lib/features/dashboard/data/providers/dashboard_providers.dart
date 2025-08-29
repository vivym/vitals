import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../datasources/dashboard_remote_datasource_mock.dart';
import '../datasources/dashboard_local_datasource.dart';
import '../datasources/dashboard_local_datasource_impl.dart';
import '../repositories/dashboard_repository.dart';
import '../repositories/dashboard_repository_impl.dart';
import '../../../../features/auth/presentation/providers/auth_providers.dart';

part 'dashboard_providers.g.dart';

// =============================================================================
// 数据源层 Providers
// =============================================================================

@Riverpod(keepAlive: true)
DashboardRemoteDataSource dashboardRemoteDataSource(DashboardRemoteDataSourceRef ref) {
  // 开发环境使用Mock数据源
  return DashboardRemoteDataSourceMock();
}

@Riverpod(keepAlive: true)
DashboardLocalDataSource dashboardLocalDataSource(DashboardLocalDataSourceRef ref) {
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


