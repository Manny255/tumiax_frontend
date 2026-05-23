// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationCategoryModel _$NotificationCategoryModelFromJson(
  Map<String, dynamic> json,
) => _NotificationCategoryModel(
  id: json['id'] as String,
  name: json['name'] as String,
  code: json['code'] as String,
  description: json['description'] as String?,
  icon: json['icon'] as String?,
  priority: (json['priority'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$NotificationCategoryModelToJson(
  _NotificationCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'description': instance.description,
  'icon': instance.icon,
  'priority': instance.priority,
  'created_at': instance.createdAt.toIso8601String(),
};
