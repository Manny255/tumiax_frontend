import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class AssetToCashAnimation extends StatefulWidget {
  const AssetToCashAnimation({super.key});

  @override
  State<AssetToCashAnimation> createState() => _AssetToCashAnimationState();
}

class _AssetToCashAnimationState extends State<AssetToCashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool showCash = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.addListener(() {
      if (_controller.value > 0.5) {
        if (!showCash) {
          setState(() => showCash = true);
        }
      } else {
        if (showCash) {
          setState(() => showCash = false);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAssetIcon(IconData icon, double offsetX, double offsetY) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(
            offsetX * (1 - _animation.value),
            offsetY * (1 - _animation.value),
          ),
          child: Opacity(opacity: showCash ? 0.0 : 1.0, child: child),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.surfaceVariant,
        ),
        child: Icon(
          icon,
          size: 28,
          color: Theme.of(context).colorScheme.primary,
        ),
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
          /// Assets
          _buildAssetIcon(Icons.motorcycle, -60, -60),
          _buildAssetIcon(Icons.directions_car, 60, -60),
          _buildAssetIcon(Icons.home, -60, 60),
          _buildAssetIcon(Icons.landscape, 60, 60),

          /// Cash Result
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: showCash ? 1.0 : 0.0,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 500),
              scale: showCash ? 1.0 : 0.6,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppTheme.primaryGradient,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.secondaryColor.withOpacity(0.5),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.payments,
                  size: 40,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
