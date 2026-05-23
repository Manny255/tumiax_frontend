// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      categoryId: json['category'] as String?,
      categoryName: json['category_name'] as String?,
      categoryCode: json['category_code'] as String?,
      priority: (json['priority'] as num).toInt(),
      isRead: json['is_read'] as bool,
      readAt: json['read_at'] == null
          ? null
          : DateTime.parse(json['read_at'] as String),
      isArchived: json['is_archived'] as bool,
      actionType: json['action_type'] as String?,
      actionId: json['action_id'] as String?,
      actionUrl: json['action_url'] as String?,
      imageUrl: json['image_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      timeAgo: json['time_ago'] as String?,
      isExpired: json['is_expired'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'category': instance.categoryId,
      'category_name': instance.categoryName,
      'category_code': instance.categoryCode,
      'priority': instance.priority,
      'is_read': instance.isRead,
      'read_at': instance.readAt?.toIso8601String(),
      'is_archived': instance.isArchived,
      'action_type': instance.actionType,
      'action_id': instance.actionId,
      'action_url': instance.actionUrl,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
      'time_ago': instance.timeAgo,
      'is_expired': instance.isExpired,
      'metadata': instance.metadata,
    };
