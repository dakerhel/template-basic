import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/theme/widgets/app_toast.dart';

import '../../../../../core/notifications/notifications.dart';
import '../../../../../core/theme/tokens/tokens.dart';
import '../../../../../core/theme/widgets/app_glass.dart';
import '../../../../../core/utils/native_intent_launcher.dart';
import '../../../../update/presentation/update_settings_provider.dart';
import '../../../../../l10n/generated/app_localizations.dart';
import '../common/settings_group_header.dart';
import '../common/settings_link_tile.dart';

class NotificationsSection extends ConsumerWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final settings = ref.watch(updateSettingsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsGroupHeader(title: l10n.notificationsGroup),

        // Уведомления об обновлениях
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

        // Системные разрешения
        SettingsLinkTile(
          icon: Icons.notifications_active_outlined,
          title: l10n.notificationsPermissionTitle,
          subtitle: l10n.notificationsPermissionSubtitle,
          onTap: () => _openNotifications(context),
        ),

        // Карточка тестирования Notification Router
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AppGlassCard(
            borderRadius: 16,
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.alt_route_rounded,
                      size: 20,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.notifRouterTestTitle,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  l10n.notifRouterTestDesc,
                  style: Theme.of(context).textTheme.bodySmall
                      ?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.send_rounded, size: 16),
                    label: Text(l10n.notifSendTestButton),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: AppRadius.button,
                      ),
                    ),
                    onPressed: () async {
                      HapticFeedback.lightImpact();
                      await NotificationService.show(
                        id: 99,
                        title: l10n.notifTestNotificationTitle,
                        body: l10n.notifTestNotificationBody,
                        channel: AppNotificationChannel.updates,
                        payload: const NotificationPayload(
                          type: 'update',
                          action: 'test',
                          deepLink: '/settings',
                          data: {'source': 'settings_test_button'},
                        ),
                      );

                      if (context.mounted) {
                        AppToast.success(
                          context,
                          l10n.notifTestNotificationSent,
                          title: l10n.notifSingleTitle,
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    icon: const Icon(Icons.touch_app_outlined, size: 16),
                    label: Text(l10n.notifPermissionOnboardingPreview),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      PermissionOnboardingSheet.show(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _openNotifications(BuildContext context) async {
    final success = await NativeIntentLauncher.openNotificationSettings();
    if (!success && context.mounted) {
      AppToast.error(
        context,
        AppLocalizations.of(context)!.failedToOpen('Settings'),
      );
    }
  }
}
