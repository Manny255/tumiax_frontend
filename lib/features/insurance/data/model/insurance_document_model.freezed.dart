// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insurance_document_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InsuranceDocumentModel {

 int get id; String get file;@JsonKey(name: 'file_name') String get fileName;@JsonKey(name: 'file_size') int get fileSize;@JsonKey(name: 'mime_type') String get mimeType;@JsonKey(name: 'uploaded_at') DateTime get uploadedAt;
/// Create a copy of InsuranceDocumentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsuranceDocumentModelCopyWith<InsuranceDocumentModel> get copyWith => _$InsuranceDocumentModelCopyWithImpl<InsuranceDocumentModel>(this as InsuranceDocumentModel, _$identity);

  /// Serializes this InsuranceDocumentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsuranceDocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.file, file) || other.file == file)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,file,fileName,fileSize,mimeType,uploadedAt);

@override
String toString() {
  return 'InsuranceDocumentModel(id: $id, file: $file, fileName: $fileName, fileSize: $fileSize, mimeType: $mimeType, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class $InsuranceDocumentModelCopyWith<$Res>  {
  factory $InsuranceDocumentModelCopyWith(InsuranceDocumentModel value, $Res Function(InsuranceDocumentModel) _then) = _$InsuranceDocumentModelCopyWithImpl;
@useResult
$Res call({
 int id, String file,@JsonKey(name: 'file_name') String fileName,@JsonKey(name: 'file_size') int fileSize,@JsonKey(name: 'mime_type') String mimeType,@JsonKey(name: 'uploaded_at') DateTime uploadedAt
});




}
/// @nodoc
class _$InsuranceDocumentModelCopyWithImpl<$Res>
    implements $InsuranceDocumentModelCopyWith<$Res> {
  _$InsuranceDocumentModelCopyWithImpl(this._self, this._then);

  final InsuranceDocumentModel _self;
  final $Res Function(InsuranceDocumentModel) _then;

/// Create a copy of InsuranceDocumentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? file = null,Object? fileName = null,Object? fileSize = null,Object? mimeType = null,Object? uploadedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [InsuranceDocumentModel].
extension InsuranceDocumentModelPatterns on InsuranceDocumentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InsuranceDocumentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InsuranceDocumentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InsuranceDocumentModel value)  $default,){
final _that = this;
switch (_that) {
case _InsuranceDocumentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InsuranceDocumentModel value)?  $default,){
final _that = this;
switch (_that) {
case _InsuranceDocumentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String file, @JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'file_size')  int fileSize, @JsonKey(name: 'mime_type')  String mimeType, @JsonKey(name: 'uploaded_at')  DateTime uploadedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InsuranceDocumentModel() when $default != null:
return $default(_that.id,_that.file,_that.fileName,_that.fileSize,_that.mimeType,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String file, @JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'file_size')  int fileSize, @JsonKey(name: 'mime_type')  String mimeType, @JsonKey(name: 'uploaded_at')  DateTime uploadedAt)  $default,) {final _that = this;
switch (_that) {
case _InsuranceDocumentModel():
return $default(_that.id,_that.file,_that.fileName,_that.fileSize,_that.mimeType,_that.uploadedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String file, @JsonKey(name: 'file_name')  String fileName, @JsonKey(name: 'file_size')  int fileSize, @JsonKey(name: 'mime_type')  String mimeType, @JsonKey(name: 'uploaded_at')  DateTime uploadedAt)?  $default,) {final _that = this;
switch (_that) {
case _InsuranceDocumentModel() when $default != null:
return $default(_that.id,_that.file,_that.fileName,_that.fileSize,_that.mimeType,_that.uploadedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InsuranceDocumentModel implements InsuranceDocumentModel {
  const _InsuranceDocumentModel({required this.id, required this.file, @JsonKey(name: 'file_name') required this.fileName, @JsonKey(name: 'file_size') required this.fileSize, @JsonKey(name: 'mime_type') required this.mimeType, @JsonKey(name: 'uploaded_at') required this.uploadedAt});
  factory _InsuranceDocumentModel.fromJson(Map<String, dynamic> json) => _$InsuranceDocumentModelFromJson(json);

@override final  int id;
@override final  String file;
@override@JsonKey(name: 'file_name') final  String fileName;
@override@JsonKey(name: 'file_size') final  int fileSize;
@override@JsonKey(name: 'mime_type') final  String mimeType;
@override@JsonKey(name: 'uploaded_at') final  DateTime uploadedAt;

/// Create a copy of InsuranceDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsuranceDocumentModelCopyWith<_InsuranceDocumentModel> get copyWith => __$InsuranceDocumentModelCopyWithImpl<_InsuranceDocumentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InsuranceDocumentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InsuranceDocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.file, file) || other.file == file)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,file,fileName,fileSize,mimeType,uploadedAt);

@override
String toString() {
  return 'InsuranceDocumentModel(id: $id, file: $file, fileName: $fileName, fileSize: $fileSize, mimeType: $mimeType, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class _$InsuranceDocumentModelCopyWith<$Res> implements $InsuranceDocumentModelCopyWith<$Res> {
  factory _$InsuranceDocumentModelCopyWith(_InsuranceDocumentModel value, $Res Function(_InsuranceDocumentModel) _then) = __$InsuranceDocumentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String file,@JsonKey(name: 'file_name') String fileName,@JsonKey(name: 'file_size') int fileSize,@JsonKey(name: 'mime_type') String mimeType,@JsonKey(name: 'uploaded_at') DateTime uploadedAt
});




}
/// @nodoc
class __$InsuranceDocumentModelCopyWithImpl<$Res>
    implements _$InsuranceDocumentModelCopyWith<$Res> {
  __$InsuranceDocumentModelCopyWithImpl(this._self, this._then);

  final _InsuranceDocumentModel _self;
  final $Res Function(_InsuranceDocumentModel) _then;

/// Create a copy of InsuranceDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? file = null,Object? fileName = null,Object? fileSize = null,Object? mimeType = null,Object? uploadedAt = null,}) {
  return _then(_InsuranceDocumentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
