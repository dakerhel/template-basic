import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/theme/font_provider.dart';
import 'package:my_app/core/theme/tokens/tokens.dart';
import 'package:my_app/core/theme/widgets/app_glass.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class FontPickerSheet extends ConsumerWidget {
  const FontPickerSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (_) => const FontPickerSheet(),
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
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final fontState = ref.watch(fontProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.sheet,
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
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

              // Title
              Text(
                l10n.settingsFont,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 14),

              // Card: Font scale slider
              AppGlassCard(
                borderRadius: 12,
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.fontScale,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '${fontState.scaleIndex} / 5',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.text_fields_rounded,
                          size: 16,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        Expanded(
                          child: Slider(
                            value: fontState.scaleIndex.toDouble(),
                            min: 1.0,
                            max: 5.0,
                            divisions: 4,
                            onChanged: (val) {
                              HapticFeedback.selectionClick();
                              ref
                                  .read(fontProvider.notifier)
                                  .setScaleIndex(val.round());
                            },
                          ),
                        ),
                        Icon(
                          Icons.text_fields_rounded,
                          size: 24,
                          color: colorScheme.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Font Family section title
              Text(
                Localizations.localeOf(context).languageCode == 'ru'
                    ? 'Шрифт интерфейса'
                    : 'Font Family',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),

              // Font family options
              for (final family in FontFamily.values) ...[
                Builder(
                  builder: (context) {
                    final isSelected = fontState.family == family;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: AppGlassCard(
                        borderRadius: 10,
                        isHighlighted: isSelected,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        onTap: () {
                          HapticFeedback.selectionClick();
                          ref.read(fontProvider.notifier).setFamily(family);
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? colorScheme.primary.withValues(alpha: 0.15)
                                    : colorScheme.surfaceContainerHighest
                                        .withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'A',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? colorScheme.primary
                                      : colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                getFontName(context, family),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? colorScheme.primary
                                      : colorScheme.onSurface,
                                ),
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.check_circle_rounded,
                                color: colorScheme.primary,
                                size: 20,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
