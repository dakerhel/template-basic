import 'package:flutter/material.dart';

enum AppColorPalette {
  fuchsiaPine(
    id: 'fuchsia_pine',
    nameRu: 'Хвоя и Фуксия',
    nameEn: 'Pine & Fuchsia',
    accentColor: Color(0xFFFF62FF),
    baseColor: Color(0xFF013220),
    icon: Icons.forest_outlined,
  ),
  indigoGold(
    id: 'indigo_gold',
    nameRu: 'Индиго и Золото',
    nameEn: 'Indigo & Gold',
    accentColor: Color(0xFFFFD700),
    baseColor: Color(0xFF000080),
    icon: Icons.auto_awesome_outlined,
  ),
  acidViolet(
    id: 'acid_violet',
    nameRu: 'Кислотный Неон',
    nameEn: 'Acid Violet',
    accentColor: Color(0xFF39FF14),
    baseColor: Color(0xFF1A0933),
    icon: Icons.bolt_outlined,
  ),
  warmAmber(
    id: 'warm_amber',
    nameRu: 'Красный по Жёлтому',
    nameEn: 'Warm Amber & Red',
    accentColor: Color(0xFF990011),
    baseColor: Color(0xFFFFD85F),
    icon: Icons.local_fire_department_outlined,
  ),
  rubyGold(
    id: 'ruby_gold',
    nameRu: 'Жёлтый по Красному',
    nameEn: 'Ruby & Gold',
    accentColor: Color(0xFFFFD85F),
    baseColor: Color(0xFF990011),
    icon: Icons.diamond_outlined,
  ),
  pistachioMilk(
    id: 'pistachio_milk',
    nameRu: 'Фисташковое Молоко',
    nameEn: 'Pistachio Milk',
    accentColor: Color(0xFF669944),
    baseColor: Color(0xFFFFF9EE),
    icon: Icons.spa_outlined,
  ),
  cyberCyan(
    id: 'cyber_cyan',
    nameRu: 'Электро-Бирюза',
    nameEn: 'Cyber Cyan',
    accentColor: Color(0xFF00F5FF),
    baseColor: Color(0xFF081018),
    icon: Icons.waves_outlined,
  ),
  toxicOled(
    id: 'toxic_oled',
    nameRu: 'Токсичный Терминал',
    nameEn: 'Toxic Terminal',
    accentColor: Color(0xFF39FF14),
    baseColor: Color(0xFF000000),
    icon: Icons.terminal_outlined,
  );

  const AppColorPalette({
    required this.id,
    required this.nameRu,
    required this.nameEn,
    required this.accentColor,
    required this.baseColor,
    required this.icon,
  });

  final String id;
  final String nameRu;
  final String nameEn;
  final Color accentColor;
  final Color baseColor;
  final IconData icon;

  String localizedName(Locale? locale) {
    if (locale?.languageCode == 'ru') return nameRu;
    return nameEn;
  }

  ColorScheme toColorScheme({
    required Brightness brightness,
    bool isOled = false,
  }) {
    final isDark = brightness == Brightness.dark;

    if (isDark) {
      final surfaceColor = isOled ? Colors.black : _darkSurface;
      final cardColor = isOled ? const Color(0xFF121212) : _darkCard;
      final onPrimary = accentColor.computeLuminance() > 0.5
          ? Colors.black
          : Colors.white;

      return ColorScheme.dark(
        primary: accentColor,
        onPrimary: onPrimary,
        primaryContainer: accentColor.withValues(alpha: 0.25),
        onPrimaryContainer: accentColor,
        secondary: accentColor.withValues(alpha: 0.85),
        onSecondary: onPrimary,
        surface: surfaceColor,
        onSurface: isOled ? Colors.white : const Color(0xFFE6E6E6),
        surfaceContainerHighest: cardColor,
        onSurfaceVariant: const Color(0xFFB0B0B0),
        outline: accentColor.withValues(alpha: 0.35),
        outlineVariant: const Color(0xFF333333),
      );
    } else {
      final surfaceColor = _lightSurface;
      final cardColor = _lightCard;
      final onPrimary = accentColor.computeLuminance() > 0.5
          ? Colors.black
          : Colors.white;

      return ColorScheme.light(
        primary: accentColor,
        onPrimary: onPrimary,
        primaryContainer: accentColor.withValues(alpha: 0.15),
        onPrimaryContainer: accentColor,
        secondary: accentColor.withValues(alpha: 0.8),
        onSecondary: onPrimary,
        surface: surfaceColor,
        onSurface: const Color(0xFF1C1B1F),
        surfaceContainerHighest: cardColor,
        onSurfaceVariant: const Color(0xFF49454F),
        outline: accentColor.withValues(alpha: 0.3),
        outlineVariant: const Color(0xFFCAC4D0),
      );
    }
  }

