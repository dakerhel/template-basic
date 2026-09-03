import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/device/presentation/sheets/system_diagnostics_sheet.dart';
import '../../../core/locale/locale_provider.dart';
import '../../../core/notifications/notifications.dart';
import '../../../core/theme/color_palette_provider.dart';
import '../../../core/theme/font_provider.dart';
import '../../../core/theme/liquid_glass_provider.dart';
import '../../../core/theme/theme_mode_provider.dart';
import '../../../core/theme/utils/app_haptics.dart';
import '../../../core/theme/widgets/app_avatar.dart';
import '../../../core/theme/widgets/app_badge.dart';
import '../../../core/theme/widgets/app_button.dart';
import '../../../core/theme/widgets/app_glass.dart';
import '../../../core/theme/widgets/app_pressable.dart';
import '../../../core/theme/widgets/app_staggered_item.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../security/presentation/controllers/security_controller.dart';
import '../../settings/presentation/widgets/sheets/unified_theme_sheet.dart';
import '../../update/data/background_update_task.dart';
import '../../update/presentation/update_controller.dart';
import '../../update/presentation/update_settings_provider.dart';
import 'home_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

final class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _forceDialogVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final l10n = AppLocalizations.of(context)!;
      ref
          .read(updateControllerProvider.notifier)
          .maybeBackgroundCheck(
            notifTitleBuilder: l10n.notifUpdateTitle,
            notifBody: l10n.notifUpdateBody,
          );
      _notifyIfJustUpdated();
      UpdateBackgroundScheduler.sync();
      _maybeShowPermissionOnboarding();
    });
  }

  Future<void> _maybeShowPermissionOnboarding() async {
    if (!mounted) return;
    final shouldPrompt = await ref
        .read(permissionOnboardingProvider.notifier)
        .checkShouldPrompt();
    if (shouldPrompt && mounted && !_forceDialogVisible) {
      await PermissionOnboardingSheet.show(context);
    }
  }

  void _maybeShowForceDialog(UpdateAvailable state) {
    if (!state.update.required || _forceDialogVisible) return;
    _forceDialogVisible = true;
    final l10n = AppLocalizations.of(context)!;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Text(l10n.forceUpdateTitle),
            content: Text(l10n.forceUpdateBody),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  _forceDialogVisible = false;
                  ref
                      .read(updateControllerProvider.notifier)
                      .downloadAndInstall();
                },
                child: Text(l10n.updateButton(state.update.version)),
              ),
            ],
          ),
        );
      },
    ).then((_) => _forceDialogVisible = false);
  }

  Future<void> _notifyIfJustUpdated() async {
    final info = await PackageInfo.fromPlatform();
    final prefs = await SharedPreferences.getInstance();
    final last = prefs.getString('last_run_version');
    if (last != null && last != info.version && mounted) {
      final notify = ref.read(updateSettingsProvider).notifyUpdates;
      if (notify) {
        final l10n = AppLocalizations.of(context)!;
        await NotificationService.showUpdated(
          l10n.notifUpdatedTitle,
          l10n.notifUpdatedBody(info.version),
        );
      }
    }
    await prefs.setString('last_run_version', info.version);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final counter = ref.watch(counterProvider);

    final palette = ref.watch(colorPaletteProvider);
    final themeMode = ref.watch(themeModeProvider);
    final isGlass = ref.watch(liquidGlassProvider);
    final font = ref.watch(fontProvider);
    final locale = ref.watch(localeProvider);

    ref.listen<UpdateState>(updateControllerProvider, (previous, next) {
      if (next is UpdateAvailable) {
        _maybeShowForceDialog(next);
      } else if (next is UpdateIdle ||
          next is UpdateUpToDate ||
          next is UpdateError) {
        _forceDialogVisible = false;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          Hero(
            tag: 'profile_avatar_hero',
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: AppAvatar(
                  size: AppAvatarSize.small,
                  status: AppAvatarStatus.online,
                  onTap: () => context.push('/profile'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
        children: [
          // 1. Hero баннер дизайн-системы
          AppStaggeredItem(
            index: 0,
            child: AppGlassCard(
              borderRadius: 16,
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.primaryContainer.withValues(alpha: 0.7),
                    ),
                    child: Icon(
                      Icons.auto_awesome_rounded,
                      color: colorScheme.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Design System Starter',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Flutter 3 • Riverpod • Liquid Glass UI Kit',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppBadge(
                    label: 'v1.0.57',
                    variant: AppBadgeVariant.primary,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          // 2. Интерактивная карточка живых токенов (Live Tokens Dashboard)
          AppStaggeredItem(
            index: 1,
            child: AppGlassCard(
              borderRadius: 16,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Активные токены системы',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      AppPressable(
                        onTap: () {
                          AppHaptics.selection();
                          UnifiedThemeSheet.show(context, ref);
                        },
                        child: Row(
                          children: [
                            Text(
                              'Настроить',
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 2),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 16,
                              color: colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _TokenChip(
                        icon: Icons.palette_outlined,
                        label: palette.localizedName(locale),
                        colorPreview: palette.accentColor,
                      ),
                      _TokenChip(
                        icon: themeMode.icon,
                        label: themeMode.localizedName(locale, l10n),
                      ),
                      _TokenChip(
                        icon: isGlass
                            ? Icons.blur_on_rounded
                            : Icons.blur_off_rounded,
                        label: isGlass ? 'Liquid Glass' : 'Solid',
                      ),
                      _TokenChip(
                        icon: Icons.text_fields_rounded,
                        label: '${(font.scale * 100).round()}%',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          // 3. Быстрые действия дизайн-системы (Quick Actions Grid)
          AppStaggeredItem(
            index: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: Text(
                    'Быстрые действия',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: _QuickActionCard(
                        icon: Icons.palette_rounded,
                        label: 'Шторка тем',
                        subtitle: '9 палитр и режимы',
                        onTap: () => UnifiedThemeSheet.show(context, ref),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _QuickActionCard(
                        icon: Icons.widgets_rounded,
                        label: 'Витрина UI',
                        subtitle: 'Все компоненты',
                        onTap: () => context.go('/showcase'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _QuickActionCard(
                        icon: Icons.lock_outline_rounded,
                        label: 'Тест защиты',
                        subtitle: 'Блокировка экрана',
                        onTap: () {
                          AppHaptics.light();
                          ref.read(securityControllerProvider.notifier).lockManually();
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _QuickActionCard(
                        icon: Icons.developer_mode_rounded,
                        label: 'Диагностика',
                        subtitle: 'DPR, память, ОС',
                        onTap: () => SystemDiagnosticsSheet.show(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // 4. Интерактивный счетчик состояния Riverpod
          AppStaggeredItem(
            index: 3,
            child: AppGlassCard(
              borderRadius: 16,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Реактивное состояние Riverpod',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Text(
                      '$counter',
                      key: ValueKey<int>(counter),
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      AppButton(
                        label: 'Увеличить',
                        variant: AppButtonVariant.filled,
                        leadingIcon: const Icon(Icons.add_rounded),
                        onPressed: () {
                          AppHaptics.light();
                          ref.read(counterProvider.notifier).increment();
                        },
                      ),
                      AppButton(
                        label: 'Сбросить',
                        variant: AppButtonVariant.ghost,
                        leadingIcon: const Icon(Icons.refresh_rounded),
                        onPressed: () {
                          AppHaptics.selection();
                          ref.read(counterProvider.notifier).reset();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TokenChip extends StatelessWidget {
  const _TokenChip({
    required this.icon,
    required this.label,
    this.colorPreview,
  });

  final IconData icon;
  final String label;
  final Color? colorPreview;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.06)
            : Colors.black.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.10)
              : Colors.black.withValues(alpha: 0.06),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (colorPreview != null) ...[
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: colorPreview,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colorPreview!.withValues(alpha: 0.5),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
          ] else ...[
            Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppGlassCard(
      borderRadius: 14,
      padding: const EdgeInsets.all(12),
      onTap: () {
        AppHaptics.light();
        onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: colorScheme.primary),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
