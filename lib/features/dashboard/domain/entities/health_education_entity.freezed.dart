// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_education_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HealthEducationItemEntity {

 String get id; String get title; String get summary; String get content; EducationType get type; String get category; List<String> get tags; String get authorName; DateTime get publishedAt; int get readingTimeMinutes; String get thumbnailUrl; bool get isRead; bool get isFavorited; String? get videoUrl; List<String>? get imageUrls; DateTime? get readAt;
/// Create a copy of HealthEducationItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthEducationItemEntityCopyWith<HealthEducationItemEntity> get copyWith => _$HealthEducationItemEntityCopyWithImpl<HealthEducationItemEntity>(this as HealthEducationItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthEducationItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.readingTimeMinutes, readingTimeMinutes) || other.readingTimeMinutes == readingTimeMinutes)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&const DeepCollectionEquality().equals(other.imageUrls, imageUrls)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,summary,content,type,category,const DeepCollectionEquality().hash(tags),authorName,publishedAt,readingTimeMinutes,thumbnailUrl,isRead,isFavorited,videoUrl,const DeepCollectionEquality().hash(imageUrls),readAt);

@override
String toString() {
  return 'HealthEducationItemEntity(id: $id, title: $title, summary: $summary, content: $content, type: $type, category: $category, tags: $tags, authorName: $authorName, publishedAt: $publishedAt, readingTimeMinutes: $readingTimeMinutes, thumbnailUrl: $thumbnailUrl, isRead: $isRead, isFavorited: $isFavorited, videoUrl: $videoUrl, imageUrls: $imageUrls, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class $HealthEducationItemEntityCopyWith<$Res>  {
  factory $HealthEducationItemEntityCopyWith(HealthEducationItemEntity value, $Res Function(HealthEducationItemEntity) _then) = _$HealthEducationItemEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String summary, String content, EducationType type, String category, List<String> tags, String authorName, DateTime publishedAt, int readingTimeMinutes, String thumbnailUrl, bool isRead, bool isFavorited, String? videoUrl, List<String>? imageUrls, DateTime? readAt
});




}
/// @nodoc
class _$HealthEducationItemEntityCopyWithImpl<$Res>
    implements $HealthEducationItemEntityCopyWith<$Res> {
  _$HealthEducationItemEntityCopyWithImpl(this._self, this._then);

  final HealthEducationItemEntity _self;
  final $Res Function(HealthEducationItemEntity) _then;

/// Create a copy of HealthEducationItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? content = null,Object? type = null,Object? category = null,Object? tags = null,Object? authorName = null,Object? publishedAt = null,Object? readingTimeMinutes = null,Object? thumbnailUrl = null,Object? isRead = null,Object? isFavorited = null,Object? videoUrl = freezed,Object? imageUrls = freezed,Object? readAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EducationType,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,readingTimeMinutes: null == readingTimeMinutes ? _self.readingTimeMinutes : readingTimeMinutes // ignore: cast_nullable_to_non_nullable
as int,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrls: freezed == imageUrls ? _self.imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthEducationItemEntity].
extension HealthEducationItemEntityPatterns on HealthEducationItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthEducationItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthEducationItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthEducationItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _HealthEducationItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthEducationItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HealthEducationItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  String content,  EducationType type,  String category,  List<String> tags,  String authorName,  DateTime publishedAt,  int readingTimeMinutes,  String thumbnailUrl,  bool isRead,  bool isFavorited,  String? videoUrl,  List<String>? imageUrls,  DateTime? readAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthEducationItemEntity() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.content,_that.type,_that.category,_that.tags,_that.authorName,_that.publishedAt,_that.readingTimeMinutes,_that.thumbnailUrl,_that.isRead,_that.isFavorited,_that.videoUrl,_that.imageUrls,_that.readAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  String content,  EducationType type,  String category,  List<String> tags,  String authorName,  DateTime publishedAt,  int readingTimeMinutes,  String thumbnailUrl,  bool isRead,  bool isFavorited,  String? videoUrl,  List<String>? imageUrls,  DateTime? readAt)  $default,) {final _that = this;
switch (_that) {
case _HealthEducationItemEntity():
return $default(_that.id,_that.title,_that.summary,_that.content,_that.type,_that.category,_that.tags,_that.authorName,_that.publishedAt,_that.readingTimeMinutes,_that.thumbnailUrl,_that.isRead,_that.isFavorited,_that.videoUrl,_that.imageUrls,_that.readAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String summary,  String content,  EducationType type,  String category,  List<String> tags,  String authorName,  DateTime publishedAt,  int readingTimeMinutes,  String thumbnailUrl,  bool isRead,  bool isFavorited,  String? videoUrl,  List<String>? imageUrls,  DateTime? readAt)?  $default,) {final _that = this;
switch (_that) {
case _HealthEducationItemEntity() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.content,_that.type,_that.category,_that.tags,_that.authorName,_that.publishedAt,_that.readingTimeMinutes,_that.thumbnailUrl,_that.isRead,_that.isFavorited,_that.videoUrl,_that.imageUrls,_that.readAt);case _:
  return null;

}
}

}

