// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedbackItem {

 String get id; FeedbackType get type; String get title; String get content; List<String>? get attachments; String? get contactInfo; FeedbackStatus get status; String? get reply;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'replied_at') DateTime? get repliedAt;
/// Create a copy of FeedbackItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackItemCopyWith<FeedbackItem> get copyWith => _$FeedbackItemCopyWithImpl<FeedbackItem>(this as FeedbackItem, _$identity);

  /// Serializes this FeedbackItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.contactInfo, contactInfo) || other.contactInfo == contactInfo)&&(identical(other.status, status) || other.status == status)&&(identical(other.reply, reply) || other.reply == reply)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.repliedAt, repliedAt) || other.repliedAt == repliedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,content,const DeepCollectionEquality().hash(attachments),contactInfo,status,reply,createdAt,repliedAt);

@override
String toString() {
  return 'FeedbackItem(id: $id, type: $type, title: $title, content: $content, attachments: $attachments, contactInfo: $contactInfo, status: $status, reply: $reply, createdAt: $createdAt, repliedAt: $repliedAt)';
}


}

/// @nodoc
abstract mixin class $FeedbackItemCopyWith<$Res>  {
  factory $FeedbackItemCopyWith(FeedbackItem value, $Res Function(FeedbackItem) _then) = _$FeedbackItemCopyWithImpl;
@useResult
$Res call({
 String id, FeedbackType type, String title, String content, List<String>? attachments, String? contactInfo, FeedbackStatus status, String? reply,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'replied_at') DateTime? repliedAt
});




}
/// @nodoc
class _$FeedbackItemCopyWithImpl<$Res>
    implements $FeedbackItemCopyWith<$Res> {
  _$FeedbackItemCopyWithImpl(this._self, this._then);

  final FeedbackItem _self;
  final $Res Function(FeedbackItem) _then;

/// Create a copy of FeedbackItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? content = null,Object? attachments = freezed,Object? contactInfo = freezed,Object? status = null,Object? reply = freezed,Object? createdAt = freezed,Object? repliedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FeedbackType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,contactInfo: freezed == contactInfo ? _self.contactInfo : contactInfo // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeedbackStatus,reply: freezed == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,repliedAt: freezed == repliedAt ? _self.repliedAt : repliedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedbackItem].
extension FeedbackItemPatterns on FeedbackItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedbackItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedbackItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedbackItem value)  $default,){
final _that = this;
switch (_that) {
case _FeedbackItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedbackItem value)?  $default,){
final _that = this;
switch (_that) {
case _FeedbackItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  FeedbackType type,  String title,  String content,  List<String>? attachments,  String? contactInfo,  FeedbackStatus status,  String? reply, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'replied_at')  DateTime? repliedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedbackItem() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.content,_that.attachments,_that.contactInfo,_that.status,_that.reply,_that.createdAt,_that.repliedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  FeedbackType type,  String title,  String content,  List<String>? attachments,  String? contactInfo,  FeedbackStatus status,  String? reply, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'replied_at')  DateTime? repliedAt)  $default,) {final _that = this;
switch (_that) {
case _FeedbackItem():
return $default(_that.id,_that.type,_that.title,_that.content,_that.attachments,_that.contactInfo,_that.status,_that.reply,_that.createdAt,_that.repliedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  FeedbackType type,  String title,  String content,  List<String>? attachments,  String? contactInfo,  FeedbackStatus status,  String? reply, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'replied_at')  DateTime? repliedAt)?  $default,) {final _that = this;
switch (_that) {
case _FeedbackItem() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.content,_that.attachments,_that.contactInfo,_that.status,_that.reply,_that.createdAt,_that.repliedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedbackItem implements FeedbackItem {
  const _FeedbackItem({required this.id, required this.type, required this.title, required this.content, final  List<String>? attachments, this.contactInfo, this.status = FeedbackStatus.pending, this.reply, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'replied_at') this.repliedAt}): _attachments = attachments;
  factory _FeedbackItem.fromJson(Map<String, dynamic> json) => _$FeedbackItemFromJson(json);

@override final  String id;
@override final  FeedbackType type;
@override final  String title;
@override final  String content;
 final  List<String>? _attachments;
@override List<String>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? contactInfo;
@override@JsonKey() final  FeedbackStatus status;
@override final  String? reply;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'replied_at') final  DateTime? repliedAt;

/// Create a copy of FeedbackItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedbackItemCopyWith<_FeedbackItem> get copyWith => __$FeedbackItemCopyWithImpl<_FeedbackItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedbackItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedbackItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.contactInfo, contactInfo) || other.contactInfo == contactInfo)&&(identical(other.status, status) || other.status == status)&&(identical(other.reply, reply) || other.reply == reply)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.repliedAt, repliedAt) || other.repliedAt == repliedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,content,const DeepCollectionEquality().hash(_attachments),contactInfo,status,reply,createdAt,repliedAt);

@override
String toString() {
  return 'FeedbackItem(id: $id, type: $type, title: $title, content: $content, attachments: $attachments, contactInfo: $contactInfo, status: $status, reply: $reply, createdAt: $createdAt, repliedAt: $repliedAt)';
}


}

/// @nodoc
abstract mixin class _$FeedbackItemCopyWith<$Res> implements $FeedbackItemCopyWith<$Res> {
  factory _$FeedbackItemCopyWith(_FeedbackItem value, $Res Function(_FeedbackItem) _then) = __$FeedbackItemCopyWithImpl;
@override @useResult
$Res call({
 String id, FeedbackType type, String title, String content, List<String>? attachments, String? contactInfo, FeedbackStatus status, String? reply,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'replied_at') DateTime? repliedAt
});




}
/// @nodoc
class __$FeedbackItemCopyWithImpl<$Res>
    implements _$FeedbackItemCopyWith<$Res> {
  __$FeedbackItemCopyWithImpl(this._self, this._then);

  final _FeedbackItem _self;
  final $Res Function(_FeedbackItem) _then;

/// Create a copy of FeedbackItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? content = null,Object? attachments = freezed,Object? contactInfo = freezed,Object? status = null,Object? reply = freezed,Object? createdAt = freezed,Object? repliedAt = freezed,}) {
  return _then(_FeedbackItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FeedbackType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,contactInfo: freezed == contactInfo ? _self.contactInfo : contactInfo // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FeedbackStatus,reply: freezed == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,repliedAt: freezed == repliedAt ? _self.repliedAt : repliedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
