import '../../../router/app_router.dart';
import '../../models/notification_payload.dart';
import '../notification_handler.dart';

class DeepLinkNotificationHandler implements NotificationHandler {
  const DeepLinkNotificationHandler();

  static const _allowedRoutes = {'/', '/settings', '/profile'};

  @override
  bool canHandle(NotificationPayload payload) {
    final link = payload.deepLink;
    if (link == null || link.isEmpty) return false;
    final path = Uri.tryParse(link)?.path;
    return path != null && _allowedRoutes.contains(path);
  }

  @override
  Future<void> handle(NotificationPayload payload) async {
    final link = payload.deepLink;
    if (link == null || link.isEmpty) return;
    final uri = Uri.tryParse(link);
    if (uri != null && _allowedRoutes.contains(uri.path)) {
      appRouter.go(link);
    }
  }
}
