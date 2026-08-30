import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../liquid_glass_provider.dart';
import 'app_pressable.dart';

/// Высококлассный компонент в стиле Apple Liquid Glass / Frosted Glass (iOS / visionOS).
/// Обеспечивает настоящее оптическое размытие фона, тонкие градиентные блики (specular highlight),
/// адаптивный полупрозрачный оттенок под активную цветовую палитру приложения
/// и упругий пружинящий тактильный отклик при нажатии.
class AppGlassCard extends ConsumerWidget {
  const AppGlassCard({
    super.key,
    required this.child,
    this.borderRadius = 20.0,
    this.blur = 20.0,
    this.tintOpacity = 0.65,
    this.borderOpacity = 0.22,
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
          : colorScheme.surface.withValues(alpha: tintOpacity * 0.90);

      final topBorderColor = isDark
          ? Colors.white.withValues(alpha: borderOpacity)
          : Colors.white.withValues(alpha: borderOpacity * 1.5);
      final bottomBorderColor = isDark
          ? colorScheme.primary.withValues(alpha: borderOpacity * 0.4)
          : colorScheme.primary.withValues(alpha: borderOpacity * 0.2);

      cardBody = ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: glassColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: topBorderColor, width: 1.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  topBorderColor.withValues(alpha: 0.12),
                  bottomBorderColor.withValues(alpha: 0.04),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.06),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
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
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.15),
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.04),
              blurRadius: 12,
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
