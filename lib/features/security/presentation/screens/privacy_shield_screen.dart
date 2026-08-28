import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/theme/tokens/tokens.dart';

class PrivacyShieldScreen extends StatelessWidget {
  const PrivacyShieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Оптическое глубокое размытие
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.85)
                  : colorScheme.surface.withValues(alpha: 0.9),
            ),
          ),

          // Центрированная иконка защиты
          Center(
            child: Container(
              padding: AppSpacing.allXl,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.8,
                ),
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.25),
                  width: 1.5,
                ),
                boxShadow: AppShadows.elevated,
              ),
              child: Icon(
                Icons.shield_rounded,
                size: AppIcons.hero,
                color: colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
