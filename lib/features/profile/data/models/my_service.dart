import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_service.freezed.dart';
part 'my_service.g.dart';

/// 服务类型
@JsonEnum(valueField: 'value')
enum ServiceType {
  consultation(1, '在线问诊'),
  followUp(2, '随访管理'),
  rehabilitation(3, '康复计划'),
  nutrition(4, '营养指导'),
  medication(5, '用药管理');

  const ServiceType(this.value, this.label);
  final int value;
  final String label;
}

/// 服务状态
@JsonEnum(valueField: 'value')
enum ServiceStatus {
  active(1, '服务中'),
  expired(2, '已过期'),
  suspended(3, '已暂停');

  const ServiceStatus(this.value, this.label);
  final int value;
  final String label;
}

/// 我的服务
@freezed
abstract class MyService with _$MyService {
  const factory MyService({
    required String id,
    required String name,
    required String description,
    required ServiceType type,
    required ServiceStatus status,
    String? iconUrl,
    @JsonKey(name: 'subscribed_at') DateTime? subscribedAt,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
  }) = _MyService;

  factory MyService.fromJson(Map<String, dynamic> json) =>
      _$MyServiceFromJson(json);
}
