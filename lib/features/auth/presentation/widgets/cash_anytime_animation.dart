import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class CashAnytimeAnimation extends StatefulWidget {
  const CashAnytimeAnimation({super.key});

  @override
  State<CashAnytimeAnimation> createState() => _CashAnytimeAnimationState();
}

class _CashAnytimeAnimationState extends State<CashAnytimeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFlowingCoin(double delay) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = (_controller.value + delay) % 1.0;

        return Transform.translate(
          offset: Offset(0, -80 * progress),
          child: Opacity(opacity: 1 - progress, child: child),
        );
      },
      child: Icon(
        Icons.monetization_on,
        color: Theme.of(context).colorScheme.secondary,
        size: 24,
      ),
    );
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
          /// Wallet Glow
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final scale = 1 + (_controller.value * 0.05);
              return Transform.scale(scale: scale, child: child);
            },
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppTheme.primaryGradient,
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.secondary.withOpacity(0.4),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Icon(
                Icons.account_balance_wallet,
                size: 40,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),

          /// Flowing coins
          _buildFlowingCoin(0.0),
          _buildFlowingCoin(0.3),
          _buildFlowingCoin(0.6),
        ],
      ),
    );
  }
}
