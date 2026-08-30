import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/theme/widgets/app_pressable.dart';

void main() {
  testWidgets('AppPressable triggers onTap on tap gesture', (tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppPressable(
              onTap: () => tapped = true,
              child: const Text('Tap Me'),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Tap Me'), findsOneWidget);

    await tester.tap(find.text('Tap Me'));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });

  testWidgets('AppPressable scales on pointer down and returns on pointer up', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppPressable(
              onTap: () {},
              pressedScale: 0.9,
              child: Container(
                key: const ValueKey('pressable_box'),
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );

    final gesture = await tester.startGesture(
      tester.getCenter(find.byKey(const ValueKey('pressable_box'))),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 150));

    final scaleFinder = find.descendant(
      of: find.byType(AppPressable),
      matching: find.byType(ScaleTransition),
    );
    expect(scaleFinder, findsOneWidget);

    final ScaleTransition scaleWidget = tester.widget(scaleFinder);
    expect(scaleWidget.scale.value, closeTo(0.9, 0.05));

    await gesture.up();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    final ScaleTransition scaleWidgetAfter = tester.widget(scaleFinder);
    expect(scaleWidgetAfter.scale.value, closeTo(1.0, 0.01));
  });
}
