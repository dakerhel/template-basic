import '../../../router/app_router.dart';
import '../../models/notification_payload.dart';
import '../notification_handler.dart';

class UpdateNotificationHandler implements NotificationHandler {
  const UpdateNotificationHandler();

  @override
  bool canHandle(NotificationPayload payload) {
    return payload.type == 'update';
  }

  @override
  Future<void> handle(NotificationPayload payload) async {
    appRouter.go('/settings');
  }
}
