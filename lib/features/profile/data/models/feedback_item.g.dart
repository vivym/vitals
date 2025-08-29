// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedbackItem _$FeedbackItemFromJson(Map<String, dynamic> json) =>
    _FeedbackItem(
      id: json['id'] as String,
      type: $enumDecode(_$FeedbackTypeEnumMap, json['type']),
      title: json['title'] as String,
      content: json['content'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      contactInfo: json['contactInfo'] as String?,
      status:
          $enumDecodeNullable(_$FeedbackStatusEnumMap, json['status']) ??
          FeedbackStatus.pending,
      reply: json['reply'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      repliedAt: json['replied_at'] == null
          ? null
          : DateTime.parse(json['replied_at'] as String),
    );

Map<String, dynamic> _$FeedbackItemToJson(_FeedbackItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$FeedbackTypeEnumMap[instance.type]!,
      'title': instance.title,
      'content': instance.content,
      'attachments': instance.attachments,
      'contactInfo': instance.contactInfo,
      'status': _$FeedbackStatusEnumMap[instance.status]!,
      'reply': instance.reply,
      'created_at': instance.createdAt?.toIso8601String(),
      'replied_at': instance.repliedAt?.toIso8601String(),
    };

const _$FeedbackTypeEnumMap = {
  FeedbackType.bug: 1,
  FeedbackType.suggestion: 2,
  FeedbackType.complaint: 3,
  FeedbackType.praise: 4,
  FeedbackType.other: 5,
};

const _$FeedbackStatusEnumMap = {
  FeedbackStatus.pending: 1,
  FeedbackStatus.processing: 2,
  FeedbackStatus.replied: 3,
  FeedbackStatus.closed: 4,
};
