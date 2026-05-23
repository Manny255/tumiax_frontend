import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_category_model.freezed.dart';
part 'notification_category_model.g.dart';

@freezed
sealed class NotificationCategoryModel with _$NotificationCategoryModel {
  const factory NotificationCategoryModel({
    required String id,
    required String name,
    required String code,
    String? description,
    String? icon,
    required int priority,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NotificationCategoryModel;

  factory NotificationCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationCategoryModelFromJson(json);
}
