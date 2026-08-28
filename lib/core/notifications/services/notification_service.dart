import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../models/notification_channel.dart';
import '../models/notification_payload.dart';
import '../routing/handlers/deeplink_notification_handler.dart';
import '../routing/handlers/sample_feature_handlers.dart';
import '../routing/handlers/update_notification_handler.dart';
import '../routing/notification_router.dart';
import 'notification_permissions.dart';

final class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static bool _isInitialized = false;

  static Future<void> init() async {
    if (_isInitialized) return;

    // 1. Регистрация базовых обработчиков в NotificationRouter
    NotificationRouter.instance.clearHandlers();
    NotificationRouter.instance.registerHandler(
      const UpdateNotificationHandler(),
    );
    NotificationRouter.instance.registerHandler(
      const DeepLinkNotificationHandler(),
    );
    NotificationRouter.instance.registerHandler(
      const ChatNotificationHandler(),
    );
    NotificationRouter.instance.registerHandler(
      const TaskNotificationHandler(),
    );
    NotificationRouter.instance.registerHandler(
      const InvoiceNotificationHandler(),
    );

    // 2. Инициализация FlutterLocalNotificationsPlugin с перехватом кликов
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _plugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        final payloadStr = response.payload;
        final payload = NotificationPayload.fromJsonString(payloadStr);
        if (payload != null) {
          NotificationRouter.instance.dispatch(payload);
        }
      },
    );

    // 3. Создание каналов уведомлений на Android
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    if (android != null) {
      for (final channel in AppNotificationChannel.values) {
        await android.createNotificationChannel(channel.toAndroidChannel());
      }
    }

    // 4. Проверка запуска из уведомления при холодном старте
    final launchDetails = await _plugin.getNotificationAppLaunchDetails();
    if (launchDetails?.didNotificationLaunchApp == true) {
      final payloadStr = launchDetails?.notificationResponse?.payload;
      final payload = NotificationPayload.fromJsonString(payloadStr);
      if (payload != null) {
        Future.microtask(() => NotificationRouter.instance.dispatch(payload));
      }
    }

    _isInitialized = true;
  }

  static Future<void> show({
    required int id,
    required String title,
    required String body,
    AppNotificationChannel channel = AppNotificationChannel.updates,
    NotificationPayload? payload,
  }) async {
    await init();

    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: channel.importance,
      priority: channel.priority,
      playSound: channel.playSound,
      enableVibration: channel.enableVibration,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: const DarwinNotificationDetails(),
    );

    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: details,
      payload: payload?.toJsonString(),
    );
  }

  static Future<void> cancel(int id) async {
    await _plugin.cancel(id: id);
  }

  static Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }

  static Future<bool> requestPermission() =>
      NotificationPermissions.requestPermission();

  static Future<bool> areNotificationsEnabled() =>
      NotificationPermissions.areNotificationsEnabled();

  // Шорткаты для обновлений (обратная совместимость)
  static Future<void> showUpdateAvailable(String title, String body) {
    return show(
      id: 1,
      title: title,
      body: body,
      channel: AppNotificationChannel.updates,
      payload: const NotificationPayload(
        type: 'update',
        action: 'check',
        deepLink: '/settings',
      ),
    );
  }

  static Future<void> showUpdated(String title, String body) {
    return show(
      id: 2,
      title: title,
      body: body,
      channel: AppNotificationChannel.updates,
      payload: const NotificationPayload(type: 'update', action: 'completed'),
    );
  }
}
