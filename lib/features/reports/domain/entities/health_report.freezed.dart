// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HealthReport {

 String get id; String get patientId; String get title; String get description; ReportType get type; String get reportUrl; ReportStatus get status;@JsonKey(name: 'generated_at') DateTime? get generatedAt;@JsonKey(name: 'period_start') DateTime? get periodStart;@JsonKey(name: 'period_end') DateTime? get periodEnd; String? get thumbnailUrl; bool get isRead; bool get isShared;@JsonKey(name: 'created_at') DateTime? get createdAt; Map<String, dynamic>? get metadata;
/// Create a copy of HealthReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthReportCopyWith<HealthReport> get copyWith => _$HealthReportCopyWithImpl<HealthReport>(this as HealthReport, _$identity);

  /// Serializes this HealthReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthReport&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.reportUrl, reportUrl) || other.reportUrl == reportUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isShared, isShared) || other.isShared == isShared)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,title,description,type,reportUrl,status,generatedAt,periodStart,periodEnd,thumbnailUrl,isRead,isShared,createdAt,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'HealthReport(id: $id, patientId: $patientId, title: $title, description: $description, type: $type, reportUrl: $reportUrl, status: $status, generatedAt: $generatedAt, periodStart: $periodStart, periodEnd: $periodEnd, thumbnailUrl: $thumbnailUrl, isRead: $isRead, isShared: $isShared, createdAt: $createdAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $HealthReportCopyWith<$Res>  {
  factory $HealthReportCopyWith(HealthReport value, $Res Function(HealthReport) _then) = _$HealthReportCopyWithImpl;
