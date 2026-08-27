import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/theme/app_color_palette.dart';
import 'package:my_app/core/theme/color_palette_provider.dart';
import 'package:my_app/core/theme/theme_mode_provider.dart';
import 'package:my_app/core/theme/widgets/app_glass.dart';

class UnifiedThemeSheet extends ConsumerWidget {
  const UnifiedThemeSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (sheetContext) {
        return const UnifiedThemeSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(themeModeProvider);
    final currentPalette = ref.watch(colorPaletteProvider);
    final locale = Localizations.localeOf(context);
    final isRu = locale.languageCode == 'ru';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            Text(
              isRu ? 'Тема и оформление' : 'Theme & Appearance',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),

            // Единый селектор режима: [ Авто | Светлая | Тёмная | OLED ]
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SegmentedButton<AppThemeMode>(
                segments: [
                  for (final mode in AppThemeMode.values)
                    ButtonSegment<AppThemeMode>(
                      value: mode,
                      icon: Icon(mode.icon, size: 18),
                      label: Text(mode.localizedName(locale)),
                    ),
                ],
                selected: {currentMode},
                onSelectionChanged: (newSelection) {
                  HapticFeedback.selectionClick();
                  ref
                      .read(themeModeProvider.notifier)
                      .setThemeMode(newSelection.first);
                },
              ),
            ),
            const SizedBox(height: 16),

            // Подзаголовок палитр
            Text(
              isRu ? 'Цветовые палитры' : 'Color Schemes',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),

            // Сетка палитр в стиле Apple Liquid Glass
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: AppColorPalette.values.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final palette = AppColorPalette.values[index];
                  final isSelected = palette == currentPalette;

                  return AppGlassCard(
                    borderRadius: 14,
                    tintOpacity: isSelected ? 0.85 : 0.45,
                    borderOpacity: isSelected ? 0.6 : 0.15,
                    onTap: () {
                      HapticFeedback.selectionClick();
                      ref
                          .read(colorPaletteProvider.notifier)
                          .setPalette(palette);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        // Двухцветный свотч палитры
                        _PaletteSwatch(
                          baseColor: currentMode == AppThemeMode.oled
                              ? Colors.black
                              : palette.baseColor,
                          accentColor: palette.accentColor,
                          isSelected: isSelected,
                        ),
                        const SizedBox(width: 14),

                        // Название и иконка темы
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                palette.icon,
                                size: 18,
                                color: isSelected
                                    ? palette.accentColor
                                    : Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                palette.localizedName(locale),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ),

                        // Индикатор выбора
                        if (isSelected)
                          Icon(
                            Icons.check_circle_rounded,
                            color: palette.accentColor,
                            size: 22,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaletteSwatch extends StatelessWidget {
  const _PaletteSwatch({
    required this.baseColor,
    required this.accentColor,
    required this.isSelected,
  });

  final Color baseColor;
  final Color accentColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? accentColor : Colors.white.withValues(alpha: 0.2),
          width: 2.0,
        ),
      ),
      padding: const EdgeInsets.all(2),
      child: ClipOval(
        child: Row(
          children: [
            Expanded(child: Container(color: baseColor)),
            Expanded(child: Container(color: accentColor)),
          ],
        ),
      ),
    );
  }
}
