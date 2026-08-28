import 'package:flutter/widgets.dart';

class AccessibilityInfoModel {
  const AccessibilityInfoModel({
    required this.boldText,
    required this.highContrast,
    required this.disableAnimations,
    required this.accessibleNavigation,
    required this.textScaleFactor,
  });

  factory AccessibilityInfoModel.fromMediaQuery(MediaQueryData data) {
    return AccessibilityInfoModel(
      boldText: data.boldText,
      highContrast: data.highContrast,
      disableAnimations: data.disableAnimations,
      accessibleNavigation: data.accessibleNavigation,
      textScaleFactor: data.textScaler.scale(1.0),
    );
  }

  final bool boldText;
  final bool highContrast;
  final bool disableAnimations;
  final bool accessibleNavigation;
  final double textScaleFactor;

  bool get hasAccessibilityEnabled =>
      boldText ||
      highContrast ||
      disableAnimations ||
      accessibleNavigation ||
      textScaleFactor != 1.0;

  Map<String, dynamic> toMap() {
    return {
      'boldText': boldText,
      'highContrast': highContrast,
      'disableAnimations': disableAnimations,
      'accessibleNavigation': accessibleNavigation,
      'textScaleFactor': textScaleFactor,
      'hasAccessibilityEnabled': hasAccessibilityEnabled,
    };
  }
}
