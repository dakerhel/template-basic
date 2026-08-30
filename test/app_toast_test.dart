import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/theme/widgets/app_toast.dart';

void main() {
  testWidgets('AppToast displays message and dismisses properly', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  AppToast.success(
                    context,
                    'Saved successfully',
                    title: 'Success',
                  );
                },
                child: const Text('Show Toast'),
              );
            },
          ),
        ),
      ),
    );

    // Tap to show toast
    await tester.tap(find.text('Show Toast'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Saved successfully'), findsOneWidget);
    expect(find.text('Success'), findsOneWidget);

    // Call hide
    AppToast.hide();
    await tester.pump();

    expect(find.text('Saved successfully'), findsNothing);
  });
}
