import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/locale/locale_provider.dart';
import 'package:my_app/core/theme/tokens/tokens.dart';
import 'package:my_app/core/theme/widgets/app_glass.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class LanguagePickerSheet extends ConsumerWidget {
  const LanguagePickerSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) async {
    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (_) => const LanguagePickerSheet(),
    );
  }

  static String getLanguageName(BuildContext context, Locale? locale) {
    final l10n = AppLocalizations.of(context)!;
    if (locale == null) return l10n.languageSystem;
    final lang = AppLanguage.fromLocale(locale);
    return '${lang.flagEmoji} ${lang.nativeName}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final current = ref.watch(localeProvider);
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
                l10n.settingsLanguage,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),

              // Системный язык
              AppGlassCard(
                borderRadius: 10,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                onTap: () {
                  HapticFeedback.selectionClick();
                  Navigator.of(context).pop();
                  ref.read(localeProvider.notifier).resetToSystem();
                },
                child: Row(
                  children: [
                    const Icon(Icons.settings_suggest_outlined, size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.languageSystem,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: current == null
                              ? FontWeight.bold
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                    if (current == null)
                      Icon(
                        Icons.check_circle_rounded,
                        color: colorScheme.primary,
                        size: 20,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // Список 14 языков
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: AppLanguage.values.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 6),
                  itemBuilder: (context, index) {
                    final language = AppLanguage.values[index];
                    final isSelected = current?.languageCode == language.code;

                    return AppGlassCard(
                      borderRadius: 10,
                      tintOpacity: isSelected ? 0.9 : 0.35,
                      borderOpacity: isSelected ? 0.8 : 0.15,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      onTap: () {
                        HapticFeedback.selectionClick();
                        Navigator.of(context).pop();
                        ref
                            .read(localeProvider.notifier)
                            .setLanguage(language);
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 28,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? colorScheme.primary.withValues(alpha: 0.2)
                                  : colorScheme.surfaceContainerHighest
                                      .withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected
                                    ? colorScheme.primary.withValues(alpha: 0.4)
                                    : colorScheme.outline.withValues(alpha: 0.15),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              language.code.toUpperCase(),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? colorScheme.primary
                                    : colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  language.nativeName,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    color: isSelected
                                        ? colorScheme.primary
                                        : colorScheme.onSurface,
                                  ),
                                ),
                                Text(
                                  language.englishName +
                                      (language.isRtl ? ' (RTL)' : ''),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
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
