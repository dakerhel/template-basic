import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/update/presentation/update_controller.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../theme/utils/app_haptics.dart';
import 'app_floating_nav_bar.dart';

/// Оболочка маршрутизатора (Shell) для StatefulShellRoute с парящей панелью навигации,
/// сохранением состояния вкладок, обработкой жеста «Назад» на Android и горизонтальным свайпом.
class AppScaffoldShell extends ConsumerWidget {
  const AppScaffoldShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final updateState = ref.watch(updateControllerProvider);
    final bool hasUpdateBadge = updateState is UpdateAvailable;

    final navHome = l10n?.navHome ?? 'Главная';
    final navShowcase = l10n?.navShowcase ?? 'Витрина';
    final navSettings = l10n?.settingsTitle ?? 'Настройки';

    final navItems = [
      AppNavItem(
        icon: Icons.home_outlined,
        selectedIcon: Icons.home_rounded,
        label: navHome,
      ),
      AppNavItem(
        icon: Icons.widgets_outlined,
        selectedIcon: Icons.widgets_rounded,
        label: navShowcase,
      ),
      AppNavItem(
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings_rounded,
        label: navSettings,
        hasBadge: hasUpdateBadge,
      ),
    ];

    return PopScope(
      canPop: navigationShell.currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && navigationShell.currentIndex != 0) {
          navigationShell.goBranch(0);
        }
      },
      child: Scaffold(
        extendBody: true,
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragEnd: (details) {
            final velocity = details.primaryVelocity ?? 0;
            // Свайп влево -> следующая вкладка
            if (velocity < -220 && navigationShell.currentIndex < navItems.length - 1) {
              AppHaptics.selection();
              navigationShell.goBranch(navigationShell.currentIndex + 1);
            }
            // Свайп вправо -> предыдущая вкладка
            else if (velocity > 220 && navigationShell.currentIndex > 0) {
              AppHaptics.selection();
              navigationShell.goBranch(navigationShell.currentIndex - 1);
            }
          },
          child: navigationShell,
        ),
        bottomNavigationBar: AppFloatingNavBar(
          currentIndex: navigationShell.currentIndex,
          items: navItems,
          onTap: (index) => navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          ),
        ),
      ),
    );
  }
}
