import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class KeepOwnershipAnimation extends StatefulWidget {
  const KeepOwnershipAnimation({super.key});

  @override
  State<KeepOwnershipAnimation> createState() => _KeepOwnershipAnimationState();
}

class _KeepOwnershipAnimationState extends State<KeepOwnershipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 220,
      width: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Subtle pulse
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final scale = 1 + (_controller.value * 0.08);
              return Transform.scale(scale: scale, child: child);
            },
            child: Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppTheme.primaryGradient,
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.secondary.withOpacity(0.3),
                    blurRadius: 25,
                  ),
                ],
              ),
              child: Icon(
                Icons.shield,
                size: 42,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),

          /// Money icon inside
          Icon(Icons.payments, size: 24, color: theme.colorScheme.onPrimary),
        ],
      ),
    );
  }
}
