import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/locale/locale_provider.dart';
import 'package:my_app/features/settings/domain/models/app_language.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class LanguagePickerSheet extends StatelessWidget {
  const LanguagePickerSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final current = ref.read(localeProvider);

    await showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return SafeArea(
          child: RadioGroup<Locale?>(
            groupValue: current,
            onChanged: (selected) {
              Navigator.of(sheetContext).pop();
              ref.read(localeProvider.notifier).setLocale(selected);
            },
            child: ListView(
              shrinkWrap: true,
              children: [
                RadioListTile<Locale?>(
                  value: null,
                  title: Text(l10n.languageSystem),
                ),
                for (final language in appLanguages)
                  RadioListTile<Locale?>(
                    value: language.locale,
                    title: Text(language.nativeName),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  static String getLanguageName(BuildContext context, Locale? locale) {
    final l10n = AppLocalizations.of(context)!;
    if (locale == null) return l10n.languageSystem;
    for (final language in appLanguages) {
      if (language.locale?.languageCode == locale.languageCode) {
        return language.nativeName;
      }
    }
    return l10n.languageSystem;
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
