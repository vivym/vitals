import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vitals/features/health_data/domain/entities/data_entry_state.dart';

part 'data_entry_notifier.g.dart';

// 数据录入表单状态
@riverpod
class DataEntryNotifier extends _$DataEntryNotifier {
  @override
  DataEntryState build() => const DataEntryState();

  void updateSystolic(int? value) {
    state = state.copyWith(systolic: value);
    _validateForm();
  }

  void updateDiastolic(int? value) {
    state = state.copyWith(diastolic: value);
    _validateForm();
  }

  void updateHeartRate(int? value) {
    state = state.copyWith(heartRate: value);
  }

  void _validateForm() {
    final errors = <String, String>{};

    if (state.systolic != null && (state.systolic! <= 0 || state.systolic! > 300)) {
      errors['systolic'] = '收缩压范围：1-300';
    }

    if (state.diastolic != null && (state.diastolic! <= 0 || state.diastolic! > 200)) {
      errors['diastolic'] = '舒张压范围：1-200';
    }

    if (state.systolic != null && state.diastolic != null &&
        state.systolic! <= state.diastolic!) {
      errors['pressure'] = '收缩压应大于舒张压';
    }

    state = state.copyWith(validationErrors: errors);
  }

  void reset() {
    state = const DataEntryState();
  }
}
