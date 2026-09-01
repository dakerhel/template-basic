import 'package:flutter/material.dart';

import 'app_pressable.dart';

enum AppButtonVariant {
  filled,
  tonal,
  outlined,
  ghost,
  danger,
}

enum AppButtonSize {
  small(36.0, 13.0, 16.0),
  medium(46.0, 15.0, 18.0),
  large(54.0, 16.0, 20.0);

  const AppButtonSize(this.height, this.fontSize, this.iconSize);
  final double height;
  final double fontSize;
  final double iconSize;
}

/// Высококлассная переиспользуемая кнопка дизайн-системы с физикой нажатия,
/// поддержкой состояний загрузки, иконками и семантическими стилями.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.filled,
    this.size = AppButtonSize.medium,
    this.leadingIcon,
    this.trailingIcon,
    this.isLoading = false,
    this.isFullWidth = false,
    this.borderRadius,
    this.padding,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool isLoading;
  final bool isFullWidth;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final bool isEnabled = onPressed != null && !isLoading;

    // Определение цветовой схемы кнопки
    Color backgroundColor;
    Color foregroundColor;
    Border? border;

    switch (variant) {
      case AppButtonVariant.filled:
        backgroundColor = isEnabled
            ? colorScheme.primary
            : colorScheme.onSurface.withValues(alpha: 0.12);
        foregroundColor = isEnabled
            ? colorScheme.onPrimary
            : colorScheme.onSurface.withValues(alpha: 0.38);
        break;

      case AppButtonVariant.tonal:
        backgroundColor = isEnabled
            ? (isDark
                ? colorScheme.primary.withValues(alpha: 0.18)
                : colorScheme.primaryContainer)
            : colorScheme.surfaceContainerHighest.withValues(alpha: 0.30);
        foregroundColor = isEnabled
            ? (isDark ? colorScheme.primary : colorScheme.onPrimaryContainer)
            : colorScheme.onSurface.withValues(alpha: 0.38);
        border = Border.all(
          color: isEnabled
              ? (isDark
                  ? colorScheme.primary.withValues(alpha: 0.35)
                  : colorScheme.primary.withValues(alpha: 0.25))
              : Colors.transparent,
        );
        break;

      case AppButtonVariant.outlined:
        backgroundColor = Colors.transparent;
        foregroundColor = isEnabled
            ? colorScheme.primary
            : colorScheme.onSurface.withValues(alpha: 0.38);
        border = Border.all(
          color: isEnabled
              ? (isDark
                  ? colorScheme.primary.withValues(alpha: 0.45)
                  : colorScheme.primary.withValues(alpha: 0.45))
              : colorScheme.outline.withValues(alpha: 0.20),
          width: 1.2,
        );
        break;

      case AppButtonVariant.ghost:
        backgroundColor = Colors.transparent;
        foregroundColor = isEnabled
            ? colorScheme.primary
            : colorScheme.onSurface.withValues(alpha: 0.38);
        break;

      case AppButtonVariant.danger:
        backgroundColor = isEnabled
            ? colorScheme.error
            : colorScheme.onSurface.withValues(alpha: 0.12);
        foregroundColor = isEnabled
            ? colorScheme.onError
            : colorScheme.onSurface.withValues(alpha: 0.38);
        break;
    }

    final double effectiveRadius = borderRadius ?? 14.0;
    final EdgeInsetsGeometry effectivePadding = padding ??
        EdgeInsets.symmetric(
          horizontal: size == AppButtonSize.small ? 14 : 20,
        );

    Widget content = Row(
      mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: size.iconSize,
            height: size.iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
            ),
          ),
          const SizedBox(width: 8),
        ] else if (leadingIcon != null) ...[
          IconTheme(
            data: IconThemeData(size: size.iconSize, color: foregroundColor),
            child: leadingIcon!,
          ),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              fontSize: size.fontSize,
              fontWeight: FontWeight.w600,
              color: foregroundColor,
              letterSpacing: 0.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (!isLoading && trailingIcon != null) ...[
          const SizedBox(width: 8),
          IconTheme(
            data: IconThemeData(size: size.iconSize, color: foregroundColor),
            child: trailingIcon!,
          ),
        ],
      ],
    );

    Widget button = Container(
      height: size.height,
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(effectiveRadius),
        border: border,
        boxShadow: variant == AppButtonVariant.filled && isEnabled
            ? [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Center(
        widthFactor: isFullWidth ? null : 1.0,
        child: content,
      ),
    );

    if (isFullWidth) {
      button = SizedBox(width: double.infinity, child: button);
    }

    if (!isEnabled) {
      return Opacity(opacity: 0.65, child: button);
    }

    return AppPressable(
      onTap: onPressed,
      pressedScale: 0.97,
      hapticFeedbackType: variant == AppButtonVariant.danger
          ? HapticFeedbackType.heavy
          : HapticFeedbackType.light,
      child: button,
    );
  }
}

/// Компактная иконочная кнопка дизайн-системы с физикой нажатия
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.variant = AppButtonVariant.ghost,
    this.size = 42.0,
    this.iconSize = 20.0,
    this.tooltip,
    this.borderRadius,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final double size;
  final double iconSize;
  final String? tooltip;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final bool isEnabled = onPressed != null;

    Color backgroundColor;
    Color foregroundColor;
    Border? border;

    switch (variant) {
      case AppButtonVariant.filled:
        backgroundColor = isEnabled ? colorScheme.primary : Colors.transparent;
        foregroundColor =
            isEnabled ? colorScheme.onPrimary : colorScheme.onSurfaceVariant;
        break;
      case AppButtonVariant.tonal:
        backgroundColor = isDark
            ? colorScheme.primary.withValues(alpha: 0.18)
            : colorScheme.primaryContainer;
        foregroundColor = isDark
            ? colorScheme.primary
            : colorScheme.onPrimaryContainer;
        border = Border.all(
          color: colorScheme.primary.withValues(alpha: isDark ? 0.35 : 0.25),
        );
        break;
      case AppButtonVariant.outlined:
        backgroundColor = Colors.transparent;
        foregroundColor = colorScheme.primary;
        border = Border.all(
          color: colorScheme.primary.withValues(alpha: 0.35),
        );
        break;
      case AppButtonVariant.ghost:
        backgroundColor = Colors.transparent;
        foregroundColor = colorScheme.onSurface;
        break;
      case AppButtonVariant.danger:
        backgroundColor = colorScheme.error.withValues(alpha: 0.12);
        foregroundColor = colorScheme.error;
        break;
    }

    final double effectiveRadius = borderRadius ?? (size / 2);

    Widget result = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(effectiveRadius),
        border: border,
      ),
      alignment: Alignment.center,
      child: IconTheme(
        data: IconThemeData(
          size: iconSize,
          color: isEnabled
              ? foregroundColor
              : foregroundColor.withValues(alpha: 0.38),
        ),
        child: icon,
      ),
    );

    if (tooltip != null) {
      result = Tooltip(message: tooltip!, child: result);
    }

    if (!isEnabled) {
      return Opacity(opacity: 0.5, child: result);
    }

    return AppPressable(
      onTap: onPressed,
      pressedScale: 0.92,
      child: result,
    );
  }
}
