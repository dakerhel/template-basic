import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/update/presentation/update_controller.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../theme/utils/app_haptics.dart';
import 'app_floating_nav_bar.dart';

/// Оболочка маршрутизатора (Shell) для StatefulShellRoute с парящей панелью навигации,
/// сохранением состояния вкладок, направленными слайд-анимациями и свайпами.
class AppScaffoldShell extends ConsumerStatefulWidget {
  const AppScaffoldShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<AppScaffoldShell> createState() => _AppScaffoldShellState();
}

class _AppScaffoldShellState extends ConsumerState<AppScaffoldShell> {
  int _previousIndex = 0;

  @override
  void didUpdateWidget(covariant AppScaffoldShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.navigationShell.currentIndex !=
        widget.navigationShell.currentIndex) {
      _previousIndex = oldWidget.navigationShell.currentIndex;
    }
  }

  void _onTabSelected(int index) {
    if (index == widget.navigationShell.currentIndex) {
      widget.navigationShell.goBranch(index, initialLocation: true);
    } else {
      setState(() {
        _previousIndex = widget.navigationShell.currentIndex;
      });
      widget.navigationShell.goBranch(index);
    }
  }

  @override
  Widget build(BuildContext context) {
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

    final currentIndex = widget.navigationShell.currentIndex;
    final isForward = currentIndex >= _previousIndex;

    return PopScope(
      canPop: currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && currentIndex != 0) {
          _onTabSelected(0);
        }
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragEnd: (details) {
            final velocity = details.primaryVelocity ?? 0;
            // Свайп влево -> следующая вкладка
            if (velocity < -240 && currentIndex < navItems.length - 1) {
              AppHaptics.selection();
              _onTabSelected(currentIndex + 1);
            }
            // Свайп вправо -> предыдущая вкладка
            else if (velocity > 240 && currentIndex > 0) {
              AppHaptics.selection();
              _onTabSelected(currentIndex - 1);
            }
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 260),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            layoutBuilder: (currentChild, previousChildren) {
              return Stack(
                children: [
                  ...previousChildren,
                  if (currentChild != null) currentChild,
                ],
              );
            },
            transitionBuilder: (child, animation) {
              final offsetTween = Tween<Offset>(
                begin: isForward
                    ? const Offset(0.06, 0)
                    : const Offset(-0.06, 0),
                end: Offset.zero,
              );
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
                ),
                child: SlideTransition(
                  position: offsetTween.animate(animation),
                  child: child,
                ),
              );
            },
            child: KeyedSubtree(
              key: ValueKey<int>(currentIndex),
              child: widget.navigationShell,
            ),
          ),
        ),
        bottomNavigationBar: AppFloatingNavBar(
          currentIndex: currentIndex,
          items: navItems,
          onTap: _onTabSelected,
        ),
      ),
    );
  }
}
