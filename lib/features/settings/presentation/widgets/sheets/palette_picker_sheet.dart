import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/theme/app_color_palette.dart';
import 'package:my_app/core/theme/color_palette_provider.dart';
import 'package:my_app/core/theme/oled_mode_provider.dart';

class PalettePickerSheet extends ConsumerWidget {
  const PalettePickerSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) {
        return const PalettePickerSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPalette = ref.watch(colorPaletteProvider);
    final isOled = ref.watch(oledModeProvider);
    final locale = Localizations.localeOf(context);

    final titleText =
        locale.languageCode == 'ru' ? 'Цветовая схема' : 'Color Scheme';
    final oledTitle =
        locale.languageCode == 'ru' ? 'Истинно чёрный (OLED)' : 'Pure Black (OLED)';
    final oledSubtitle = locale.languageCode == 'ru'
        ? 'Отключает пиксели на AMOLED экранах в тёмной теме'
        : 'Disables pixels on AMOLED screens in dark mode';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: Text(
                titleText,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode_outlined),
              title: Text(oledTitle),
              subtitle: Text(oledSubtitle),
              value: isOled,
              onChanged: (value) {
                ref.read(oledModeProvider.notifier).setOledMode(value);
              },
            ),
            const Divider(height: 1),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: AppColorPalette.values.length,
                itemBuilder: (context, index) {
                  final palette = AppColorPalette.values[index];
                  final isSelected = palette == currentPalette;

                  return ListTile(
                    leading: _PaletteSwatch(
                      baseColor: palette.baseColor,
                      accentColor: palette.accentColor,
                      isSelected: isSelected,
                    ),
                    title: Text(
                      palette.localizedName(locale),
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(
                            Icons.check_circle,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : null,
                    onTap: () {
                      ref
                          .read(colorPaletteProvider.notifier)
                          .setPalette(palette);
                    },
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
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          width: 2.5,
        ),
      ),
      padding: const EdgeInsets.all(2),
      child: ClipOval(
        child: Row(
          children: [
            Expanded(
              child: Container(color: baseColor),
            ),
            Expanded(
              child: Container(color: accentColor),
            ),
          ],
        ),
      ),
    );
  }
}
