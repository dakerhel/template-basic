import 'package:flutter/widgets.dart';

abstract final class AppRadius {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double base = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double xxl = 28.0;
  static const double full = 9999.0;

  // BorderRadius shortcuts
  static final BorderRadius rXs = BorderRadius.circular(xs);
  static final BorderRadius rSm = BorderRadius.circular(sm);
  static final BorderRadius rMd = BorderRadius.circular(md);
  static final BorderRadius rBase = BorderRadius.circular(base);
  static final BorderRadius rLg = BorderRadius.circular(lg);
  static final BorderRadius rXl = BorderRadius.circular(xl);
  static final BorderRadius rXxl = BorderRadius.circular(xxl);
  static final BorderRadius rFull = BorderRadius.circular(full);

  // Semantic components radius
  static final BorderRadius card = rLg;
  static final BorderRadius button = rMd;
  static final BorderRadius sheet = const BorderRadius.vertical(
    top: Radius.circular(xxl),
  );
  static final BorderRadius pill = rFull;
}
