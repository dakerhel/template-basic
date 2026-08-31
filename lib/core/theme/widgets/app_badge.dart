import 'package:flutter/material.dart';

import 'app_pressable.dart';

enum AppBadgeVariant {
  primary,
  success,
  warning,
  error,
  neutral,
}

/// Статусный бейдж дизайн-системы с мягким свечением и поддержкой тем
class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.label,
    this.variant = AppBadgeVariant.primary,
    this.icon,
    this.isDot = false,
  });

  final String label;
  final AppBadgeVariant variant;
  final Widget? icon;
  final bool isDot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final isDark = theme.brightness == Brightness.dark;

    final (Color accentColor, Color textColor) = switch (variant) {
      AppBadgeVariant.primary => (
          colorScheme.primary,
          colorScheme.primary,
        ),
      AppBadgeVariant.success => (
          isDark ? const Color(0xFF34D399) : const Color(0xFF047857),
          isDark ? const Color(0xFF34D399) : const Color(0xFF047857),
        ),
      AppBadgeVariant.warning => (
          isDark ? const Color(0xFFFBBF24) : const Color(0xFFB45309),
          isDark ? const Color(0xFFFBBF24) : const Color(0xFFB45309),
        ),
      AppBadgeVariant.error => (
          colorScheme.error,
          colorScheme.error,
        ),
      AppBadgeVariant.neutral => (
          colorScheme.onSurfaceVariant,
          colorScheme.onSurfaceVariant,
        ),
    };

    if (isDot) {
      return Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: accentColor,
          boxShadow: [
            BoxShadow(
              color: accentColor.withValues(alpha: 0.5),
              blurRadius: 6,
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: accentColor.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: IconThemeData(size: 12, color: textColor),
              child: icon!,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 11,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}

/// Интерактивный переиспользуемый чип / тег (AppChip)
class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.icon,
    this.onDeleted,
  });

  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final Widget? icon;
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = isSelected
        ? (isDark
            ? colorScheme.primary.withValues(alpha: 0.22)
            : colorScheme.primaryContainer)
        : (isDark
            ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.5)
            : colorScheme.surfaceContainerHighest.withValues(alpha: 0.7));

    final textColor = isSelected
        ? (isDark ? colorScheme.primary : colorScheme.onPrimaryContainer)
        : colorScheme.onSurfaceVariant;

    final borderColor = isSelected
        ? colorScheme.primary.withValues(alpha: 0.45)
        : colorScheme.outline.withValues(alpha: 0.15);

    Widget chipContent = Container(
      padding: EdgeInsets.fromLTRB(
        icon != null ? 8 : 12,
        6,
        onDeleted != null ? 6 : 12,
        6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            IconTheme(
              data: IconThemeData(size: 14, color: textColor),
              child: icon!,
            ),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: textColor,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
          if (onDeleted != null) ...[
            const SizedBox(width: 4),
            InkWell(
              onTap: onDeleted,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(
                  Icons.close_rounded,
                  size: 14,
                  color: textColor.withValues(alpha: 0.7),
                ),
              ),
            ),
          ],
        ],
      ),
    );

    if (onTap == null) {
      return chipContent;
    }

    return AppPressable(
      onTap: onTap,
      pressedScale: 0.95,
      child: chipContent,
    );
  }
}
