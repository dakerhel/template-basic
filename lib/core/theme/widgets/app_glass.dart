import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../liquid_glass_provider.dart';
import 'app_pressable.dart';

/// Высококлассный карточный компонент с поддержкой двух независимых режимов:
/// 1. Standalone Solid Mode: чистый, эталонный карточный дизайн (Apple / Linear / Material 3)
///    с белоснежными/глубокими непрозрачными поверхностями, четкими микро-бордерами и мягкими тенями.
/// 2. Liquid Frosted Glass Mode: кристальное матовое стекло с оптическим размытием и световыми бликами.
class AppGlassCard extends ConsumerWidget {
  const AppGlassCard({
    super.key,
    required this.child,
    this.borderRadius = 12.0,
    this.blur = 16.0,
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
      // --- РЕЖИМ LIQUID FROSTED GLASS ---
      final glassColor = isDark
          ? colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.52,
            )
          : Colors.white.withValues(alpha: 0.72);

      final borderColor = isDark
          ? (borderOpacity > 0.5
              ? colorScheme.primary.withValues(alpha: borderOpacity * 0.8)
              : Colors.white.withValues(alpha: 0.12))
          : (borderOpacity > 0.5
              ? colorScheme.primary.withValues(alpha: borderOpacity * 0.6)
              : Colors.black.withValues(alpha: 0.06));

      cardBody = ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: glassColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: borderColor,
                width: borderOpacity > 0.5 ? 1.5 : 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.04),
                  blurRadius: isDark ? 16 : 10,
                  offset: const Offset(0, 2),
                ),
                if (borderOpacity > 0.5)
                  BoxShadow(
                    color: colorScheme.primary.withValues(
                      alpha: isDark ? 0.18 : 0.08,
                    ),
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
              ],
            ),
            child: Material(
              type: MaterialType.transparency,
              child: child,
            ),
          ),
        ),
      );
    } else {
      // --- РЕЖИМ STANDALONE SOLID (Apple / Linear / M3) ---
      final solidBg = isDark
          ? (borderOpacity > 0.5
              ? Color.alphaBlend(
                  colorScheme.primary.withValues(alpha: 0.12),
                  colorScheme.surfaceContainerHighest,
                )
              : colorScheme.surfaceContainerHighest)
          : (borderOpacity > 0.5
              ? Color.alphaBlend(
                  colorScheme.primary.withValues(alpha: 0.04),
                  Colors.white,
                )
              : Colors.white);

      final solidBorder = isDark
          ? (borderOpacity > 0.5
              ? colorScheme.primary.withValues(alpha: 0.60)
              : Colors.white.withValues(alpha: 0.08))
          : (borderOpacity > 0.5
              ? colorScheme.primary.withValues(alpha: 0.50)
              : const Color(0xFFE2E8F0));

      cardBody = Container(
        padding: padding,
        decoration: BoxDecoration(
          color: solidBg,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: solidBorder,
            width: borderOpacity > 0.5 ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.20 : 0.03),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.02),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
            if (borderOpacity > 0.5)
              BoxShadow(
                color: colorScheme.primary.withValues(
                  alpha: isDark ? 0.16 : 0.06,
                ),
                blurRadius: 8,
                offset: const Offset(0, 1),
              ),
          ],
        ),
        child: Material(
          type: MaterialType.transparency,
          child: child,
        ),
      );
    }

    final bool isInteractive = onTap != null || onLongPress != null;

    if (isInteractive) {
      if (enablePressAnimation) {
        cardBody = AppPressable(
          onTap: onTap,
          onLongPress: onLongPress,
          pressedScale: 0.985,
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
