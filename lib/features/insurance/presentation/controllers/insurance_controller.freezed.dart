// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insurance_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InsuranceState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsuranceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InsuranceState()';
}


}

/// @nodoc
class $InsuranceStateCopyWith<$Res>  {
$InsuranceStateCopyWith(InsuranceState _, $Res Function(InsuranceState) __);
}


/// Adds pattern-matching-related methods to [InsuranceState].
extension InsuranceStatePatterns on InsuranceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Created value)?  created,TResult Function( _Loaded value)?  loaded,TResult Function( _DocumentUploaded value)?  documentUploaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _DocumentUploaded() when documentUploaded != null:
return documentUploaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Created value)  created,required TResult Function( _Loaded value)  loaded,required TResult Function( _DocumentUploaded value)  documentUploaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Created():
return created(_that);case _Loaded():
return loaded(_that);case _DocumentUploaded():
return documentUploaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Created value)?  created,TResult? Function( _Loaded value)?  loaded,TResult? Function( _DocumentUploaded value)?  documentUploaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Created() when created != null:
return created(_that);case _Loaded() when loaded != null:
return loaded(_that);case _DocumentUploaded() when documentUploaded != null:
return documentUploaded(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( InsurancePolicyModel policy)?  created,TResult Function( InsurancePolicyModel policy)?  loaded,TResult Function( InsuranceDocumentModel document)?  documentUploaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Created() when created != null:
return created(_that.policy);case _Loaded() when loaded != null:
return loaded(_that.policy);case _DocumentUploaded() when documentUploaded != null:
return documentUploaded(_that.document);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( InsurancePolicyModel policy)  created,required TResult Function( InsurancePolicyModel policy)  loaded,required TResult Function( InsuranceDocumentModel document)  documentUploaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Created():
return created(_that.policy);case _Loaded():
return loaded(_that.policy);case _DocumentUploaded():
return documentUploaded(_that.document);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( InsurancePolicyModel policy)?  created,TResult? Function( InsurancePolicyModel policy)?  loaded,TResult? Function( InsuranceDocumentModel document)?  documentUploaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Created() when created != null:
return created(_that.policy);case _Loaded() when loaded != null:
return loaded(_that.policy);case _DocumentUploaded() when documentUploaded != null:
return documentUploaded(_that.document);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements InsuranceState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InsuranceState.initial()';
}


}




/// @nodoc


class _Loading implements InsuranceState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InsuranceState.loading()';
}


}




/// @nodoc


class _Created implements InsuranceState {
  const _Created(this.policy);
  

 final  InsurancePolicyModel policy;

/// Create a copy of InsuranceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedCopyWith<_Created> get copyWith => __$CreatedCopyWithImpl<_Created>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Created&&(identical(other.policy, policy) || other.policy == policy));
}


@override
int get hashCode => Object.hash(runtimeType,policy);

@override
String toString() {
  return 'InsuranceState.created(policy: $policy)';
}


}

/// @nodoc
abstract mixin class _$CreatedCopyWith<$Res> implements $InsuranceStateCopyWith<$Res> {
  factory _$CreatedCopyWith(_Created value, $Res Function(_Created) _then) = __$CreatedCopyWithImpl;
@useResult
$Res call({
 InsurancePolicyModel policy
});


$InsurancePolicyModelCopyWith<$Res> get policy;

}
/// @nodoc
class __$CreatedCopyWithImpl<$Res>
    implements _$CreatedCopyWith<$Res> {
  __$CreatedCopyWithImpl(this._self, this._then);

  final _Created _self;
  final $Res Function(_Created) _then;

/// Create a copy of InsuranceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? policy = null,}) {
  return _then(_Created(
null == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as InsurancePolicyModel,
  ));
}

/// Create a copy of InsuranceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InsurancePolicyModelCopyWith<$Res> get policy {
  
  return $InsurancePolicyModelCopyWith<$Res>(_self.policy, (value) {
    return _then(_self.copyWith(policy: value));
  });
}
}

/// @nodoc


class _Loaded implements InsuranceState {
  const _Loaded(this.policy);
  

 final  InsurancePolicyModel policy;

/// Create a copy of InsuranceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.policy, policy) || other.policy == policy));
}


@override
int get hashCode => Object.hash(runtimeType,policy);

@override
String toString() {
  return 'InsuranceState.loaded(policy: $policy)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $InsuranceStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 InsurancePolicyModel policy
});


$InsurancePolicyModelCopyWith<$Res> get policy;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of InsuranceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? policy = null,}) {
  return _then(_Loaded(
null == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as InsurancePolicyModel,
  ));
}

/// Create a copy of InsuranceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InsurancePolicyModelCopyWith<$Res> get policy {
  
  return $InsurancePolicyModelCopyWith<$Res>(_self.policy, (value) {
    return _then(_self.copyWith(policy: value));
  });
}
}

/// @nodoc


class _DocumentUploaded implements InsuranceState {
  const _DocumentUploaded(this.document);
  

 final  InsuranceDocumentModel document;

/// Create a copy of InsuranceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentUploadedCopyWith<_DocumentUploaded> get copyWith => __$DocumentUploadedCopyWithImpl<_DocumentUploaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentUploaded&&(identical(other.document, document) || other.document == document));
}


@override
int get hashCode => Object.hash(runtimeType,document);

@override
String toString() {
  return 'InsuranceState.documentUploaded(document: $document)';
}


}

/// @nodoc
abstract mixin class _$DocumentUploadedCopyWith<$Res> implements $InsuranceStateCopyWith<$Res> {
  factory _$DocumentUploadedCopyWith(_DocumentUploaded value, $Res Function(_DocumentUploaded) _then) = __$DocumentUploadedCopyWithImpl;
@useResult
$Res call({
 InsuranceDocumentModel document
});


$InsuranceDocumentModelCopyWith<$Res> get document;

}
/// @nodoc
class __$DocumentUploadedCopyWithImpl<$Res>
    implements _$DocumentUploadedCopyWith<$Res> {
  __$DocumentUploadedCopyWithImpl(this._self, this._then);

  final _DocumentUploaded _self;
  final $Res Function(_DocumentUploaded) _then;

/// Create a copy of InsuranceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? document = null,}) {
  return _then(_DocumentUploaded(
null == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as InsuranceDocumentModel,
  ));
}

/// Create a copy of InsuranceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InsuranceDocumentModelCopyWith<$Res> get document {
  
  return $InsuranceDocumentModelCopyWith<$Res>(_self.document, (value) {
    return _then(_self.copyWith(document: value));
  });
}
}

/// @nodoc


class _Error implements InsuranceState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of InsuranceState
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
  return 'InsuranceState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $InsuranceStateCopyWith<$Res> {
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

/// Create a copy of InsuranceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
