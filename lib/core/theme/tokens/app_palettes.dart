import 'package:flutter/material.dart';

enum AppColorPalette {
  monochrome(
    id: 'monochrome',
    nameRu: 'Классический Монохром',
    nameEn: 'Classic Monochrome',
    accentColor: Color(0xFFFFFFFF),
    baseColor: Color(0xFF000000),
    icon: Icons.contrast_rounded,
  ),
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

  static AppColorPalette fromId(String? id) {
    if (id == null) return AppColorPalette.monochrome;
    for (final palette in values) {
      if (palette.id == id) return palette;
    }
    return AppColorPalette.monochrome;
  }

  String localizedName(Locale? locale) {
    final lang = locale?.languageCode ?? 'en';
    switch (lang) {
      case 'ru':
        return nameRu;
      case 'zh':
        switch (this) {
          case AppColorPalette.monochrome:
            return '经典黑白';
          case AppColorPalette.fuchsiaPine:
            return '松绿与洋红';
          case AppColorPalette.indigoGold:
            return '靛蓝与金黄';
          case AppColorPalette.acidViolet:
            return '荧光霓虹';
          case AppColorPalette.warmAmber:
            return '暖黄烈焰';
          case AppColorPalette.rubyGold:
            return '红宝石金';
          case AppColorPalette.pistachioMilk:
            return '开心果乳白';
          case AppColorPalette.cyberCyan:
            return '赛博青蓝';
          case AppColorPalette.toxicOled:
            return '极客终端';
        }
      case 'es':
        switch (this) {
          case AppColorPalette.monochrome:
            return 'Monocromo Clásico';
          case AppColorPalette.fuchsiaPine:
            return 'Pino y Fucsia';
          case AppColorPalette.indigoGold:
            return 'Índigo y Oro';
          case AppColorPalette.acidViolet:
            return 'Neón Ácido';
          case AppColorPalette.warmAmber:
            return 'Carmesí en Amarillo';
          case AppColorPalette.rubyGold:
            return 'Oro en Rubí';
          case AppColorPalette.pistachioMilk:
            return 'Leche de Pistacho';
          case AppColorPalette.cyberCyan:
            return 'Cíber Cian';
          case AppColorPalette.toxicOled:
            return 'Terminal Tóxico';
        }
      case 'pt':
        switch (this) {
          case AppColorPalette.monochrome:
            return 'Monocromático Clássico';
          case AppColorPalette.fuchsiaPine:
            return 'Pinheiro e Fúcsia';
          case AppColorPalette.indigoGold:
            return 'Índigo e Ouro';
          case AppColorPalette.acidViolet:
            return 'Neon Ácido';
          case AppColorPalette.warmAmber:
            return 'Carmim no Amarelo';
          case AppColorPalette.rubyGold:
            return 'Ouro no Rubi';
          case AppColorPalette.pistachioMilk:
            return 'Leite de Pistache';
          case AppColorPalette.cyberCyan:
            return 'Ciano Cyber';
          case AppColorPalette.toxicOled:
            return 'Terminal Tóxico';
        }
      case 'de':
        switch (this) {
          case AppColorPalette.monochrome:
            return 'Klassisches Monochrom';
          case AppColorPalette.fuchsiaPine:
            return 'Kiefer & Fuchsia';
          case AppColorPalette.indigoGold:
            return 'Indigo & Gold';
          case AppColorPalette.acidViolet:
            return 'Säure-Neon';
          case AppColorPalette.warmAmber:
            return 'Karmesin auf Gelb';
          case AppColorPalette.rubyGold:
            return 'Gold auf Rubin';
          case AppColorPalette.pistachioMilk:
            return 'Pistazienmilch';
          case AppColorPalette.cyberCyan:
            return 'Cyber-Cyan';
          case AppColorPalette.toxicOled:
            return 'Toxisches Terminal';
        }
      case 'fr':
        switch (this) {
          case AppColorPalette.monochrome:
            return 'Monochrome Classique';
          case AppColorPalette.fuchsiaPine:
            return 'Pin & Fuchsia';
          case AppColorPalette.indigoGold:
            return 'Indigo & Or';
          case AppColorPalette.acidViolet:
            return 'Néon Acide';
          case AppColorPalette.warmAmber:
            return 'Cramoisi sur Jaune';
          case AppColorPalette.rubyGold:
            return 'Or sur Rubis';
          case AppColorPalette.pistachioMilk:
            return 'Lait de Pistache';
          case AppColorPalette.cyberCyan:
            return 'Cyber Cyan';
          case AppColorPalette.toxicOled:
            return 'Terminal Toxique';
        }
      case 'it':
        switch (this) {
          case AppColorPalette.monochrome:
            return 'Monocromatico Classico';
          case AppColorPalette.fuchsiaPine:
            return 'Pino e Fucsia';
          case AppColorPalette.indigoGold:
            return 'Indaco e Oro';
          case AppColorPalette.acidViolet:
            return 'Neon Acido';
          case AppColorPalette.warmAmber:
            return 'Cremisi su Giallo';
          case AppColorPalette.rubyGold:
            return 'Oro su Rubino';
          case AppColorPalette.pistachioMilk:
            return 'Latte di Pistacchio';
          case AppColorPalette.cyberCyan:
            return 'Ciano Cyber';
          case AppColorPalette.toxicOled:
            return 'Terminale Tossico';
        }
      case 'ja':
        switch (this) {
          case AppColorPalette.monochrome:
            return 'クラシックモノクローム';
          case AppColorPalette.fuchsiaPine:
            return '松葉とフューシャ';
          case AppColorPalette.indigoGold:
            return '藍とゴールド';
          case AppColorPalette.acidViolet:
            return 'アシッドネオン';
          case AppColorPalette.warmAmber:
            return '琥珀とクリムゾン';
          case AppColorPalette.rubyGold:
            return 'ルビーとゴールド';
          case AppColorPalette.pistachioMilk:
            return 'ピスタチオミルク';
          case AppColorPalette.cyberCyan:
            return 'サイバーシアン';
          case AppColorPalette.toxicOled:
            return 'トキシック端末';
        }
      case 'ko':
        switch (this) {
          case AppColorPalette.monochrome:
            return '클래식 모노크롬';
          case AppColorPalette.fuchsiaPine:
            return '소나무 & 퓨샤';
          case AppColorPalette.indigoGold:
            return '인디고 & 골드';
          case AppColorPalette.acidViolet:
            return '애시드 네온';
          case AppColorPalette.warmAmber:
            return '웜 앰버 & 레드';
          case AppColorPalette.rubyGold:
            return '루비 & 골드';
          case AppColorPalette.pistachioMilk:
            return '피스타치오 밀크';
          case AppColorPalette.cyberCyan:
            return '사이버 시안';
          case AppColorPalette.toxicOled:
            return '톡식 터미널';
        }
      case 'tr':
        switch (this) {
          case AppColorPalette.monochrome:
            return 'Klasik Monokrom';
          case AppColorPalette.fuchsiaPine:
            return 'Çam ve Fuşya';
          case AppColorPalette.indigoGold:
            return 'İndigo ve Altın';
          case AppColorPalette.acidViolet:
            return 'Asit Neon';
          case AppColorPalette.warmAmber:
            return 'Sarı Üzeri Kırmızı';
          case AppColorPalette.rubyGold:
            return 'Yakut Üzeri Altın';
          case AppColorPalette.pistachioMilk:
            return 'Fıstık Sütü';
          case AppColorPalette.cyberCyan:
            return 'Siber Camgöbeği';
          case AppColorPalette.toxicOled:
            return 'Toksik Terminal';
        }
      case 'id':
        switch (this) {
          case AppColorPalette.monochrome:
            return 'Monokrom Klasik';
          case AppColorPalette.fuchsiaPine:
            return 'Pinus & Fusia';
          case AppColorPalette.indigoGold:
            return 'Nila & Emas';
          case AppColorPalette.acidViolet:
            return 'Neon Asam';
          case AppColorPalette.warmAmber:
            return 'Merah pada Kuning';
          case AppColorPalette.rubyGold:
            return 'Emas pada Rubi';
          case AppColorPalette.pistachioMilk:
            return 'Susu Pistachio';
          case AppColorPalette.cyberCyan:
            return 'Siber Sian';
          case AppColorPalette.toxicOled:
            return 'Terminal Toksik';
        }
      case 'ar':
        switch (this) {
          case AppColorPalette.monochrome:
            return 'أحادي اللون الكلاسيكي';
          case AppColorPalette.fuchsiaPine:
            return 'الصنوبر والفوشيا';
          case AppColorPalette.indigoGold:
            return 'النيلي والذهب';
          case AppColorPalette.acidViolet:
            return 'نيون حمضي';
          case AppColorPalette.warmAmber:
            return 'قرمزي على أصفر';
          case AppColorPalette.rubyGold:
            return 'ذهب على ياقوت';
          case AppColorPalette.pistachioMilk:
            return 'حليب الفستق';
          case AppColorPalette.cyberCyan:
            return 'سماوي سايبر';
          case AppColorPalette.toxicOled:
            return 'طرفية سامة';
        }
      case 'hi':
        switch (this) {
          case AppColorPalette.monochrome:
            return 'क्लासिक मोनोक्रोम';
          case AppColorPalette.fuchsiaPine:
            return 'चीड़ और फوشिया';
          case AppColorPalette.indigoGold:
            return 'इंडिगो और सोना';
          case AppColorPalette.acidViolet:
            return 'एसिड नियॉन';
          case AppColorPalette.warmAmber:
            return 'पीले पर लाल';
          case AppColorPalette.rubyGold:
            return 'रूबी पर सोना';
          case AppColorPalette.pistachioMilk:
            return 'पिस्ता दूध';
          case AppColorPalette.cyberCyan:
            return 'साइबर सियान';
          case AppColorPalette.toxicOled:
            return 'विषाक्त टर्मिनल';
        }
      default:
        return nameEn;
    }
  }

