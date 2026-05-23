// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetDocumentModel {

 String get id;@JsonKey(name: 'document_type') String get documentType;// File info
 String? get file;@JsonKey(name: 'file_url') String? get fileUrl;@JsonKey(name: 'file_name') String? get fileName;@JsonKey(name: 'file_size') int? get fileSize;@JsonKey(name: 'mime_type') String? get mimeType;// Status
 String get status;@JsonKey(name: 'rejection_reason') String? get rejectionReason;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of AssetDocumentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetDocumentModelCopyWith<AssetDocumentModel> get copyWith => _$AssetDocumentModelCopyWithImpl<AssetDocumentModel>(this as AssetDocumentModel, _$identity);

  /// Serializes this AssetDocumentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetDocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.file, file) || other.file == file)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentType,file,fileUrl,fileName,fileSize,mimeType,status,rejectionReason,createdAt);

@override
String toString() {
  return 'AssetDocumentModel(id: $id, documentType: $documentType, file: $file, fileUrl: $fileUrl, fileName: $fileName, fileSize: $fileSize, mimeType: $mimeType, status: $status, rejectionReason: $rejectionReason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AssetDocumentModelCopyWith<$Res>  {
  factory $AssetDocumentModelCopyWith(AssetDocumentModel value, $Res Function(AssetDocumentModel) _then) = _$AssetDocumentModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'document_type') String documentType, String? file,@JsonKey(name: 'file_url') String? fileUrl,@JsonKey(name: 'file_name') String? fileName,@JsonKey(name: 'file_size') int? fileSize,@JsonKey(name: 'mime_type') String? mimeType, String status,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$AssetDocumentModelCopyWithImpl<$Res>
    implements $AssetDocumentModelCopyWith<$Res> {
  _$AssetDocumentModelCopyWithImpl(this._self, this._then);

  final AssetDocumentModel _self;
  final $Res Function(AssetDocumentModel) _then;

/// Create a copy of AssetDocumentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? documentType = null,Object? file = freezed,Object? fileUrl = freezed,Object? fileName = freezed,Object? fileSize = freezed,Object? mimeType = freezed,Object? status = null,Object? rejectionReason = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetDocumentModel].
extension AssetDocumentModelPatterns on AssetDocumentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetDocumentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetDocumentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetDocumentModel value)  $default,){
final _that = this;
switch (_that) {
case _AssetDocumentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetDocumentModel value)?  $default,){
final _that = this;
switch (_that) {
case _AssetDocumentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'document_type')  String documentType,  String? file, @JsonKey(name: 'file_url')  String? fileUrl, @JsonKey(name: 'file_name')  String? fileName, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'mime_type')  String? mimeType,  String status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetDocumentModel() when $default != null:
return $default(_that.id,_that.documentType,_that.file,_that.fileUrl,_that.fileName,_that.fileSize,_that.mimeType,_that.status,_that.rejectionReason,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'document_type')  String documentType,  String? file, @JsonKey(name: 'file_url')  String? fileUrl, @JsonKey(name: 'file_name')  String? fileName, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'mime_type')  String? mimeType,  String status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AssetDocumentModel():
return $default(_that.id,_that.documentType,_that.file,_that.fileUrl,_that.fileName,_that.fileSize,_that.mimeType,_that.status,_that.rejectionReason,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'document_type')  String documentType,  String? file, @JsonKey(name: 'file_url')  String? fileUrl, @JsonKey(name: 'file_name')  String? fileName, @JsonKey(name: 'file_size')  int? fileSize, @JsonKey(name: 'mime_type')  String? mimeType,  String status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AssetDocumentModel() when $default != null:
return $default(_that.id,_that.documentType,_that.file,_that.fileUrl,_that.fileName,_that.fileSize,_that.mimeType,_that.status,_that.rejectionReason,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetDocumentModel implements AssetDocumentModel {
  const _AssetDocumentModel({required this.id, @JsonKey(name: 'document_type') required this.documentType, this.file, @JsonKey(name: 'file_url') this.fileUrl, @JsonKey(name: 'file_name') this.fileName, @JsonKey(name: 'file_size') this.fileSize, @JsonKey(name: 'mime_type') this.mimeType, required this.status, @JsonKey(name: 'rejection_reason') this.rejectionReason, @JsonKey(name: 'created_at') required this.createdAt});
  factory _AssetDocumentModel.fromJson(Map<String, dynamic> json) => _$AssetDocumentModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'document_type') final  String documentType;
// File info
@override final  String? file;
@override@JsonKey(name: 'file_url') final  String? fileUrl;
@override@JsonKey(name: 'file_name') final  String? fileName;
@override@JsonKey(name: 'file_size') final  int? fileSize;
@override@JsonKey(name: 'mime_type') final  String? mimeType;
// Status
@override final  String status;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of AssetDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetDocumentModelCopyWith<_AssetDocumentModel> get copyWith => __$AssetDocumentModelCopyWithImpl<_AssetDocumentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetDocumentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetDocumentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.documentType, documentType) || other.documentType == documentType)&&(identical(other.file, file) || other.file == file)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,documentType,file,fileUrl,fileName,fileSize,mimeType,status,rejectionReason,createdAt);

@override
String toString() {
  return 'AssetDocumentModel(id: $id, documentType: $documentType, file: $file, fileUrl: $fileUrl, fileName: $fileName, fileSize: $fileSize, mimeType: $mimeType, status: $status, rejectionReason: $rejectionReason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AssetDocumentModelCopyWith<$Res> implements $AssetDocumentModelCopyWith<$Res> {
  factory _$AssetDocumentModelCopyWith(_AssetDocumentModel value, $Res Function(_AssetDocumentModel) _then) = __$AssetDocumentModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'document_type') String documentType, String? file,@JsonKey(name: 'file_url') String? fileUrl,@JsonKey(name: 'file_name') String? fileName,@JsonKey(name: 'file_size') int? fileSize,@JsonKey(name: 'mime_type') String? mimeType, String status,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$AssetDocumentModelCopyWithImpl<$Res>
    implements _$AssetDocumentModelCopyWith<$Res> {
  __$AssetDocumentModelCopyWithImpl(this._self, this._then);

  final _AssetDocumentModel _self;
  final $Res Function(_AssetDocumentModel) _then;

/// Create a copy of AssetDocumentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? documentType = null,Object? file = freezed,Object? fileUrl = freezed,Object? fileName = freezed,Object? fileSize = freezed,Object? mimeType = freezed,Object? status = null,Object? rejectionReason = freezed,Object? createdAt = null,}) {
  return _then(_AssetDocumentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,documentType: null == documentType ? _self.documentType : documentType // ignore: cast_nullable_to_non_nullable
as String,file: freezed == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as int?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
