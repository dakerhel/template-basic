import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/theme/widgets/app_button.dart';

void main() {
  testWidgets('AppButton renders label and triggers onPressed', (tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppButton(
              label: 'Submit Action',
              onPressed: () => tapped = true,
            ),
          ),
        ),
      ),
    );

    expect(find.text('Submit Action'), findsOneWidget);

    await tester.tap(find.text('Submit Action'));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });

  testWidgets('AppButton shows loading spinner and disables clicks when isLoading is true', (
    tester,
  ) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppButton(
              label: 'Loading Button',
              isLoading: true,
              onPressed: () => tapped = true,
            ),
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.tap(find.text('Loading Button'));
    await tester.pump();

    expect(tapped, isFalse);
  });

  testWidgets('AppIconButton renders icon and triggers onPressed', (
    tester,
  ) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppIconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => tapped = true,
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.settings), findsOneWidget);

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });
}
