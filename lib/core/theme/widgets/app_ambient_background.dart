import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color_palette_provider.dart';
import '../liquid_glass_provider.dart';
import '../theme_mode_provider.dart';

/// Атмосферный живой фоновый компонент с мягкими световыми сферами (Ambient Aurora Glow),
/// которые плавно покачиваются, создавая живую глубину для эффекта Liquid Glass.
class AppAmbientBackground extends ConsumerStatefulWidget {
  const AppAmbientBackground({super.key, this.child});

  final Widget? child;

  @override
  ConsumerState<AppAmbientBackground> createState() =>
      _AppAmbientBackgroundState();
}

class _AppAmbientBackgroundState extends ConsumerState<AppAmbientBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = ref.watch(colorPaletteProvider);
    final themeMode = ref.watch(themeModeProvider);
    final isGlass = ref.watch(liquidGlassProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final isOled = themeMode.isOled;

    // В OLED режиме делаем свечение более тонкими акцентами для идеального контраста
    final double primaryOpacity = isOled
        ? 0.09
        : (isDark ? 0.22 : 0.12);
    final double secondaryOpacity = isOled
        ? 0.06
        : (isDark ? 0.16 : 0.08);

    final primaryColor = (isDark
            ? palette.accentColor
            : palette.getSafeAccentColor(theme.brightness))
        .withValues(alpha: primaryOpacity);
    final secondaryColor = (isDark ? palette.baseColor : colorScheme.primary)
        .withValues(alpha: secondaryOpacity);

    // Базовый градиент фона
    final BoxDecoration backgroundDeco = isOled
        ? const BoxDecoration(color: Color(0xFF000000))
        : BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      const Color(0xFF101218),
                      const Color(0xFF0B0D12),
                    ]
                  : [
                      const Color(0xFFF9FAFD),
                      const Color(0xFFEEF2F8),
                    ],
            ),
          );

    return Stack(
      fit: StackFit.expand,
      children: [
        // Базовый цвет / градиент фона
        DecoratedBox(decoration: backgroundDeco),

        // Анимированные сферы Авроры (только если Liquid Glass включен)
        if (isGlass)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final progress = _controller.value;
              final sinValue = math.sin(progress * math.pi);
              final cosValue = math.cos(progress * math.pi);

              return Stack(
                fit: StackFit.expand,
                children: [
                  // 1. Верхняя правая световая сфера (Primary)
                  Positioned(
                    top: -120 + (sinValue * 25),
                    right: -100 + (cosValue * 20),
                    width: 380,
                    height: 380,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            primaryColor,
                            primaryColor.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // 2. Нижняя левая световая сфера (Secondary)
                  Positioned(
                    bottom: -100 + (cosValue * 30),
                    left: -80 + (sinValue * 25),
                    width: 360,
                    height: 360,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            secondaryColor,
                            secondaryColor.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // 3. Центральная плавающая акцентная сфера
                  Positioned(
                    top: 260 + (sinValue * 40),
                    right: -60 - (cosValue * 20),
                    width: 280,
                    height: 280,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            primaryColor.withValues(alpha: primaryOpacity * 0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

        // Основное содержимое приложения
        if (widget.child != null) widget.child!,
      ],
    );
  }
}
