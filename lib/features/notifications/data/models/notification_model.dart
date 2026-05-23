import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/themes/app_theme.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
sealed class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String title,
    required String message,
    @JsonKey(name: 'category') String? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    @JsonKey(name: 'category_code') String? categoryCode,
    required int priority,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: 'read_at') DateTime? readAt,
    @JsonKey(name: 'is_archived') required bool isArchived,
    @JsonKey(name: 'action_type') String? actionType,
    @JsonKey(name: 'action_id') String? actionId,
    @JsonKey(name: 'action_url') String? actionUrl,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @JsonKey(name: 'time_ago') String? timeAgo,
    @JsonKey(name: 'is_expired') bool? isExpired,
    Map<String, dynamic>? metadata,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}


extension NotificationModelX on NotificationModel {
  /// Get icon based on category or priority
  IconData get icon {
    if (categoryCode != null) {
      switch (categoryCode) {
        case 'TRANSACTION':
          return Icons.payment;
        case 'SECURITY':
          return Icons.security;
        case 'CREDIT':
          return Icons.credit_card;
        case 'ASSET':
          return Icons.inventory;
        case 'KYC':
          return Icons.verified_user;
        case 'PROMOTION':
          return Icons.local_offer;
        case 'SYSTEM':
          return Icons.settings;
        case 'REMINDER':
          return Icons.notifications;
        case 'WITHDRAWAL':
          return Icons.account_balance;
        case 'DEPOSIT':
          return Icons.add_circle;
        default:
          return Icons.notifications;
      }
    }

    // Fallback based on priority
    switch (priority) {
      case 5: // Critical
        return Icons.warning;
      case 4: // Urgent
        return Icons.priority_high;
      case 3: // High
        return Icons.notifications_active;
      default:
        return Icons.notifications;
    }
  }

  /// Get color based on priority
  Color get priorityColor {
    switch (priority) {
      case 5: // Critical
        return Colors.red;
      case 4: // Urgent
        return Colors.orange;
      case 3: // High
        return Colors.amber;
      case 2: // Medium
        return AppTheme.primaryColor;
      default: // Low
        return Colors.grey;
    }
  }

  /// Get gradient colors based on category
  List<Color> get gradientColors {
    if (categoryCode != null) {
      switch (categoryCode) {
        case 'TRANSACTION':
          return [Colors.blue, Colors.lightBlue];
        case 'SECURITY':
          return [Colors.red, Colors.orange];
        case 'CREDIT':
          return [Colors.green, Colors.teal];
        case 'ASSET':
          return [Colors.purple, Colors.deepPurple];
        case 'KYC':
          return [Colors.indigo, Colors.blue];
        case 'PROMOTION':
          return [Colors.pink, Colors.red];
        default:
          return [priorityColor, priorityColor.withValues(alpha: 0.7)];
      }
    }
    return [priorityColor, priorityColor.withValues(alpha: 0.7)];
  }

  /// Check if notification is actionable
  bool get isActionable => actionType != null && actionType!.isNotEmpty;

  /// Get action route based on action type
 /// Get action route based on action type
  String? get actionRoute {
    if (actionType == null) return null;

    switch (actionType) {
      case 'credit_page':
        return RouteNames.credit;

      case 'asset_detail':
        return actionId != null
            ? '${RouteNames.assets}/$actionId'
            : RouteNames.assets;

      case 'transaction_detail':
        return actionId != null
            ? '${RouteNames.wallet}/transactions/$actionId'
            : RouteNames.wallet;

      case 'profile':
        return RouteNames.profile;

      case 'kyc':
        return RouteNames.kyc;

      default:
        return actionUrl;
    }
  }
}
