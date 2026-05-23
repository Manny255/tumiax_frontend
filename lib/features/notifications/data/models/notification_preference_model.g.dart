// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationPreferenceModel _$NotificationPreferenceModelFromJson(
  Map<String, dynamic> json,
) => _NotificationPreferenceModel(
  allNotificationsDisabled: json['all_notifications_disabled'] as bool,
  preferences: json['preferences'] as Map<String, dynamic>,
  quietHoursEnabled: json['quiet_hours_enabled'] as bool,
  quietHoursStart: json['quiet_hours_start'] as String?,
  quietHoursEnd: json['quiet_hours_end'] as String?,
  quietHoursTimezone: json['quiet_hours_timezone'] as String,
);

Map<String, dynamic> _$NotificationPreferenceModelToJson(
  _NotificationPreferenceModel instance,
) => <String, dynamic>{
  'all_notifications_disabled': instance.allNotificationsDisabled,
  'preferences': instance.preferences,
  'quiet_hours_enabled': instance.quietHoursEnabled,
  'quiet_hours_start': instance.quietHoursStart,
  'quiet_hours_end': instance.quietHoursEnd,
  'quiet_hours_timezone': instance.quietHoursTimezone,
};
