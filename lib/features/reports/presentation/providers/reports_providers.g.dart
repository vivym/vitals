// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportsRemoteDataSourceHash() =>
    r'938922ae56b0befb7a834fe2b737fe4571a293e5';

/// 远程数据源提供者
///
/// Copied from [reportsRemoteDataSource].
@ProviderFor(reportsRemoteDataSource)
final reportsRemoteDataSourceProvider =
    AutoDisposeProvider<ReportsRemoteDataSource>.internal(
      reportsRemoteDataSource,
      name: r'reportsRemoteDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$reportsRemoteDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReportsRemoteDataSourceRef =
    AutoDisposeProviderRef<ReportsRemoteDataSource>;
String _$reportsLocalDataSourceHash() =>
    r'c913468312f0953b28f7461cdb667eb3f0449509';

/// 本地数据源提供者
///
/// Copied from [reportsLocalDataSource].
@ProviderFor(reportsLocalDataSource)
final reportsLocalDataSourceProvider =
    AutoDisposeProvider<ReportsLocalDataSource>.internal(
      reportsLocalDataSource,
      name: r'reportsLocalDataSourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$reportsLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReportsLocalDataSourceRef =
    AutoDisposeProviderRef<ReportsLocalDataSource>;
String _$reportsRepositoryHash() => r'a3bbfd5544920154d4c238ad49bc1b8e54b99cbe';

/// 仓库提供者
///
/// Copied from [reportsRepository].
@ProviderFor(reportsRepository)
final reportsRepositoryProvider =
    AutoDisposeProvider<ReportsRepository>.internal(
      reportsRepository,
      name: r'reportsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$reportsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReportsRepositoryRef = AutoDisposeProviderRef<ReportsRepository>;
String _$getReportsUseCaseHash() => r'e57f892fbb89f3d9a333d2c7efad0529f3704232';

/// 获取报告用例提供者
///
/// Copied from [getReportsUseCase].
@ProviderFor(getReportsUseCase)
final getReportsUseCaseProvider =
    AutoDisposeProvider<GetReportsUseCase>.internal(
      getReportsUseCase,
      name: r'getReportsUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getReportsUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetReportsUseCaseRef = AutoDisposeProviderRef<GetReportsUseCase>;
String _$shareReportUseCaseHash() =>
    r'632421c8e38eac791541fd312fb57cdb900576dd';

/// 分享报告用例提供者
///
/// Copied from [ShareReportUseCase].
@ProviderFor(ShareReportUseCase)
final shareReportUseCaseProvider =
    AutoDisposeAsyncNotifierProvider<ShareReportUseCase, void>.internal(
      ShareReportUseCase.new,
      name: r'shareReportUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$shareReportUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ShareReportUseCase = AutoDisposeAsyncNotifier<void>;
String _$markReportAsReadUseCaseHash() =>
    r'905d48718e5b85bf9f3d5eee53629f425e4e7dac';

/// 标记报告已读用例提供者
///
/// Copied from [MarkReportAsReadUseCase].
@ProviderFor(MarkReportAsReadUseCase)
final markReportAsReadUseCaseProvider =
    AutoDisposeAsyncNotifierProvider<MarkReportAsReadUseCase, void>.internal(
      MarkReportAsReadUseCase.new,
      name: r'markReportAsReadUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$markReportAsReadUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MarkReportAsReadUseCase = AutoDisposeAsyncNotifier<void>;
String _$requestReportGenerationUseCaseHash() =>
    r'e0818df74358b2c339f36d4d4f6010efebde3349';

/// 请求生成报告用例提供者
///
/// Copied from [RequestReportGenerationUseCase].
@ProviderFor(RequestReportGenerationUseCase)
final requestReportGenerationUseCaseProvider =
    AutoDisposeAsyncNotifierProvider<
      RequestReportGenerationUseCase,
      void
    >.internal(
      RequestReportGenerationUseCase.new,
      name: r'requestReportGenerationUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$requestReportGenerationUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RequestReportGenerationUseCase = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
