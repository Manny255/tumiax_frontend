// presentation/pages/add_asset_page/widgets/step_animations.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Widget Function(Widget, Animation<double>) buildFadeTransition =
    (child, animation) => FadeTransition(opacity: animation, child: child);

double useFadeAnimation(AnimationController controller) {
  return useAnimation(
    Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn)),
  );
}
