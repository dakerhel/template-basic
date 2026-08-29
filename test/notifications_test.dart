import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/notifications/notifications.dart';

class _MockCustomHandler implements NotificationHandler {
  _MockCustomHandler(this.targetType);
  final String targetType;
  NotificationPayload? lastHandled;

  @override
  bool canHandle(NotificationPayload payload) => payload.type == targetType;

  @override
  Future<void> handle(NotificationPayload payload) async {
    lastHandled = payload;
  }
}

void main() {
  group('NotificationPayload', () {
    test('serializes and deserializes to JSON correctly', () {
      const payload = NotificationPayload(
        type: 'chat',
        targetId: 'chat_42',
        action: 'open_thread',
        deepLink: '/chat/42',
        data: {'userId': 'user_99', 'unread': 3},
      );

      final jsonStr = payload.toJsonString();
      expect(jsonStr, isNotEmpty);

      final restored = NotificationPayload.fromJsonString(jsonStr);
      expect(restored, isNotNull);
      expect(restored?.type, 'chat');
      expect(restored?.targetId, 'chat_42');
      expect(restored?.action, 'open_thread');
      expect(restored?.deepLink, '/chat/42');
      expect(restored?.data['userId'], 'user_99');
      expect(restored?.data['unread'], 3);
    });

    test('handles null and invalid json gracefully', () {
      expect(NotificationPayload.fromJsonString(null), isNull);
      expect(NotificationPayload.fromJsonString(''), isNull);
      expect(NotificationPayload.fromJsonString('invalid json {['), isNull);
    });
  });

  group('AppNotificationChannel', () {
    test('contains all 5 standard channels with correct parameters', () {
      expect(AppNotificationChannel.values.length, 5);
      final ids = AppNotificationChannel.values.map((c) => c.id).toSet();
      expect(
        ids,
        containsAll([
          'updates',
          'security',
          'messages',
          'reminders',
          'transactions',
        ]),
      );

      for (final channel in AppNotificationChannel.values) {
        final androidChannel = channel.toAndroidChannel();
        expect(androidChannel.id, channel.id);
        expect(androidChannel.name, channel.name);
      }
    });
  });

  group('NotificationRouter', () {
    test('dispatches payload to matching handler', () async {
      final router = NotificationRouter.instance;
      final chatHandler = _MockCustomHandler('chat');
      final invoiceHandler = _MockCustomHandler('invoice');

      router.registerHandler(chatHandler);
      router.registerHandler(invoiceHandler);

      const chatPayload = NotificationPayload(type: 'chat', targetId: 'room_1');
      final handledChat = await router.dispatch(chatPayload);
      expect(handledChat, isTrue);
      expect(chatHandler.lastHandled?.targetId, 'room_1');
      expect(invoiceHandler.lastHandled, isNull);

      const invoicePayload = NotificationPayload(
        type: 'invoice',
        targetId: 'inv_888',
      );
      final handledInvoice = await router.dispatch(invoicePayload);
      expect(handledInvoice, isTrue);
      expect(invoiceHandler.lastHandled?.targetId, 'inv_888');

      // Cleanup
      router.unregisterHandler(chatHandler);
      router.unregisterHandler(invoiceHandler);
    });

    test('returns false when no handler matches payload', () async {
      final router = NotificationRouter.instance;
      const unknownPayload = NotificationPayload(type: 'unknown_type_xyz');
      final handled = await router.dispatch(unknownPayload);
      expect(handled, isFalse);
    });
  });

  group('Default Notification Handlers', () {
    test('canHandle checks payload type and deepLink accurately', () {
      const updateHandler = UpdateNotificationHandler();
      expect(
        updateHandler.canHandle(const NotificationPayload(type: 'update')),
        isTrue,
      );
      expect(
        updateHandler.canHandle(const NotificationPayload(type: 'other')),
        isFalse,
      );

      const deepLinkHandler = DeepLinkNotificationHandler();
      expect(
        deepLinkHandler.canHandle(
          const NotificationPayload(type: 'custom', deepLink: '/settings'),
        ),
        isTrue,
      );
      expect(
        deepLinkHandler.canHandle(
          const NotificationPayload(type: 'custom', deepLink: '/profile'),
        ),
        isTrue,
      );
      expect(
        deepLinkHandler.canHandle(
          const NotificationPayload(type: 'custom', deepLink: '/unauthorized/route'),
        ),
        isFalse,
      );
      expect(
        deepLinkHandler.canHandle(
          const NotificationPayload(type: 'custom', deepLink: null),
        ),
        isFalse,
      );

      const chatHandler = ChatNotificationHandler();
      expect(
        chatHandler.canHandle(const NotificationPayload(type: 'chat')),
        isTrue,
      );

      const taskHandler = TaskNotificationHandler();
      expect(
        taskHandler.canHandle(const NotificationPayload(type: 'task')),
        isTrue,
      );

      const invoiceHandler = InvoiceNotificationHandler();
      expect(
        invoiceHandler.canHandle(const NotificationPayload(type: 'invoice')),
        isTrue,
      );
    });
  });
}
