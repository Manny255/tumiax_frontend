//lib\shared\widgets\bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/themes/app_theme.dart';
import '../../core/routing/route_names.dart';
import '../../core/localization/app_localizations.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final location = GoRouterState.of(context).uri.toString();

    int currentIndex = _getCurrentIndex(location);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: AppTheme.caption.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppTheme.caption,
        onTap: (index) => _onTap(context, index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: t.translate('home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_balance_wallet_outlined),
            activeIcon: const Icon(Icons.account_balance_wallet),
            label: t.translate('credit'),
          ),
          // BottomNavigationBarItem(
          //   icon: Container(
          //     padding: const EdgeInsets.all(8),
          //     decoration: BoxDecoration(
          //       color: AppTheme.primaryColor.withOpacity(0.1),
          //       shape: BoxShape.circle,
          //     ),
          //     child: const Icon(
          //       Icons.qr_code_scanner,
          //       color: AppTheme.primaryColor,
          //     ),
          //   ),
          //   label: '',
          // ),
          // BottomNavigationBarItem(
          //   icon: const Icon(Icons.attach_money_outlined),
          //   activeIcon: const Icon(Icons.attach_money),
          //   label: t.translate('wallet'),
          // ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            label: t.translate('settings'),
          ),
        ],
      ),
    );
  }

  int _getCurrentIndex(String location) {
    if (location.contains(RouteNames.home)) return 0;
    if (location.contains(RouteNames.credit)) return 1;
    if (location.contains(RouteNames.settings)) return 2;
    // if (location.contains(RouteNames.kyc)) return 4;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(RouteNames.home);
        break;
      case 1:
        context.go(RouteNames.credit);
        break;
      case 2:
          context.go(RouteNames.settings);
        // // Show QR Scanner
        // _showQRScanner(context);
        break;
      // case 3:
      //   context.go(RouteNames.wallet);
      //   break;
      // case 4:
      //   context.go(RouteNames.profile);
      //   break;
    }
  }

  void _showQRScanner(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        height: 300,
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.qr_code_scanner,
              size: 80,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 20),
            Text('Scan QR Code', style: AppTheme.heading3),
            const SizedBox(height: 8),
            Text(
              'Scan to pay or receive payments',
              style: AppTheme.body2.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigate to full QR scanner
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Open Scanner'),
            ),
          ],
        ),
      ),
    );
  }
}
