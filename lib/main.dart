import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';

import 'app.dart';
import 'core/notifications/notification_service.dart';
import 'features/update/data/background_update_task.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  try {
    await Workmanager().initialize(callbackDispatcher);
  } catch (_) {
    // Игнорируем на неподдерживаемых платформах и в тестах
  }
  runApp(const ProviderScope(child: MyApp()));
}
