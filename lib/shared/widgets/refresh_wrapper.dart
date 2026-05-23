// //lib\shared\widgets\refresh_wrapper.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../core/themes/app_theme.dart';

// class RefreshWrapper extends ConsumerStatefulWidget {
//   final Widget child;
//   final Future<void> Function() onRefresh;
//   final bool showLoadingIndicator;

//   const RefreshWrapper({
//     super.key,
//     required this.child,
//     required this.onRefresh,
//     this.showLoadingIndicator = true,
//   });

//   @override
//   ConsumerState<RefreshWrapper> createState() => _RefreshWrapperState();
// }

// class _RefreshWrapperState extends ConsumerState<RefreshWrapper> {
//   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
//       GlobalKey<RefreshIndicatorState>();

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       key: _refreshIndicatorKey,
//       onRefresh: widget.onRefresh,
//       color: AppTheme.primaryColor,
//       backgroundColor: Colors.white,
//       strokeWidth: 2,
//       displacement: 40,
//       child: widget.showLoadingIndicator
//           ? Stack(
//               children: [
//                 widget.child,
//                 // Pull to refresh hint
//                 Positioned(
//                   top: 10,
//                   left: 0,
//                   right: 0,
//                   child: Center(
//                     child: AnimatedOpacity(
//                       opacity: _isDragging ? 1 : 0,
//                       duration: const Duration(milliseconds: 200),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               blurRadius: 5,
//                               offset: const Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             const Icon(
//                               Icons.arrow_downward,
//                               size: 16,
//                               color: AppTheme.primaryColor,
//                             ),
//                             const SizedBox(width: 8),
//                             Text(
//                               'Pull to refresh',
//                               style: AppTheme.caption.copyWith(
//                                 color: AppTheme.primaryColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           : widget.child,
//     );
//   }

//   bool get _isDragging =>
//       _refreshIndicatorKey.currentState?.isRefreshIndicatorDragging ?? false;
// }

// // Pull-to-refresh wrapper with custom scroll physics
// class CustomScrollRefreshWrapper extends StatelessWidget {
//   final Widget child;
//   final Future<void> Function() onRefresh;

//   const CustomScrollRefreshWrapper({
//     super.key,
//     required this.child,
//     required this.onRefresh,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: onRefresh,
//       color: AppTheme.primaryColor,
//       child: CustomScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         slivers: [SliverToBoxAdapter(child: child)],
//       ),
//     );
//   }
// }

// // Nested refresh wrapper for tabs
// class NestedRefreshWrapper extends StatefulWidget {
//   final Widget child;
//   final Future<void> Function() onRefresh;

//   const NestedRefreshWrapper({
//     super.key,
//     required this.child,
//     required this.onRefresh,
//   });

//   @override
//   State<NestedRefreshWrapper> createState() => _NestedRefreshWrapperState();
// }

// class _NestedRefreshWrapperState extends State<NestedRefreshWrapper> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: widget.onRefresh,
//       color: AppTheme.primaryColor,
//       child: SingleChildScrollView(
//         controller: _scrollController,
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: widget.child,
//       ),
//     );
//   }
// }
