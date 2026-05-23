import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../features/auth/data/models/user_model.dart';

class UserAvatar extends StatelessWidget {
  final UserModel user;
  final double radius;

  const UserAvatar({super.key, required this.user, this.radius = 16});

  @override
  Widget build(BuildContext context) {
    final selfieUrl = user.selfieUrl;
    final hasSelfie = selfieUrl != null && selfieUrl.isNotEmpty;

    return CircleAvatar(
      radius: radius,
      backgroundColor: AppTheme.primaryColor,

      // Use selfie image if available
      backgroundImage: hasSelfie ? CachedNetworkImageProvider(selfieUrl) : null,

      // Otherwise fallback to email initial
      child: hasSelfie
          ? null
          : Text(
              user.email[0].toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: radius * 0.8,
              ),
            ),
    );
  }
}
