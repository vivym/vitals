import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/features/reports/domain/repositories/reports_repository.dart';
import 'package:vitals/features/reports/data/repositories/reports_repository_impl.dart';

part 'reports_providers.g.dart';

@riverpod
ReportsRepository reportsRepository(ReportsRepositoryRef ref) {
  return ReportsRepositoryImpl();
}
