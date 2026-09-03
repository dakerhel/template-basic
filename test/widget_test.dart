import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/app.dart';

void main() {
  testWidgets('Home screen smoke test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(412 * 2, 915 * 2);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('0'), findsOneWidget);

    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pump(const Duration(milliseconds: 300));

    await tester.tap(find.text('Увеличить'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('1'), findsOneWidget);
  });
}
