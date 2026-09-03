import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/theme/widgets/app_avatar.dart';
import 'package:my_app/core/theme/widgets/app_progress_bar.dart';
import 'package:my_app/core/theme/widgets/app_segmented_control.dart';

void main() {
  group('Design System Components', () {
    testWidgets('AppSegmentedControl renders and reacts to tap', (tester) async {
      int selected = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return AppSegmentedControl<int>(
                  selectedValue: selected,
                  onValueChanged: (val) {
                    setState(() => selected = val);
                  },
                  items: const [
                    AppSegmentItem(value: 0, label: 'First'),
                    AppSegmentItem(value: 1, label: 'Second'),
                    AppSegmentItem(value: 2, label: 'Third'),
                  ],
                );
              },
            ),
          ),
        ),
      );

      expect(find.text('First'), findsOneWidget);
      expect(find.text('Second'), findsOneWidget);
      expect(find.text('Third'), findsOneWidget);

      await tester.tap(find.text('Second'));
      await tester.pumpAndSettle();

      expect(selected, equals(1));
    });

    testWidgets('AppProgressBar renders determinate and indeterminate', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppProgressBar(value: 0.5),
                AppProgressBar(value: null),
                AppCircularProgress(value: 0.75),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(AppProgressBar), findsNWidgets(2));
      expect(find.byType(AppCircularProgress), findsOneWidget);
    });

    testWidgets('AppAvatar renders initials, status and handles tap', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppAvatar(
              initials: 'AG',
              status: AppAvatarStatus.online,
              size: AppAvatarSize.large,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      expect(find.text('AG'), findsOneWidget);
      await tester.tap(find.text('AG'));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}
