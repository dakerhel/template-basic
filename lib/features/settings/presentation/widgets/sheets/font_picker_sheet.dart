import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/theme/font_provider.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class FontPickerSheet extends StatelessWidget {
  const FontPickerSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;

    await showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        var scaleIndex = ref.read(fontProvider).scaleIndex;
        return StatefulBuilder(
          builder: (sheetContext, setSheetState) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                    child: Text(
                      '${l10n.fontScale}: $scaleIndex',
                      style: Theme.of(sheetContext).textTheme.titleMedium,
                    ),
                  ),
                  Slider(
                    value: scaleIndex.toDouble(),
                    min: 1,
                    max: 5,
                    divisions: 4,
                    label: '$scaleIndex',
                    onChanged: (value) {
                      setSheetState(() => scaleIndex = value.round());
                      ref
                          .read(fontProvider.notifier)
                          .setScaleIndex(value.round());
                    },
                  ),
                  const Divider(height: 1),
                  RadioGroup<FontFamily>(
                    groupValue: ref.read(fontProvider).family,
                    onChanged: (selected) {
                      if (selected == null) return;
                      ref.read(fontProvider.notifier).setFamily(selected);
                      Navigator.of(sheetContext).pop();
                    },
                    child: Column(
                      children: [
                        for (final family in FontFamily.values)
                          RadioListTile<FontFamily>(
                            value: family,
                            title: Text(getFontName(sheetContext, family)),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static String getFontName(BuildContext context, FontFamily family) {
    final l10n = AppLocalizations.of(context)!;
    return switch (family) {
      FontFamily.system => l10n.fontSystem,
      FontFamily.defaultFont => l10n.fontDefault,
      FontFamily.inter => 'Inter',
    };
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
