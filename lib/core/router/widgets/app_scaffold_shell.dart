import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/update/presentation/update_controller.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../theme/utils/app_haptics.dart';
import 'app_floating_nav_bar.dart';

/// Оболочка маршрутизатора (Shell) для StatefulShellRoute с парящей панелью навигации,
/// интерактивным 1:1 PageView-свайпом между экранами и сохранением состояния.
class AppScaffoldShell extends ConsumerStatefulWidget {
  const AppScaffoldShell({
    super.key,
    required this.navigationShell,
    this.children,
  });

  final StatefulNavigationShell navigationShell;
  final List<Widget>? children;

  @override
  ConsumerState<AppScaffoldShell> createState() => _AppScaffoldShellState();
}

class _AppScaffoldShellState extends ConsumerState<AppScaffoldShell> {
  late final PageController _pageController;
  bool _isAnimatingPage = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.navigationShell.currentIndex,
    );
  }

  @override
  void didUpdateWidget(covariant AppScaffoldShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    final targetPage = widget.navigationShell.currentIndex;
    if (_pageController.hasClients &&
        !_isAnimatingPage &&
        _pageController.page?.round() != targetPage) {
      _isAnimatingPage = true;
      _pageController
          .animateToPage(
            targetPage,
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeOutCubic,
          )
          .then((_) {
            if (mounted) {
              _isAnimatingPage = false;
            }
          });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    if (index == widget.navigationShell.currentIndex) {
      widget.navigationShell.goBranch(index, initialLocation: true);
    } else {
      AppHaptics.selection();
      if (_pageController.hasClients) {
        _isAnimatingPage = true;
        _pageController
            .animateToPage(
              index,
              duration: const Duration(milliseconds: 320),
              curve: Curves.easeOutCubic,
            )
            .then((_) {
              if (mounted) {
                _isAnimatingPage = false;
              }
            });
      }
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

    Widget bodyContent;
    if (widget.children != null && widget.children!.isNotEmpty) {
      bodyContent = PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        onPageChanged: (index) {
          if (index != widget.navigationShell.currentIndex) {
            AppHaptics.selection();
            widget.navigationShell.goBranch(index);
          }
        },
        children: widget.children!,
      );
    } else {
      bodyContent = widget.navigationShell;
    }

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
        body: bodyContent,
        bottomNavigationBar: AppFloatingNavBar(
          currentIndex: currentIndex,
          items: navItems,
          onTap: _onTabSelected,
        ),
      ),
    );
  }
}
