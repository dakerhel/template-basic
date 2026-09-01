import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../liquid_glass_provider.dart';
import 'app_pressable.dart';

/// Высококлассный карточный компонент с поддержкой двух независимых режимов:
///
/// 1. **Solid Mode** (по умолчанию): чистый непрозрачный дизайн (Apple / Linear / M3).
///    Светлая тема: #FFFFFF карточка, 1px border #E2E8F0, ультра-мягкая тень.
///    Тёмная тема:  surfaceContainerHighest, 1px border white.08.
///
/// 2. **Liquid Frosted Glass Mode** (только тёмная тема!):
///    BackdropFilter(sigma: 18) + alpha(0.50). В светлой теме Glass == Solid
///    (BackdropFilter на белом фоне визуально бессмысленен).
///
/// Параметр [isHighlighted] заменяет старую "магию" borderOpacity > 0.5:
/// true → акцентный бордер primary + лёгкая тень primary.
class AppGlassCard extends ConsumerWidget {
  const AppGlassCard({
    super.key,
    required this.child,
    this.borderRadius = 12.0,
    this.blur = 18.0,
    this.padding,
    this.margin,
    this.onTap,
    this.onLongPress,
    this.enablePressAnimation = true,
    this.forceGlass,
    this.isHighlighted = false,
    // Deprecated — kept for binary compatibility, ignored internally.
    @Deprecated('Use isHighlighted instead') double tintOpacity = 0.80,
    @Deprecated('Use isHighlighted instead') double borderOpacity = 0.20,
  });

  final Widget child;
  final double borderRadius;
  final double blur;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enablePressAnimation;

  /// Если не null — переопределяет глобальный liquidGlassProvider.
  final bool? forceGlass;

  /// true → акцентный бордер цвета primary и слабая primary-тень.
  /// Используется для выбранных/активных карточек в списках.
  final bool isHighlighted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isGlassEnabled = forceGlass ?? ref.watch(liquidGlassProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorScheme = theme.colorScheme;

    Widget cardBody;

    if (isGlassEnabled) {
      // ─── РЕЖИМ LIQUID FROSTED GLASS (Светлая и Тёмная темы) ─────────────────
      final glassColor = isDark
          ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.50)
          : Colors.white.withValues(alpha: 0.72);

      final borderColor = isDark
          ? (isHighlighted
              ? colorScheme.primary.withValues(alpha: 0.60)
              : Colors.white.withValues(alpha: 0.12))
          : (isHighlighted
              ? colorScheme.primary.withValues(alpha: 0.60)
              : Colors.white.withValues(alpha: 0.90));

      final List<BoxShadow> shadows = [
        BoxShadow(
          color: const Color(0xFF0F172A).withValues(alpha: isDark ? 0.22 : 0.05),
          blurRadius: isDark ? 16 : 18,
          offset: const Offset(0, 3),
        ),
        if (!isDark)
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        if (isHighlighted)
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: isDark ? 0.18 : 0.12),
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
      ];

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
                width: isHighlighted ? 1.5 : 1.0,
              ),
              boxShadow: shadows,
            ),
            child: Material(
              type: MaterialType.transparency,
              child: child,
            ),
          ),
        ),
      );
    } else if (isDark) {
      // ─── ТЁМНАЯ ТЕМА, SOLID ─────────────────────────────────────────────────
      final solidBg = isHighlighted
          ? Color.alphaBlend(
              colorScheme.primary.withValues(alpha: 0.10),
              colorScheme.surfaceContainerHighest,
            )
          : colorScheme.surfaceContainerHighest;

      final solidBorder = isHighlighted
          ? colorScheme.primary.withValues(alpha: 0.55)
          : Colors.white.withValues(alpha: 0.08);

      cardBody = Container(
        padding: padding,
        decoration: BoxDecoration(
          color: solidBg,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: solidBorder, width: isHighlighted ? 1.5 : 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.20),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.14),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
            if (isHighlighted)
              BoxShadow(
                color: colorScheme.primary.withValues(alpha: 0.16),
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
    } else {
      // ─── СВЕТЛАЯ ТЕМА, SOLID ────────────────────────────────────────────────
      final solidBg = isHighlighted
          ? Color.alphaBlend(
              colorScheme.primary.withValues(alpha: 0.06),
              Colors.white,
            )
          : Colors.white;

      final solidBorder = isHighlighted
          ? colorScheme.primary.withValues(alpha: 0.45)
          : const Color(0xFFE2E8F0);

      cardBody = Container(
        padding: padding,
        decoration: BoxDecoration(
          color: solidBg,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: solidBorder, width: isHighlighted ? 1.5 : 1.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha: 0.04),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
            if (isHighlighted)
              BoxShadow(
                color: colorScheme.primary.withValues(alpha: 0.10),
                blurRadius: 6,
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
