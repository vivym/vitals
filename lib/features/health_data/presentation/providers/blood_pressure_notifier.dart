import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/core/errors/app_error.dart';
import 'package:vitals/features/health_data/domain/entities/blood_pressure_record.dart' as domain;
import 'package:vitals/features/health_data/domain/entities/record_health_data_request.dart';
import 'package:vitals/features/health_data/domain/entities/time_range.dart' as domain;

import '../models/health_data_states.dart';
import '../models/chart_models.dart' as presentation;
import 'health_data_providers.dart';

part 'blood_pressure_notifier.g.dart';

/// 血压状态管理 - 参考Dashboard模块架构
@riverpod
class BloodPressureNotifier extends _$BloodPressureNotifier {
  @override
  AsyncValue<BloodPressureState> build() {
    // 确保异步调用不会阻塞build方法
    Future.microtask(() => _loadInitialData());
    return const AsyncValue.loading();
  }

  /// 刷新数据
  Future<void> refresh() async {
    if (state.isLoading) return;
    await _loadBloodPressureData(forceRefresh: true);
  }

  /// 记录血压数据
  Future<void> recordBloodPressure({
    required String patientId,
    required int systolic,
    required int diastolic,
    int? heartRate,
    String? notes,
    DateTime? recordedAt,
  }) async {
    // 设置录入状态
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(isRecording: true));
    });

    try {
      final useCase = ref.read(recordBloodPressureUseCaseProvider);
      final request = RecordHealthDataRequest.bloodPressure(
        systolic: systolic,
        diastolic: diastolic,
        heartRate: heartRate,
        notes: notes,
        recordedAt: recordedAt,
      );

      final result = await useCase.execute(patientId, request);

      result.when(
        success: (recordEntity) {
          state.whenData((currentState) {
            // 将domain entity转换为presentation model
            final newRecord = _mapBloodPressureEntityToPresentation(recordEntity);
            final updatedRecords = [newRecord, ...currentState.records];

            state = AsyncValue.data(currentState.copyWith(
              records: updatedRecords,
              isRecording: false,
              error: null,
            ));
          });
        },
        failure: (error) {
          state.whenData((currentState) {
            state = AsyncValue.data(currentState.copyWith(
              isRecording: false,
              error: error.message,
            ));
          });
        },
      );
    } catch (e) {
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(
          isRecording: false,
          error: e.toString(),
        ));
      });
    }
  }

  /// 切换时间范围
  Future<void> changeTimeRange(TimeRange range, String patientId) async {
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(selectedRange: range));
    });

    await _loadBloodPressureData(forceRefresh: false);
    await _updateChartData(patientId);
  }

  /// 清除错误
  void clearError() {
    state.whenData((currentState) {
      state = AsyncValue.data(currentState.copyWith(error: null));
    });
  }

  // =============================================================================
  // 私有方法
  // =============================================================================

  /// 加载初始数据
  Future<void> _loadInitialData() async {
    await _loadBloodPressureData(forceRefresh: false);
  }

    /// 加载血压数据
  Future<void> _loadBloodPressureData({required bool forceRefresh}) async {
    try {
      const patientId = 'patient_1'; // 临时硬编码，实际应从auth状态获取

      final useCase = ref.read(getBloodPressureDataUseCaseProvider);
      final currentRange = state.value?.selectedRange ?? TimeRange.month;
      final domainRange = _mapPresentationRangeToDomain(currentRange);

      final result = await useCase.execute(
        patientId,
        range: domainRange,
        forceRefresh: forceRefresh,
      );

      result.when(
        success: (recordEntities) {
          print('🩺 [BloodPressureNotifier] 数据加载成功, 记录数量: ${recordEntities.length}');
          // 将domain entities转换为presentation models
          final records = recordEntities
              .map((entity) => _mapBloodPressureEntityToPresentation(entity))
              .toList();

          print('🩺 [BloodPressureNotifier] 数据转换完成, presentation records: ${records.length}');
          state = AsyncValue.data(BloodPressureState(
            records: records,
            selectedRange: currentRange,
            isLoading: false,
            error: null,
          ));

          print('🩺 [BloodPressureNotifier] 状态更新完成');
          // 加载图表数据
          _updateChartData(patientId);
        },
        failure: (error) {
          print('🩺 [BloodPressureNotifier] 数据加载失败: $error');
          state = AsyncValue.error(error, StackTrace.current);
        },
      );
    } catch (e, stackTrace) {
      print('🩺 [BloodPressureNotifier] 发生异常: $e');
      print('🩺 [BloodPressureNotifier] 堆栈跟踪: $stackTrace');
      state = AsyncValue.error(
        AppError.unknown(message: '加载血压数据失败: $e'),
        stackTrace,
      );
    }
  }

  /// 更新图表数据
  Future<void> _updateChartData(String patientId) async {
    try {
      final useCase = ref.read(generateChartDataUseCaseProvider);
      final currentRange = state.value?.selectedRange ?? TimeRange.month;
      final domainRange = _mapPresentationRangeToDomain(currentRange);

      final result = await useCase.execute(patientId, domainRange);

      result.when(
        success: (chartDataEntity) {
          state.whenData((currentState) {
            // 将domain entity转换为presentation model
            final chartData = _mapChartDataEntityToPresentation(chartDataEntity, currentRange);
            state = AsyncValue.data(currentState.copyWith(chartData: chartData));
          });
        },
        failure: (error) {
          // 图表数据加载失败不影响主要功能，只记录错误
          state.whenData((currentState) {
            state = AsyncValue.data(currentState.copyWith(error: error.message));
          });
        },
      );
    } catch (e) {
      // 图表数据加载失败不影响主要功能
      state.whenData((currentState) {
        state = AsyncValue.data(currentState.copyWith(error: e.toString()));
      });
    }
  }

  // =============================================================================
  // 数据转换方法 (Domain -> Presentation)
  // =============================================================================

  /// 血压记录：Domain Entity -> Presentation Model
  presentation.BloodPressureRecord _mapBloodPressureEntityToPresentation(
    domain.BloodPressureRecord entity,
  ) {
    return presentation.BloodPressureRecord(
      id: entity.id,
      systolic: entity.systolic,
      diastolic: entity.diastolic,
      recordedAt: entity.recordedAt,
      heartRate: entity.heartRate,
      notes: entity.notes,
      levelText: _getBloodPressureLevelText(entity.level),
      sourceText: _getMeasurementSourceText(entity.source),
      calculatedLevel: _calculateBloodPressureLevel(entity.systolic, entity.diastolic),
    );
  }

  /// 图表数据：Domain Entity -> Presentation Model
  presentation.ChartData _mapChartDataEntityToPresentation(
    dynamic chartDataEntity, // 实际类型应该是ChartDataEntity
    TimeRange range,
  ) {
    // 如果后端返回了图表实体，则尝试按约定字段读取；
    // 否则根据当前records计算出可用的图表数据。
    final currentRecords = state.value?.records ?? <presentation.BloodPressureRecord>[];

    // 根据records构造数据点（按时间升序）
    final sorted = [...currentRecords]..sort((a, b) => a.recordedAt.compareTo(b.recordedAt));
    final points = sorted
        .map((r) => presentation.ChartDataPoint(
              timestamp: r.recordedAt,
              value: r.systolic.toDouble(),
              secondaryValue: r.diastolic.toDouble(),
              metadata: null,
            ))
        .toList();

    // 统计指标（对收缩压计算）
    double? minV;
    double? maxV;
    double? avgV;
    if (sorted.isNotEmpty) {
      final values = sorted.map((e) => e.systolic.toDouble()).toList();
      minV = values.reduce((a, b) => a < b ? a : b);
      maxV = values.reduce((a, b) => a > b ? a : b);
      avgV = values.reduce((a, b) => a + b) / values.length;
    }

    // 趋势（近3条与前3条平均对比）
    String? trend;
    if (sorted.length >= 6) {
      final recent = sorted.take(3).map((e) => e.systolic.toDouble()).toList();
      final older = sorted.skip(3).take(3).map((e) => e.systolic.toDouble()).toList();
      if (older.isNotEmpty) {
        final recentAvg = recent.reduce((a, b) => a + b) / recent.length;
        final olderAvg = older.reduce((a, b) => a + b) / older.length;
        if (recentAvg > olderAvg + 3) {
          trend = 'rising';
        } else if (recentAvg < olderAvg - 3) {
          trend = 'falling';
        } else {
          trend = 'stable';
        }
      }
    }

    return presentation.ChartData(
      dataPoints: points,
      timeRangeLabel: range.label,
      minValue: minV,
      maxValue: maxV,
      averageValue: avgV,
      trend: trend,
    );
  }

  /// 时间范围：Presentation -> Domain
  domain.TimeRange _mapPresentationRangeToDomain(TimeRange range) {
    switch (range) {
      case TimeRange.week:
        return domain.TimeRange.week;
      case TimeRange.month:
        return domain.TimeRange.month;
      case TimeRange.all:
        return domain.TimeRange.all;
    }
  }

  /// 获取血压水平文本
  String? _getBloodPressureLevelText(dynamic level) {
    if (level == null) return null;
    // 实际实现应该根据BloodPressureLevel枚举来转换
    return '正常'; // 临时返回
  }

  /// 获取测量来源文本
  String? _getMeasurementSourceText(dynamic source) {
    if (source == null) return null;
    // 实际实现应该根据MeasurementSource枚举来转换
    return '手动录入'; // 临时返回
  }

  /// 计算血压等级
  String _calculateBloodPressureLevel(int systolic, int diastolic) {
    if (systolic >= 180 || diastolic >= 110) {
      return '高血压危象';
    } else if (systolic >= 160 || diastolic >= 100) {
      return '2级高血压';
    } else if (systolic >= 140 || diastolic >= 90) {
      return '1级高血压';
    } else if (systolic >= 120 && diastolic < 80) {
      return '血压偏高';
    } else if (systolic < 90 || diastolic < 60) {
      return '低血压';
    } else {
      return '正常';
    }
  }
}