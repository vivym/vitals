import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vitals/features/reports/data/datasources/reports_local_datasource.dart';
import 'package:vitals/features/reports/data/datasources/reports_remote_datasource.dart';
import 'package:vitals/features/reports/data/repositories/reports_repository_impl.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/presentation/providers/reports_providers.dart';
import 'package:vitals/features/reports/domain/usecases/get_reports_usecase.dart';

class MockReportsRemoteDataSource extends Mock implements ReportsRemoteDataSource {}
class MockReportsLocalDataSource extends Mock implements ReportsLocalDataSource {}

void main() {
  group('ReportsProviders', () {
    late ProviderContainer container;
    late MockReportsRemoteDataSource mockRemoteDataSource;
    late MockReportsLocalDataSource mockLocalDataSource;

    setUp(() {
      mockRemoteDataSource = MockReportsRemoteDataSource();
      mockLocalDataSource = MockReportsLocalDataSource();

      container = ProviderContainer(
        overrides: [
          reportsRepositoryProvider.overrideWithValue(
            ReportsRepositoryImpl(mockRemoteDataSource, mockLocalDataSource),
          ),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('should provide ReportsRepository instance', () {
      // When
      final repository = container.read(reportsRepositoryProvider);

      // Then
      expect(repository, isA<ReportsRepository>());
      expect(repository, isA<ReportsRepositoryImpl>());
    });

    test('should provide GetReportsUseCase instance', () {
      // When
      final useCase = container.read(getReportsUseCaseProvider.notifier);

      // Then
      expect(useCase, isA<GetReportsUseCase>());
    });
  });
}
