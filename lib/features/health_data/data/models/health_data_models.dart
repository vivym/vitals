import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_data_models.freezed.dart';
part 'health_data_models.g.dart';

// =============================================================================
// 血压相关模型
// =============================================================================

// 血压水平枚举
enum BloodPressureLevelModel {
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
enum MeasurementSourceModel {
  @JsonValue('manual')
  manual,
  @JsonValue('device')
  device,
  @JsonValue('import')
  import,
}

// 血压记录数据模型
@freezed
abstract class BloodPressureRecordModel with _$BloodPressureRecordModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BloodPressureRecordModel({
    required String id,
    required String patientId,
    required int systolic,
    required int diastolic,
    required DateTime recordedAt,
    int? heartRate,
    String? notes,
    BloodPressureLevelModel? level,
    MeasurementSourceModel? source,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BloodPressureRecordModel;

  factory BloodPressureRecordModel.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureRecordModelFromJson(json);
}

// =============================================================================
// 图表相关模型
// =============================================================================

// 时间范围枚举
enum TimeRangeModel {
  @JsonValue('week')
  week,
  @JsonValue('month')
  month,
  @JsonValue('all')
  all,
}

// 数据点模型
@freezed
abstract class DataPointModel with _$DataPointModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DataPointModel({
    required DateTime timestamp,
    required double value,
    double? secondaryValue,
    Map<String, dynamic>? metadata,
  }) = _DataPointModel;

  factory DataPointModel.fromJson(Map<String, dynamic> json) =>
      _$DataPointModelFromJson(json);
}

// 图表数据模型
@freezed
abstract class ChartDataModel with _$ChartDataModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ChartDataModel({
    required List<DataPointModel> dataPoints,
    required TimeRangeModel timeRange,
    double? minValue,
    double? maxValue,
    double? averageValue,
    String? trend,
  }) = _ChartDataModel;

  factory ChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChartDataModelFromJson(json);
}

// =============================================================================
// 请求模型
// =============================================================================

// 记录健康数据请求模型
@freezed
abstract class RecordHealthDataRequestModel with _$RecordHealthDataRequestModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RecordHealthDataRequestModel({
    int? systolic,
    int? diastolic,
    int? heartRate,
    double? weight,
    DateTime? recordedAt,
    String? notes,
    MeasurementSourceModel? source,
  }) = _RecordHealthDataRequestModel;

  factory RecordHealthDataRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RecordHealthDataRequestModelFromJson(json);
}

// =============================================================================
// 响应模型
// =============================================================================

// 血压数据响应模型
@freezed
abstract class BloodPressureDataResponse with _$BloodPressureDataResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BloodPressureDataResponse({
    required List<BloodPressureRecordModel> records,
    ChartDataModel? chartData,
    Map<String, dynamic>? metadata,
  }) = _BloodPressureDataResponse;

  factory BloodPressureDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureDataResponseFromJson(json);
}
