import '../models/notification_payload.dart';

abstract interface class NotificationHandler {
  bool canHandle(NotificationPayload payload);
  Future<void> handle(NotificationPayload payload);
}
