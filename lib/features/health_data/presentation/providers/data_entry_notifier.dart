import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/health_data_states.dart';

part 'data_entry_notifier.g.dart';

// 数据录入表单状态管理
@riverpod
class DataEntryNotifier extends _$DataEntryNotifier {
  @override
  DataEntryState build() {
    return const DataEntryState();
  }

  // 更新收缩压
  void updateSystolic(int? value) {
    state = state.copyWith(
      systolic: value,
      validationErrors: {...state.validationErrors}..remove('systolic'),
    );
    _validateBloodPressure();
  }

  // 更新舒张压
  void updateDiastolic(int? value) {
    state = state.copyWith(
      diastolic: value,
      validationErrors: {...state.validationErrors}..remove('diastolic'),
    );
    _validateBloodPressure();
  }

  // 更新心率
  void updateHeartRate(int? value) {
    state = state.copyWith(heartRate: value);
    _validateHeartRate();
  }

  // 更新体重
  void updateWeight(double? value) {
    state = state.copyWith(weight: value);
    _validateWeight();
  }

  // 更新记录时间
  void updateRecordedAt(DateTime? value) {
    state = state.copyWith(recordedAt: value);
  }

  // 更新备注
  void updateNotes(String? value) {
    state = state.copyWith(notes: value);
  }

  // 切换输入模式
  void toggleInputMode() {
    state = state.copyWith(isDiastolicMode: !state.isDiastolicMode);
  }

  // 设置输入模式
  void setInputMode(bool isDiastolic) {
    state = state.copyWith(isDiastolicMode: isDiastolic);
  }

  // 设置提交状态
  void setSubmitting(bool isSubmitting) {
    state = state.copyWith(isSubmitting: isSubmitting);
  }

  // 验证表单
  bool validateForm() {
    final errors = <String, String>{};

    if (state.systolic == null) {
      errors['systolic'] = '请输入收缩压';
    } else if (state.systolic! < 70 || state.systolic! > 250) {
      errors['systolic'] = '收缩压应在70-250之间';
    }

    if (state.diastolic == null) {
      errors['diastolic'] = '请输入舒张压';
    } else if (state.diastolic! < 40 || state.diastolic! > 150) {
      errors['diastolic'] = '舒张压应在40-150之间';
    }

    if (state.systolic != null && state.diastolic != null) {
      if (state.systolic! <= state.diastolic!) {
        errors['pressure'] = '收缩压应大于舒张压';
      }
    }

    if (state.heartRate != null) {
      if (state.heartRate! < 30 || state.heartRate! > 200) {
        errors['heartRate'] = '心率应在30-200之间';
      }
    }

    if (state.weight != null) {
      if (state.weight! < 20 || state.weight! > 300) {
        errors['weight'] = '体重应在20-300kg之间';
      }
    }

    state = state.copyWith(validationErrors: errors);
    return errors.isEmpty;
  }

  // 清空表单
  void clearForm() {
    state = const DataEntryState();
  }

  // 私有验证方法
  void _validateBloodPressure() {
    final errors = {...state.validationErrors};

    if (state.systolic != null && state.diastolic != null) {
      if (state.systolic! <= state.diastolic!) {
        errors['pressure'] = '收缩压应大于舒张压';
      } else {
        errors.remove('pressure');
      }
    } else {
      errors.remove('pressure');
    }

    state = state.copyWith(validationErrors: errors);
  }

  void _validateHeartRate() {
    final errors = {...state.validationErrors};

    if (state.heartRate != null) {
      if (state.heartRate! < 30 || state.heartRate! > 200) {
        errors['heartRate'] = '心率应在30-200之间';
      } else {
        errors.remove('heartRate');
      }
    } else {
      errors.remove('heartRate');
    }

    state = state.copyWith(validationErrors: errors);
  }

  void _validateWeight() {
    final errors = {...state.validationErrors};

    if (state.weight != null) {
      if (state.weight! < 20 || state.weight! > 300) {
        errors['weight'] = '体重应在20-300kg之间';
      } else {
        errors.remove('weight');
      }
    } else {
      errors.remove('weight');
    }

    state = state.copyWith(validationErrors: errors);
  }
}