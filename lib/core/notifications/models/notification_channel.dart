import 'package:flutter_local_notifications/flutter_local_notifications.dart';

enum AppNotificationChannel {
  updates(
    id: 'updates',
    name: 'Обновления ПО',
    description: 'Уведомления о новых версиях и системных апдейтах',
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
    enableVibration: true,
    playSound: true,
  ),
  security(
    id: 'security',
    name: 'Безопасность и Доступ',
    description: 'Оповещения о блокировках, входах и PIN-коде',
    importance: Importance.high,
    priority: Priority.high,
    enableVibration: true,
    playSound: true,
  ),
  messages(
    id: 'messages',
    name: 'Сообщения и Чаты',
    description: 'Личные сообщения, ответы и упоминания',
    importance: Importance.max,
    priority: Priority.max,
    enableVibration: true,
    playSound: true,
  ),
  reminders(
    id: 'reminders',
    name: 'Задачи и Напоминания',
    description: 'Запланированные задачи и напоминания',
    importance: Importance.high,
    priority: Priority.high,
    enableVibration: true,
    playSound: true,
  ),
  transactions(
    id: 'transactions',
    name: 'Финансы и Счета',
    description: 'Квитанции, инвойсы и статусы транзакций',
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
    enableVibration: false,
    playSound: true,
  );

  const AppNotificationChannel({
    required this.id,
    required this.name,
    required this.description,
    required this.importance,
    required this.priority,
    required this.enableVibration,
    required this.playSound,
  });

  final String id;
  final String name;
  final String description;
  final Importance importance;
  final Priority priority;
  final bool enableVibration;
  final bool playSound;

  AndroidNotificationChannel toAndroidChannel() {
    return AndroidNotificationChannel(
      id,
      name,
      description: description,
      importance: importance,
      enableVibration: enableVibration,
      playSound: playSound,
    );
  }
}
