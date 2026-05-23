// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KYCState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KYCState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KYCState()';
}


}

/// @nodoc
class $KYCStateCopyWith<$Res>  {
$KYCStateCopyWith(KYCState _, $Res Function(KYCState) __);
}


/// Adds pattern-matching-related methods to [KYCState].
extension KYCStatePatterns on KYCState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Submitting value)?  submitting,TResult Function( _Submitted value)?  submitted,TResult Function( _Error value)?  error,TResult Function( _DraftSaved value)?  draftSaved,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Submitted() when submitted != null:
return submitted(_that);case _Error() when error != null:
return error(_that);case _DraftSaved() when draftSaved != null:
return draftSaved(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Submitting value)  submitting,required TResult Function( _Submitted value)  submitted,required TResult Function( _Error value)  error,required TResult Function( _DraftSaved value)  draftSaved,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Submitting():
return submitting(_that);case _Submitted():
return submitted(_that);case _Error():
return error(_that);case _DraftSaved():
return draftSaved(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Submitting value)?  submitting,TResult? Function( _Submitted value)?  submitted,TResult? Function( _Error value)?  error,TResult? Function( _DraftSaved value)?  draftSaved,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Submitting() when submitting != null:
return submitting(_that);case _Submitted() when submitted != null:
return submitted(_that);case _Error() when error != null:
return error(_that);case _DraftSaved() when draftSaved != null:
return draftSaved(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( KYCProfile? profile,  KYCDraft? draft,  KYCStatus? status)?  loaded,TResult Function()?  submitting,TResult Function( KYCProfile profile)?  submitted,TResult Function( String message)?  error,TResult Function()?  draftSaved,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.profile,_that.draft,_that.status);case _Submitting() when submitting != null:
return submitting();case _Submitted() when submitted != null:
return submitted(_that.profile);case _Error() when error != null:
return error(_that.message);case _DraftSaved() when draftSaved != null:
return draftSaved();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( KYCProfile? profile,  KYCDraft? draft,  KYCStatus? status)  loaded,required TResult Function()  submitting,required TResult Function( KYCProfile profile)  submitted,required TResult Function( String message)  error,required TResult Function()  draftSaved,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.profile,_that.draft,_that.status);case _Submitting():
return submitting();case _Submitted():
return submitted(_that.profile);case _Error():
return error(_that.message);case _DraftSaved():
return draftSaved();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( KYCProfile? profile,  KYCDraft? draft,  KYCStatus? status)?  loaded,TResult? Function()?  submitting,TResult? Function( KYCProfile profile)?  submitted,TResult? Function( String message)?  error,TResult? Function()?  draftSaved,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.profile,_that.draft,_that.status);case _Submitting() when submitting != null:
return submitting();case _Submitted() when submitted != null:
return submitted(_that.profile);case _Error() when error != null:
return error(_that.message);case _DraftSaved() when draftSaved != null:
return draftSaved();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements KYCState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KYCState.initial()';
}


}




/// @nodoc


class _Loading implements KYCState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KYCState.loading()';
}


}




/// @nodoc


class _Loaded implements KYCState {
  const _Loaded({this.profile, this.draft, this.status});
  

 final  KYCProfile? profile;
 final  KYCDraft? draft;
 final  KYCStatus? status;

/// Create a copy of KYCState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,profile,draft,status);

@override
String toString() {
  return 'KYCState.loaded(profile: $profile, draft: $draft, status: $status)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $KYCStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 KYCProfile? profile, KYCDraft? draft, KYCStatus? status
});


$KYCProfileCopyWith<$Res>? get profile;$KYCStatusCopyWith<$Res>? get status;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of KYCState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = freezed,Object? draft = freezed,Object? status = freezed,}) {
  return _then(_Loaded(
profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as KYCProfile?,draft: freezed == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as KYCDraft?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as KYCStatus?,
  ));
}

/// Create a copy of KYCState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KYCProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $KYCProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of KYCState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KYCStatusCopyWith<$Res>? get status {
    if (_self.status == null) {
    return null;
  }

  return $KYCStatusCopyWith<$Res>(_self.status!, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc


class _Submitting implements KYCState {
  const _Submitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KYCState.submitting()';
}


}




/// @nodoc


class _Submitted implements KYCState {
  const _Submitted(this.profile);
  

 final  KYCProfile profile;

/// Create a copy of KYCState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmittedCopyWith<_Submitted> get copyWith => __$SubmittedCopyWithImpl<_Submitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submitted&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'KYCState.submitted(profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$SubmittedCopyWith<$Res> implements $KYCStateCopyWith<$Res> {
  factory _$SubmittedCopyWith(_Submitted value, $Res Function(_Submitted) _then) = __$SubmittedCopyWithImpl;
@useResult
$Res call({
 KYCProfile profile
});


$KYCProfileCopyWith<$Res> get profile;

}
/// @nodoc
class __$SubmittedCopyWithImpl<$Res>
    implements _$SubmittedCopyWith<$Res> {
  __$SubmittedCopyWithImpl(this._self, this._then);

  final _Submitted _self;
  final $Res Function(_Submitted) _then;

/// Create a copy of KYCState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(_Submitted(
null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as KYCProfile,
  ));
}

/// Create a copy of KYCState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KYCProfileCopyWith<$Res> get profile {
  
  return $KYCProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

/// @nodoc


class _Error implements KYCState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of KYCState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'KYCState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $KYCStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of KYCState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DraftSaved implements KYCState {
  const _DraftSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'KYCState.draftSaved()';
}


}




// dart format on
