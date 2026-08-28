import '../../../router/app_router.dart';
import '../../models/notification_payload.dart';
import '../notification_handler.dart';

class DeepLinkNotificationHandler implements NotificationHandler {
  const DeepLinkNotificationHandler();

  @override
  bool canHandle(NotificationPayload payload) {
    return payload.deepLink != null && payload.deepLink!.isNotEmpty;
  }

  @override
  Future<void> handle(NotificationPayload payload) async {
    final link = payload.deepLink!;
    if (link.startsWith('/')) {
      appRouter.go(link);
    }
  }
}
