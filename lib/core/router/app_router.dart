import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import 'page_transitions.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const HomeScreen(),
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => buildAppSlideFadeTransition(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) => buildAppSlideFadeTransition(
        key: state.pageKey,
        child: const SettingsScreen(),
      ),
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) => buildAppSlideFadeTransition(
        key: state.pageKey,
        child: const ProfileScreen(),
      ),
    ),
  ],
);

