import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/theme/app_color_palette.dart';
import 'package:my_app/core/theme/color_palette_provider.dart';
import 'package:my_app/core/theme/theme_mode_provider.dart';
import 'package:my_app/core/theme/widgets/app_glass.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class UnifiedThemeSheet extends ConsumerWidget {
  const UnifiedThemeSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (sheetContext) {
        return const UnifiedThemeSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentMode = ref.watch(themeModeProvider);
    final currentPalette = ref.watch(colorPaletteProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final locale = Localizations.localeOf(context);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Заголовок
              Text(
                l10n.settingsTheme,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 16),

              // Нативный адаптивный 4-сегментный селектор темы (на 100% ширины)
              _NativeThemeModeBar(
                currentMode: currentMode,
                l10n: l10n,
                onModeSelected: (mode) {
                  HapticFeedback.selectionClick();
                  ref.read(themeModeProvider.notifier).setThemeMode(mode);
                },
              ),
              const SizedBox(height: 18),

              // Подзаголовок палитр
              Text(
                locale.languageCode == 'ru'
                    ? 'Цветовые палитры'
                    : locale.languageCode == 'zh'
                    ? '配色方案'
                    : 'Color Schemes',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),

              // Список палитр с Glass-эффектом и абсолютным контрастом
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.46,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: AppColorPalette.values.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final palette = AppColorPalette.values[index];
                    final isSelected = palette == currentPalette;

                    return AppGlassCard(
                      borderRadius: 16,
                      tintOpacity: isSelected ? 0.9 : 0.4,
                      borderOpacity: isSelected ? 0.8 : 0.2,
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

                          // Иконка и название темы с гарантированным контрастом
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  palette.icon,
                                  size: 18,
                                  color: isSelected
                                      ? palette.accentColor
                                      : colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    palette.localizedName(locale),
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          color: colorScheme.onSurface,
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.w500,
                                        ),
                                    overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}

/// Нативный адаптивный бар выбора темы (4 равные колонки без горизонтального скролла)
class _NativeThemeModeBar extends StatelessWidget {
  const _NativeThemeModeBar({
    required this.currentMode,
    required this.l10n,
    required this.onModeSelected,
  });

  final AppThemeMode currentMode;
  final AppLocalizations l10n;
  final ValueChanged<AppThemeMode> onModeSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final modes = [
      (AppThemeMode.system, Icons.brightness_auto, l10n.themeSystem),
      (AppThemeMode.light, Icons.light_mode, l10n.themeLight),
      (AppThemeMode.dark, Icons.dark_mode, l10n.themeDark),
      (AppThemeMode.oled, Icons.contrast, 'OLED'),
    ];

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          for (final (mode, icon, label) in modes)
            Expanded(
              child: _ThemeTabItem(
                mode: mode,
                icon: icon,
                label: label,
                isSelected: mode == currentMode,
                onTap: () => onModeSelected(mode),
              ),
            ),
        ],
      ),
    );
  }
}

class _ThemeTabItem extends StatelessWidget {
  const _ThemeTabItem({
    required this.mode,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final AppThemeMode mode;
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? colorScheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurfaceVariant,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
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
          color: isSelected
              ? accentColor
              : Colors.white.withValues(alpha: 0.25),
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
