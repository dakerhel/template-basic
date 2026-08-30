import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/core/router/page_transitions.dart';

void main() {
  testWidgets('buildAppSlideFadeTransition constructs CustomTransitionPage', (
    tester,
  ) async {
    final page = buildAppSlideFadeTransition(
      key: const ValueKey('test_page'),
      child: const Text('Target Page Content'),
    );

    expect(page, isA<CustomTransitionPage<void>>());

    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => buildAppSlideFadeTransition(
            key: state.pageKey,
            child: const Scaffold(body: Text('Home Screen Transition')),
          ),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.text('Home Screen Transition'), findsOneWidget);
  });
}
