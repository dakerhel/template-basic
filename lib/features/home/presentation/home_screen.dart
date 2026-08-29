import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/notifications/notifications.dart';
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
    final counter = ref.watch(counterProvider);
    ref.listen<UpdateState>(updateControllerProvider, (previous, next) {
      if (next is UpdateAvailable) {
        _maybeShowForceDialog(next);
      } else if (next is UpdateIdle ||
          next is UpdateUpToDate ||
          next is UpdateError) {
        // Сбрасываем флаг только в терминальных состояниях
        // UpdateDownloading не сбрасывает флаг — пользователь уже подтвердил обновление
        _forceDialogVisible = false;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            tooltip: l10n.profileTitle,
            onPressed: () => context.push('/profile'),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: l10n.settingsTitle,
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.homeGreeting,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            Text('$counter', style: Theme.of(context).textTheme.displayMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
