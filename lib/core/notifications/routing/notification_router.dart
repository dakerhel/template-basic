import 'dart:async';

import '../models/notification_payload.dart';
import 'notification_handler.dart';

class NotificationRouter {
  NotificationRouter._();

  static final NotificationRouter instance = NotificationRouter._();

  final List<NotificationHandler> _handlers = [];
  final StreamController<NotificationPayload> _payloadStreamController =
      StreamController<NotificationPayload>.broadcast();

  Stream<NotificationPayload> get onNotificationTapped =>
      _payloadStreamController.stream;

  void registerHandler(NotificationHandler handler) {
    if (!_handlers.contains(handler)) {
      _handlers.add(handler);
    }
  }

  void clearHandlers() {
    _handlers.clear();
  }

  void unregisterHandler(NotificationHandler handler) {
    _handlers.remove(handler);
  }

  Future<bool> dispatch(NotificationPayload payload) async {
    _payloadStreamController.add(payload);

    for (final handler in _handlers) {
      if (handler.canHandle(payload)) {
        await handler.handle(payload);
        return true;
      }
    }
    return false;
  }

  void dispose() {
    _payloadStreamController.close();
  }
}
