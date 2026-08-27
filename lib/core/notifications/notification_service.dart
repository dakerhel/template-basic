import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static const _channelId = 'updates';
  static const _channelName = 'Updates';
  static const _channelDescription = 'Update notifications';

  static Future<void> init() async {
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    await _plugin.initialize(settings: settings);
    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            _channelId,
            _channelName,
            description: _channelDescription,
            importance: Importance.defaultImportance,
          ),
        );
  }

  static Future<void> _show({
    required int id,
    required String title,
    required String body,
  }) async {
    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          channelDescription: _channelDescription,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
        ),
      ),
    );
  }

  static Future<void> showUpdateAvailable(
    String version,
    String title,
    String body,
  ) {
    return _show(id: 1, title: title, body: body);
  }

  static Future<void> showUpdated(String version, String title, String body) {
    return _show(id: 2, title: title, body: body);
  }
}
