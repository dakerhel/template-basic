import 'dart:ui';
import 'package:flutter/material.dart';

/// Высококлассный компонент в стиле Apple Liquid Glass / Frosted Glass (iOS / visionOS).
/// Обеспечивает настоящее оптическое размытие фона, тонкие градиентные блики (specular highlight)
/// и адаптивный полупрозрачный оттенок под активную цветовую палитру приложения.
class AppGlassCard extends StatelessWidget {
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
  });

  final Widget child;
  final double borderRadius;
  final double blur;
  final double tintOpacity;
  final double borderOpacity;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorScheme = theme.colorScheme;

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

    Widget content = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: glassColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: topBorderColor,
              width: 1.0,
            ),
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
