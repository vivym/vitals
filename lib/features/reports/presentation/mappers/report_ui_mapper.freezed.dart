// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_ui_mapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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
