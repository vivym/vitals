// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportsState {

 List<HealthReport> get reports; ReportType? get selectedType; bool get isLoading; bool get isRefreshing; String? get error;@JsonKey(name: 'last_updated') DateTime? get lastUpdated;
/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportsStateCopyWith<ReportsState> get copyWith => _$ReportsStateCopyWithImpl<ReportsState>(this as ReportsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportsState&&const DeepCollectionEquality().equals(other.reports, reports)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.error, error) || other.error == error)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reports),selectedType,isLoading,isRefreshing,error,lastUpdated);

@override
String toString() {
  return 'ReportsState(reports: $reports, selectedType: $selectedType, isLoading: $isLoading, isRefreshing: $isRefreshing, error: $error, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $ReportsStateCopyWith<$Res>  {
  factory $ReportsStateCopyWith(ReportsState value, $Res Function(ReportsState) _then) = _$ReportsStateCopyWithImpl;
@useResult
$Res call({
 List<HealthReport> reports, ReportType? selectedType, bool isLoading, bool isRefreshing, String? error,@JsonKey(name: 'last_updated') DateTime? lastUpdated
});




}
/// @nodoc
class _$ReportsStateCopyWithImpl<$Res>
    implements $ReportsStateCopyWith<$Res> {
  _$ReportsStateCopyWithImpl(this._self, this._then);

  final ReportsState _self;
  final $Res Function(ReportsState) _then;

/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reports = null,Object? selectedType = freezed,Object? isLoading = null,Object? isRefreshing = null,Object? error = freezed,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
reports: null == reports ? _self.reports : reports // ignore: cast_nullable_to_non_nullable
as List<HealthReport>,selectedType: freezed == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as ReportType?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportsState].
extension ReportsStatePatterns on ReportsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportsState value)  $default,){
final _that = this;
switch (_that) {
case _ReportsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportsState value)?  $default,){
final _that = this;
switch (_that) {
case _ReportsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HealthReport> reports,  ReportType? selectedType,  bool isLoading,  bool isRefreshing,  String? error, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportsState() when $default != null:
return $default(_that.reports,_that.selectedType,_that.isLoading,_that.isRefreshing,_that.error,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HealthReport> reports,  ReportType? selectedType,  bool isLoading,  bool isRefreshing,  String? error, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _ReportsState():
return $default(_that.reports,_that.selectedType,_that.isLoading,_that.isRefreshing,_that.error,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HealthReport> reports,  ReportType? selectedType,  bool isLoading,  bool isRefreshing,  String? error, @JsonKey(name: 'last_updated')  DateTime? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _ReportsState() when $default != null:
return $default(_that.reports,_that.selectedType,_that.isLoading,_that.isRefreshing,_that.error,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc


class _ReportsState extends ReportsState {
  const _ReportsState({final  List<HealthReport> reports = const [], this.selectedType, this.isLoading = false, this.isRefreshing = false, this.error, @JsonKey(name: 'last_updated') this.lastUpdated}): _reports = reports,super._();
  

 final  List<HealthReport> _reports;
@override@JsonKey() List<HealthReport> get reports {
  if (_reports is EqualUnmodifiableListView) return _reports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reports);
}

@override final  ReportType? selectedType;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isRefreshing;
@override final  String? error;
@override@JsonKey(name: 'last_updated') final  DateTime? lastUpdated;

/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportsStateCopyWith<_ReportsState> get copyWith => __$ReportsStateCopyWithImpl<_ReportsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportsState&&const DeepCollectionEquality().equals(other._reports, _reports)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.error, error) || other.error == error)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reports),selectedType,isLoading,isRefreshing,error,lastUpdated);

@override
String toString() {
  return 'ReportsState(reports: $reports, selectedType: $selectedType, isLoading: $isLoading, isRefreshing: $isRefreshing, error: $error, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$ReportsStateCopyWith<$Res> implements $ReportsStateCopyWith<$Res> {
  factory _$ReportsStateCopyWith(_ReportsState value, $Res Function(_ReportsState) _then) = __$ReportsStateCopyWithImpl;
@override @useResult
$Res call({
 List<HealthReport> reports, ReportType? selectedType, bool isLoading, bool isRefreshing, String? error,@JsonKey(name: 'last_updated') DateTime? lastUpdated
});




}
/// @nodoc
class __$ReportsStateCopyWithImpl<$Res>
    implements _$ReportsStateCopyWith<$Res> {
  __$ReportsStateCopyWithImpl(this._self, this._then);

  final _ReportsState _self;
  final $Res Function(_ReportsState) _then;

/// Create a copy of ReportsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reports = null,Object? selectedType = freezed,Object? isLoading = null,Object? isRefreshing = null,Object? error = freezed,Object? lastUpdated = freezed,}) {
  return _then(_ReportsState(
reports: null == reports ? _self._reports : reports // ignore: cast_nullable_to_non_nullable
as List<HealthReport>,selectedType: freezed == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as ReportType?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$ReportDetailState {

 HealthReport? get report; bool get isSharing; String? get shareError; List<ReportShareRecord> get shareHistory;
/// Create a copy of ReportDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportDetailStateCopyWith<ReportDetailState> get copyWith => _$ReportDetailStateCopyWithImpl<ReportDetailState>(this as ReportDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportDetailState&&(identical(other.report, report) || other.report == report)&&(identical(other.isSharing, isSharing) || other.isSharing == isSharing)&&(identical(other.shareError, shareError) || other.shareError == shareError)&&const DeepCollectionEquality().equals(other.shareHistory, shareHistory));
}


@override
int get hashCode => Object.hash(runtimeType,report,isSharing,shareError,const DeepCollectionEquality().hash(shareHistory));

@override
String toString() {
  return 'ReportDetailState(report: $report, isSharing: $isSharing, shareError: $shareError, shareHistory: $shareHistory)';
}


}

/// @nodoc
abstract mixin class $ReportDetailStateCopyWith<$Res>  {
  factory $ReportDetailStateCopyWith(ReportDetailState value, $Res Function(ReportDetailState) _then) = _$ReportDetailStateCopyWithImpl;
@useResult
$Res call({
 HealthReport? report, bool isSharing, String? shareError, List<ReportShareRecord> shareHistory
});


$HealthReportCopyWith<$Res>? get report;

}
/// @nodoc
class _$ReportDetailStateCopyWithImpl<$Res>
    implements $ReportDetailStateCopyWith<$Res> {
  _$ReportDetailStateCopyWithImpl(this._self, this._then);

  final ReportDetailState _self;
  final $Res Function(ReportDetailState) _then;

/// Create a copy of ReportDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? report = freezed,Object? isSharing = null,Object? shareError = freezed,Object? shareHistory = null,}) {
  return _then(_self.copyWith(
report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as HealthReport?,isSharing: null == isSharing ? _self.isSharing : isSharing // ignore: cast_nullable_to_non_nullable
as bool,shareError: freezed == shareError ? _self.shareError : shareError // ignore: cast_nullable_to_non_nullable
as String?,shareHistory: null == shareHistory ? _self.shareHistory : shareHistory // ignore: cast_nullable_to_non_nullable
as List<ReportShareRecord>,
  ));
}
/// Create a copy of ReportDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthReportCopyWith<$Res>? get report {
    if (_self.report == null) {
    return null;
  }

  return $HealthReportCopyWith<$Res>(_self.report!, (value) {
    return _then(_self.copyWith(report: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportDetailState].
extension ReportDetailStatePatterns on ReportDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ReportDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ReportDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HealthReport? report,  bool isSharing,  String? shareError,  List<ReportShareRecord> shareHistory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportDetailState() when $default != null:
return $default(_that.report,_that.isSharing,_that.shareError,_that.shareHistory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HealthReport? report,  bool isSharing,  String? shareError,  List<ReportShareRecord> shareHistory)  $default,) {final _that = this;
switch (_that) {
case _ReportDetailState():
return $default(_that.report,_that.isSharing,_that.shareError,_that.shareHistory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HealthReport? report,  bool isSharing,  String? shareError,  List<ReportShareRecord> shareHistory)?  $default,) {final _that = this;
switch (_that) {
case _ReportDetailState() when $default != null:
return $default(_that.report,_that.isSharing,_that.shareError,_that.shareHistory);case _:
  return null;

}
}

}

/// @nodoc


class _ReportDetailState implements ReportDetailState {
  const _ReportDetailState({this.report, this.isSharing = false, this.shareError, final  List<ReportShareRecord> shareHistory = const []}): _shareHistory = shareHistory;
  

@override final  HealthReport? report;
@override@JsonKey() final  bool isSharing;
@override final  String? shareError;
 final  List<ReportShareRecord> _shareHistory;
@override@JsonKey() List<ReportShareRecord> get shareHistory {
  if (_shareHistory is EqualUnmodifiableListView) return _shareHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shareHistory);
}


/// Create a copy of ReportDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportDetailStateCopyWith<_ReportDetailState> get copyWith => __$ReportDetailStateCopyWithImpl<_ReportDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportDetailState&&(identical(other.report, report) || other.report == report)&&(identical(other.isSharing, isSharing) || other.isSharing == isSharing)&&(identical(other.shareError, shareError) || other.shareError == shareError)&&const DeepCollectionEquality().equals(other._shareHistory, _shareHistory));
}


@override
int get hashCode => Object.hash(runtimeType,report,isSharing,shareError,const DeepCollectionEquality().hash(_shareHistory));

@override
String toString() {
  return 'ReportDetailState(report: $report, isSharing: $isSharing, shareError: $shareError, shareHistory: $shareHistory)';
}


}

/// @nodoc
abstract mixin class _$ReportDetailStateCopyWith<$Res> implements $ReportDetailStateCopyWith<$Res> {
  factory _$ReportDetailStateCopyWith(_ReportDetailState value, $Res Function(_ReportDetailState) _then) = __$ReportDetailStateCopyWithImpl;
@override @useResult
$Res call({
 HealthReport? report, bool isSharing, String? shareError, List<ReportShareRecord> shareHistory
});


@override $HealthReportCopyWith<$Res>? get report;

}
/// @nodoc
class __$ReportDetailStateCopyWithImpl<$Res>
    implements _$ReportDetailStateCopyWith<$Res> {
  __$ReportDetailStateCopyWithImpl(this._self, this._then);

  final _ReportDetailState _self;
  final $Res Function(_ReportDetailState) _then;

/// Create a copy of ReportDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? report = freezed,Object? isSharing = null,Object? shareError = freezed,Object? shareHistory = null,}) {
  return _then(_ReportDetailState(
report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as HealthReport?,isSharing: null == isSharing ? _self.isSharing : isSharing // ignore: cast_nullable_to_non_nullable
as bool,shareError: freezed == shareError ? _self.shareError : shareError // ignore: cast_nullable_to_non_nullable
as String?,shareHistory: null == shareHistory ? _self._shareHistory : shareHistory // ignore: cast_nullable_to_non_nullable
as List<ReportShareRecord>,
  ));
}

/// Create a copy of ReportDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthReportCopyWith<$Res>? get report {
    if (_self.report == null) {
    return null;
  }

  return $HealthReportCopyWith<$Res>(_self.report!, (value) {
    return _then(_self.copyWith(report: value));
  });
}
}

// dart format on
