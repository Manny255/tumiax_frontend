// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationModel {

 String get id; String get title; String get message;@JsonKey(name: 'category') String? get categoryId;@JsonKey(name: 'category_name') String? get categoryName;@JsonKey(name: 'category_code') String? get categoryCode; int get priority;@JsonKey(name: 'is_read') bool get isRead;@JsonKey(name: 'read_at') DateTime? get readAt;@JsonKey(name: 'is_archived') bool get isArchived;@JsonKey(name: 'action_type') String? get actionType;@JsonKey(name: 'action_id') String? get actionId;@JsonKey(name: 'action_url') String? get actionUrl;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'expires_at') DateTime? get expiresAt;@JsonKey(name: 'time_ago') String? get timeAgo;@JsonKey(name: 'is_expired') bool? get isExpired; Map<String, dynamic>? get metadata;
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationModelCopyWith<NotificationModel> get copyWith => _$NotificationModelCopyWithImpl<NotificationModel>(this as NotificationModel, _$identity);

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.categoryCode, categoryCode) || other.categoryCode == categoryCode)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.actionId, actionId) || other.actionId == actionId)&&(identical(other.actionUrl, actionUrl) || other.actionUrl == actionUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,message,categoryId,categoryName,categoryCode,priority,isRead,readAt,isArchived,actionType,actionId,actionUrl,imageUrl,createdAt,expiresAt,timeAgo,isExpired,const DeepCollectionEquality().hash(metadata)]);

@override
String toString() {
  return 'NotificationModel(id: $id, title: $title, message: $message, categoryId: $categoryId, categoryName: $categoryName, categoryCode: $categoryCode, priority: $priority, isRead: $isRead, readAt: $readAt, isArchived: $isArchived, actionType: $actionType, actionId: $actionId, actionUrl: $actionUrl, imageUrl: $imageUrl, createdAt: $createdAt, expiresAt: $expiresAt, timeAgo: $timeAgo, isExpired: $isExpired, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $NotificationModelCopyWith<$Res>  {
  factory $NotificationModelCopyWith(NotificationModel value, $Res Function(NotificationModel) _then) = _$NotificationModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String message,@JsonKey(name: 'category') String? categoryId,@JsonKey(name: 'category_name') String? categoryName,@JsonKey(name: 'category_code') String? categoryCode, int priority,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'read_at') DateTime? readAt,@JsonKey(name: 'is_archived') bool isArchived,@JsonKey(name: 'action_type') String? actionType,@JsonKey(name: 'action_id') String? actionId,@JsonKey(name: 'action_url') String? actionUrl,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'time_ago') String? timeAgo,@JsonKey(name: 'is_expired') bool? isExpired, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? message = null,Object? categoryId = freezed,Object? categoryName = freezed,Object? categoryCode = freezed,Object? priority = null,Object? isRead = null,Object? readAt = freezed,Object? isArchived = null,Object? actionType = freezed,Object? actionId = freezed,Object? actionUrl = freezed,Object? imageUrl = freezed,Object? createdAt = null,Object? expiresAt = freezed,Object? timeAgo = freezed,Object? isExpired = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,categoryCode: freezed == categoryCode ? _self.categoryCode : categoryCode // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,actionId: freezed == actionId ? _self.actionId : actionId // ignore: cast_nullable_to_non_nullable
as String?,actionUrl: freezed == actionUrl ? _self.actionUrl : actionUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,timeAgo: freezed == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as String?,isExpired: freezed == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationModel].
extension NotificationModelPatterns on NotificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String message, @JsonKey(name: 'category')  String? categoryId, @JsonKey(name: 'category_name')  String? categoryName, @JsonKey(name: 'category_code')  String? categoryCode,  int priority, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'read_at')  DateTime? readAt, @JsonKey(name: 'is_archived')  bool isArchived, @JsonKey(name: 'action_type')  String? actionType, @JsonKey(name: 'action_id')  String? actionId, @JsonKey(name: 'action_url')  String? actionUrl, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'time_ago')  String? timeAgo, @JsonKey(name: 'is_expired')  bool? isExpired,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.categoryId,_that.categoryName,_that.categoryCode,_that.priority,_that.isRead,_that.readAt,_that.isArchived,_that.actionType,_that.actionId,_that.actionUrl,_that.imageUrl,_that.createdAt,_that.expiresAt,_that.timeAgo,_that.isExpired,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String message, @JsonKey(name: 'category')  String? categoryId, @JsonKey(name: 'category_name')  String? categoryName, @JsonKey(name: 'category_code')  String? categoryCode,  int priority, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'read_at')  DateTime? readAt, @JsonKey(name: 'is_archived')  bool isArchived, @JsonKey(name: 'action_type')  String? actionType, @JsonKey(name: 'action_id')  String? actionId, @JsonKey(name: 'action_url')  String? actionUrl, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'time_ago')  String? timeAgo, @JsonKey(name: 'is_expired')  bool? isExpired,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _NotificationModel():
return $default(_that.id,_that.title,_that.message,_that.categoryId,_that.categoryName,_that.categoryCode,_that.priority,_that.isRead,_that.readAt,_that.isArchived,_that.actionType,_that.actionId,_that.actionUrl,_that.imageUrl,_that.createdAt,_that.expiresAt,_that.timeAgo,_that.isExpired,_that.metadata);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String message, @JsonKey(name: 'category')  String? categoryId, @JsonKey(name: 'category_name')  String? categoryName, @JsonKey(name: 'category_code')  String? categoryCode,  int priority, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'read_at')  DateTime? readAt, @JsonKey(name: 'is_archived')  bool isArchived, @JsonKey(name: 'action_type')  String? actionType, @JsonKey(name: 'action_id')  String? actionId, @JsonKey(name: 'action_url')  String? actionUrl, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'time_ago')  String? timeAgo, @JsonKey(name: 'is_expired')  bool? isExpired,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.categoryId,_that.categoryName,_that.categoryCode,_that.priority,_that.isRead,_that.readAt,_that.isArchived,_that.actionType,_that.actionId,_that.actionUrl,_that.imageUrl,_that.createdAt,_that.expiresAt,_that.timeAgo,_that.isExpired,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationModel implements NotificationModel {
  const _NotificationModel({required this.id, required this.title, required this.message, @JsonKey(name: 'category') this.categoryId, @JsonKey(name: 'category_name') this.categoryName, @JsonKey(name: 'category_code') this.categoryCode, required this.priority, @JsonKey(name: 'is_read') required this.isRead, @JsonKey(name: 'read_at') this.readAt, @JsonKey(name: 'is_archived') required this.isArchived, @JsonKey(name: 'action_type') this.actionType, @JsonKey(name: 'action_id') this.actionId, @JsonKey(name: 'action_url') this.actionUrl, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'time_ago') this.timeAgo, @JsonKey(name: 'is_expired') this.isExpired, final  Map<String, dynamic>? metadata}): _metadata = metadata;
  factory _NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String message;
