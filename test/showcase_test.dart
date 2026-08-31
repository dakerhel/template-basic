import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/features/showcase/presentation/showcase_screen.dart';

void main() {
  testWidgets('ShowcaseScreen renders sections and interactive components', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ShowcaseScreen(),
        ),
      ),
    );

    // Initial pump
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Витрина компонентов'), findsOneWidget);
    expect(find.text('Кнопки (AppButton & AppIconButton)'), findsOneWidget);
    expect(find.text('Поля ввода (AppTextField & Search)'), findsOneWidget);
    expect(find.text('Плавающие тосты (AppToast HUD)'), findsOneWidget);
    expect(find.text('Модальные шторки (AppBottomSheet)'), findsOneWidget);
    expect(find.text('Бейджи и теги (AppBadge & AppChip)'), findsOneWidget);
    expect(find.text('Тактильная отдача (AppHaptics Engine)'), findsOneWidget);
  });
}
