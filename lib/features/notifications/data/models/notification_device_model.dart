import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_device_model.freezed.dart';
part 'notification_device_model.g.dart';

@freezed
sealed class NotificationDeviceModel with _$NotificationDeviceModel {
  const factory NotificationDeviceModel({
    required String id,
    @JsonKey(name: 'device_type') required String deviceType,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'device_name') String? deviceName,
    @JsonKey(name: 'push_token') String? pushToken,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'last_active_at') required DateTime lastActiveAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NotificationDeviceModel;

  factory NotificationDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationDeviceModelFromJson(json);
}
