import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../theme/tokens/tokens.dart';
import '../../../theme/widgets/app_glass.dart';
import '../providers/permission_onboarding_provider.dart';

/// Высококлассная банковская шторка запроса разрешений на уведомления (Pre-Prompt).
class PermissionOnboardingSheet extends ConsumerWidget {
  const PermissionOnboardingSheet({super.key});

  /// Отображает шторку модально и возвращает true, если разрешение было предоставлено
  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const PermissionOnboardingSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(permissionOnboardingProvider);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: AppGlassCard(
        borderRadius: 28,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Иконка-бейдж с градиентом
            Center(
              child: Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primaryContainer,
                      colorScheme.primary.withValues(alpha: 0.8),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_active_rounded,
                    size: 34,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),

            // Заголовок
            Text(
              l10n.permissionOnboardingTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(height: 10),

            // Описание
            Text(
              l10n.permissionOnboardingBody,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 22),

            // Список преимуществ (Benefits)
            _BenefitTile(
              icon: Icons.system_update_rounded,
              iconColor: colorScheme.primary,
              title: l10n.permissionUpdatesBenefitTitle,
              subtitle: l10n.permissionUpdatesBenefitDesc,
            ),
            const SizedBox(height: 12),
            _BenefitTile(
              icon: Icons.shield_outlined,
              iconColor: colorScheme.secondary,
              title: l10n.permissionSecurityBenefitTitle,
              subtitle: l10n.permissionSecurityBenefitDesc,
            ),
            const SizedBox(height: 26),

            // Главная кнопка "Включить уведомления"
            FilledButton(
              onPressed: state.isLoading
                  ? null
                  : () async {
                      HapticFeedback.mediumImpact();
                      final granted = await ref
                          .read(permissionOnboardingProvider.notifier)
                          .requestPermission();

                      if (context.mounted) {
                        Navigator.of(context).pop(granted);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              granted
                                  ? l10n.permissionGrantedSnackbar
                                  : l10n.permissionDeniedSnackbar,
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: AppRadius.button,
                            ),
                          ),
                        );
                      }
                    },
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.button,
                ),
              ),
              child: state.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      l10n.permissionOnboardingAction,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
            const SizedBox(height: 6),

            // Кнопка "Позже"
            TextButton(
              onPressed: () async {
                HapticFeedback.lightImpact();
                await ref
                    .read(permissionOnboardingProvider.notifier)
                    .dismiss();
                if (context.mounted) {
                  Navigator.of(context).pop(false);
                }
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                foregroundColor: colorScheme.onSurfaceVariant,
              ),
              child: Text(
                l10n.permissionOnboardingDismiss,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BenefitTile extends StatelessWidget {
  const _BenefitTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
