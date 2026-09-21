import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/theme/widgets/app_toast.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

import '../../../../../core/theme/widgets/app_glass.dart';
import '../../../../security/domain/models/security_settings.dart';
import '../../../../security/presentation/controllers/security_controller.dart';
import '../../../../security/presentation/sheets/pin_setup_sheet.dart';
import '../common/settings_group_header.dart';
import '../common/settings_toggle_card.dart';

class SecuritySection extends ConsumerWidget {
  const SecuritySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final security = ref.watch(securityControllerProvider);
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsGroupHeader(title: l10n.securityGroup),

        // Карточка включения PIN-кода
        SettingsToggleCard(
          title: l10n.securityPinTitle,
          subtitle: l10n.securityPinSubtitle,
          value: security.settings.isPinEnabled,
          onChanged: (value) async {
            if (value) {
              await PinSetupSheet.show(context);
            } else {
              _confirmRemovePin(context, ref, l10n);
            }
          },
        ),

        // Дополнительные параметры безопасности при активном PIN
        if (security.settings.isPinEnabled) ...[
          // Биометрия
          if (security.canUseBiometrics)
            SettingsToggleCard(
              title: l10n.securityBiometricsTitle,
              subtitle: l10n.securityBiometricsSubtitle,
              value: security.settings.isBiometricsEnabled,
              onChanged: (value) async {
                if (value) {
                  // Для включения биометрии требуется подтверждение мастер-PIN
                  final verified = await PinSetupSheet.show(
                    context,
                    mode: PinSheetMode.verify,
                  );
                  if (verified == true) {
                    await ref
                        .read(securityControllerProvider.notifier)
                        .setBiometricsEnabled(true);
                  }
                } else {
                  await ref
                      .read(securityControllerProvider.notifier)
                      .setBiometricsEnabled(false);
                }
              },
            ),

          // Автоблокировка
          _AutoLockCard(
            currentDuration: security.settings.autoLockDuration,
            l10n: l10n,
            onChanged: (dur) => ref
                .read(securityControllerProvider.notifier)
                .setAutoLockDuration(dur),
          ),

          // Скрытие контента в диспетчере задач (Privacy Shield)
          SettingsToggleCard(
            title: l10n.securityPrivacyTitle,
            subtitle: l10n.securityPrivacySubtitle,
            value: security.settings.isHideContentEnabled,
            onChanged: (value) => ref
                .read(securityControllerProvider.notifier)
                .setHideContentEnabled(value),
          ),

          // Действия с PIN-кодом
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: AppGlassCard(
              borderRadius: 12,
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.password_rounded),
                    title: Text(l10n.securityChangePin),
                    subtitle: Text(l10n.securityChangePinSubtitle),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () async {
                      final result = await PinSetupSheet.show(
                        context,
                        mode: PinSheetMode.change,
                      );
                      if (result == true && context.mounted) {
                        AppToast.success(
                          context,
                          l10n.securityPinChanged,
                          title: l10n.securityGroup,
                        );
                      }
                    },
                  ),
                  const Divider(height: 1, indent: 56, endIndent: 16),
                  ListTile(
                    leading: const Icon(Icons.lock_clock_outlined),
                    title: Text(l10n.securityLockNow),
                    subtitle: Text(l10n.lockScreenSubtitle),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () =>
                        ref.read(securityControllerProvider.notifier).lockManually(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  void _confirmRemovePin(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(l10n.securityDisableTitle),
          content: Text(l10n.securityDisableDesc),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(l10n.commonCancel),
            ),
            FilledButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                final verified = await PinSetupSheet.show(
                  context,
                  mode: PinSheetMode.verify,
                );
                if (verified == true) {
                  await ref
                      .read(securityControllerProvider.notifier)
                      .removePin();
                  if (context.mounted) {
                    AppToast.info(
                      context,
                      l10n.securityDisabledToast,
                      title: l10n.securityGroup,
                    );
                  }
                }
              },
              child: Text(l10n.commonContinue),
            ),
          ],
        );
      },
    );
  }
}

class _AutoLockCard extends StatelessWidget {
  const _AutoLockCard({
    required this.currentDuration,
    required this.l10n,
    required this.onChanged,
  });

  final AutoLockDuration currentDuration;
  final AppLocalizations l10n;
  final ValueChanged<AutoLockDuration> onChanged;

  String _formatDuration(AutoLockDuration duration) {
    switch (duration) {
      case AutoLockDuration.immediately:
        return l10n.securityTimeoutImmediately;
      case AutoLockDuration.oneMinute:
        return l10n.securityTimeout1Min;
      case AutoLockDuration.fiveMinutes:
        return l10n.securityTimeout5Min;
      case AutoLockDuration.fifteenMinutes:
        return l10n.securityTimeout15Min;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: AppGlassCard(
        borderRadius: 16,
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.securityAutoLock,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.securityAutoLock,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                for (int i = 0; i < AutoLockDuration.values.length; i++) ...[
                  if (i > 0) const SizedBox(width: 6),
                  Expanded(
                    child: _AutoLockChip(
                      label: _formatDuration(AutoLockDuration.values[i]),
                      isSelected: AutoLockDuration.values[i] == currentDuration,
                      onTap: () => onChanged(AutoLockDuration.values[i]),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AutoLockChip extends StatelessWidget {
  const _AutoLockChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outline.withValues(alpha: 0.15),
              width: isSelected ? 1.5 : 1.0,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