@override@JsonKey(name: 'category') final  String? categoryId;
@override@JsonKey(name: 'category_name') final  String? categoryName;
@override@JsonKey(name: 'category_code') final  String? categoryCode;
@override final  int priority;
@override@JsonKey(name: 'is_read') final  bool isRead;
@override@JsonKey(name: 'read_at') final  DateTime? readAt;
@override@JsonKey(name: 'is_archived') final  bool isArchived;
@override@JsonKey(name: 'action_type') final  String? actionType;
@override@JsonKey(name: 'action_id') final  String? actionId;
@override@JsonKey(name: 'action_url') final  String? actionUrl;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'expires_at') final  DateTime? expiresAt;
@override@JsonKey(name: 'time_ago') final  String? timeAgo;
@override@JsonKey(name: 'is_expired') final  bool? isExpired;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationModelCopyWith<_NotificationModel> get copyWith => __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.categoryCode, categoryCode) || other.categoryCode == categoryCode)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.actionId, actionId) || other.actionId == actionId)&&(identical(other.actionUrl, actionUrl) || other.actionUrl == actionUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.timeAgo, timeAgo) || other.timeAgo == timeAgo)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,message,categoryId,categoryName,categoryCode,priority,isRead,readAt,isArchived,actionType,actionId,actionUrl,imageUrl,createdAt,expiresAt,timeAgo,isExpired,const DeepCollectionEquality().hash(_metadata)]);

@override
String toString() {
  return 'NotificationModel(id: $id, title: $title, message: $message, categoryId: $categoryId, categoryName: $categoryName, categoryCode: $categoryCode, priority: $priority, isRead: $isRead, readAt: $readAt, isArchived: $isArchived, actionType: $actionType, actionId: $actionId, actionUrl: $actionUrl, imageUrl: $imageUrl, createdAt: $createdAt, expiresAt: $expiresAt, timeAgo: $timeAgo, isExpired: $isExpired, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$NotificationModelCopyWith<$Res> implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(_NotificationModel value, $Res Function(_NotificationModel) _then) = __$NotificationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String message,@JsonKey(name: 'category') String? categoryId,@JsonKey(name: 'category_name') String? categoryName,@JsonKey(name: 'category_code') String? categoryCode, int priority,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'read_at') DateTime? readAt,@JsonKey(name: 'is_archived') bool isArchived,@JsonKey(name: 'action_type') String? actionType,@JsonKey(name: 'action_id') String? actionId,@JsonKey(name: 'action_url') String? actionUrl,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'time_ago') String? timeAgo,@JsonKey(name: 'is_expired') bool? isExpired, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? message = null,Object? categoryId = freezed,Object? categoryName = freezed,Object? categoryCode = freezed,Object? priority = null,Object? isRead = null,Object? readAt = freezed,Object? isArchived = null,Object? actionType = freezed,Object? actionId = freezed,Object? actionUrl = freezed,Object? imageUrl = freezed,Object? createdAt = null,Object? expiresAt = freezed,Object? timeAgo = freezed,Object? isExpired = freezed,Object? metadata = freezed,}) {
  return _then(_NotificationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,categoryCode: freezed == categoryCode ? _self.categoryCode : categoryCode // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,actionType: freezed == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as String?,actionId: freezed == actionId ? _self.actionId : actionId // ignore: cast_nullable_to_non_nullable
as String?,actionUrl: freezed == actionUrl ? _self.actionUrl : actionUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,timeAgo: freezed == timeAgo ? _self.timeAgo : timeAgo // ignore: cast_nullable_to_non_nullable
as String?,isExpired: freezed == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
