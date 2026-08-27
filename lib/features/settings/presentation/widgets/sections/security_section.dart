import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final isRu = Localizations.localeOf(context).languageCode == 'ru';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsGroupHeader(title: isRu ? 'Безопасность' : 'Security'),

        // Карточка включения PIN-кода
        SettingsToggleCard(
          title: isRu ? 'Защита PIN-кодом' : 'PIN Code Protection',
          subtitle: isRu
              ? 'Запрашивать PIN-код при входе в приложение'
              : 'Require PIN code to open the application',
          value: security.settings.isPinEnabled,
          onChanged: (value) async {
            if (value) {
              await PinSetupSheet.show(context);
            } else {
              _confirmRemovePin(context, ref, isRu);
            }
          },
        ),

        // Дополнительные параметры безопасности при активном PIN
        if (security.settings.isPinEnabled) ...[
          // Биометрия
          if (security.canUseBiometrics)
            SettingsToggleCard(
              title: isRu
                  ? 'Биометрия (Отпечаток / Face ID)'
                  : 'Biometrics (Fingerprint / Face ID)',
              subtitle: isRu
                  ? 'Быстрый вход с помощью датчика устройства'
                  : 'Quick unlock using device biometric sensor',
              value: security.settings.isBiometricsEnabled,
              onChanged: (value) => ref
                  .read(securityControllerProvider.notifier)
                  .setBiometricsEnabled(value),
            ),

          // Автоблокировка
          _AutoLockCard(
            currentDuration: security.settings.autoLockDuration,
            isRu: isRu,
            onChanged: (dur) => ref
                .read(securityControllerProvider.notifier)
                .setAutoLockDuration(dur),
          ),

          // Смена PIN-кода
          ListTile(
            leading: const Icon(Icons.password_rounded),
            title: Text(isRu ? 'Изменить PIN-код' : 'Change PIN Code'),
            subtitle: Text(
              isRu
                  ? 'Установить новый 4-значный пароль'
                  : 'Set a new 4-digit password',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => PinSetupSheet.show(context, isChanging: true),
          ),

          // Заблокировать сейчас
          ListTile(
            leading: const Icon(Icons.lock_clock_outlined),
            title: Text(isRu ? 'Заблокировать сейчас' : 'Lock App Now'),
            subtitle: Text(
              isRu
                  ? 'Мгновенно перейти на экран блокировки'
                  : 'Immediately switch to lock screen',
            ),
            onTap: () =>
                ref.read(securityControllerProvider.notifier).lockManually(),
          ),
        ],
      ],
    );
  }

  void _confirmRemovePin(BuildContext context, WidgetRef ref, bool isRu) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(isRu ? 'Отключить защиту?' : 'Disable PIN Protection?'),
          content: Text(
            isRu
                ? 'PIN-код и вход по биометрии будут отключены.'
                : 'PIN code and biometric unlock will be disabled.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(isRu ? 'Отмена' : 'Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                ref.read(securityControllerProvider.notifier).removePin();
              },
              child: Text(isRu ? 'Отключить' : 'Disable'),
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
    required this.isRu,
    required this.onChanged,
  });

  final AutoLockDuration currentDuration;
  final bool isRu;
  final ValueChanged<AutoLockDuration> onChanged;

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
              isRu ? 'Автоблокировка' : 'Auto-Lock',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              isRu
                  ? 'Время неактивности до блокировки'
                  : 'Inactive time before locking',
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
                      label: isRu
                          ? AutoLockDuration.values[i].nameRu
                          : AutoLockDuration.values[i].nameEn,
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
