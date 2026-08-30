import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../liquid_glass_provider.dart';
import 'app_pressable.dart';

/// Высококлассный компонент в стиле Apple Liquid Glass / Frosted Glass (iOS / visionOS).
/// Обеспечивает настоящее оптическое размытие фона, чёткие контуры, тонкие градиентные блики (specular highlight),
/// адаптивный полупрозрачный оттенок и упругий пружинящий тактильный отклик при нажатии.
class AppGlassCard extends ConsumerWidget {
  const AppGlassCard({
    super.key,
    required this.child,
    this.borderRadius = 20.0,
    this.blur = 20.0,
    this.tintOpacity = 0.80,
    this.borderOpacity = 0.20,
    this.padding,
    this.margin,
    this.onTap,
    this.onLongPress,
    this.enablePressAnimation = true,
    this.forceGlass,
  });

  final Widget child;
  final double borderRadius;
  final double blur;
  final double tintOpacity;
  final double borderOpacity;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enablePressAnimation;
  final bool? forceGlass;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isGlassEnabled = forceGlass ?? ref.watch(liquidGlassProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorScheme = theme.colorScheme;

    Widget cardBody;

    if (isGlassEnabled == true) {
      final glassColor = isDark
          ? colorScheme.surfaceContainerHighest.withValues(alpha: tintOpacity * 0.85)
          : Colors.white.withValues(alpha: 0.85);

      final borderColor = isDark
          ? Colors.white.withValues(alpha: borderOpacity)
          : Colors.black.withValues(alpha: 0.08);

      cardBody = ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: glassColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor, width: 1.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.06),
                  blurRadius: isDark ? 20 : 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: child,
          ),
        ),
      );
    } else {
      cardBody = Container(
        padding: padding,
        decoration: BoxDecoration(
          color: isDark
              ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.75)
              : Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.15)
                : Colors.black.withValues(alpha: 0.08),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.20 : 0.05),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: child,
      );
    }

    final bool isInteractive = onTap != null || onLongPress != null;

    if (isInteractive) {
      if (enablePressAnimation) {
        cardBody = AppPressable(
          onTap: onTap,
          onLongPress: onLongPress,
          pressedScale: 0.98,
          child: cardBody,
        );
      } else {
        cardBody = GestureDetector(
          onTap: onTap,
          onLongPress: onLongPress,
          behavior: HitTestBehavior.opaque,
          child: cardBody,
        );
      }
    }

    if (margin != null) {
      cardBody = Padding(padding: margin!, child: cardBody);
    }

    return cardBody;
  }
}
