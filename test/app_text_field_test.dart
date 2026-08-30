import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/theme/widgets/app_text_field.dart';

void main() {
  testWidgets('AppTextField enters text and clear button clears text', (
    tester,
  ) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: AppTextField(
              controller: controller,
              label: 'Username',
              hint: 'Enter username',
              clearable: true,
            ),
          ),
        ),
      ),
    );

    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Enter username'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'JohnDoe');
    await tester.pumpAndSettle();

    expect(controller.text, 'JohnDoe');
    expect(find.byIcon(Icons.cancel_rounded), findsOneWidget);

    // Tap clear button
    await tester.tap(find.byIcon(Icons.cancel_rounded));
    await tester.pumpAndSettle();

    expect(controller.text, '');
    expect(find.byIcon(Icons.cancel_rounded), findsNothing);
  });

  testWidgets('AppTextField with isPassword toggles visibility', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16),
            child: AppTextField(
              initialValue: 'secretpassword',
              isPassword: true,
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);

    // Tap eye icon to show password
    await tester.tap(find.byIcon(Icons.visibility_off_outlined));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
  });
}
