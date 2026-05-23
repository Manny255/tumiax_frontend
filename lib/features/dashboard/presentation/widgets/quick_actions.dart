import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/localization/app_localizations.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // _buildActionButton(
        //   context,
        //   icon: Icons.add_circle_outline,
        //   label: t.translate('add_asset'),
        //   color: AppTheme.primaryColor,
        //   onTap: () => context.push(RouteNames.addAsset),
        // ),
        _buildActionButton(
          context,
          icon: Icons.qr_code_scanner,
          label: t.translate('pay'),
          color: AppTheme.primaryColor,
          onTap: () => context.push(RouteNames.pay),
        ),
        _buildActionButton(
          context,
          icon: Icons.swap_horiz,
          label: t.translate('transfer'),
          color: AppTheme.accentColor,
          onTap: () => context.push(RouteNames.transefer),
        ),
        // _buildActionButton(
        //   context,
        //   icon: Icons.shop,
        //   label: t.translate('shop'),
        //   color: Colors.purple,
        //   onTap: () => context.push(RouteNames.shop),
        // ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTheme.caption.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
