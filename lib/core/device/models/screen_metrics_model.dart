import 'package:flutter/widgets.dart';

class ScreenMetricsModel {
  const ScreenMetricsModel({
    required this.width,
    required this.height,
    required this.pixelRatio,
    required this.orientation,
    required this.aspectRatio,
    required this.isTablet,
  });

  factory ScreenMetricsModel.fromMediaQuery(MediaQueryData data) {
    final size = data.size;
    final isTablet = data.size.shortestSide >= 600;

    return ScreenMetricsModel(
      width: size.width,
      height: size.height,
      pixelRatio: data.devicePixelRatio,
      orientation: data.orientation,
      aspectRatio: size.aspectRatio,
      isTablet: isTablet,
    );
  }

  final double width;
  final double height;
  final double pixelRatio;
  final Orientation orientation;
  final double aspectRatio;
  final bool isTablet;

  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  String get resolutionString =>
      '${(width * pixelRatio).round()} × ${(height * pixelRatio).round()} px (${width.round()} × ${height.round()} dp)';

  Map<String, dynamic> toMap() {
    return {
      'widthDp': width,
      'heightDp': height,
      'pixelRatio': pixelRatio,
      'orientation': orientation.name,
      'isTablet': isTablet,
      'resolution': resolutionString,
    };
  }
}
