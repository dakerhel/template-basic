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
    final themeMode = ref.watch(themeModeProvider);
    final isGlass = ref.watch(liquidGlassProvider);
    final palette = ref.watch(colorPaletteProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isOled = themeMode.isOled;

    // В светлом режиме сферы используют яркие светящиеся цвета акцента и базы
    final primaryColor = isOled
        ? palette.accentColor.withValues(alpha: 0.08)
        : (isDark
            ? palette.accentColor.withValues(alpha: 0.20)
            : palette.accentColor.withValues(alpha: 0.15));

    final secondarySource = palette.toColorScheme(brightness: Brightness.dark).secondary;
    final secondaryColor = isOled
        ? secondarySource.withValues(alpha: 0.05)
        : (isDark
            ? secondarySource.withValues(alpha: 0.14)
            : secondarySource.withValues(alpha: 0.12));

    // Базовый холст фона
    final BoxDecoration backgroundDeco = isOled
        ? const BoxDecoration(color: Color(0xFF000000))
        : isDark
            ? BoxDecoration(color: theme.colorScheme.surface)
            : const BoxDecoration(color: Color(0xFFF8FAFC)); // Чистый фарфоровый холст

    return Stack(
      fit: StackFit.expand,
      children: [
        // Базовый цвет / градиент фона
        DecoratedBox(decoration: backgroundDeco),

        // Анимированные сферы Авроры (когда Liquid Glass включен)
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
                            primaryColor.withValues(alpha: primaryColor.a * 0.7),
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
