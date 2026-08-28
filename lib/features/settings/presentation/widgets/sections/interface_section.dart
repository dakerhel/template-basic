import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/locale/locale_provider.dart';
import 'package:my_app/core/theme/color_palette_provider.dart';
import 'package:my_app/core/theme/font_provider.dart';
import 'package:my_app/core/theme/liquid_glass_provider.dart';
import 'package:my_app/core/theme/theme_mode_provider.dart';
import 'package:my_app/features/settings/presentation/widgets/common/settings_group_header.dart';
import 'package:my_app/features/settings/presentation/widgets/sheets/font_picker_sheet.dart';
import 'package:my_app/features/settings/presentation/widgets/sheets/language_picker_sheet.dart';
import 'package:my_app/features/settings/presentation/widgets/sheets/unified_theme_sheet.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class InterfaceSection extends ConsumerWidget {
  const InterfaceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);
    final font = ref.watch(fontProvider);
    final palette = ref.watch(colorPaletteProvider);

    final isLiquidGlass = ref.watch(liquidGlassProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsGroupHeader(title: l10n.interfaceGroup),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text(l10n.settingsLanguage),
          subtitle: Text(LanguagePickerSheet.getLanguageName(context, locale)),
          onTap: () => LanguagePickerSheet.show(context, ref),
        ),
        ListTile(
          leading: const Icon(Icons.palette_outlined),
          title: Text(l10n.settingsTheme),
          subtitle: Text(
            '${themeMode.localizedName(locale, l10n)} · ${palette.localizedName(locale)}${isLiquidGlass ? ' · Glass' : ''}',
          ),
          onTap: () => UnifiedThemeSheet.show(context, ref),
        ),
        ListTile(
          leading: const Icon(Icons.text_fields),
          title: Text(l10n.settingsFont),
          subtitle: Text(
            '${l10n.fontScale}: ${font.scaleIndex} · ${FontPickerSheet.getFontName(context, font.family)}',
          ),
          onTap: () => FontPickerSheet.show(context, ref),
        ),
      ],
    );
  }
}
