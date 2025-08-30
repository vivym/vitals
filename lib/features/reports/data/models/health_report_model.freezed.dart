// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HealthReportModel {

 String get id;@JsonKey(name: 'patient_id') String get patientId; String get title; String get description; int get type;// 使用int表示ReportType的value
@JsonKey(name: 'report_url') String get reportUrl; int get status;// 使用int表示ReportStatus的value
@JsonKey(name: 'generated_at') DateTime? get generatedAt;@JsonKey(name: 'period_start') DateTime? get periodStart;@JsonKey(name: 'period_end') DateTime? get periodEnd;@JsonKey(name: 'thumbnail_url') String? get thumbnailUrl;@JsonKey(name: 'is_read') bool get isRead;@JsonKey(name: 'is_shared') bool get isShared;@JsonKey(name: 'created_at') DateTime? get createdAt; Map<String, dynamic>? get metadata;
/// Create a copy of HealthReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthReportModelCopyWith<HealthReportModel> get copyWith => _$HealthReportModelCopyWithImpl<HealthReportModel>(this as HealthReportModel, _$identity);

  /// Serializes this HealthReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.reportUrl, reportUrl) || other.reportUrl == reportUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isShared, isShared) || other.isShared == isShared)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,title,description,type,reportUrl,status,generatedAt,periodStart,periodEnd,thumbnailUrl,isRead,isShared,createdAt,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'HealthReportModel(id: $id, patientId: $patientId, title: $title, description: $description, type: $type, reportUrl: $reportUrl, status: $status, generatedAt: $generatedAt, periodStart: $periodStart, periodEnd: $periodEnd, thumbnailUrl: $thumbnailUrl, isRead: $isRead, isShared: $isShared, createdAt: $createdAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $HealthReportModelCopyWith<$Res>  {
  factory $HealthReportModelCopyWith(HealthReportModel value, $Res Function(HealthReportModel) _then) = _$HealthReportModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'patient_id') String patientId, String title, String description, int type,@JsonKey(name: 'report_url') String reportUrl, int status,@JsonKey(name: 'generated_at') DateTime? generatedAt,@JsonKey(name: 'period_start') DateTime? periodStart,@JsonKey(name: 'period_end') DateTime? periodEnd,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'is_shared') bool isShared,@JsonKey(name: 'created_at') DateTime? createdAt, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$HealthReportModelCopyWithImpl<$Res>
    implements $HealthReportModelCopyWith<$Res> {
  _$HealthReportModelCopyWithImpl(this._self, this._then);

  final HealthReportModel _self;
  final $Res Function(HealthReportModel) _then;

/// Create a copy of HealthReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? title = null,Object? description = null,Object? type = null,Object? reportUrl = null,Object? status = null,Object? generatedAt = freezed,Object? periodStart = freezed,Object? periodEnd = freezed,Object? thumbnailUrl = freezed,Object? isRead = null,Object? isShared = null,Object? createdAt = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,reportUrl: null == reportUrl ? _self.reportUrl : reportUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,generatedAt: freezed == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,periodStart: freezed == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,periodEnd: freezed == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isShared: null == isShared ? _self.isShared : isShared // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthReportModel].
extension HealthReportModelPatterns on HealthReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthReportModel value)  $default,){
final _that = this;
switch (_that) {
case _HealthReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _HealthReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'patient_id')  String patientId,  String title,  String description,  int type, @JsonKey(name: 'report_url')  String reportUrl,  int status, @JsonKey(name: 'generated_at')  DateTime? generatedAt, @JsonKey(name: 'period_start')  DateTime? periodStart, @JsonKey(name: 'period_end')  DateTime? periodEnd, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'is_shared')  bool isShared, @JsonKey(name: 'created_at')  DateTime? createdAt,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthReportModel() when $default != null:
return $default(_that.id,_that.patientId,_that.title,_that.description,_that.type,_that.reportUrl,_that.status,_that.generatedAt,_that.periodStart,_that.periodEnd,_that.thumbnailUrl,_that.isRead,_that.isShared,_that.createdAt,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'patient_id')  String patientId,  String title,  String description,  int type, @JsonKey(name: 'report_url')  String reportUrl,  int status, @JsonKey(name: 'generated_at')  DateTime? generatedAt, @JsonKey(name: 'period_start')  DateTime? periodStart, @JsonKey(name: 'period_end')  DateTime? periodEnd, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'is_shared')  bool isShared, @JsonKey(name: 'created_at')  DateTime? createdAt,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _HealthReportModel():
return $default(_that.id,_that.patientId,_that.title,_that.description,_that.type,_that.reportUrl,_that.status,_that.generatedAt,_that.periodStart,_that.periodEnd,_that.thumbnailUrl,_that.isRead,_that.isShared,_that.createdAt,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'patient_id')  String patientId,  String title,  String description,  int type, @JsonKey(name: 'report_url')  String reportUrl,  int status, @JsonKey(name: 'generated_at')  DateTime? generatedAt, @JsonKey(name: 'period_start')  DateTime? periodStart, @JsonKey(name: 'period_end')  DateTime? periodEnd, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'is_shared')  bool isShared, @JsonKey(name: 'created_at')  DateTime? createdAt,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _HealthReportModel() when $default != null:
return $default(_that.id,_that.patientId,_that.title,_that.description,_that.type,_that.reportUrl,_that.status,_that.generatedAt,_that.periodStart,_that.periodEnd,_that.thumbnailUrl,_that.isRead,_that.isShared,_that.createdAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthReportModel implements HealthReportModel {
  const _HealthReportModel({required this.id, @JsonKey(name: 'patient_id') required this.patientId, required this.title, required this.description, required this.type, @JsonKey(name: 'report_url') required this.reportUrl, required this.status, @JsonKey(name: 'generated_at') this.generatedAt, @JsonKey(name: 'period_start') this.periodStart, @JsonKey(name: 'period_end') this.periodEnd, @JsonKey(name: 'thumbnail_url') this.thumbnailUrl, @JsonKey(name: 'is_read') this.isRead = false, @JsonKey(name: 'is_shared') this.isShared = false, @JsonKey(name: 'created_at') this.createdAt, final  Map<String, dynamic>? metadata}): _metadata = metadata;
  factory _HealthReportModel.fromJson(Map<String, dynamic> json) => _$HealthReportModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'patient_id') final  String patientId;
@override final  String title;
@override final  String description;
@override final  int type;
// 使用int表示ReportType的value
@override@JsonKey(name: 'report_url') final  String reportUrl;
@override final  int status;
// 使用int表示ReportStatus的value
@override@JsonKey(name: 'generated_at') final  DateTime? generatedAt;
@override@JsonKey(name: 'period_start') final  DateTime? periodStart;
@override@JsonKey(name: 'period_end') final  DateTime? periodEnd;
@override@JsonKey(name: 'thumbnail_url') final  String? thumbnailUrl;
@override@JsonKey(name: 'is_read') final  bool isRead;
@override@JsonKey(name: 'is_shared') final  bool isShared;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of HealthReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthReportModelCopyWith<_HealthReportModel> get copyWith => __$HealthReportModelCopyWithImpl<_HealthReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.reportUrl, reportUrl) || other.reportUrl == reportUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isShared, isShared) || other.isShared == isShared)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,title,description,type,reportUrl,status,generatedAt,periodStart,periodEnd,thumbnailUrl,isRead,isShared,createdAt,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'HealthReportModel(id: $id, patientId: $patientId, title: $title, description: $description, type: $type, reportUrl: $reportUrl, status: $status, generatedAt: $generatedAt, periodStart: $periodStart, periodEnd: $periodEnd, thumbnailUrl: $thumbnailUrl, isRead: $isRead, isShared: $isShared, createdAt: $createdAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$HealthReportModelCopyWith<$Res> implements $HealthReportModelCopyWith<$Res> {
  factory _$HealthReportModelCopyWith(_HealthReportModel value, $Res Function(_HealthReportModel) _then) = __$HealthReportModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'patient_id') String patientId, String title, String description, int type,@JsonKey(name: 'report_url') String reportUrl, int status,@JsonKey(name: 'generated_at') DateTime? generatedAt,@JsonKey(name: 'period_start') DateTime? periodStart,@JsonKey(name: 'period_end') DateTime? periodEnd,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'is_shared') bool isShared,@JsonKey(name: 'created_at') DateTime? createdAt, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$HealthReportModelCopyWithImpl<$Res>
    implements _$HealthReportModelCopyWith<$Res> {
  __$HealthReportModelCopyWithImpl(this._self, this._then);

  final _HealthReportModel _self;
  final $Res Function(_HealthReportModel) _then;

/// Create a copy of HealthReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? title = null,Object? description = null,Object? type = null,Object? reportUrl = null,Object? status = null,Object? generatedAt = freezed,Object? periodStart = freezed,Object? periodEnd = freezed,Object? thumbnailUrl = freezed,Object? isRead = null,Object? isShared = null,Object? createdAt = freezed,Object? metadata = freezed,}) {
  return _then(_HealthReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,reportUrl: null == reportUrl ? _self.reportUrl : reportUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,generatedAt: freezed == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,periodStart: freezed == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as DateTime?,periodEnd: freezed == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isShared: null == isShared ? _self.isShared : isShared // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$ReportShareRecordModel {

 String get id;@JsonKey(name: 'report_id') String get reportId; int get method;// 使用int表示ShareMethod的value
@JsonKey(name: 'recipient_info') String? get recipientInfo;@JsonKey(name: 'shared_at') DateTime get sharedAt; String? get message;
/// Create a copy of ReportShareRecordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportShareRecordModelCopyWith<ReportShareRecordModel> get copyWith => _$ReportShareRecordModelCopyWithImpl<ReportShareRecordModel>(this as ReportShareRecordModel, _$identity);

  /// Serializes this ReportShareRecordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportShareRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.method, method) || other.method == method)&&(identical(other.recipientInfo, recipientInfo) || other.recipientInfo == recipientInfo)&&(identical(other.sharedAt, sharedAt) || other.sharedAt == sharedAt)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportId,method,recipientInfo,sharedAt,message);

@override
String toString() {
  return 'ReportShareRecordModel(id: $id, reportId: $reportId, method: $method, recipientInfo: $recipientInfo, sharedAt: $sharedAt, message: $message)';
}


}

/// @nodoc
abstract mixin class $ReportShareRecordModelCopyWith<$Res>  {
  factory $ReportShareRecordModelCopyWith(ReportShareRecordModel value, $Res Function(ReportShareRecordModel) _then) = _$ReportShareRecordModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'report_id') String reportId, int method,@JsonKey(name: 'recipient_info') String? recipientInfo,@JsonKey(name: 'shared_at') DateTime sharedAt, String? message
});




}
/// @nodoc
class _$ReportShareRecordModelCopyWithImpl<$Res>
    implements $ReportShareRecordModelCopyWith<$Res> {
  _$ReportShareRecordModelCopyWithImpl(this._self, this._then);

  final ReportShareRecordModel _self;
  final $Res Function(ReportShareRecordModel) _then;

/// Create a copy of ReportShareRecordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reportId = null,Object? method = null,Object? recipientInfo = freezed,Object? sharedAt = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as int,recipientInfo: freezed == recipientInfo ? _self.recipientInfo : recipientInfo // ignore: cast_nullable_to_non_nullable
as String?,sharedAt: null == sharedAt ? _self.sharedAt : sharedAt // ignore: cast_nullable_to_non_nullable
as DateTime,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportShareRecordModel].
extension ReportShareRecordModelPatterns on ReportShareRecordModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportShareRecordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportShareRecordModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportShareRecordModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportShareRecordModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportShareRecordModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportShareRecordModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'report_id')  String reportId,  int method, @JsonKey(name: 'recipient_info')  String? recipientInfo, @JsonKey(name: 'shared_at')  DateTime sharedAt,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportShareRecordModel() when $default != null:
return $default(_that.id,_that.reportId,_that.method,_that.recipientInfo,_that.sharedAt,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'report_id')  String reportId,  int method, @JsonKey(name: 'recipient_info')  String? recipientInfo, @JsonKey(name: 'shared_at')  DateTime sharedAt,  String? message)  $default,) {final _that = this;
switch (_that) {
case _ReportShareRecordModel():
return $default(_that.id,_that.reportId,_that.method,_that.recipientInfo,_that.sharedAt,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'report_id')  String reportId,  int method, @JsonKey(name: 'recipient_info')  String? recipientInfo, @JsonKey(name: 'shared_at')  DateTime sharedAt,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _ReportShareRecordModel() when $default != null:
return $default(_that.id,_that.reportId,_that.method,_that.recipientInfo,_that.sharedAt,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportShareRecordModel implements ReportShareRecordModel {
  const _ReportShareRecordModel({required this.id, @JsonKey(name: 'report_id') required this.reportId, required this.method, @JsonKey(name: 'recipient_info') this.recipientInfo, @JsonKey(name: 'shared_at') required this.sharedAt, this.message});
  factory _ReportShareRecordModel.fromJson(Map<String, dynamic> json) => _$ReportShareRecordModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'report_id') final  String reportId;
@override final  int method;
// 使用int表示ShareMethod的value
@override@JsonKey(name: 'recipient_info') final  String? recipientInfo;
@override@JsonKey(name: 'shared_at') final  DateTime sharedAt;
@override final  String? message;

/// Create a copy of ReportShareRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportShareRecordModelCopyWith<_ReportShareRecordModel> get copyWith => __$ReportShareRecordModelCopyWithImpl<_ReportShareRecordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportShareRecordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportShareRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.method, method) || other.method == method)&&(identical(other.recipientInfo, recipientInfo) || other.recipientInfo == recipientInfo)&&(identical(other.sharedAt, sharedAt) || other.sharedAt == sharedAt)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportId,method,recipientInfo,sharedAt,message);

@override
String toString() {
  return 'ReportShareRecordModel(id: $id, reportId: $reportId, method: $method, recipientInfo: $recipientInfo, sharedAt: $sharedAt, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ReportShareRecordModelCopyWith<$Res> implements $ReportShareRecordModelCopyWith<$Res> {
  factory _$ReportShareRecordModelCopyWith(_ReportShareRecordModel value, $Res Function(_ReportShareRecordModel) _then) = __$ReportShareRecordModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'report_id') String reportId, int method,@JsonKey(name: 'recipient_info') String? recipientInfo,@JsonKey(name: 'shared_at') DateTime sharedAt, String? message
});




}
/// @nodoc
class __$ReportShareRecordModelCopyWithImpl<$Res>
    implements _$ReportShareRecordModelCopyWith<$Res> {
  __$ReportShareRecordModelCopyWithImpl(this._self, this._then);

  final _ReportShareRecordModel _self;
  final $Res Function(_ReportShareRecordModel) _then;

/// Create a copy of ReportShareRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reportId = null,Object? method = null,Object? recipientInfo = freezed,Object? sharedAt = null,Object? message = freezed,}) {
  return _then(_ReportShareRecordModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as int,recipientInfo: freezed == recipientInfo ? _self.recipientInfo : recipientInfo // ignore: cast_nullable_to_non_nullable
as String?,sharedAt: null == sharedAt ? _self.sharedAt : sharedAt // ignore: cast_nullable_to_non_nullable
as DateTime,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
