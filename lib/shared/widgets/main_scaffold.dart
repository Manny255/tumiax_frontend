// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../core/localization/app_localizations.dart';
// import '../../core/providers/connectivity_provider.dart';
// import '../../core/themes/app_theme.dart';
// import 'bottom_nav_bar.dart';

// class MainScaffold extends ConsumerStatefulWidget {
//   final Widget child;

//   const MainScaffold({super.key, required this.child});

//   @override
//   ConsumerState<MainScaffold> createState() => _MainScaffoldState();
// }

// class _MainScaffoldState extends ConsumerState<MainScaffold> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context);
//     final connectivityStatus = ref.watch(connectivityProvider);
//     final isOffline = connectivityStatus == ConnectivityStatus.offline;

//     return Scaffold(
//       key: _scaffoldKey,
//       body: Stack(
//         children: [
//           widget.child,
//           if (isOffline)
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: SafeArea(
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 8,
//                     horizontal: 16,
//                   ),
//                   color: AppTheme.errorColor,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Icon(Icons.wifi_off, color: Colors.white, size: 16),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           t.translate(
//                             'offline_message',
//                             params: {'app': 'TumiaX'},
//                           ),
//                           style: AppTheme.caption.copyWith(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//       bottomNavigationBar: const BottomNavBar(),
//     );
//   }
// }

// lib/shared/widgets/main_scaffold.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'bottom_nav_bar.dart';
import '../../core/themes/app_theme.dart';
import '../../core/providers/connectivity_provider.dart';
import '../../core/localization/app_localizations.dart';

class MainScaffold extends ConsumerStatefulWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  ConsumerState<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends ConsumerState<MainScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final connectivityStatus = ref.watch(connectivityProvider);
    final isOffline = connectivityStatus == ConnectivityStatus.offline;

    return Scaffold(
      key: _scaffoldKey,
      // drawer: const AppDrawer(),
      body: Stack(
        children: [
          // Main content
          widget.child,

          // Offline Banner
          if (isOffline)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  color: AppTheme.errorColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.wifi_off, color: Colors.white, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          t.translate(
                            'offline_message',
                            params: {'app': 'TumiaX'},
                          ),
                          style: AppTheme.caption.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
