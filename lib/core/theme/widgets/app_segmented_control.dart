import 'package:flutter/material.dart';

import '../utils/app_haptics.dart';
import 'app_pressable.dart';

/// Элемент сегментированного переключателя [AppSegmentedControl].
class AppSegmentItem<T> {
  const AppSegmentItem({
    required this.value,
    required this.label,
    this.icon,
  });

  final T value;
  final String label;
  final Widget? icon;
}

/// Универсальный сегментированный переключатель в стиле Liquid Glass / iOS / Material 3.
/// Обладает плавным скользящим индикатором (Sliding Pill), поддержкой иконок и семантическим виброоткликом.
class AppSegmentedControl<T> extends StatelessWidget {
  const AppSegmentedControl({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onValueChanged,
    this.height = 40,
    this.padding = const EdgeInsets.all(4),
  }) : assert(items.length >= 2, 'items must have at least 2 elements');

  final List<AppSegmentItem<T>> items;
  final T selectedValue;
  final ValueChanged<T> onValueChanged;
  final double height;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final selectedIndex = items.indexWhere((item) => item.value == selectedValue);
    final validIndex = selectedIndex >= 0 ? selectedIndex : 0;

    final trackColor = isDark
        ? Colors.white.withValues(alpha: 0.07)
        : Colors.black.withValues(alpha: 0.05);

    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.12)
        : Colors.black.withValues(alpha: 0.08);

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final contentWidth = totalWidth - padding.horizontal;
        final segmentWidth = contentWidth / items.length;
        final contentHeight = height - padding.vertical;

        return Container(
          height: height,
          decoration: BoxDecoration(
            color: trackColor,
            borderRadius: BorderRadius.circular(height / 2),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Padding(
            padding: padding,
            child: Stack(
              children: [
                // Скользящий активный индикатор (Sliding Pill)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOutCubic,
                  left: validIndex * segmentWidth,
                  top: 0,
                  width: segmentWidth,
                  height: contentHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular((contentHeight) / 2),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withValues(alpha: 0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),

                // Интерактивные сегменты
                Row(
                  children: List.generate(items.length, (index) {
                    final item = items[index];
                    final isSelected = index == validIndex;

                    return Expanded(
                      child: AppPressable(
                        onTap: () {
                          if (!isSelected) {
                            AppHaptics.selection();
                            onValueChanged(item.value);
                          }
                        },
                        child: Container(
                          height: contentHeight,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: theme.textTheme.labelMedium!.copyWith(
                              fontWeight:
                                  isSelected ? FontWeight.bold : FontWeight.w500,
                              color: isSelected
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurface.withValues(alpha: 0.75),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (item.icon != null) ...[
                                  IconTheme(
                                    data: IconThemeData(
                                      size: 16,
                                      color: isSelected
                                          ? colorScheme.onPrimary
                                          : colorScheme.onSurface
                                              .withValues(alpha: 0.75),
                                    ),
                                    child: item.icon!,
                                  ),
                                  const SizedBox(width: 6),
                                ],
                                Flexible(
                                  child: Text(
                                    item.label,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
