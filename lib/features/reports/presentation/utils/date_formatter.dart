import 'package:intl/intl.dart';
import 'package:vitals/features/reports/domain/entities/health_report.dart';

/// 报告日期格式化工具类
class ReportDateFormatter {
  /// 格式化时间段描述
  static String formatPeriodDescription(HealthReport report) {
    if (!report.hasValidPeriod) return '';

    final start = DateFormat('yyyy年MM月dd日').format(report.periodStart!);
    final end = DateFormat('yyyy年MM月dd日').format(report.periodEnd!);
    return '$start - $end';
  }

  /// 格式化生成日期
  static String formatGeneratedDate(HealthReport report) {
    if (report.generatedAt == null) return '';
    return DateFormat('yyyy年MM月dd日').format(report.generatedAt!);
  }

  /// 格式化创建日期
  static String formatCreatedDate(HealthReport report) {
    if (report.createdAt == null) return '';
    return DateFormat('yyyy年MM月dd日 HH:mm').format(report.createdAt!);
  }

  /// 获取相对时间描述（如：2天前）
  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}天前';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}小时前';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}分钟前';
    } else {
      return '刚刚';
    }
  }
}
