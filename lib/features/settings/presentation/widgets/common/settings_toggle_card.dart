import 'package:flutter/material.dart';

import 'package:my_app/core/theme/widgets/app_glass.dart';

class SettingsToggleCard extends StatelessWidget {
  const SettingsToggleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: AppGlassCard(
        borderRadius: 12,
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: SwitchListTile(
          value: value,
          onChanged: enabled ? onChanged : null,
          title: Text(title, style: Theme.of(context).textTheme.titleMedium),
          subtitle: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
