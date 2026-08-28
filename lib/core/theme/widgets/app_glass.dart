import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../liquid_glass_provider.dart';

/// Высококлассный компонент в стиле Apple Liquid Glass / Frosted Glass (iOS / visionOS).
/// Обеспечивает настоящее оптическое размытие фона, тонкие градиентные блики (specular highlight)
/// и адаптивный полупрозрачный оттенок под активную цветовую палитру приложения.
/// При отключении Liquid Glass плавно переключается на чистый Material 3 Solid стиль.
class AppGlassCard extends ConsumerWidget {
  const AppGlassCard({
    super.key,
    required this.child,
    this.borderRadius = 20.0,
    this.blur = 16.0,
    this.tintOpacity = 0.65,
    this.borderOpacity = 0.25,
    this.padding,
    this.margin,
    this.onTap,
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
  final bool? forceGlass;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isGlassEnabled = forceGlass ?? ref.watch(liquidGlassProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorScheme = theme.colorScheme;

    Widget content;

    if (isGlassEnabled == true) {
      // Базовый цвет стекла адаптируется под тему (темный оттенок на dark/oled, светлый на light)
      final glassColor = isDark
          ? colorScheme.surfaceContainerHighest.withValues(alpha: tintOpacity)
          : colorScheme.surface.withValues(alpha: tintOpacity);

      // Градиентная кайма: сверху блик света (светлее), снизу затенение
      final topBorderColor = isDark
          ? Colors.white.withValues(alpha: borderOpacity)
          : Colors.white.withValues(alpha: borderOpacity * 1.5);
      final bottomBorderColor = isDark
          ? colorScheme.primary.withValues(alpha: borderOpacity * 0.4)
          : colorScheme.primary.withValues(alpha: borderOpacity * 0.2);

      content = ClipRRect(
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
                  topBorderColor.withValues(alpha: 0.15),
                  bottomBorderColor.withValues(alpha: 0.05),
                ],
              ),
            ),
            child: child,
          ),
        ),
      );
    } else {
      // Solid Material 3 Surface
      content = Container(
        padding: padding,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.15),
            width: 1.0,
          ),
        ),
        child: child,
      );
    }

    if (onTap != null) {
      content = Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: content,
        ),
      );
    }

    if (margin != null) {
      content = Padding(padding: margin!, child: content);
    }

    return content;
  }
}
