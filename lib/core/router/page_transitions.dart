import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/tokens/app_animations.dart';

/// Кинематографичный и плавный переход между экранами (Slide + Fade)
/// в стиле Apple iOS / visionOS с кривой [AppAnimations.smoothOut].
CustomTransitionPage<void> buildAppSlideFadeTransition({
  required LocalKey key,
  required Widget child,
  Duration? transitionDuration,
  Duration? reverseTransitionDuration,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: transitionDuration ?? AppAnimations.pageTransition,
    reverseTransitionDuration:
        reverseTransitionDuration ?? AppAnimations.pageTransition,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: AppAnimations.smoothOut,
        reverseCurve: Curves.easeInCubic,
      );

      final slideAnimation = Tween<Offset>(
        begin: const Offset(0.08, 0.0),
        end: Offset.zero,
      ).animate(curvedAnimation);

      final fadeAnimation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(curvedAnimation);

      return SlideTransition(
        position: slideAnimation,
        child: FadeTransition(
          opacity: fadeAnimation,
          child: child,
        ),
      );
    },
  );
}
