import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/utils/native_intent_launcher.dart';
import 'package:my_app/features/settings/presentation/widgets/common/settings_group_header.dart';
import 'package:my_app/features/settings/presentation/widgets/common/settings_interval_card.dart';
import 'package:my_app/features/settings/presentation/widgets/common/settings_link_tile.dart';
import 'package:my_app/features/settings/presentation/widgets/common/settings_toggle_card.dart';
import 'package:my_app/features/update/presentation/update_controller.dart';
import 'package:my_app/features/update/presentation/update_settings_provider.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class UpdatesSection extends ConsumerWidget {
  const UpdatesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final updateState = ref.watch(updateControllerProvider);
    final settings = ref.watch(updateSettingsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsGroupHeader(title: l10n.updatesGroup),
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
        SettingsToggleCard(
          title: l10n.backgroundCheckTitle,
          subtitle: l10n.backgroundCheckSubtitle,
          value: settings.backgroundCheck,
          onChanged: (value) => ref
              .read(updateSettingsProvider.notifier)
              .setBackgroundCheck(value),
        ),
        SettingsIntervalCard(settings: settings),
        SettingsToggleCard(
          title: l10n.backgroundInstallTitle,
          subtitle: l10n.backgroundInstallSubtitle,
          value: settings.backgroundInstall,
          enabled: settings.backgroundCheck,
          onChanged: (value) => ref
              .read(updateSettingsProvider.notifier)
              .setBackgroundInstall(value),
        ),
        SettingsLinkTile(
          icon: Icons.install_mobile_outlined,
          title: l10n.installPermissionTitle,
          subtitle: l10n.installPermissionSubtitle,
          onTap: () => _openInstallPermission(context),
        ),
        SettingsLinkTile(
          icon: Icons.battery_saver_outlined,
          title: l10n.backgroundWorkTitle,
          subtitle: l10n.backgroundWorkSubtitle,
          onTap: () => _openBatteryOptimization(context),
        ),
      ],
    );
  }

  Widget? _subtitle(BuildContext context, UpdateState state) {
    final l10n = AppLocalizations.of(context)!;
    final style = Theme.of(context).textTheme.bodySmall;
    return switch (state) {
      UpdateChecking() => Text(l10n.updateChecking, style: style),
      UpdateUpToDate() => Text(l10n.updateUpToDate, style: style),
      UpdateAvailable(:final update) => Text(
        l10n.updateAvailable(update.version),
        style: style,
      ),
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

  Future<void> _openBatteryOptimization(BuildContext context) async {
    final success =
        await NativeIntentLauncher.openBatteryOptimizationSettings();
    if (!success && context.mounted) {
      _showSettingsError(context);
    }
  }

  Future<void> _openInstallPermission(BuildContext context) async {
    final success = await NativeIntentLauncher.openInstallPermissionSettings();
    if (!success && context.mounted) {
      _showSettingsError(context);
    }
  }

  void _showSettingsError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.failedToOpen('Settings')),
      ),
    );
  }
}
