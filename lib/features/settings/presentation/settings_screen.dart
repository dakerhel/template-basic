import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config.dart';
import '../../../core/locale/locale_provider.dart';
import '../../../core/theme/font_provider.dart';
import '../../../core/theme/theme_mode_provider.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../update/data/storage_usage.dart';
import '../../update/presentation/update_controller.dart';
import '../../update/presentation/update_settings_provider.dart';

class AppLanguage {
  const AppLanguage(this.locale, this.nativeName);

  final Locale? locale;
  final String nativeName;
}

final storageRefreshProvider =
    NotifierProvider<StorageRefreshController, int>(
        StorageRefreshController.new);

final class StorageRefreshController extends Notifier<int> {
  @override
  int build() => 0;

  void bump() => state = state + 1;
}

const appLanguages = <AppLanguage>[
  AppLanguage(Locale('ru'), 'Русский'),
  AppLanguage(Locale('en'), 'English'),
  AppLanguage(Locale('es'), 'Español'),
  AppLanguage(Locale('zh'), '中文'),
  AppLanguage(Locale('hi'), 'हिन्दी'),
  AppLanguage(Locale('ar'), 'العربية'),
  AppLanguage(Locale('fr'), 'Français'),
  AppLanguage(Locale('de'), 'Deutsch'),
  AppLanguage(Locale('pt'), 'Português'),
  AppLanguage(Locale('ja'), '日本語'),
  AppLanguage(Locale('ko'), '한국어'),
  AppLanguage(Locale('tr'), 'Türkçe'),
  AppLanguage(Locale('it'), 'Italiano'),
  AppLanguage(Locale('id'), 'Bahasa Indonesia'),
];

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final updateState = ref.watch(updateControllerProvider);
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeModeProvider);
    final font = ref.watch(fontProvider);
    final settings = ref.watch(updateSettingsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        children: [
          _groupHeader(context, l10n.interfaceGroup),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(l10n.settingsLanguage),
            subtitle: Text(_languageName(context, locale)),
            onTap: () => _pickLanguage(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6_outlined),
            title: Text(l10n.settingsTheme),
            subtitle: Text(_themeName(context, themeMode)),
            onTap: () => _pickTheme(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.text_fields),
            title: Text(l10n.settingsFont),
            subtitle: Text(
              '${l10n.fontScale}: ${font.scaleIndex} · ${_fontName(context, font.family)}',
            ),
            onTap: () => _pickFont(context, ref),
          ),
          _groupHeader(context, l10n.updatesGroup),
          ListTile(
            leading: const Icon(Icons.system_update),
            title: Text(l10n.checkForUpdate),
            subtitle: _subtitle(context, updateState),
            onTap: updateState is UpdateChecking
                ? null
                : () => ref
                    .read(updateControllerProvider.notifier)
                    .checkForUpdate(),
          ),
          if (updateState is UpdateAvailable) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: FilledButton.icon(
                onPressed: () => ref
                    .read(updateControllerProvider.notifier)
                    .downloadAndInstall(),
                icon: const Icon(Icons.download),
                label: Text(l10n.updateButton(updateState.update.version)),
              ),
            ),
            if (updateState.update.notes != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.whatsNewLabel,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      updateState.update.notes!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
          ],
          if (updateState is UpdateDownloading)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(value: updateState.progress),
            ),
          _toggleBlock(
            context,
            title: l10n.backgroundCheckTitle,
            subtitle: l10n.backgroundCheckSubtitle,
            value: settings.backgroundCheck,
            onChanged: (value) => ref
                .read(updateSettingsProvider.notifier)
                .setBackgroundCheck(value),
          ),
          _intervalBlock(context, ref, settings),
          _toggleBlock(
            context,
            title: l10n.backgroundInstallTitle,
            subtitle: l10n.backgroundInstallSubtitle,
            value: settings.backgroundInstall,
            enabled: settings.backgroundCheck,
            onChanged: (value) => ref
                .read(updateSettingsProvider.notifier)
                .setBackgroundInstall(value),
          ),
          _linkTile(
            context,
            icon: Icons.install_mobile_outlined,
            title: l10n.installPermissionTitle,
            subtitle: l10n.installPermissionSubtitle,
            onTap: () => _openInstallPermissionSettings(context),
          ),
          _linkTile(
            context,
            icon: Icons.battery_saver_outlined,
            title: l10n.backgroundWorkTitle,
            subtitle: l10n.backgroundWorkSubtitle,
            onTap: () => _openBatteryOptimizationSettings(context),
          ),
          _groupHeader(context, l10n.notificationsGroup),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: Text(l10n.notifyUpdatesToggle),
            trailing: Switch(
              value: settings.notifyUpdates,
              onChanged: (value) => ref
                  .read(updateSettingsProvider.notifier)
                  .setNotifyUpdates(value),
            ),
          ),
          _linkTile(
            context,
            icon: Icons.notifications_active_outlined,
            title: l10n.notificationsPermissionTitle,
            subtitle: l10n.notificationsPermissionSubtitle,
            onTap: () => _openNotificationSettings(context),
          ),
          _groupHeader(context, l10n.storageGroup),
          ListTile(
            leading: const Icon(Icons.storage_outlined),
            title: Text(l10n.storageGroup),
            subtitle: FutureBuilder<StorageUsage>(
              key: ValueKey(ref.watch(storageRefreshProvider)),
              future: computeUpdateArtifactsUsage(),
              builder: (context, snapshot) {
                final usage = snapshot.data;
                return Text(l10n.storageUsed(usage?.displayMb ?? '0.0'));
              },
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: l10n.clearCacheAction,
              onPressed: () => _clearArtifacts(context, ref),
            ),
          ),
          _groupHeader(context, l10n.aboutGroup),
          ListTile(
            leading: const Icon(Icons.apps),
            title: Text(l10n.appNameLabel),
            subtitle: Text(AppConfig.appName),
          ),
          ListTile(
            leading: const Icon(Icons.tag),
            title: Text(l10n.appVersionLabel),
            subtitle: FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                final info = snapshot.data;
                return Text(info != null
                    ? '${info.version} (${info.buildNumber})'
                    : '...');
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.memory),
            title: Text(l10n.coreVersionLabel),
            subtitle: Text(AppConfig.coreVersion),
          ),
          ListTile(
            leading: const Icon(Icons.devices),
            title: Text(l10n.deviceLabel),
            subtitle: Text(_platformName),
          ),
          _linkTile(
            context,
            icon: Icons.privacy_tip_outlined,
            title: l10n.aboutPrivacy,
            onTap: () => _openUrl(context, AppConfig.privacyPolicyUrl),
          ),
          _linkTile(
            context,
            icon: Icons.code,
            title: l10n.sourceCodeLabel,
            onTap: () => _openUrl(context, AppConfig.sourceCodeUrl),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Future<void> _clearArtifacts(BuildContext context, WidgetRef ref) async {
    await clearUpdateArtifacts();
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.cacheCleared),
      ),
    );
    ref.read(storageRefreshProvider.notifier).bump();
  }

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.failedToOpen(url)),
        ),
      );
    }
  }

  Future<void> _openBatteryOptimizationSettings(BuildContext context) async {
    if (!Platform.isAndroid) return;
    final info = await PackageInfo.fromPlatform();
    final intent = AndroidIntent(
      action: 'android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS',
      data: 'package:${info.packageName}',
    );
    try {
      await intent.launch();
    } on Exception {
      if (context.mounted) _showSettingsError(context);
    }
  }

  Future<void> _openInstallPermissionSettings(BuildContext context) async {
    if (!Platform.isAndroid) return;
    final info = await PackageInfo.fromPlatform();
    final intent = AndroidIntent(
      action: 'android.settings.MANAGE_UNKNOWN_APP_SOURCES',
      data: 'package:${info.packageName}',
    );
    try {
      await intent.launch();
    } on Exception {
      if (context.mounted) _showSettingsError(context);
    }
  }

  Future<void> _openNotificationSettings(BuildContext context) async {
    if (!Platform.isAndroid) return;
    final info = await PackageInfo.fromPlatform();
    final intent = AndroidIntent(
      action: 'android.settings.APP_NOTIFICATION_SETTINGS',
      arguments: <String, String>{
        'android.provider.extra.APP_PACKAGE': info.packageName,
      },
    );
    try {
      await intent.launch();
    } on Exception {
      if (context.mounted) _showSettingsError(context);
    }
  }

  void _showSettingsError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.failedToOpen('Settings')),
      ),
    );
  }

  String get _platformName => switch (Platform.operatingSystem) {
        'android' => 'Android',
        'ios' => 'iOS',
        'windows' => 'Windows',
        'linux' => 'Linux',
        'macos' => 'macOS',
        final name => name,
      };

  Widget _linkTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.open_in_new, size: 18),
      onTap: onTap,
    );
  }

  Widget _groupHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }

  Widget _toggleBlock(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool enabled = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceContainerHighest
            .withValues(alpha: 0.5),
        child: SwitchListTile(
          value: value,
          onChanged: enabled ? onChanged : null,
          title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }

  Widget _intervalBlock(
    BuildContext context,
    WidgetRef ref,
    UpdateSettings settings,
  ) {
    final l10n = AppLocalizations.of(context)!;
    String label(int minutes) => minutes < 60
        ? l10n.intervalMinutes('$minutes')
        : l10n.intervalHours('${minutes ~/ 60}');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceContainerHighest
            .withValues(alpha: 0.5),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.checkIntervalTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final minutes in updateIntervalOptions)
                    ChoiceChip(
                      label: Text(label(minutes)),
                      selected: settings.intervalMinutes == minutes,
                      onSelected: (_) => ref
                          .read(updateSettingsProvider.notifier)
                          .setIntervalMinutes(minutes),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _languageName(BuildContext context, Locale? locale) {
    final l10n = AppLocalizations.of(context)!;
    if (locale == null) return l10n.languageSystem;
    for (final language in appLanguages) {
      if (language.locale?.languageCode == locale.languageCode) {
        return language.nativeName;
      }
    }
    return l10n.languageSystem;
  }

  Future<void> _pickLanguage(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final current = ref.read(localeProvider);

    await showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return SafeArea(
          child: RadioGroup<Locale?>(
            groupValue: current,
            onChanged: (selected) {
              Navigator.of(context).pop();
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

  String _fontName(BuildContext context, FontFamily family) {
    final l10n = AppLocalizations.of(context)!;
    return switch (family) {
      FontFamily.system => l10n.fontSystem,
      FontFamily.defaultFont => l10n.fontDefault,
      FontFamily.inter => 'Inter',
    };
  }

  Future<void> _pickFont(BuildContext context, WidgetRef ref) async {
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
                            title: Text(_fontName(sheetContext, family)),
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

  String _themeName(BuildContext context, ThemeMode mode) {
    final l10n = AppLocalizations.of(context)!;
    return switch (mode) {
      ThemeMode.light => l10n.themeLight,
      ThemeMode.dark => l10n.themeDark,
      ThemeMode.system => l10n.themeSystem,
    };
  }

  Future<void> _pickTheme(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;

    await showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) {
        return SafeArea(
          child: RadioGroup<ThemeMode>(
            groupValue: ref.read(themeModeProvider),
            onChanged: (selected) {
              Navigator.of(context).pop();
              if (selected != null) {
                ref.read(themeModeProvider.notifier).setThemeMode(selected);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<ThemeMode>(
                  value: ThemeMode.system,
                  title: Text(l10n.themeSystem),
                ),
                RadioListTile<ThemeMode>(
                  value: ThemeMode.light,
                  title: Text(l10n.themeLight),
                ),
                RadioListTile<ThemeMode>(
                  value: ThemeMode.dark,
                  title: Text(l10n.themeDark),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget? _subtitle(BuildContext context, UpdateState state) {
    final l10n = AppLocalizations.of(context)!;
    final style = Theme.of(context).textTheme.bodySmall;
    return switch (state) {
      UpdateChecking() => Text(l10n.updateChecking, style: style),
      UpdateUpToDate() => Text(l10n.updateUpToDate, style: style),
      UpdateAvailable(:final update) =>
        Text(l10n.updateAvailable(update.version), style: style),
      UpdateDownloading(:final progress) => Text(
          l10n.updateDownload((progress * 100).toStringAsFixed(0)),
          style: style,
        ),
      UpdateError(:final error, :final isCheck) => Text(
          isCheck
              ? l10n.updateCheckFailed('$error')
              : l10n.updateFailed('$error'),
          style: style?.copyWith(color: Theme.of(context).colorScheme.error),
        ),
      UpdateIdle() => null,
    };
  }
}
