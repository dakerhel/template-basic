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

/// Парящий Liquid Glass Floating Navigation Bar с оптическим размытием,
/// скользящим пружинным индикатором (Sliding Pill) и тактильным откликом.
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
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isTablet = screenWidth >= 640;

    final backgroundColor = isDark
        ? const Color(0xFF181A1F).withValues(alpha: 0.82)
        : Colors.white.withValues(alpha: 0.88);

    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.16)
        : Colors.black.withValues(alpha: 0.09);

    return SafeArea(
      top: false,
      left: !isTablet,
      right: !isTablet,
      bottom: true,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          isTablet ? (screenWidth - 480) / 2 : 20,
          0,
          isTablet ? (screenWidth - 480) / 2 : 20,
          10,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
            child: Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: borderColor, width: 1.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.45 : 0.12),
                    blurRadius: 28,
                    offset: const Offset(0, 8),
                  ),
                  BoxShadow(
                    color: colorScheme.primary.withValues(
                      alpha: isDark ? 0.08 : 0.04,
                    ),
                    blurRadius: 16,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final tabWidth = constraints.maxWidth / items.length;
                  return Stack(
                    children: [
                      // Скользящий световой индикатор выбранной вкладки (Sliding Pill)
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 320),
                        curve: Curves.easeOutBack,
                        left: currentIndex * tabWidth,
                        top: 0,
                        bottom: 0,
                        width: tabWidth,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                colorScheme.primary.withValues(
                                  alpha: isDark ? 0.28 : 0.16,
                                ),
                                colorScheme.primary.withValues(
                                  alpha: isDark ? 0.15 : 0.08,
                                ),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: colorScheme.primary.withValues(
                                alpha: isDark ? 0.35 : 0.25,
                              ),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      // Список элементов навигации
                      Row(
                        children: List.generate(items.length, (index) {
                          final item = items[index];
                          final isSelected = index == currentIndex;

                          return Expanded(
                            child: AppPressable(
                              onTap: () {
                                if (!isSelected) {
                                  AppHaptics.selection();
                                  onTap(index);
                                }
                              },
                              pressedScale: 0.92,
                              child: _NavItemContent(
                                item: item,
                                isSelected: isSelected,
                                colorScheme: colorScheme,
                                isDark: isDark,
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItemContent extends StatelessWidget {
  const _NavItemContent({
    required this.item,
    required this.isSelected,
    required this.colorScheme,
    required this.isDark,
  });

  final AppNavItem item;
  final bool isSelected;
  final ColorScheme colorScheme;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final activeColor = colorScheme.primary;
    final inactiveColor = colorScheme.onSurfaceVariant.withValues(alpha: 0.7);

    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedScale(
                scale: isSelected ? 1.08 : 1.0,
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutBack,
                child: Icon(
                  isSelected ? item.selectedIcon : item.icon,
                  size: 22,
                  color: isSelected ? activeColor : inactiveColor,
                ),
              ),
              if (item.hasBadge)
                Positioned(
                  top: -2,
                  right: -4,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.error,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.error.withValues(alpha: 0.5),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 3),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected ? activeColor : inactiveColor,
              letterSpacing: 0.2,
            ),
            child: Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
