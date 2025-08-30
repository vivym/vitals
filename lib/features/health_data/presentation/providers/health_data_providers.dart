import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/health_data_repository.dart';
import '../../domain/usecases/get_blood_pressure_data_usecase.dart';
import '../../domain/usecases/record_blood_pressure_usecase.dart';
import '../../domain/usecases/generate_chart_data_usecase.dart';
import '../../data/repositories/health_data_repository_impl.dart';
import '../../data/datasources/health_data_remote_data_source.dart';
import '../../data/datasources/health_data_remote_data_source_mock.dart';
import '../../data/datasources/health_data_local_data_source.dart';
import '../../data/datasources/health_data_local_data_source_impl.dart';
import '../../../../features/auth/presentation/providers/auth_providers.dart';

part 'health_data_providers.g.dart';

// =============================================================================
// 数据源层 Providers
// =============================================================================

@Riverpod(keepAlive: true)
HealthDataRemoteDataSource healthDataRemoteDataSource(Ref ref) {
  // 开发环境使用Mock数据源
  return HealthDataRemoteDataSourceMock();
}

@Riverpod(keepAlive: true)
HealthDataLocalDataSource healthDataLocalDataSource(Ref ref) {
  return HealthDataLocalDataSourceImpl(
    ref.read(sharedPreferencesProvider),
  );
}

// =============================================================================
// 仓库层 Providers
// =============================================================================

@Riverpod(keepAlive: true)
HealthDataRepository healthDataRepository(Ref ref) {
  return HealthDataRepositoryImpl(
    ref.read(healthDataRemoteDataSourceProvider),
    ref.read(healthDataLocalDataSourceProvider),
  );
}

// =============================================================================
// 用例层 Providers
// =============================================================================

@Riverpod(keepAlive: true)
GetBloodPressureDataUseCase getBloodPressureDataUseCase(Ref ref) {
  return GetBloodPressureDataUseCaseImpl(
    ref.read(healthDataRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
RecordBloodPressureUseCase recordBloodPressureUseCase(Ref ref) {
  return RecordBloodPressureUseCaseImpl(
    ref.read(healthDataRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GenerateChartDataUseCase generateChartDataUseCase(Ref ref) {
  return GenerateChartDataUseCaseImpl(
    ref.read(healthDataRepositoryProvider),
  );
}