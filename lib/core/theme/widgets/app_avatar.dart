import 'package:flutter/material.dart';

import 'app_pressable.dart';

/// Размеры аватара в дизайн-системе.
enum AppAvatarSize {
  small(32.0, 12.0, 8.0),
  medium(44.0, 16.0, 10.0),
  large(58.0, 20.0, 13.0),
  xlarge(76.0, 26.0, 16.0);

  const AppAvatarSize(this.dimension, this.fontSize, this.statusDotSize);

  final double dimension;
  final double fontSize;
  final double statusDotSize;
}

/// Статус присутствия пользователя.
enum AppAvatarStatus {
  online(Color(0xFF10B981)),
  busy(Color(0xFFEF4444)),
  away(Color(0xFFF59E0B)),
  offline(Color(0xFF9CA3AF));

  const AppAvatarStatus(this.color);

  final Color color;
}

/// Премиальный компонент аватара с поддержкой изображений, инициалов,
/// статусной точки присутствия и тактильного нажатия.
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.icon,
    this.size = AppAvatarSize.medium,
    this.status,
    this.showBorder = true,
    this.onTap,
  });

  final String? imageUrl;
  final String? initials;
  final IconData? icon;
  final AppAvatarSize size;
  final AppAvatarStatus? status;
  final bool showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final borderColor = isDark
        ? colorScheme.primary.withValues(alpha: 0.35)
        : colorScheme.primary.withValues(alpha: 0.25);

    Widget content;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      content = Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildFallback(colorScheme),
      );
    } else {
      content = _buildFallback(colorScheme);
    }

    final avatarCircle = Container(
      width: size.dimension,
      height: size.dimension,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorScheme.surfaceContainerHighest,
        border: showBorder
            ? Border.all(color: borderColor, width: size == AppAvatarSize.small ? 1.5 : 2.0)
            : null,
        boxShadow: showBorder
            ? [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: isDark ? 0.18 : 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: ClipOval(child: content),
    );

    Widget result;
    if (status != null) {
      result = SizedBox(
        width: size.dimension,
        height: size.dimension,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            avatarCircle,
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: size.statusDotSize,
                height: size.statusDotSize,
                decoration: BoxDecoration(
                  color: status!.color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.scaffoldBackgroundColor,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: status!.color.withValues(alpha: 0.5),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      result = avatarCircle;
    }

    if (onTap != null) {
      return AppPressable(onTap: onTap, child: result);
    }

    return result;
  }

  Widget _buildFallback(ColorScheme colorScheme) {
    if (initials != null && initials!.isNotEmpty) {
      final cleanInitials = initials!.trim().toUpperCase();
      final text = cleanInitials.length > 2
          ? cleanInitials.substring(0, 2)
          : cleanInitials;

      return Container(
        alignment: Alignment.center,
        color: colorScheme.primaryContainer,
        child: Text(
          text,
          style: TextStyle(
            fontSize: size.fontSize,
            fontWeight: FontWeight.bold,
            color: colorScheme.onPrimaryContainer,
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.center,
      color: colorScheme.primaryContainer,
      child: Icon(
        icon ?? Icons.person_rounded,
        size: size.dimension * 0.52,
        color: colorScheme.onPrimaryContainer,
      ),
    );
  }
}
