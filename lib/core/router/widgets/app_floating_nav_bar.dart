import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/tokens/tokens.dart';
import '../../theme/utils/app_haptics.dart';
import '../../theme/widgets/app_pressable.dart';

class AppNavItem {
  const AppNavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.hasBadge = false,
    this.badgeText,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool hasBadge;
  final String? badgeText;
}

/// Парящий Liquid Glass Floating Navigation Bar в стиле современного Pill Dock (iOS / visionOS / OneUI).
/// Активная вкладка превращается в яркую капсулу с иконкой и текстом, а неактивные — в лаконичные полупрозрачные иконки.
class AppFloatingNavBar extends StatelessWidget {
  const AppFloatingNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<AppNavItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = isDark
        ? const Color(0xFF13151B).withValues(alpha: 0.78)
        : Colors.white.withValues(alpha: 0.88);

    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.18)
        : Colors.black.withValues(alpha: 0.08);

    return SafeArea(
      top: false,
      left: true,
      right: true,
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: Center(
          heightFactor: 1.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(36),
                  border: Border.all(color: borderColor, width: 1.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.45 : 0.12),
                      blurRadius: 28,
                      offset: const Offset(0, 8),
                    ),
                    BoxShadow(
                      color: colorScheme.primary.withValues(
                        alpha: isDark ? 0.10 : 0.04,
                      ),
                      blurRadius: 18,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(items.length, (index) {
                    final item = items[index];
                    final isSelected = index == currentIndex;

                    return _PillTabItem(
                      key: ValueKey(index),
                      item: item,
                      isSelected: isSelected,
                      colorScheme: colorScheme,
                      isDark: isDark,
                      onTap: () {
                        if (!isSelected) {
                          AppHaptics.selection();
                          onTap(index);
                        }
                      },
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PillTabItem extends StatelessWidget {
  const _PillTabItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.colorScheme,
    required this.isDark,
    required this.onTap,
  });

  final AppNavItem item;
  final bool isSelected;
  final ColorScheme colorScheme;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final activeTextColor = colorScheme.onPrimary;
    final inactiveIconColor = isDark
        ? Colors.white.withValues(alpha: 0.55)
        : colorScheme.onSurfaceVariant.withValues(alpha: 0.70);

    return AppPressable(
      onTap: onTap,
      pressedScale: 0.92,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 18 : 14,
          vertical: 9,
        ),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(26),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(
                      alpha: isDark ? 0.42 : 0.30,
                    ),
                    blurRadius: 14,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  isSelected ? item.selectedIcon : item.icon,
                  size: 20,
                  color: isSelected ? activeTextColor : inactiveIconColor,
                ),
                if (item.hasBadge && !isSelected)
                  Positioned(
                    top: -2,
                    right: -3,
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.error,
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.error.withValues(alpha: 0.6),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                item.label,
                style: TextStyle(
                  color: activeTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 13.5,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
