import 'package:flutter/material.dart';

/// Линейный индикатор прогресса в стиле Liquid Glass / Modern M3.
/// Поддерживает детерминированное (0.0..1.0) и недетерминированное состояния,
/// а также опциональное неоновое свечение в тонах палитры.
class AppProgressBar extends StatelessWidget {
  const AppProgressBar({
    super.key,
    this.value,
    this.height = 8.0,
    this.borderRadius = 4.0,
    this.color,
    this.backgroundColor,
    this.showGlow = true,
  });

  final double? value;
  final double height;
  final double borderRadius;
  final Color? color;
  final Color? backgroundColor;
  final bool showGlow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final progressColor = color ?? colorScheme.primary;
    final trackColor = backgroundColor ??
        (isDark
            ? Colors.white.withValues(alpha: 0.10)
            : Colors.black.withValues(alpha: 0.06));

    final radius = BorderRadius.circular(borderRadius);

    if (value == null) {
      // Indeterminate
      return ClipRRect(
        borderRadius: radius,
        child: SizedBox(
          height: height,
          child: LinearProgressIndicator(
            backgroundColor: trackColor,
            color: progressColor,
            minHeight: height,
          ),
        ),
      );
    }

    final clampedValue = value!.clamp(0.0, 1.0);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: trackColor,
        borderRadius: radius,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final progressWidth = constraints.maxWidth * clampedValue;

          return Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                width: progressWidth,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: radius,
                  gradient: LinearGradient(
                    colors: [
                      progressColor.withValues(alpha: 0.85),
                      progressColor,
                    ],
                  ),
                  boxShadow: showGlow
                      ? [
                          BoxShadow(
                            color: progressColor.withValues(alpha: 0.40),
                            blurRadius: 8,
                            offset: const Offset(0, 1),
                          ),
                        ]
                      : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Круговой индикатор загрузки в едином стиле дизайн-системы.
class AppCircularProgress extends StatelessWidget {
  const AppCircularProgress({
    super.key,
    this.value,
    this.size = 32.0,
    this.strokeWidth = 3.0,
    this.color,
  });

  final double? value;
  final double size;
  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final progressColor = color ?? colorScheme.primary;

    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: strokeWidth,
        strokeCap: StrokeCap.round,
        color: progressColor,
        backgroundColor: progressColor.withValues(alpha: 0.15),
      ),
    );
  }
}