/// @nodoc


class _HealthEducationItemEntity extends HealthEducationItemEntity {
  const _HealthEducationItemEntity({required this.id, required this.title, required this.summary, required this.content, required this.type, required this.category, required final  List<String> tags, required this.authorName, required this.publishedAt, required this.readingTimeMinutes, required this.thumbnailUrl, required this.isRead, required this.isFavorited, this.videoUrl, final  List<String>? imageUrls, this.readAt}): _tags = tags,_imageUrls = imageUrls,super._();
  

@override final  String id;
@override final  String title;
@override final  String summary;
@override final  String content;
@override final  EducationType type;
@override final  String category;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String authorName;
@override final  DateTime publishedAt;
@override final  int readingTimeMinutes;
@override final  String thumbnailUrl;
@override final  bool isRead;
@override final  bool isFavorited;
@override final  String? videoUrl;
 final  List<String>? _imageUrls;
@override List<String>? get imageUrls {
  final value = _imageUrls;
  if (value == null) return null;
  if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? readAt;

/// Create a copy of HealthEducationItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthEducationItemEntityCopyWith<_HealthEducationItemEntity> get copyWith => __$HealthEducationItemEntityCopyWithImpl<_HealthEducationItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthEducationItemEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.readingTimeMinutes, readingTimeMinutes) || other.readingTimeMinutes == readingTimeMinutes)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&const DeepCollectionEquality().equals(other._imageUrls, _imageUrls)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,summary,content,type,category,const DeepCollectionEquality().hash(_tags),authorName,publishedAt,readingTimeMinutes,thumbnailUrl,isRead,isFavorited,videoUrl,const DeepCollectionEquality().hash(_imageUrls),readAt);

@override
String toString() {
  return 'HealthEducationItemEntity(id: $id, title: $title, summary: $summary, content: $content, type: $type, category: $category, tags: $tags, authorName: $authorName, publishedAt: $publishedAt, readingTimeMinutes: $readingTimeMinutes, thumbnailUrl: $thumbnailUrl, isRead: $isRead, isFavorited: $isFavorited, videoUrl: $videoUrl, imageUrls: $imageUrls, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class _$HealthEducationItemEntityCopyWith<$Res> implements $HealthEducationItemEntityCopyWith<$Res> {
  factory _$HealthEducationItemEntityCopyWith(_HealthEducationItemEntity value, $Res Function(_HealthEducationItemEntity) _then) = __$HealthEducationItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String summary, String content, EducationType type, String category, List<String> tags, String authorName, DateTime publishedAt, int readingTimeMinutes, String thumbnailUrl, bool isRead, bool isFavorited, String? videoUrl, List<String>? imageUrls, DateTime? readAt
});




}
/// @nodoc
class __$HealthEducationItemEntityCopyWithImpl<$Res>
    implements _$HealthEducationItemEntityCopyWith<$Res> {
  __$HealthEducationItemEntityCopyWithImpl(this._self, this._then);

  final _HealthEducationItemEntity _self;
  final $Res Function(_HealthEducationItemEntity) _then;

/// Create a copy of HealthEducationItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? content = null,Object? type = null,Object? category = null,Object? tags = null,Object? authorName = null,Object? publishedAt = null,Object? readingTimeMinutes = null,Object? thumbnailUrl = null,Object? isRead = null,Object? isFavorited = null,Object? videoUrl = freezed,Object? imageUrls = freezed,Object? readAt = freezed,}) {
  return _then(_HealthEducationItemEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EducationType,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,readingTimeMinutes: null == readingTimeMinutes ? _self.readingTimeMinutes : readingTimeMinutes // ignore: cast_nullable_to_non_nullable
as int,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isFavorited: null == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrls: freezed == imageUrls ? _self._imageUrls : imageUrls // ignore: cast_nullable_to_non_nullable
as List<String>?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
