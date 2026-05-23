import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_preference_model.freezed.dart';
part 'notification_preference_model.g.dart';

@freezed
sealed class NotificationPreferenceModel with _$NotificationPreferenceModel {
  const factory NotificationPreferenceModel({
    @JsonKey(name: 'all_notifications_disabled')
    required bool allNotificationsDisabled,
    required Map<String, dynamic> preferences,
    @JsonKey(name: 'quiet_hours_enabled') required bool quietHoursEnabled,
    @JsonKey(name: 'quiet_hours_start') String? quietHoursStart,
    @JsonKey(name: 'quiet_hours_end') String? quietHoursEnd,
    @JsonKey(name: 'quiet_hours_timezone') required String quietHoursTimezone,
  }) = _NotificationPreferenceModel;

  factory NotificationPreferenceModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferenceModelFromJson(json);
}
