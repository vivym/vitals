import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_item.freezed.dart';
part 'favorite_item.g.dart';

/// 收藏类型
@JsonEnum(valueField: 'value')
enum FavoriteType {
  article(1, '文章'),
  video(2, '视频'),
  report(3, '报告');

  const FavoriteType(this.value, this.label);
  final int value;
  final String label;
}

/// 收藏内容
@freezed
abstract class FavoriteItem with _$FavoriteItem {
  const factory FavoriteItem({
    required String id,
    required String contentId,
    required FavoriteType type,
    required String title,
    String? summary,
    String? imageUrl,
    @JsonKey(name: 'favorited_at') required DateTime favoritedAt,
  }) = _FavoriteItem;

  factory FavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemFromJson(json);
}