@useResult
$Res call({
 String id, String patientId, String title, String description, ReportType type, String reportUrl, ReportStatus status,@JsonKey(name: 'generated_at') DateTime? generatedAt,@JsonKey(name: 'period_start') DateTime? periodStart,@JsonKey(name: 'period_end') DateTime? periodEnd, String? thumbnailUrl, bool isRead, bool isShared,@JsonKey(name: 'created_at') DateTime? createdAt, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$HealthReportCopyWithImpl<$Res>
    implements $HealthReportCopyWith<$Res> {
  _$HealthReportCopyWithImpl(this._self, this._then);

  final HealthReport _self;
  final $Res Function(HealthReport) _then;

/// Create a copy of HealthReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? title = null,Object? description = null,Object? type = null,Object? reportUrl = null,Object? status = null,Object? generatedAt = freezed,Object? periodStart = freezed,Object? periodEnd = freezed,Object? thumbnailUrl = freezed,Object? isRead = null,Object? isShared = null,Object? createdAt = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReportType,reportUrl: null == reportUrl ? _self.reportUrl : reportUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,generatedAt: freezed == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [HealthReport].
extension HealthReportPatterns on HealthReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthReport value)  $default,){
final _that = this;
switch (_that) {
case _HealthReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthReport value)?  $default,){
final _that = this;
switch (_that) {
case _HealthReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String patientId,  String title,  String description,  ReportType type,  String reportUrl,  ReportStatus status, @JsonKey(name: 'generated_at')  DateTime? generatedAt, @JsonKey(name: 'period_start')  DateTime? periodStart, @JsonKey(name: 'period_end')  DateTime? periodEnd,  String? thumbnailUrl,  bool isRead,  bool isShared, @JsonKey(name: 'created_at')  DateTime? createdAt,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthReport() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String patientId,  String title,  String description,  ReportType type,  String reportUrl,  ReportStatus status, @JsonKey(name: 'generated_at')  DateTime? generatedAt, @JsonKey(name: 'period_start')  DateTime? periodStart, @JsonKey(name: 'period_end')  DateTime? periodEnd,  String? thumbnailUrl,  bool isRead,  bool isShared, @JsonKey(name: 'created_at')  DateTime? createdAt,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _HealthReport():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String patientId,  String title,  String description,  ReportType type,  String reportUrl,  ReportStatus status, @JsonKey(name: 'generated_at')  DateTime? generatedAt, @JsonKey(name: 'period_start')  DateTime? periodStart, @JsonKey(name: 'period_end')  DateTime? periodEnd,  String? thumbnailUrl,  bool isRead,  bool isShared, @JsonKey(name: 'created_at')  DateTime? createdAt,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _HealthReport() when $default != null:
return $default(_that.id,_that.patientId,_that.title,_that.description,_that.type,_that.reportUrl,_that.status,_that.generatedAt,_that.periodStart,_that.periodEnd,_that.thumbnailUrl,_that.isRead,_that.isShared,_that.createdAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthReport extends HealthReport {
  const _HealthReport({required this.id, required this.patientId, required this.title, required this.description, required this.type, required this.reportUrl, required this.status, @JsonKey(name: 'generated_at') this.generatedAt, @JsonKey(name: 'period_start') this.periodStart, @JsonKey(name: 'period_end') this.periodEnd, this.thumbnailUrl, this.isRead = false, this.isShared = false, @JsonKey(name: 'created_at') this.createdAt, final  Map<String, dynamic>? metadata}): _metadata = metadata,super._();
  factory _HealthReport.fromJson(Map<String, dynamic> json) => _$HealthReportFromJson(json);

@override final  String id;
@override final  String patientId;
@override final  String title;
@override final  String description;
@override final  ReportType type;
@override final  String reportUrl;
@override final  ReportStatus status;
@override@JsonKey(name: 'generated_at') final  DateTime? generatedAt;
@override@JsonKey(name: 'period_start') final  DateTime? periodStart;
@override@JsonKey(name: 'period_end') final  DateTime? periodEnd;
@override final  String? thumbnailUrl;
@override@JsonKey() final  bool isRead;
@override@JsonKey() final  bool isShared;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of HealthReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthReportCopyWith<_HealthReport> get copyWith => __$HealthReportCopyWithImpl<_HealthReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthReportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthReport&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.reportUrl, reportUrl) || other.reportUrl == reportUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isShared, isShared) || other.isShared == isShared)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,title,description,type,reportUrl,status,generatedAt,periodStart,periodEnd,thumbnailUrl,isRead,isShared,createdAt,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'HealthReport(id: $id, patientId: $patientId, title: $title, description: $description, type: $type, reportUrl: $reportUrl, status: $status, generatedAt: $generatedAt, periodStart: $periodStart, periodEnd: $periodEnd, thumbnailUrl: $thumbnailUrl, isRead: $isRead, isShared: $isShared, createdAt: $createdAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$HealthReportCopyWith<$Res> implements $HealthReportCopyWith<$Res> {
  factory _$HealthReportCopyWith(_HealthReport value, $Res Function(_HealthReport) _then) = __$HealthReportCopyWithImpl;
@override @useResult
$Res call({
 String id, String patientId, String title, String description, ReportType type, String reportUrl, ReportStatus status,@JsonKey(name: 'generated_at') DateTime? generatedAt,@JsonKey(name: 'period_start') DateTime? periodStart,@JsonKey(name: 'period_end') DateTime? periodEnd, String? thumbnailUrl, bool isRead, bool isShared,@JsonKey(name: 'created_at') DateTime? createdAt, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$HealthReportCopyWithImpl<$Res>
    implements _$HealthReportCopyWith<$Res> {
  __$HealthReportCopyWithImpl(this._self, this._then);

  final _HealthReport _self;
  final $Res Function(_HealthReport) _then;

/// Create a copy of HealthReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? title = null,Object? description = null,Object? type = null,Object? reportUrl = null,Object? status = null,Object? generatedAt = freezed,Object? periodStart = freezed,Object? periodEnd = freezed,Object? thumbnailUrl = freezed,Object? isRead = null,Object? isShared = null,Object? createdAt = freezed,Object? metadata = freezed,}) {
  return _then(_HealthReport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReportType,reportUrl: null == reportUrl ? _self.reportUrl : reportUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReportStatus,generatedAt: freezed == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
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
mixin _$ReportShareRecord {

 String get id; String get reportId; ShareMethod get method; String? get recipientInfo;@JsonKey(name: 'shared_at') DateTime get sharedAt; String? get message;
/// Create a copy of ReportShareRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportShareRecordCopyWith<ReportShareRecord> get copyWith => _$ReportShareRecordCopyWithImpl<ReportShareRecord>(this as ReportShareRecord, _$identity);

  /// Serializes this ReportShareRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportShareRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.method, method) || other.method == method)&&(identical(other.recipientInfo, recipientInfo) || other.recipientInfo == recipientInfo)&&(identical(other.sharedAt, sharedAt) || other.sharedAt == sharedAt)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportId,method,recipientInfo,sharedAt,message);

@override
String toString() {
  return 'ReportShareRecord(id: $id, reportId: $reportId, method: $method, recipientInfo: $recipientInfo, sharedAt: $sharedAt, message: $message)';
}


}

/// @nodoc
abstract mixin class $ReportShareRecordCopyWith<$Res>  {
  factory $ReportShareRecordCopyWith(ReportShareRecord value, $Res Function(ReportShareRecord) _then) = _$ReportShareRecordCopyWithImpl;
@useResult
$Res call({
 String id, String reportId, ShareMethod method, String? recipientInfo,@JsonKey(name: 'shared_at') DateTime sharedAt, String? message
});




}
/// @nodoc
class _$ReportShareRecordCopyWithImpl<$Res>
    implements $ReportShareRecordCopyWith<$Res> {
  _$ReportShareRecordCopyWithImpl(this._self, this._then);

  final ReportShareRecord _self;
  final $Res Function(ReportShareRecord) _then;

/// Create a copy of ReportShareRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reportId = null,Object? method = null,Object? recipientInfo = freezed,Object? sharedAt = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as ShareMethod,recipientInfo: freezed == recipientInfo ? _self.recipientInfo : recipientInfo // ignore: cast_nullable_to_non_nullable
as String?,sharedAt: null == sharedAt ? _self.sharedAt : sharedAt // ignore: cast_nullable_to_non_nullable
as DateTime,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportShareRecord].
extension ReportShareRecordPatterns on ReportShareRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportShareRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportShareRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportShareRecord value)  $default,){
final _that = this;
switch (_that) {
case _ReportShareRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportShareRecord value)?  $default,){
final _that = this;
switch (_that) {
case _ReportShareRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reportId,  ShareMethod method,  String? recipientInfo, @JsonKey(name: 'shared_at')  DateTime sharedAt,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportShareRecord() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reportId,  ShareMethod method,  String? recipientInfo, @JsonKey(name: 'shared_at')  DateTime sharedAt,  String? message)  $default,) {final _that = this;
switch (_that) {
case _ReportShareRecord():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reportId,  ShareMethod method,  String? recipientInfo, @JsonKey(name: 'shared_at')  DateTime sharedAt,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _ReportShareRecord() when $default != null:
return $default(_that.id,_that.reportId,_that.method,_that.recipientInfo,_that.sharedAt,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportShareRecord implements ReportShareRecord {
  const _ReportShareRecord({required this.id, required this.reportId, required this.method, this.recipientInfo, @JsonKey(name: 'shared_at') required this.sharedAt, this.message});
  factory _ReportShareRecord.fromJson(Map<String, dynamic> json) => _$ReportShareRecordFromJson(json);

@override final  String id;
@override final  String reportId;
@override final  ShareMethod method;
@override final  String? recipientInfo;
@override@JsonKey(name: 'shared_at') final  DateTime sharedAt;
@override final  String? message;

/// Create a copy of ReportShareRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportShareRecordCopyWith<_ReportShareRecord> get copyWith => __$ReportShareRecordCopyWithImpl<_ReportShareRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportShareRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportShareRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.method, method) || other.method == method)&&(identical(other.recipientInfo, recipientInfo) || other.recipientInfo == recipientInfo)&&(identical(other.sharedAt, sharedAt) || other.sharedAt == sharedAt)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reportId,method,recipientInfo,sharedAt,message);

@override
String toString() {
  return 'ReportShareRecord(id: $id, reportId: $reportId, method: $method, recipientInfo: $recipientInfo, sharedAt: $sharedAt, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ReportShareRecordCopyWith<$Res> implements $ReportShareRecordCopyWith<$Res> {
  factory _$ReportShareRecordCopyWith(_ReportShareRecord value, $Res Function(_ReportShareRecord) _then) = __$ReportShareRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, String reportId, ShareMethod method, String? recipientInfo,@JsonKey(name: 'shared_at') DateTime sharedAt, String? message
});




}
/// @nodoc
class __$ReportShareRecordCopyWithImpl<$Res>
    implements _$ReportShareRecordCopyWith<$Res> {
  __$ReportShareRecordCopyWithImpl(this._self, this._then);

  final _ReportShareRecord _self;
  final $Res Function(_ReportShareRecord) _then;

/// Create a copy of ReportShareRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reportId = null,Object? method = null,Object? recipientInfo = freezed,Object? sharedAt = null,Object? message = freezed,}) {
  return _then(_ReportShareRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as ShareMethod,recipientInfo: freezed == recipientInfo ? _self.recipientInfo : recipientInfo // ignore: cast_nullable_to_non_nullable
as String?,sharedAt: null == sharedAt ? _self.sharedAt : sharedAt // ignore: cast_nullable_to_non_nullable
as DateTime,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$WebViewState {

 bool get isLoading; bool get hasError; String? get errorMessage; int get loadProgress; String? get currentUrl; bool get canGoBack; bool get canGoForward;
/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebViewStateCopyWith<WebViewState> get copyWith => _$WebViewStateCopyWithImpl<WebViewState>(this as WebViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebViewState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loadProgress, loadProgress) || other.loadProgress == loadProgress)&&(identical(other.currentUrl, currentUrl) || other.currentUrl == currentUrl)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasError,errorMessage,loadProgress,currentUrl,canGoBack,canGoForward);

@override
String toString() {
  return 'WebViewState(isLoading: $isLoading, hasError: $hasError, errorMessage: $errorMessage, loadProgress: $loadProgress, currentUrl: $currentUrl, canGoBack: $canGoBack, canGoForward: $canGoForward)';
}


}

/// @nodoc
abstract mixin class $WebViewStateCopyWith<$Res>  {
  factory $WebViewStateCopyWith(WebViewState value, $Res Function(WebViewState) _then) = _$WebViewStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool hasError, String? errorMessage, int loadProgress, String? currentUrl, bool canGoBack, bool canGoForward
});




}
/// @nodoc
class _$WebViewStateCopyWithImpl<$Res>
    implements $WebViewStateCopyWith<$Res> {
  _$WebViewStateCopyWithImpl(this._self, this._then);

  final WebViewState _self;
  final $Res Function(WebViewState) _then;

/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? hasError = null,Object? errorMessage = freezed,Object? loadProgress = null,Object? currentUrl = freezed,Object? canGoBack = null,Object? canGoForward = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,loadProgress: null == loadProgress ? _self.loadProgress : loadProgress // ignore: cast_nullable_to_non_nullable
as int,currentUrl: freezed == currentUrl ? _self.currentUrl : currentUrl // ignore: cast_nullable_to_non_nullable
as String?,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WebViewState].
extension WebViewStatePatterns on WebViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WebViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WebViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WebViewState value)  $default,){
final _that = this;
switch (_that) {
case _WebViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WebViewState value)?  $default,){
final _that = this;
switch (_that) {
case _WebViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool hasError,  String? errorMessage,  int loadProgress,  String? currentUrl,  bool canGoBack,  bool canGoForward)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WebViewState() when $default != null:
return $default(_that.isLoading,_that.hasError,_that.errorMessage,_that.loadProgress,_that.currentUrl,_that.canGoBack,_that.canGoForward);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool hasError,  String? errorMessage,  int loadProgress,  String? currentUrl,  bool canGoBack,  bool canGoForward)  $default,) {final _that = this;
switch (_that) {
case _WebViewState():
return $default(_that.isLoading,_that.hasError,_that.errorMessage,_that.loadProgress,_that.currentUrl,_that.canGoBack,_that.canGoForward);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool hasError,  String? errorMessage,  int loadProgress,  String? currentUrl,  bool canGoBack,  bool canGoForward)?  $default,) {final _that = this;
switch (_that) {
case _WebViewState() when $default != null:
return $default(_that.isLoading,_that.hasError,_that.errorMessage,_that.loadProgress,_that.currentUrl,_that.canGoBack,_that.canGoForward);case _:
  return null;

}
}

}

