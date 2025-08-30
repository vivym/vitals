import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_education_entity.freezed.dart';

/// 健康教育内容实体
@freezed
abstract class HealthEducationItemEntity with _$HealthEducationItemEntity {
  const factory HealthEducationItemEntity({
    required String id,
    required String title,
    required String summary,
    required String content,
    required EducationType type,
    required String category,
    required List<String> tags,
    required String authorName,
    required DateTime publishedAt,
    required int readingTimeMinutes,
    required String thumbnailUrl,
    required bool isRead,
    required bool isFavorited,
    String? videoUrl,
    List<String>? imageUrls,
    DateTime? readAt,
  }) = _HealthEducationItemEntity;

  const HealthEducationItemEntity._();

  /// 是否为视频内容
  bool get isVideo => type == EducationType.video;

  /// 是否为图文内容
  bool get isArticle => type == EducationType.article;

  /// 是否为图解内容
  bool get isInfographic => type == EducationType.infographic;

  /// 格式化阅读时间
  String get formattedReadingTime {
    if (readingTimeMinutes < 1) return '< 1分钟';
    return '$readingTimeMinutes分钟';
  }

  /// 格式化发布时间
  String get formattedPublishDate {
    final now = DateTime.now();
    final difference = now.difference(publishedAt);

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

/// 教育内容类型枚举
enum EducationType {
  article('文章', 'article', 'primary'),
  video('视频', 'video', 'danger'),
  infographic('图解', 'infographic', 'success'),
  audio('音频', 'audio', 'secondary');

  const EducationType(this.label, this.iconKey, this.colorKey);

  final String label;
  final String iconKey;
  final String colorKey;
}
