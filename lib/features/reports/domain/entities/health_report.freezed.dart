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

 String get id; String get patientId; String get title; String get description; ReportType get type; String get reportUrl; ReportStatus get status; DateTime? get generatedAt; DateTime? get periodStart; DateTime? get periodEnd; String? get thumbnailUrl; bool get isRead; bool get isShared; DateTime? get createdAt; Map<String, dynamic>? get metadata;
/// Create a copy of HealthReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthReportCopyWith<HealthReport> get copyWith => _$HealthReportCopyWithImpl<HealthReport>(this as HealthReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthReport&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.reportUrl, reportUrl) || other.reportUrl == reportUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isShared, isShared) || other.isShared == isShared)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}


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
 String id, String patientId, String title, String description, ReportType type, String reportUrl, ReportStatus status, DateTime? generatedAt, DateTime? periodStart, DateTime? periodEnd, String? thumbnailUrl, bool isRead, bool isShared, DateTime? createdAt, Map<String, dynamic>? metadata
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String patientId,  String title,  String description,  ReportType type,  String reportUrl,  ReportStatus status,  DateTime? generatedAt,  DateTime? periodStart,  DateTime? periodEnd,  String? thumbnailUrl,  bool isRead,  bool isShared,  DateTime? createdAt,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String patientId,  String title,  String description,  ReportType type,  String reportUrl,  ReportStatus status,  DateTime? generatedAt,  DateTime? periodStart,  DateTime? periodEnd,  String? thumbnailUrl,  bool isRead,  bool isShared,  DateTime? createdAt,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String patientId,  String title,  String description,  ReportType type,  String reportUrl,  ReportStatus status,  DateTime? generatedAt,  DateTime? periodStart,  DateTime? periodEnd,  String? thumbnailUrl,  bool isRead,  bool isShared,  DateTime? createdAt,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _HealthReport() when $default != null:
return $default(_that.id,_that.patientId,_that.title,_that.description,_that.type,_that.reportUrl,_that.status,_that.generatedAt,_that.periodStart,_that.periodEnd,_that.thumbnailUrl,_that.isRead,_that.isShared,_that.createdAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc


class _HealthReport extends HealthReport {
  const _HealthReport({required this.id, required this.patientId, required this.title, required this.description, required this.type, required this.reportUrl, required this.status, this.generatedAt, this.periodStart, this.periodEnd, this.thumbnailUrl, this.isRead = false, this.isShared = false, this.createdAt, final  Map<String, dynamic>? metadata}): _metadata = metadata,super._();
  

@override final  String id;
@override final  String patientId;
@override final  String title;
@override final  String description;
@override final  ReportType type;
@override final  String reportUrl;
@override final  ReportStatus status;
@override final  DateTime? generatedAt;
@override final  DateTime? periodStart;
@override final  DateTime? periodEnd;
@override final  String? thumbnailUrl;
@override@JsonKey() final  bool isRead;
@override@JsonKey() final  bool isShared;
@override final  DateTime? createdAt;
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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthReport&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.reportUrl, reportUrl) || other.reportUrl == reportUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isShared, isShared) || other.isShared == isShared)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}


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
 String id, String patientId, String title, String description, ReportType type, String reportUrl, ReportStatus status, DateTime? generatedAt, DateTime? periodStart, DateTime? periodEnd, String? thumbnailUrl, bool isRead, bool isShared, DateTime? createdAt, Map<String, dynamic>? metadata
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

 String get id; String get reportId; ShareMethod get method; String? get recipientInfo; DateTime get sharedAt; String? get message;
/// Create a copy of ReportShareRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportShareRecordCopyWith<ReportShareRecord> get copyWith => _$ReportShareRecordCopyWithImpl<ReportShareRecord>(this as ReportShareRecord, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportShareRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.method, method) || other.method == method)&&(identical(other.recipientInfo, recipientInfo) || other.recipientInfo == recipientInfo)&&(identical(other.sharedAt, sharedAt) || other.sharedAt == sharedAt)&&(identical(other.message, message) || other.message == message));
}


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
 String id, String reportId, ShareMethod method, String? recipientInfo, DateTime sharedAt, String? message
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String reportId,  ShareMethod method,  String? recipientInfo,  DateTime sharedAt,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String reportId,  ShareMethod method,  String? recipientInfo,  DateTime sharedAt,  String? message)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String reportId,  ShareMethod method,  String? recipientInfo,  DateTime sharedAt,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _ReportShareRecord() when $default != null:
return $default(_that.id,_that.reportId,_that.method,_that.recipientInfo,_that.sharedAt,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ReportShareRecord implements ReportShareRecord {
  const _ReportShareRecord({required this.id, required this.reportId, required this.method, this.recipientInfo, required this.sharedAt, this.message});
  

@override final  String id;
@override final  String reportId;
@override final  ShareMethod method;
@override final  String? recipientInfo;
@override final  DateTime sharedAt;
@override final  String? message;

/// Create a copy of ReportShareRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportShareRecordCopyWith<_ReportShareRecord> get copyWith => __$ReportShareRecordCopyWithImpl<_ReportShareRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportShareRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.method, method) || other.method == method)&&(identical(other.recipientInfo, recipientInfo) || other.recipientInfo == recipientInfo)&&(identical(other.sharedAt, sharedAt) || other.sharedAt == sharedAt)&&(identical(other.message, message) || other.message == message));
}


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
 String id, String reportId, ShareMethod method, String? recipientInfo, DateTime sharedAt, String? message
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

// dart format on
