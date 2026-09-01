import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final themeMode = ref.watch(themeModeProvider);
    final isGlass = ref.watch(liquidGlassProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final isOled = themeMode.isOled;

    // В OLED режиме и светлом режиме делаем свечение ультра-тонким для идеального контраста
    final double primaryOpacity = isOled
        ? 0.08
        : (isDark ? 0.18 : 0.04);
    final double secondaryOpacity = isOled
        ? 0.05
        : (isDark ? 0.12 : 0.03);

    final primaryColor = colorScheme.primary.withValues(alpha: primaryOpacity);
    final secondaryColor = colorScheme.secondary.withValues(alpha: secondaryOpacity);

    // Базовый цвет фона
    // Светлая тема: строго нейтральный Slate 100 — никаких градиентов/тонов
    // Тёмная тема: colorScheme.surface с атмосферным оттенком
    final BoxDecoration backgroundDeco = isOled
        ? const BoxDecoration(color: Color(0xFF000000))
        : isDark
            ? BoxDecoration(color: colorScheme.surface)
            : const BoxDecoration(color: Color(0xFFF1F5F9)); // Slate 100

    return Stack(
      fit: StackFit.expand,
      children: [
        // Базовый цвет / градиент фона
        DecoratedBox(decoration: backgroundDeco),

        // Анимированные сферы Авроры (только тёмная / OLED тема!)
        // В светлой теме сферы не дают визуального эффекта и создают «грязный» тон.
        if (isGlass && isDark)
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
