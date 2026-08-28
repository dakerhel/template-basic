import 'dart:convert';

class NotificationPayload {
  const NotificationPayload({
    required this.type,
    this.targetId,
    this.action,
    this.deepLink,
    this.data = const <String, dynamic>{},
  });

  final String type;
  final String? targetId;
  final String? action;
  final String? deepLink;
  final Map<String, dynamic> data;

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      if (targetId != null) 'targetId': targetId,
      if (action != null) 'action': action,
      if (deepLink != null) 'deepLink': deepLink,
      if (data.isNotEmpty) 'data': data,
    };
  }

  String toJsonString() => jsonEncode(toMap());

  factory NotificationPayload.fromMap(Map<String, dynamic> map) {
    return NotificationPayload(
      type: map['type'] as String? ?? 'generic',
      targetId: map['targetId'] as String?,
      action: map['action'] as String?,
      deepLink: map['deepLink'] as String?,
      data: map['data'] is Map
          ? Map<String, dynamic>.from(map['data'] as Map)
          : const <String, dynamic>{},
    );
  }

  static NotificationPayload? fromJsonString(String? jsonString) {
    if (jsonString == null || jsonString.trim().isEmpty) return null;
    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is Map<String, dynamic>) {
        return NotificationPayload.fromMap(decoded);
      }
    } catch (_) {}
    return null;
  }

  @override
  String toString() =>
      'NotificationPayload(type: $type, targetId: $targetId, action: $action, deepLink: $deepLink)';
}
