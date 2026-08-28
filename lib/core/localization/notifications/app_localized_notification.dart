import 'package:flutter/widgets.dart';

class LocalizedNotificationPayload {
  const LocalizedNotificationPayload({
    required this.titleEn,
    required this.titleRu,
    required this.bodyEn,
    required this.bodyRu,
    this.payload,
  });

  final String titleEn;
  final String titleRu;
  final String bodyEn;
  final String bodyRu;
  final String? payload;

  String localizedTitle(Locale? locale) {
    if (locale?.languageCode == 'ru') return titleRu;
    return titleEn;
  }

  String localizedBody(Locale? locale) {
    if (locale?.languageCode == 'ru') return bodyRu;
    return bodyEn;
  }
}
