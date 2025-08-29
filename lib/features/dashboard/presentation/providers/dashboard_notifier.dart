import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/app_error.dart';
import '../../data/models/dashboard_models.dart';
import '../../data/providers/dashboard_providers.dart';
import '../../domain/usecases/get_dashboard_data_usecase.dart';
import '../../domain/usecases/mark_education_as_read_usecase.dart';
import '../../domain/usecases/calculate_health_score_usecase.dart';

part 'dashboard_notifier.g.dart';

/// 首页状态管理
@riverpod
class DashboardNotifier extends _$DashboardNotifier {
  @override
  AsyncValue<DashboardState> build() {
    _loadInitialData();
    return const AsyncValue.loading();
  }

  /// 刷新数据
  Future<void> refresh() async {
    if (state.isLoading) return;

    // 设置刷新状态
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(isRefreshing: true));
    });

    // 模拟获取数据（实际项目中应该从用户认证状态获取patientId）
    const patientId = 'mock_patient_id';

    final useCase = ref.read(getDashboardDataUseCaseProvider.notifier);
    final result = await useCase.execute(patientId, forceRefresh: true);

    result.when(
      success: (response) {
        state = AsyncValue.data(DashboardState(
          healthData: response.healthData,
          recoveryGoals: response.recoveryGoals,
          educationItems: response.educationItems,
          lastUpdated: response.lastUpdated,
        ));
      },
      failure: (error) {
        state.whenData((currentState) {
          state = AsyncValue.data(currentState.copyWith(
            isRefreshing: false,
            error: error.toString(),
          ));
        });
      },
    );
  }

  /// 标记教育内容为已读
  Future<void> markEducationAsRead(String itemId) async {
    final useCase = ref.read(markEducationAsReadUseCaseProvider.notifier);
    final result = await useCase.execute(itemId);

    result.when(
      success: (_) {
        // 更新本地状态
        state.whenData((currentState) {
          final updatedItems = currentState.educationItems.map((item) {
            if (item.id == itemId) {
              return item.copyWith(isRead: true);
            }
            return item;
          }).toList();

          state = AsyncValue.data(currentState.copyWith(
            educationItems: updatedItems,
          ));
        });
      },
      failure: (error) {
        // 显示错误但不影响当前状态
        print('Failed to mark education as read: $error');
      },
    );
  }

  /// 切换教育内容收藏状态
  Future<void> toggleEducationFavorite(String itemId) async {
    // 先乐观更新 UI
    late bool newFavoriteStatus;
    state.whenData((currentState) {
      final item = currentState.educationItems.firstWhere(
        (item) => item.id == itemId,
      );
      newFavoriteStatus = !item.isFavorited;

      final updatedItems = currentState.educationItems.map((item) {
        if (item.id == itemId) {
          return item.copyWith(isFavorited: newFavoriteStatus);
        }
        return item;
      }).toList();

      state = AsyncValue.data(currentState.copyWith(
        educationItems: updatedItems,
      ));
    });

    // 然后同步到服务器（这里简化处理，实际应该调用相应的用例）
    // 模拟网络延迟
    await Future.delayed(const Duration(milliseconds: 300));

    // 如果失败，可以在这里回滚状态
  }

  /// 加载初始数据
  Future<void> _loadInitialData() async {
    // 模拟获取数据（实际项目中应该从用户认证状态获取patientId）
    const patientId = 'mock_patient_id';

    final useCase = ref.read(getDashboardDataUseCaseProvider.notifier);
    final result = await useCase.execute(patientId);

    result.when(
      success: (response) {
        state = AsyncValue.data(DashboardState(
          healthData: response.healthData,
          recoveryGoals: response.recoveryGoals,
          educationItems: response.educationItems,
          lastUpdated: response.lastUpdated,
        ));
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }
}

/// 健康评分计算
@riverpod
int healthScore(HealthScoreRef ref) {
  final dashboardState = ref.watch(dashboardNotifierProvider);

  return dashboardState.maybeWhen(
    data: (state) {
      if (state.healthData == null) return 0;

      final useCase = CalculateHealthScoreUseCase();
      return useCase.execute(state.healthData!);
    },
    orElse: () => 0,
  );
}

/// 便利的派生状态
@riverpod
List<RecoveryGoal> urgentGoals(UrgentGoalsRef ref) {
  return ref.watch(dashboardNotifierProvider).maybeWhen(
    data: (state) => state.activeGoals
        .where((goal) => goal.daysRemaining <= 7 && !goal.isCompleted)
        .toList(),
    orElse: () => [],
  );
}

@riverpod
List<HealthEducationItem> recommendedEducation(RecommendedEducationRef ref) {
  return ref.watch(dashboardNotifierProvider).maybeWhen(
    data: (state) => state.educationItems
        .where((item) => !item.isRead)
        .take(3)
        .toList(),
    orElse: () => [],
  );
}
