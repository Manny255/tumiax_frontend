// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationDeviceModel _$NotificationDeviceModelFromJson(
  Map<String, dynamic> json,
) => _NotificationDeviceModel(
  id: json['id'] as String,
  deviceType: json['device_type'] as String,
  deviceId: json['device_id'] as String,
  deviceName: json['device_name'] as String?,
  pushToken: json['push_token'] as String?,
  isActive: json['is_active'] as bool,
  lastActiveAt: DateTime.parse(json['last_active_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$NotificationDeviceModelToJson(
  _NotificationDeviceModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'device_type': instance.deviceType,
  'device_id': instance.deviceId,
  'device_name': instance.deviceName,
  'push_token': instance.pushToken,
  'is_active': instance.isActive,
  'last_active_at': instance.lastActiveAt.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
};
