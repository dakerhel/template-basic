import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../routing/notification_router.dart';
import '../services/notification_service.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

final notificationRouterProvider = Provider<NotificationRouter>((ref) {
  return NotificationRouter.instance;
});
