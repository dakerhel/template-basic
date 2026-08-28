import 'notification_channel.dart';

class NotificationOptions {
  const NotificationOptions({
    this.channel = AppNotificationChannel.updates,
    this.badgeCount,
    this.subtitle,
  });

  final AppNotificationChannel channel;
  final int? badgeCount;
  final String? subtitle;
}
