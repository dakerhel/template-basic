import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/showcase/presentation/showcase_screen.dart';
import 'page_transitions.dart';
import 'widgets/app_scaffold_shell.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    // Главная StatefulShellRoute оболочка с интерактивным PageView и сохранением состояния
    StatefulShellRoute(
      branches: [
        // Вкладка 0: Главная
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => buildAppSlideFadeTransition(
                key: state.pageKey,
                child: const HomeScreen(),
              ),
            ),
          ],
        ),

        // Вкладка 1: Витрина компонентов UI Kit
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/showcase',
              pageBuilder: (context, state) => buildAppSlideFadeTransition(
                key: state.pageKey,
                child: const ShowcaseScreen(),
              ),
            ),
          ],
        ),

        // Вкладка 2: Настройки
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => buildAppSlideFadeTransition(
                key: state.pageKey,
                child: const SettingsScreen(),
              ),
            ),
          ],
        ),
      ],
      navigatorContainerBuilder: (
        BuildContext context,
        StatefulNavigationShell navigationShell,
        List<Widget> children,
      ) {
        return AppScaffoldShell(
          navigationShell: navigationShell,
          children: children,
        );
      },
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return navigationShell;
      },
    ),

    // Полноэкранные маршруты поверх оболочки (с кнопкой назад)
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/profile',
      pageBuilder: (context, state) => buildAppSlideFadeTransition(
        key: state.pageKey,
        child: const ProfileScreen(),
      ),
    ),
  ],
);
