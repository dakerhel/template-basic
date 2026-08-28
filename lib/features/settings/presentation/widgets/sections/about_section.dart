import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:my_app/core/config.dart';
import 'package:my_app/core/device/presentation/sheets/system_diagnostics_sheet.dart';
import 'package:my_app/features/settings/presentation/widgets/common/settings_group_header.dart';
import 'package:my_app/features/settings/presentation/widgets/common/settings_link_tile.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsGroupHeader(title: l10n.aboutGroup),
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
              return Text(
                info != null ? '${info.version} (${info.buildNumber})' : '...',
              );
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
        ListTile(
          leading: const Icon(Icons.developer_board_rounded),
          title: Text(
            Localizations.localeOf(context).languageCode == 'ru'
                ? 'Системная диагностика'
                : 'System Diagnostics',
          ),
          subtitle: Text(
            Localizations.localeOf(context).languageCode == 'ru'
                ? 'Параметры экрана, ОС, сети и устройства'
                : 'Screen, OS, network, and hardware specs',
          ),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: () => SystemDiagnosticsSheet.show(context),
        ),
        SettingsLinkTile(
          icon: Icons.privacy_tip_outlined,
          title: l10n.aboutPrivacy,
          onTap: () => _openUrl(context, AppConfig.privacyPolicyUrl),
        ),
        SettingsLinkTile(
          icon: Icons.code,
          title: l10n.sourceCodeLabel,
          onTap: () => _openUrl(context, AppConfig.sourceCodeUrl),
        ),
        const SizedBox(height: 16),
      ],
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
}
