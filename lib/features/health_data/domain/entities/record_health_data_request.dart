import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_health_data_request.freezed.dart';

// 数据录入请求
@freezed
abstract class RecordHealthDataRequest with _$RecordHealthDataRequest {
  const factory RecordHealthDataRequest.bloodPressure({
    required int systolic,
    required int diastolic,
    int? heartRate,
    DateTime? recordedAt,
    String? notes,
  }) = _BloodPressureRequest;

  const factory RecordHealthDataRequest.heartRate({
    required int bpm,
    DateTime? recordedAt,
    String? notes,
  }) = _HeartRateRequest;

  const factory RecordHealthDataRequest.weight({
    required double weight,
    DateTime? recordedAt,
    String? notes,
  }) = _WeightRequest;


}
