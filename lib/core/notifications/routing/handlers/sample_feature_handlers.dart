import 'dart:developer' as developer;

import '../../models/notification_payload.dart';
import '../notification_handler.dart';

class ChatNotificationHandler implements NotificationHandler {
  const ChatNotificationHandler();

  @override
  bool canHandle(NotificationPayload payload) => payload.type == 'chat';

  @override
  Future<void> handle(NotificationPayload payload) async {
    developer.log(
      'Navigating to Chat: ID=${payload.targetId}, data=${payload.data}',
      name: 'NotificationRouter',
    );
  }
}

class TaskNotificationHandler implements NotificationHandler {
  const TaskNotificationHandler();

  @override
  bool canHandle(NotificationPayload payload) => payload.type == 'task';

  @override
  Future<void> handle(NotificationPayload payload) async {
    developer.log(
      'Navigating to Task: ID=${payload.targetId}, data=${payload.data}',
      name: 'NotificationRouter',
    );
  }
}

class InvoiceNotificationHandler implements NotificationHandler {
  const InvoiceNotificationHandler();

  @override
  bool canHandle(NotificationPayload payload) => payload.type == 'invoice';

  @override
  Future<void> handle(NotificationPayload payload) async {
    developer.log(
      'Navigating to Invoice: ID=${payload.targetId}, data=${payload.data}',
      name: 'NotificationRouter',
    );
  }
}
