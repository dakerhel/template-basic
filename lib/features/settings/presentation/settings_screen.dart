import 'package:flutter/material.dart';

import 'package:my_app/features/settings/presentation/widgets/sections/about_section.dart';
import 'package:my_app/features/settings/presentation/widgets/sections/interface_section.dart';
import 'package:my_app/features/settings/presentation/widgets/sections/notifications_section.dart';
import 'package:my_app/features/settings/presentation/widgets/sections/security_section.dart';
import 'package:my_app/features/settings/presentation/widgets/sections/storage_section.dart';
import 'package:my_app/features/settings/presentation/widgets/sections/updates_section.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 100),
        children: const [
          InterfaceSection(),
          SecuritySection(),
          UpdatesSection(),
          NotificationsSection(),
          StorageSection(),
          AboutSection(),
        ],
      ),
    );
  }
}