/// @nodoc


class _WebViewState implements WebViewState {
  const _WebViewState({this.isLoading = false, this.hasError = false, this.errorMessage, this.loadProgress = 0, this.currentUrl, this.canGoBack = false, this.canGoForward = false});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasError;
@override final  String? errorMessage;
@override@JsonKey() final  int loadProgress;
@override final  String? currentUrl;
@override@JsonKey() final  bool canGoBack;
@override@JsonKey() final  bool canGoForward;

/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebViewStateCopyWith<_WebViewState> get copyWith => __$WebViewStateCopyWithImpl<_WebViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebViewState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.loadProgress, loadProgress) || other.loadProgress == loadProgress)&&(identical(other.currentUrl, currentUrl) || other.currentUrl == currentUrl)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,hasError,errorMessage,loadProgress,currentUrl,canGoBack,canGoForward);

@override
String toString() {
  return 'WebViewState(isLoading: $isLoading, hasError: $hasError, errorMessage: $errorMessage, loadProgress: $loadProgress, currentUrl: $currentUrl, canGoBack: $canGoBack, canGoForward: $canGoForward)';
}


}

/// @nodoc
abstract mixin class _$WebViewStateCopyWith<$Res> implements $WebViewStateCopyWith<$Res> {
  factory _$WebViewStateCopyWith(_WebViewState value, $Res Function(_WebViewState) _then) = __$WebViewStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool hasError, String? errorMessage, int loadProgress, String? currentUrl, bool canGoBack, bool canGoForward
});




}
/// @nodoc
class __$WebViewStateCopyWithImpl<$Res>
    implements _$WebViewStateCopyWith<$Res> {
  __$WebViewStateCopyWithImpl(this._self, this._then);

  final _WebViewState _self;
  final $Res Function(_WebViewState) _then;

/// Create a copy of WebViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? hasError = null,Object? errorMessage = freezed,Object? loadProgress = null,Object? currentUrl = freezed,Object? canGoBack = null,Object? canGoForward = null,}) {
  return _then(_WebViewState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,loadProgress: null == loadProgress ? _self.loadProgress : loadProgress // ignore: cast_nullable_to_non_nullable
as int,currentUrl: freezed == currentUrl ? _self.currentUrl : currentUrl // ignore: cast_nullable_to_non_nullable
as String?,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
