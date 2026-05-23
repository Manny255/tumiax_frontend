import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../data/models/kyc_model.dart';

class KYCStatusBadge extends StatelessWidget {
  final KYCProfile profile;

  const KYCStatusBadge({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: profile.statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: profile.statusColor.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(profile.statusIcon, size: 16, color: profile.statusColor),
          const SizedBox(width: 6),
          Text(
            profile.statusDisplay,
            style: AppTheme.caption.copyWith(
              color: profile.statusColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
