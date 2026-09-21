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
    nameRu: 'Тёплый Янтарь',
    nameEn: 'Warm Amber & Gold',
    accentColor: Color(0xFFD97706),
    baseColor: Color(0xFFFEF3C7),
    icon: Icons.local_fire_department_outlined,
  ),
  rubyGold(
    id: 'ruby_gold',
    nameRu: 'Рубин и Золото',
    nameEn: 'Ruby & Gold',
    accentColor: Color(0xFFDC2626),
    baseColor: Color(0xFFFEF08A),
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

  /// Безопасный контрастный цвет акцента для иконок, свотчей и индикаторов на светлом фоне
  Color getSafeAccentColor(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return accentColor;
    }
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFF0F172A);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFFC026D3);
      case AppColorPalette.indigoGold:
        return const Color(0xFFD97706);
      case AppColorPalette.acidViolet:
        return const Color(0xFF65A30D);
      case AppColorPalette.warmAmber:
        return const Color(0xFFD97706);
      case AppColorPalette.rubyGold:
        return const Color(0xFFDC2626);
      case AppColorPalette.pistachioMilk:
        return const Color(0xFF4D7C0F);
      case AppColorPalette.cyberCyan:
        return const Color(0xFF0284C7);
      case AppColorPalette.toxicOled:
        return const Color(0xFF16A34A);
    }
  }

  /// Возвращает пару ключевых цветов (базовый тон палитры, акцентный цвет)
  /// для фирменного двухцветного шарика (сплит-круга) в шторке тем
  (Color, Color) getSwatchColors(Brightness brightness, {bool isOled = false}) {
    if (brightness == Brightness.dark) {
      if (this == AppColorPalette.monochrome) {
        return (const Color(0xFF1E1E24), Colors.white);
      }
      final base = isOled ? Colors.black : _darkCard;
      return (base, accentColor);
    } else {
      // В светлой теме шарик показывает сочный дуэт: Базовый цвет палитры + Акцентный цвет
      switch (this) {
        case AppColorPalette.monochrome:
          return (const Color(0xFF0F172A), const Color(0xFFF1F5F9));
        case AppColorPalette.fuchsiaPine:
          return (const Color(0xFF047857), const Color(0xFFFF62FF)); // Хвоя + Фуксия
        case AppColorPalette.indigoGold:
          return (const Color(0xFF312E81), const Color(0xFFFFD700)); // Индиго + Золото
        case AppColorPalette.acidViolet:
          return (const Color(0xFF6B21A8), const Color(0xFF39FF14)); // Фиолет + Кислота
        case AppColorPalette.warmAmber:
          return (const Color(0xFFB45309), const Color(0xFFF59E0B)); // Тёплый янтарь + Золото
        case AppColorPalette.rubyGold:
          return (const Color(0xFFBE123C), const Color(0xFFF59E0B)); // Рубин + Золото
        case AppColorPalette.pistachioMilk:
          return (const Color(0xFF4D7C0F), const Color(0xFF84CC16)); // Матча + Фисташка
        case AppColorPalette.cyberCyan:
          return (const Color(0xFF0369A1), const Color(0xFF00F5FF)); // Тёмный циан + Электро-циан
        case AppColorPalette.toxicOled:
          return (const Color(0xFF0F172A), const Color(0xFF39FF14)); // Чёрный терминал + Зелёный неон
      }
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
          primaryContainer: Color(0xFFF1F5F9),
          onPrimaryContainer: Color(0xFF0F172A),
          secondary: Color(0xFF475569),
          onSecondary: Colors.white,
          surface: Color(0xFFF8FAFC),
          onSurface: Color(0xFF0F172A),
          surfaceContainerHighest: Colors.white,
          onSurfaceVariant: Color(0xFF64748B),
          outline: Color(0xFFCBD5E1),
          outlineVariant: Color(0xFFE2E8F0),
        );
      }
    }

    if (isDark) {
      final surfaceColor = isOled ? Colors.black : _darkSurface;
      final cardColor = isOled ? const Color(0xFF0A0A0E) : _darkCard;
      
      // Динамический расчет контрастного цвета текста на акценте
      final onPrimary = accentColor.computeLuminance() > 0.45
          ? (isOled ? Colors.black : const Color(0xFF0A0D14))
          : Colors.white;

      return ColorScheme.dark(
        primary: accentColor,
        onPrimary: onPrimary,
        primaryContainer: accentColor.withValues(alpha: 0.22),
        onPrimaryContainer: accentColor.computeLuminance() > 0.45 
            ? accentColor 
            : const Color(0xFFF1F5F9),
        secondary: _darkSecondary,
        onSecondary: Colors.white,
        surface: surfaceColor,
        onSurface: isOled ? Colors.white : const Color(0xFFE2E8F0),
        surfaceContainerHighest: cardColor,
        onSurfaceVariant: isOled ? const Color(0xFF78869A) : const Color(0xFF94A3B8),
        outline: accentColor.withValues(alpha: isOled ? 0.25 : 0.35),
        outlineVariant: Colors.white.withValues(alpha: isOled ? 0.05 : 0.12),
      );
    } else {
      final surfaceColor = _lightSurface;
      final cardColor = _lightCard;
      final secColor = _lightSecondaryColor;
      final onSurf = _lightOnSurface;
      final onSurfVariant = _lightOnSurfaceVariant;
      final outlineVar = _lightOutlineVariant;

      // Динамический расчет контрастного цвета текста на акценте ровно как в тёмной теме
      final onPrimary = accentColor.computeLuminance() > 0.45
          ? const Color(0xFF0A0D14)
          : Colors.white;

      return ColorScheme.light(
        primary: accentColor,
        onPrimary: onPrimary,
        primaryContainer: accentColor.withValues(alpha: 0.18),
        onPrimaryContainer: accentColor.computeLuminance() > 0.45 
            ? const Color(0xFF0A0D14) 
            : accentColor,
        secondary: secColor,
        onSecondary: Colors.white,
        secondaryContainer: secColor.withValues(alpha: 0.14),
        onSecondaryContainer: secColor,
        surface: surfaceColor,
        onSurface: onSurf,
        surfaceContainerHighest: cardColor,
        onSurfaceVariant: onSurfVariant,
        outline: accentColor.withValues(alpha: 0.35),
        outlineVariant: outlineVar,
      );
    }
  }

  Color get _lightSecondaryColor {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFF475569);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFF047857); // Хвойный зеленый
      case AppColorPalette.indigoGold:
        return const Color(0xFF312E81); // Индиго
      case AppColorPalette.acidViolet:
        return const Color(0xFF6B21A8); // Фиолет
      case AppColorPalette.warmAmber:
        return const Color(0xFFDC2626); // Красный огонь
      case AppColorPalette.rubyGold:
        return const Color(0xFFD97706); // Золото
      case AppColorPalette.pistachioMilk:
        return const Color(0xFF4D7C0F); // Фисташковый лайм
      case AppColorPalette.cyberCyan:
        return const Color(0xFF0284C7); // Синий циан
      case AppColorPalette.toxicOled:
        return const Color(0xFF15803D); // Зелёный
    }
  }

  // --- Темные цвета поверхностей и акцентов ---

  Color get _darkSurface {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFF121216);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFF031A11); // Глубокая лесная хвоя
      case AppColorPalette.indigoGold:
        return const Color(0xFF05052E); // Глубокий ночной индиго
      case AppColorPalette.acidViolet:
        return const Color(0xFF140728); // Тёмный неоновый фиолет
      case AppColorPalette.warmAmber:
        return const Color(0xFF261D05); // Тёмный тёплый янтарь
      case AppColorPalette.rubyGold:
        return const Color(0xFF2B0205); // Глубокий рубин
      case AppColorPalette.pistachioMilk:
        return const Color(0xFF131A10); // Тёмная фисташка
      case AppColorPalette.cyberCyan:
        return const Color(0xFF061018); // Тёмный киберспейс
      case AppColorPalette.toxicOled:
        return const Color(0xFF000000); // Абсолютно чёрный терминал
    }
  }

  Color get _darkCard {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFF1E1E24);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFF072B1E);
      case AppColorPalette.indigoGold:
        return const Color(0xFF0D0D48);
      case AppColorPalette.acidViolet:
        return const Color(0xFF220D3E);
      case AppColorPalette.warmAmber:
        return const Color(0xFF382C0A);
      case AppColorPalette.rubyGold:
        return const Color(0xFF40060C);
      case AppColorPalette.pistachioMilk:
        return const Color(0xFF1E2E19);
      case AppColorPalette.cyberCyan:
        return const Color(0xFF0E1E2C);
      case AppColorPalette.toxicOled:
        return const Color(0xFF0E140E);
    }
  }

  Color get _darkSecondary {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFF94A3B8);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFF10B981); // Emerald pine
      case AppColorPalette.indigoGold:
        return const Color(0xFF6366F1); // Indigo
      case AppColorPalette.acidViolet:
        return const Color(0xFFA855F7); // Violet
      case AppColorPalette.warmAmber:
        return const Color(0xFFEF4444); // Red
      case AppColorPalette.rubyGold:
        return const Color(0xFFF43F5E); // Ruby
      case AppColorPalette.pistachioMilk:
        return const Color(0xFF84CC16); // Lime
      case AppColorPalette.cyberCyan:
        return const Color(0xFF0284C7); // Sky
      case AppColorPalette.toxicOled:
        return const Color(0xFF22C55E); // Green
    }
  }

  // --- Светлые цвета поверхностей и акцентов ---

  Color get _lightSurface {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFFF1F5F9);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFFE2F4E9); // Нежный хвойный мятно-зеленый холст
      case AppColorPalette.indigoGold:
        return const Color(0xFFE8ECFD); // Нежный лавандовый холст индиго
      case AppColorPalette.acidViolet:
        return const Color(0xFFF1E8FB); // Нежный фиолетовый неоновый холст
      case AppColorPalette.warmAmber:
        return const Color(0xFFFEF3C7); // Тёплый янтарно-медовый холст
      case AppColorPalette.rubyGold:
        return const Color(0xFFFFE4E6); // Нежный рубиновый розе холст
      case AppColorPalette.pistachioMilk:
        return const Color(0xFFEAF5E5); // Фисташковое молоко холст
      case AppColorPalette.cyberCyan:
        return const Color(0xFFE0F2FE); // Ледяной лазурный кибер-циан холст
      case AppColorPalette.toxicOled:
        return const Color(0xFFE6F7ED); // Свежий терминальный холст
    }
  }

  Color get _lightCard {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFFFFFFFF);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFFF2FAF5); // Деликатная хвойно-белая карточка
      case AppColorPalette.indigoGold:
        return const Color(0xFFF4F6FE); // Деликатная индиго-белая карточка
      case AppColorPalette.acidViolet:
        return const Color(0xFFF8F4FD); // Деликатная фиолетово-белая карточка
      case AppColorPalette.warmAmber:
        return const Color(0xFFFFFBEB); // Тёплая кремовая карточка
      case AppColorPalette.rubyGold:
        return const Color(0xFFFFF1F2); // Деликатная рубиново-кремовая карточка
      case AppColorPalette.pistachioMilk:
        return const Color(0xFFF4FAF1); // Деликатная фисташково-молочная карточка
      case AppColorPalette.cyberCyan:
        return const Color(0xFFF0F9FF); // Деликатная ледяная циан-белая карточка
      case AppColorPalette.toxicOled:
        return const Color(0xFFF2FAF5); // Деликатная терминально-белая карточка
    }
  }

  Color get _lightOnSurface {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFF0F172A);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFF052E1D); // Глубокий лесной хвойный
      case AppColorPalette.indigoGold:
        return const Color(0xFF1E1B4B); // Глубокий ночной индиго
      case AppColorPalette.acidViolet:
        return const Color(0xFF2E1065); // Глубокий темный фиолет
      case AppColorPalette.warmAmber:
        return const Color(0xFF451A03); // Глубокий янтарный темный
      case AppColorPalette.rubyGold:
        return const Color(0xFF4C0519); // Глубокий винно-рубиновый темный
      case AppColorPalette.pistachioMilk:
        return const Color(0xFF14532D); // Глубокий лесной матча темный
      case AppColorPalette.cyberCyan:
        return const Color(0xFF082F49); // Глубокий кибер-синий темный
      case AppColorPalette.toxicOled:
        return const Color(0xFF052E16); // Глубокий терминальный темный
    }
  }

  Color get _lightOnSurfaceVariant {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFF64748B);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFF166534);
      case AppColorPalette.indigoGold:
        return const Color(0xFF4338CA);
      case AppColorPalette.acidViolet:
        return const Color(0xFF6B21A8);
      case AppColorPalette.warmAmber:
        return const Color(0xFF78350F);
      case AppColorPalette.rubyGold:
        return const Color(0xFF881337);
      case AppColorPalette.pistachioMilk:
        return const Color(0xFF2D6A4F);
      case AppColorPalette.cyberCyan:
        return const Color(0xFF0C4A6E);
      case AppColorPalette.toxicOled:
        return const Color(0xFF166534);
    }
  }

  Color get _lightOutlineVariant {
    switch (this) {
      case AppColorPalette.monochrome:
        return const Color(0xFFE2E8F0);
      case AppColorPalette.fuchsiaPine:
        return const Color(0xFFA7D8BA); // Тонкая хвойная граница
      case AppColorPalette.indigoGold:
        return const Color(0xFFC7D2FE); // Тонкая индиго граница
      case AppColorPalette.acidViolet:
        return const Color(0xFFDDD0F5); // Тонкая фиолетовая граница
      case AppColorPalette.warmAmber:
        return const Color(0xFFFDE68A); // Тонкая янтарная граница
      case AppColorPalette.rubyGold:
        return const Color(0xFFFECDD3); // Тонкая рубиновая граница
      case AppColorPalette.pistachioMilk:
        return const Color(0xFFCBE6B8); // Тонкая фисташковая граница
      case AppColorPalette.cyberCyan:
        return const Color(0xFFBAE6FD); // Тонкая циан граница
      case AppColorPalette.toxicOled:
        return const Color(0xFFA7E3BC); // Тонкая терминальная граница
    }
  }
}