  Color get _lightPrimary {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFF0F172A);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFF064E3B);
      case AppColorPalette.indigoGold:
        return const Color(0xFF1E1B4B);
      case AppColorPalette.acidViolet:
        return const Color(0xFF3B0764);
      case AppColorPalette.warmAmber:
        return const Color(0xFF991B1B);
      case AppColorPalette.rubyGold:
        return const Color(0xFF7F1D1D);
      case AppColorPalette.pistachioMilk:
        return const Color(0xFF1E3A10);
      case AppColorPalette.cyberCyan:
        return const Color(0xFF0E7490);
      case AppColorPalette.toxicOled:
        return const Color(0xFF14532D);
    }
  }

  ColorScheme toColorScheme({
    required Brightness brightness,
    bool isOled = false,
  }) {
    final isDark = brightness == Brightness.dark;

    if (this == AppColorPalette.monochrome) {
      if (isDark) {
        final surfaceColor = isOled ? Colors.black : const Color(0xFF121216);
        final cardColor = isOled
            ? const Color(0xFF141418)
            : const Color(0xFF1E1E24);
        const accent = Color(0xFFF1F5F9);

        return ColorScheme.dark(
          primary: accent,
          onPrimary: Colors.black,
          primaryContainer: const Color(0xFF334155),
          onPrimaryContainer: const Color(0xFFF8FAFC),
          secondary: const Color(0xFF94A3B8),
          onSecondary: Colors.black,
          surface: surfaceColor,
          onSurface: isOled ? Colors.white : const Color(0xFFE2E8F0),
          surfaceContainerHighest: cardColor,
          onSurfaceVariant: const Color(0xFF94A3B8),
          outline: const Color(0xFF475569),
          outlineVariant: const Color(0xFF334155),
        );
      } else {
        const accent = Color(0xFF0F172A);
        return const ColorScheme.light(
          primary: accent,
          onPrimary: Colors.white,
          primaryContainer: Color(0xFFE2E8F0),
          onPrimaryContainer: Color(0xFF0F172A),
          secondary: Color(0xFF475569),
          onSecondary: Colors.white,
          surface: Color(0xFFF8FAFC),
          onSurface: Color(0xFF0F172A),
          surfaceContainerHighest: Color(0xFFEDF2F7),
          onSurfaceVariant: Color(0xFF64748B),
          outline: Color(0xFFCBD5E1),
          outlineVariant: Color(0xFFE2E8F0),
        );
      }
    }

    if (isDark) {
      final surfaceColor = isOled ? Colors.black : _darkSurface;
      final cardColor = isOled ? const Color(0xFF141418) : _darkCard;
      final onPrimary = accentColor.computeLuminance() > 0.45
          ? Colors.black
          : Colors.white;

      return ColorScheme.dark(
        primary: accentColor,
        onPrimary: onPrimary,
        primaryContainer: accentColor.withValues(alpha: 0.22),
        onPrimaryContainer: isOled ? Colors.white : const Color(0xFFF1F5F9),
        secondary: accentColor.withValues(alpha: 0.85),
        onSecondary: onPrimary,
        surface: surfaceColor,
        onSurface: isOled ? Colors.white : const Color(0xFFE2E8F0),
        surfaceContainerHighest: cardColor,
        onSurfaceVariant: const Color(0xFF94A3B8),
        outline: Colors.white.withValues(alpha: 0.24),
        outlineVariant: Colors.white.withValues(alpha: 0.12),
      );
    } else {
      final lightPrim = _lightPrimary;
      final surfaceColor = _lightSurface;
      final cardColor = _lightCard;

      return ColorScheme.light(
        primary: lightPrim,
        onPrimary: Colors.white,
        primaryContainer: lightPrim.withValues(alpha: 0.10),
        onPrimaryContainer: lightPrim,
        secondary: accentColor,
        onSecondary: accentColor.computeLuminance() > 0.45 ? Colors.black : Colors.white,
        surface: surfaceColor,
        onSurface: const Color(0xFF0F172A),
        surfaceContainerHighest: cardColor,
        onSurfaceVariant: const Color(0xFF475569),
        outline: lightPrim.withValues(alpha: 0.22),
        outlineVariant: const Color(0xFFCBD5E1),
      );
    }
  }

  Color get _darkSurface {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFF121216);
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
        return const Color(0xFF14240E);
      case AppColorPalette.cyberCyan:
        return const Color(0xFF081018);
      case AppColorPalette.toxicOled:
        return const Color(0xFF000000);
    }
  }

  Color get _darkCard {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFF1E1E24);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFF072B1E);
      case AppColorPalette.indigoGold:
        return const Color(0xFF0B0B45);
      case AppColorPalette.acidViolet:
        return const Color(0xFF1F0D3A);
      case AppColorPalette.warmAmber:
        return const Color(0xFF382C0A);
      case AppColorPalette.rubyGold:
        return const Color(0xFF3D060B);
      case AppColorPalette.pistachioMilk:
        return const Color(0xFF1E3316);
      case AppColorPalette.cyberCyan:
        return const Color(0xFF0F1E2E);
      case AppColorPalette.toxicOled:
        return const Color(0xFF111111);
    }
  }

  Color get _lightSurface {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFFF8FAFC);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFFF3FAF6);
      case AppColorPalette.indigoGold:
        return const Color(0xFFF4F4FD);
      case AppColorPalette.acidViolet:
        return const Color(0xFFFAF4FF);
      case AppColorPalette.warmAmber:
        return const Color(0xFFFFFDF5);
      case AppColorPalette.rubyGold:
        return const Color(0xFFFFF5F5);
      case AppColorPalette.pistachioMilk:
        return const Color(0xFFF6FAF2);
      case AppColorPalette.cyberCyan:
        return const Color(0xFFF0F9FF);
      case AppColorPalette.toxicOled:
        return const Color(0xFFF5FAF5);
    }
  }

  Color get _lightCard {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFFEDF2F7);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFFE2F3EB);
      case AppColorPalette.indigoGold:
        return const Color(0xFFE6E6FA);
      case AppColorPalette.acidViolet:
        return const Color(0xFFF0E4FF);
      case AppColorPalette.warmAmber:
        return const Color(0xFFFFF3D1);
      case AppColorPalette.rubyGold:
        return const Color(0xFFFFE0E2);
      case AppColorPalette.pistachioMilk:
        return const Color(0xFFE7F3DF);
      case AppColorPalette.cyberCyan:
        return const Color(0xFFDCF0FA);
      case AppColorPalette.toxicOled:
        return const Color(0xFFE6F5E6);
    }
  }
}
