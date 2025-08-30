import 'package:vitals/features/reports/data/models/health_report_model.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

/// 健康报告映射器
class HealthReportMapper {
  /// 将数据模型转换为领域实体
  static HealthReport toEntity(HealthReportModel model) {
    return HealthReport(
      id: model.id,
      patientId: model.patientId,
      title: model.title,
      description: model.description,
      type: _mapReportType(model.type),
      reportUrl: model.reportUrl,
      status: _mapReportStatus(model.status),
      generatedAt: model.generatedAt,
      periodStart: model.periodStart,
      periodEnd: model.periodEnd,
      thumbnailUrl: model.thumbnailUrl,
      isRead: model.isRead,
      isShared: model.isShared,
      createdAt: model.createdAt,
      metadata: model.metadata,
    );
  }

  /// 将领域实体转换为数据模型
  static HealthReportModel toModel(HealthReport entity) {
    return HealthReportModel(
      id: entity.id,
      patientId: entity.patientId,
      title: entity.title,
      description: entity.description,
      type: entity.type.value,
      reportUrl: entity.reportUrl,
      status: entity.status.value,
      generatedAt: entity.generatedAt,
      periodStart: entity.periodStart,
      periodEnd: entity.periodEnd,
      thumbnailUrl: entity.thumbnailUrl,
      isRead: entity.isRead,
      isShared: entity.isShared,
      createdAt: entity.createdAt,
      metadata: entity.metadata,
    );
  }

  /// 映射报告类型
  static ReportType _mapReportType(int value) {
    return ReportType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => ReportType.healthAssessment,
    );
  }

  /// 映射报告状态
  static ReportStatus _mapReportStatus(int value) {
    return ReportStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => ReportStatus.generating,
    );
  }
}

/// 报告分享记录映射器
class ReportShareRecordMapper {
  /// 将数据模型转换为领域实体
  static ReportShareRecord toEntity(ReportShareRecordModel model) {
    return ReportShareRecord(
      id: model.id,
      reportId: model.reportId,
      method: _mapShareMethod(model.method),
      recipientInfo: model.recipientInfo,
      sharedAt: model.sharedAt,
      message: model.message,
    );
  }

  /// 将领域实体转换为数据模型
  static ReportShareRecordModel toModel(ReportShareRecord entity) {
    return ReportShareRecordModel(
      id: entity.id,
      reportId: entity.reportId,
      method: entity.method.value,
      recipientInfo: entity.recipientInfo,
      sharedAt: entity.sharedAt,
      message: entity.message,
    );
  }

  /// 映射分享方式
  static ShareMethod _mapShareMethod(int value) {
    return ShareMethod.values.firstWhere(
      (method) => method.value == value,
      orElse: () => ShareMethod.link,
    );
  }
}
