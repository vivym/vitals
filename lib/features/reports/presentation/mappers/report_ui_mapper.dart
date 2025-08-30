import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

part 'report_ui_mapper.freezed.dart';

/// 报告UI映射器 - 处理UI相关的显示逻辑
class ReportUIMapper {
  /// 获取报告类型的图标
  static IconData getReportTypeIcon(ReportType type) {
    switch (type) {
      case ReportType.recoveryMonthly:
        return Icons.calendar_month;
      case ReportType.healthAssessment:
        return Icons.assessment;
      case ReportType.medicationAnalysis:
        return Icons.medication;
      case ReportType.lifestyleReport:
        return Icons.fitness_center;
      case ReportType.riskAssessment:
        return Icons.warning;
    }
  }

  /// 获取报告类型的颜色
  static Color getReportTypeColor(ReportType type) {
    switch (type) {
      case ReportType.recoveryMonthly:
        return const Color(0xFF2196F3);
      case ReportType.healthAssessment:
        return const Color(0xFF4CAF50);
      case ReportType.medicationAnalysis:
        return const Color(0xFFFF9800);
      case ReportType.lifestyleReport:
        return const Color(0xFF9C27B0);
      case ReportType.riskAssessment:
        return const Color(0xFFFF5722);
    }
  }

  /// 获取报告状态的颜色
  static Color getReportStatusColor(ReportStatus status) {
    switch (status) {
      case ReportStatus.generating:
        return const Color(0xFFFF9800);
      case ReportStatus.ready:
        return const Color(0xFF4CAF50);
      case ReportStatus.failed:
        return const Color(0xFFFF5722);
      case ReportStatus.expired:
        return const Color(0xFF9E9E9E);
    }
  }

  /// 获取分享方式的图标
  static IconData getShareMethodIcon(ShareMethod method) {
    switch (method) {
      case ShareMethod.link:
        return Icons.link;
      case ShareMethod.wechat:
        return Icons.chat;
      case ShareMethod.email:
        return Icons.email;
      case ShareMethod.sms:
        return Icons.sms;
      case ShareMethod.qrcode:
        return Icons.qr_code;
    }
  }
}

/// WebView状态 - 移动到presentation层
@freezed
abstract class WebViewState with _$WebViewState {
  const factory WebViewState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    String? errorMessage,
    @Default(0) int loadProgress,
    String? currentUrl,
    @Default(false) bool canGoBack,
    @Default(false) bool canGoForward,
  }) = _WebViewState;
}
