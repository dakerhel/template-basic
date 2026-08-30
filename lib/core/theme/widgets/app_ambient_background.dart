import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color_palette_provider.dart';
import '../liquid_glass_provider.dart';
import '../theme_mode_provider.dart';

/// Атмосферный фоновый компонент с мягкими световыми сферами (Ambient Glow / Aurora Mesh),
/// которые гармонично дополняют эффект Liquid Glass и плавно переливаются
/// при смене активной цветовой палитры и темы.
class AppAmbientBackground extends ConsumerWidget {
  const AppAmbientBackground({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(colorPaletteProvider);
    final themeMode = ref.watch(themeModeProvider);
    final isGlass = ref.watch(liquidGlassProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isOled = themeMode.isOled;

    // В OLED режиме для максимальной экономии энергии и чистого черного цвета
    // делаем свечение более тонкими акцентами
    final double primaryOpacity = isOled
        ? 0.08
        : (isDark ? 0.16 : 0.09);
    final double secondaryOpacity = isOled
        ? 0.05
        : (isDark ? 0.12 : 0.06);

    final primaryColor = (isDark ? palette.accentColor : palette.baseColor)
        .withValues(alpha: primaryOpacity);
    final secondaryColor = (isDark ? palette.baseColor : palette.accentColor)
        .withValues(alpha: secondaryOpacity);

    return Stack(
      fit: StackFit.expand,
      children: [
        // Базовый цвет фона
        Container(
          color: theme.scaffoldBackgroundColor,
        ),

        // Верхняя правая световая сфера
        if (isGlass)
          Positioned(
            top: -100,
            right: -100,
            width: 360,
            height: 360,
            child: TweenAnimationBuilder<Color?>(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              tween: ColorTween(end: primaryColor),
              builder: (context, color, _) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        color ?? primaryColor,
                        Colors.transparent,
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

        // Нижняя левая световая сфера
        if (isGlass)
          Positioned(
            bottom: -80,
            left: -80,
            width: 320,
            height: 320,
            child: TweenAnimationBuilder<Color?>(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              tween: ColorTween(end: secondaryColor),
              builder: (context, color, _) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        color ?? secondaryColor,
                        Colors.transparent,
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

        // Основное содержимое поверх фона
        if (child != null) child!,
      ],
    );
  }
}
