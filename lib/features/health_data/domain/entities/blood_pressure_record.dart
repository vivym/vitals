import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_pressure_record.freezed.dart';
part 'blood_pressure_record.g.dart';

// 血压水平枚举
enum BloodPressureLevel {
  @JsonValue('normal')
  normal,
  @JsonValue('elevated')
  elevated,
  @JsonValue('stage1')
  stage1,
  @JsonValue('stage2')
  stage2,
  @JsonValue('crisis')
  crisis,
}

// 测量来源枚举
enum MeasurementSource {
  @JsonValue('manual')
  manual,
  @JsonValue('device')
  device,
  @JsonValue('import')
  import,
}

// 血压记录实体
@freezed
abstract class BloodPressureRecord with _$BloodPressureRecord {
  const factory BloodPressureRecord({
    required String id,
    required String patientId,
    required int systolic,
    required int diastolic,
    required DateTime recordedAt,
    int? heartRate,
    String? notes,
    BloodPressureLevel? level,
    MeasurementSource? source,
  }) = _BloodPressureRecord;

  factory BloodPressureRecord.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureRecordFromJson(json);

  const BloodPressureRecord._();

  // 计算血压水平
  BloodPressureLevel get calculatedLevel {
    if (systolic >= 180 || diastolic >= 110) return BloodPressureLevel.crisis;
    if (systolic >= 140 || diastolic >= 90) return BloodPressureLevel.stage2;
    if (systolic >= 130 || diastolic >= 80) return BloodPressureLevel.stage1;
    if (systolic >= 120) return BloodPressureLevel.elevated;
    return BloodPressureLevel.normal;
  }
}
