// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cursor_paginated_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CursorPaginatedResponse<T> {

 String get status;@JsonKey(name: 'next_cursor') String? get nextCursor;@JsonKey(name: 'previous_cursor') String? get previousCursor; List<T> get results;@JsonKey(name: 'page_size') int get pageSize;
/// Create a copy of CursorPaginatedResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursorPaginatedResponseCopyWith<T, CursorPaginatedResponse<T>> get copyWith => _$CursorPaginatedResponseCopyWithImpl<T, CursorPaginatedResponse<T>>(this as CursorPaginatedResponse<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CursorPaginatedResponse<T>&&(identical(other.status, status) || other.status == status)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.previousCursor, previousCursor) || other.previousCursor == previousCursor)&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}


@override
int get hashCode => Object.hash(runtimeType,status,nextCursor,previousCursor,const DeepCollectionEquality().hash(results),pageSize);

@override
String toString() {
  return 'CursorPaginatedResponse<$T>(status: $status, nextCursor: $nextCursor, previousCursor: $previousCursor, results: $results, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $CursorPaginatedResponseCopyWith<T,$Res>  {
  factory $CursorPaginatedResponseCopyWith(CursorPaginatedResponse<T> value, $Res Function(CursorPaginatedResponse<T>) _then) = _$CursorPaginatedResponseCopyWithImpl;
@useResult
$Res call({
 String status,@JsonKey(name: 'next_cursor') String? nextCursor,@JsonKey(name: 'previous_cursor') String? previousCursor, List<T> results,@JsonKey(name: 'page_size') int pageSize
});




}
/// @nodoc
class _$CursorPaginatedResponseCopyWithImpl<T,$Res>
    implements $CursorPaginatedResponseCopyWith<T, $Res> {
  _$CursorPaginatedResponseCopyWithImpl(this._self, this._then);

  final CursorPaginatedResponse<T> _self;
  final $Res Function(CursorPaginatedResponse<T>) _then;

/// Create a copy of CursorPaginatedResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? nextCursor = freezed,Object? previousCursor = freezed,Object? results = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,previousCursor: freezed == previousCursor ? _self.previousCursor : previousCursor // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<T>,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CursorPaginatedResponse].
extension CursorPaginatedResponsePatterns<T> on CursorPaginatedResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CursorPaginatedResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CursorPaginatedResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CursorPaginatedResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _CursorPaginatedResponse():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CursorPaginatedResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _CursorPaginatedResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'previous_cursor')  String? previousCursor,  List<T> results, @JsonKey(name: 'page_size')  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CursorPaginatedResponse() when $default != null:
return $default(_that.status,_that.nextCursor,_that.previousCursor,_that.results,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'previous_cursor')  String? previousCursor,  List<T> results, @JsonKey(name: 'page_size')  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _CursorPaginatedResponse():
return $default(_that.status,_that.nextCursor,_that.previousCursor,_that.results,_that.pageSize);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'previous_cursor')  String? previousCursor,  List<T> results, @JsonKey(name: 'page_size')  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _CursorPaginatedResponse() when $default != null:
return $default(_that.status,_that.nextCursor,_that.previousCursor,_that.results,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc


class _CursorPaginatedResponse<T> implements CursorPaginatedResponse<T> {
  const _CursorPaginatedResponse({required this.status, @JsonKey(name: 'next_cursor') this.nextCursor, @JsonKey(name: 'previous_cursor') this.previousCursor, required final  List<T> results, @JsonKey(name: 'page_size') required this.pageSize}): _results = results;
  

@override final  String status;
@override@JsonKey(name: 'next_cursor') final  String? nextCursor;
@override@JsonKey(name: 'previous_cursor') final  String? previousCursor;
 final  List<T> _results;
@override List<T> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override@JsonKey(name: 'page_size') final  int pageSize;

/// Create a copy of CursorPaginatedResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CursorPaginatedResponseCopyWith<T, _CursorPaginatedResponse<T>> get copyWith => __$CursorPaginatedResponseCopyWithImpl<T, _CursorPaginatedResponse<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CursorPaginatedResponse<T>&&(identical(other.status, status) || other.status == status)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.previousCursor, previousCursor) || other.previousCursor == previousCursor)&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}


@override
int get hashCode => Object.hash(runtimeType,status,nextCursor,previousCursor,const DeepCollectionEquality().hash(_results),pageSize);

@override
String toString() {
  return 'CursorPaginatedResponse<$T>(status: $status, nextCursor: $nextCursor, previousCursor: $previousCursor, results: $results, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$CursorPaginatedResponseCopyWith<T,$Res> implements $CursorPaginatedResponseCopyWith<T, $Res> {
  factory _$CursorPaginatedResponseCopyWith(_CursorPaginatedResponse<T> value, $Res Function(_CursorPaginatedResponse<T>) _then) = __$CursorPaginatedResponseCopyWithImpl;
@override @useResult
$Res call({
 String status,@JsonKey(name: 'next_cursor') String? nextCursor,@JsonKey(name: 'previous_cursor') String? previousCursor, List<T> results,@JsonKey(name: 'page_size') int pageSize
});




}
/// @nodoc
class __$CursorPaginatedResponseCopyWithImpl<T,$Res>
    implements _$CursorPaginatedResponseCopyWith<T, $Res> {
  __$CursorPaginatedResponseCopyWithImpl(this._self, this._then);

  final _CursorPaginatedResponse<T> _self;
  final $Res Function(_CursorPaginatedResponse<T>) _then;

/// Create a copy of CursorPaginatedResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? nextCursor = freezed,Object? previousCursor = freezed,Object? results = null,Object? pageSize = null,}) {
  return _then(_CursorPaginatedResponse<T>(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,previousCursor: freezed == previousCursor ? _self.previousCursor : previousCursor // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<T>,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