  Color get _darkSurface {
    switch (this) {
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFF031A11);
      case AppColorPalette.indigoGold:
        return const Color(0xFF05052E);
      case AppColorPalette.acidViolet:
        return const Color(0xFF140728);
      case AppColorPalette.warmAmber:
        return const Color(0xFF261D05);
      case AppColorPalette.rubyGold:
        return const Color(0xFF2B0205);
      case AppColorPalette.pistachioMilk:
        return const Color(0xFF131A10);
      case AppColorPalette.cyberCyan:
        return const Color(0xFF060D14);
      case AppColorPalette.toxicOled:
        return Colors.black;
    }
  }

  Color get _darkCard {
    switch (this) {
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFF062A1D);
      case AppColorPalette.indigoGold:
        return const Color(0xFF0A0C42);
      case AppColorPalette.acidViolet:
        return const Color(0xFF240E42);
      case AppColorPalette.warmAmber:
        return const Color(0xFF3B2F0E);
      case AppColorPalette.rubyGold:
        return const Color(0xFF42080D);
      case AppColorPalette.pistachioMilk:
        return const Color(0xFF1E291B);
      case AppColorPalette.cyberCyan:
        return const Color(0xFF0D1C29);
      case AppColorPalette.toxicOled:
        return const Color(0xFF121212);
    }
  }

  Color get _lightSurface {
    switch (this) {
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFFF4FAF6);
      case AppColorPalette.indigoGold:
        return const Color(0xFFF5F5FF);
      case AppColorPalette.acidViolet:
        return const Color(0xFFFAF5FF);
      case AppColorPalette.warmAmber:
        return const Color(0xFFFFFBEA);
      case AppColorPalette.rubyGold:
        return const Color(0xFFFFF0F2);
      case AppColorPalette.pistachioMilk:
        return const Color(0xFFFFFDF8);
      case AppColorPalette.cyberCyan:
        return const Color(0xFFF0FAFF);
      case AppColorPalette.toxicOled:
        return const Color(0xFFF5FAF5);
    }
  }

  Color get _lightCard {
    switch (this) {
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFFE3F3EA);
      case AppColorPalette.indigoGold:
        return const Color(0xFFE8E9FF);
      case AppColorPalette.acidViolet:
        return const Color(0xFFF0E5FF);
      case AppColorPalette.warmAmber:
        return const Color(0xFFFFF2C2);
      case AppColorPalette.rubyGold:
        return const Color(0xFFFFDDE1);
      case AppColorPalette.pistachioMilk:
        return const Color(0xFFF2EEDF);
      case AppColorPalette.cyberCyan:
        return const Color(0xFFDAF4FF);
      case AppColorPalette.toxicOled:
        return const Color(0xFFE4F7E4);
    }
  }

  static AppColorPalette fromId(String? id) {
    if (id == null) return AppColorPalette.fuchsiaPine;
    for (final palette in values) {
      if (palette.id == id) return palette;
    }
    return AppColorPalette.fuchsiaPine;
  }
}
