import 'package:flutter/material.dart';
import '../../core/themes/app_theme.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final double? height;
  final VoidCallback? onAction;
  final String? actionLabel;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.height,
    this.onAction,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    if (height != null) {
      return SizedBox(
        height: height,
        child: Center(child: _buildContent()),
      );
    }

    // When no height is provided, let the content determine its own height
    return Center(child: _buildContent());
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize:
          MainAxisSize.min, // This ensures the column only takes needed space
      children: [
        Icon(icon, size: 32, color: Colors.grey),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTheme.body1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2, // Prevent long titles from causing overflow
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: AppTheme.caption,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        if (onAction != null && actionLabel != null) ...[
          const SizedBox(height: 12),
          TextButton(onPressed: onAction, child: Text(actionLabel!)),
        ],
      ],
    );
  }
}
