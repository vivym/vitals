import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_item.freezed.dart';
part 'feedback_item.g.dart';

/// 反馈类型
@JsonEnum(valueField: 'value')
enum FeedbackType {
  bug(1, 'Bug反馈'),
  suggestion(2, '建议'),
  complaint(3, '投诉'),
  praise(4, '表扬'),
  other(5, '其他');

  const FeedbackType(this.value, this.label);
  final int value;
  final String label;
}

/// 反馈状态
@JsonEnum(valueField: 'value')
enum FeedbackStatus {
  pending(1, '待处理'),
  processing(2, '处理中'),
  replied(3, '已回复'),
  closed(4, '已关闭');

  const FeedbackStatus(this.value, this.label);
  final int value;
  final String label;
}

/// 反馈信息
@freezed
abstract class FeedbackItem with _$FeedbackItem {
  const factory FeedbackItem({
    required String id,
    required FeedbackType type,
    required String title,
    required String content,
    List<String>? attachments,
    String? contactInfo,
    @Default(FeedbackStatus.pending) FeedbackStatus status,
    String? reply,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'replied_at') DateTime? repliedAt,
  }) = _FeedbackItem;

  factory FeedbackItem.fromJson(Map<String, dynamic> json) =>
      _$FeedbackItemFromJson(json);
}
