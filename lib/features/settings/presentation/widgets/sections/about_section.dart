import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/config.dart';
import '../../../../../core/device/providers/device_providers.dart';
import '../../../../../core/device/presentation/sheets/system_diagnostics_sheet.dart';
import '../../../../../core/theme/tokens/tokens.dart';
import 'package:my_app/core/theme/widgets/app_glass.dart';
import 'package:my_app/core/theme/widgets/app_toast.dart';
import '../../../../../l10n/generated/app_localizations.dart';
import '../common/settings_group_header.dart';
import '../common/settings_link_tile.dart';

class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRu = Localizations.localeOf(context).languageCode == 'ru';

    final appAsync = ref.watch(appInfoProvider);
    final deviceAsync = ref.watch(deviceInfoProvider);

    final appInfo = appAsync.value;
    final deviceInfo = deviceAsync.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsGroupHeader(title: l10n.aboutGroup),

        // 🌟 Премиальная Hero Brand Card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: AppGlassCard(
            borderRadius: 20,
            padding: const EdgeInsets.all(18),
            onTap: () {
              HapticFeedback.lightImpact();
              SystemDiagnosticsSheet.show(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Фирменная иконка приложения с градиентным свечением
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            colorScheme.primary,
                            colorScheme.primary.withValues(alpha: 0.7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: AppShadows.glassGlow(colorScheme.primary),
                      ),
                      child: Icon(
                        Icons.auto_awesome_rounded,
                        size: 28,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(width: 14),

                    // Название и бейджи версий
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppConfig.appName,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: [
                              _VersionBadge(
                                label: appInfo != null
                                    ? 'v${appInfo.version} (${appInfo.buildNumber})'
                                    : 'v1.0.36',
                                icon: Icons.verified_outlined,
                                isPrimary: true,
                              ),
                              _VersionBadge(
                                label: 'Core ${AppConfig.coreVersion}',
                                icon: Icons.memory_rounded,
                                isPrimary: false,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Разделитель
                Divider(
                  height: 1,
                  color: colorScheme.outline.withValues(alpha: 0.15),
                ),
                const SizedBox(height: 12),

                // Нижний ряд: устройство + кнопка перехода в полную диагностику
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Icon(
                            Icons.smartphone_rounded,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              deviceInfo != null
                                  ? '${deviceInfo.displayName} • ${deviceInfo.platform}'
                                  : 'System Diagnostics',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          isRu ? 'Диагностика' : 'Diagnostics',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 18,
                          color: colorScheme.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),

        // Полезные ссылки
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

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!opened && context.mounted) {
      AppToast.error(
        context,
        AppLocalizations.of(context)!.failedToOpen(url),
      );
    }
  }
}

class _VersionBadge extends StatelessWidget {
  const _VersionBadge({
    required this.label,
    required this.icon,
    required this.isPrimary,
  });

  final String label;
  final IconData icon;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
      decoration: BoxDecoration(
        color: isPrimary
            ? colorScheme.primary.withValues(alpha: 0.12)
            : colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isPrimary
              ? colorScheme.primary.withValues(alpha: 0.3)
              : colorScheme.outline.withValues(alpha: 0.2),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 11,
            color: isPrimary
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: isPrimary
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
