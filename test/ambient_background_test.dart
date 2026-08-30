import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/theme/color_palette_provider.dart';
import 'package:my_app/core/theme/tokens/app_palettes.dart';
import 'package:my_app/core/theme/widgets/app_ambient_background.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('AppAmbientBackground renders child and reacts to glass setting', (
    tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: AppAmbientBackground(
              child: Text('Content inside ambient'),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Content inside ambient'), findsOneWidget);
    expect(find.byType(DecoratedBox), findsWidgets);
  });

  testWidgets('AppAmbientBackground adapts to color palette changes', (
    tester,
  ) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: Scaffold(
            body: AppAmbientBackground(
              child: SizedBox(),
            ),
          ),
        ),
      ),
    );

    expect(find.byType(AnimatedBuilder), findsWidgets);

    await container
        .read(colorPaletteProvider.notifier)
        .setPalette(AppColorPalette.cyberCyan);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.byType(AnimatedBuilder), findsWidgets);
  });
}
