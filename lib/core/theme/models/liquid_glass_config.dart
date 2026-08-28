class LiquidGlassConfig {
  const LiquidGlassConfig({
    this.blur = 18.0,
    this.tintOpacity = 0.65,
    this.borderOpacity = 0.25,
    this.specularOpacity = 0.15,
  });

  final double blur;
  final double tintOpacity;
  final double borderOpacity;
  final double specularOpacity;

  LiquidGlassConfig copyWith({
    double? blur,
    double? tintOpacity,
    double? borderOpacity,
    double? specularOpacity,
  }) {
    return LiquidGlassConfig(
      blur: blur ?? this.blur,
      tintOpacity: tintOpacity ?? this.tintOpacity,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      specularOpacity: specularOpacity ?? this.specularOpacity,
    );
  }
}
