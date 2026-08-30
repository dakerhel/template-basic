import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/router/widgets/app_floating_nav_bar.dart';

void main() {
  testWidgets('AppFloatingNavBar renders items and responds to tab change', (
    tester,
  ) async {
    int selectedIndex = 0;

    final items = const [
      AppNavItem(
        icon: Icons.home_outlined,
        selectedIcon: Icons.home,
        label: 'Home',
      ),
      AppNavItem(
        icon: Icons.widgets_outlined,
        selectedIcon: Icons.widgets,
        label: 'Showcase',
      ),
      AppNavItem(
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings,
        label: 'Settings',
        hasBadge: true,
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: StatefulBuilder(
            builder: (context, setState) {
              return AppFloatingNavBar(
                currentIndex: selectedIndex,
                items: items,
                onTap: (index) {
                  setState(() => selectedIndex = index);
                },
              );
            },
          ),
        ),
      ),
    );

    // Active tab shows text
    expect(find.text('Home'), findsOneWidget);
    // Inactive tabs show icons
    expect(find.byIcon(Icons.widgets_outlined), findsOneWidget);
    expect(find.byIcon(Icons.settings_outlined), findsOneWidget);

    // Tap Showcase tab icon
    await tester.tap(find.byIcon(Icons.widgets_outlined));
    await tester.pumpAndSettle();

    expect(selectedIndex, 1);
    expect(find.text('Showcase'), findsOneWidget);
  });
}
