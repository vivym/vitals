// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteItem _$FavoriteItemFromJson(Map<String, dynamic> json) =>
    _FavoriteItem(
      id: json['id'] as String,
      contentId: json['contentId'] as String,
      type: $enumDecode(_$FavoriteTypeEnumMap, json['type']),
      title: json['title'] as String,
      summary: json['summary'] as String?,
      imageUrl: json['imageUrl'] as String?,
      favoritedAt: DateTime.parse(json['favorited_at'] as String),
    );

Map<String, dynamic> _$FavoriteItemToJson(_FavoriteItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contentId': instance.contentId,
      'type': _$FavoriteTypeEnumMap[instance.type]!,
      'title': instance.title,
      'summary': instance.summary,
      'imageUrl': instance.imageUrl,
      'favorited_at': instance.favoritedAt.toIso8601String(),
    };

const _$FavoriteTypeEnumMap = {
  FavoriteType.article: 1,
  FavoriteType.video: 2,
  FavoriteType.report: 3,
};
