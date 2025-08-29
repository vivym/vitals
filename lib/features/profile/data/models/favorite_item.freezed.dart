// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteItem {

 String get id; String get contentId; FavoriteType get type; String get title; String? get summary; String? get imageUrl;@JsonKey(name: 'favorited_at') DateTime get favoritedAt;
/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteItemCopyWith<FavoriteItem> get copyWith => _$FavoriteItemCopyWithImpl<FavoriteItem>(this as FavoriteItem, _$identity);

  /// Serializes this FavoriteItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteItem&&(identical(other.id, id) || other.id == id)&&(identical(other.contentId, contentId) || other.contentId == contentId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.favoritedAt, favoritedAt) || other.favoritedAt == favoritedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,contentId,type,title,summary,imageUrl,favoritedAt);

@override
String toString() {
  return 'FavoriteItem(id: $id, contentId: $contentId, type: $type, title: $title, summary: $summary, imageUrl: $imageUrl, favoritedAt: $favoritedAt)';
}


}

/// @nodoc
abstract mixin class $FavoriteItemCopyWith<$Res>  {
  factory $FavoriteItemCopyWith(FavoriteItem value, $Res Function(FavoriteItem) _then) = _$FavoriteItemCopyWithImpl;
@useResult
$Res call({
 String id, String contentId, FavoriteType type, String title, String? summary, String? imageUrl,@JsonKey(name: 'favorited_at') DateTime favoritedAt
});




}
/// @nodoc
class _$FavoriteItemCopyWithImpl<$Res>
    implements $FavoriteItemCopyWith<$Res> {
  _$FavoriteItemCopyWithImpl(this._self, this._then);

  final FavoriteItem _self;
  final $Res Function(FavoriteItem) _then;

/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? contentId = null,Object? type = null,Object? title = null,Object? summary = freezed,Object? imageUrl = freezed,Object? favoritedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contentId: null == contentId ? _self.contentId : contentId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FavoriteType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,favoritedAt: null == favoritedAt ? _self.favoritedAt : favoritedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteItem].
extension FavoriteItemPatterns on FavoriteItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteItem value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteItem value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String contentId,  FavoriteType type,  String title,  String? summary,  String? imageUrl, @JsonKey(name: 'favorited_at')  DateTime favoritedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
return $default(_that.id,_that.contentId,_that.type,_that.title,_that.summary,_that.imageUrl,_that.favoritedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String contentId,  FavoriteType type,  String title,  String? summary,  String? imageUrl, @JsonKey(name: 'favorited_at')  DateTime favoritedAt)  $default,) {final _that = this;
switch (_that) {
case _FavoriteItem():
return $default(_that.id,_that.contentId,_that.type,_that.title,_that.summary,_that.imageUrl,_that.favoritedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String contentId,  FavoriteType type,  String title,  String? summary,  String? imageUrl, @JsonKey(name: 'favorited_at')  DateTime favoritedAt)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteItem() when $default != null:
return $default(_that.id,_that.contentId,_that.type,_that.title,_that.summary,_that.imageUrl,_that.favoritedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteItem implements FavoriteItem {
  const _FavoriteItem({required this.id, required this.contentId, required this.type, required this.title, this.summary, this.imageUrl, @JsonKey(name: 'favorited_at') required this.favoritedAt});
  factory _FavoriteItem.fromJson(Map<String, dynamic> json) => _$FavoriteItemFromJson(json);

@override final  String id;
@override final  String contentId;
@override final  FavoriteType type;
@override final  String title;
@override final  String? summary;
@override final  String? imageUrl;
@override@JsonKey(name: 'favorited_at') final  DateTime favoritedAt;

/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteItemCopyWith<_FavoriteItem> get copyWith => __$FavoriteItemCopyWithImpl<_FavoriteItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteItem&&(identical(other.id, id) || other.id == id)&&(identical(other.contentId, contentId) || other.contentId == contentId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.favoritedAt, favoritedAt) || other.favoritedAt == favoritedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,contentId,type,title,summary,imageUrl,favoritedAt);

@override
String toString() {
  return 'FavoriteItem(id: $id, contentId: $contentId, type: $type, title: $title, summary: $summary, imageUrl: $imageUrl, favoritedAt: $favoritedAt)';
}


}

/// @nodoc
abstract mixin class _$FavoriteItemCopyWith<$Res> implements $FavoriteItemCopyWith<$Res> {
  factory _$FavoriteItemCopyWith(_FavoriteItem value, $Res Function(_FavoriteItem) _then) = __$FavoriteItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String contentId, FavoriteType type, String title, String? summary, String? imageUrl,@JsonKey(name: 'favorited_at') DateTime favoritedAt
});




}
/// @nodoc
class __$FavoriteItemCopyWithImpl<$Res>
    implements _$FavoriteItemCopyWith<$Res> {
  __$FavoriteItemCopyWithImpl(this._self, this._then);

  final _FavoriteItem _self;
  final $Res Function(_FavoriteItem) _then;

/// Create a copy of FavoriteItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? contentId = null,Object? type = null,Object? title = null,Object? summary = freezed,Object? imageUrl = freezed,Object? favoritedAt = null,}) {
  return _then(_FavoriteItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,contentId: null == contentId ? _self.contentId : contentId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FavoriteType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,favoritedAt: null == favoritedAt ? _self.favoritedAt : favoritedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
