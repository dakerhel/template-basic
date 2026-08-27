import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/utils/native_intent_launcher.dart';
import 'package:my_app/features/settings/presentation/widgets/common/settings_group_header.dart';
import 'package:my_app/features/settings/presentation/widgets/common/settings_link_tile.dart';
import 'package:my_app/features/update/presentation/update_settings_provider.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class NotificationsSection extends ConsumerWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(updateSettingsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsGroupHeader(title: l10n.notificationsGroup),
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
        SettingsLinkTile(
          icon: Icons.notifications_active_outlined,
          title: l10n.notificationsPermissionTitle,
          subtitle: l10n.notificationsPermissionSubtitle,
          onTap: () => _openNotifications(context),
        ),
      ],
    );
  }

  Future<void> _openNotifications(BuildContext context) async {
    final success = await NativeIntentLauncher.openNotificationSettings();
    if (!success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.failedToOpen('Settings')),
        ),
      );
    }
  }
}
