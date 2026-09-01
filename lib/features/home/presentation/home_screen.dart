import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/notifications/notifications.dart';
import '../../../core/theme/utils/app_haptics.dart';
import '../../../core/theme/widgets/app_button.dart';
import '../../../core/theme/widgets/app_glass.dart';
import '../../../core/theme/widgets/app_staggered_item.dart';
import '../../../l10n/generated/app_localizations.dart';
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
              child: IconButton(
                icon: const Icon(Icons.account_circle_outlined),
                tooltip: l10n.profileTitle,
                onPressed: () => context.push('/profile'),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
        children: [
          // Hero приветствие
          AppStaggeredItem(
            index: 0,
            child: AppGlassCard(
              borderRadius: 14,
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorScheme.primaryContainer.withValues(
                            alpha: 0.7,
                          ),
                        ),
                        child: Icon(
                          Icons.rocket_launch_rounded,
                          color: colorScheme.primary,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.homeGreeting,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Material 3 • Liquid Glass • Stateful Navigation',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Интерактивный счетчик состояния
          AppStaggeredItem(
            index: 1,
            child: AppGlassCard(
              borderRadius: 14,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              child: Column(
                children: [
                  Text(
                    'Реактивное состояние Riverpod',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
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
                  const SizedBox(height: 20),
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
                        label: 'Шоукейс UI Kit',
                        variant: AppButtonVariant.tonal,
                        trailingIcon: const Icon(Icons.arrow_forward_rounded),
                        onPressed: () => context.go('/showcase'),
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
