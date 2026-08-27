import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/theme/widgets/app_glass.dart';
import 'package:my_app/features/update/presentation/update_settings_provider.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class SettingsIntervalCard extends ConsumerWidget {
  const SettingsIntervalCard({
    super.key,
    required this.settings,
  });

  final UpdateSettings settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    String label(int minutes) => minutes < 60
        ? l10n.intervalMinutes('$minutes')
        : l10n.intervalHours('${minutes ~/ 60}');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: AppGlassCard(
        borderRadius: 16,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.checkIntervalTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final minutes in updateIntervalOptions)
                  ChoiceChip(
                    label: Text(label(minutes)),
                    selected: settings.intervalMinutes == minutes,
                    onSelected: (_) => ref
                        .read(updateSettingsProvider.notifier)
                        .setIntervalMinutes(minutes),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
