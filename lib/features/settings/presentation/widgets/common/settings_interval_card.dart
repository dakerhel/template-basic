import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/theme/widgets/app_glass.dart';
import 'package:my_app/features/update/presentation/update_settings_provider.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class SettingsIntervalCard extends ConsumerWidget {
  const SettingsIntervalCard({super.key, required this.settings});

  final UpdateSettings settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    String label(int minutes) => minutes < 60
        ? l10n.intervalMinutes('$minutes')
        : l10n.intervalHours('${minutes ~/ 60}');

    // 6 интервалов разбиваются на 2 идеальные симметричные строки по 3 элемента
    final row1 = updateIntervalOptions.sublist(0, 3); // 15 мин, 1 ч, 3 ч
    final row2 = updateIntervalOptions.sublist(3, 6); // 6 ч, 12 ч, 24 ч

    Widget buildRow(List<int> intervals) {
      return Row(
        children: [
          for (int i = 0; i < intervals.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            Expanded(
              child: _IntervalChip(
                label: label(intervals[i]),
                isSelected: settings.intervalMinutes == intervals[i],
                onTap: () => ref
                    .read(updateSettingsProvider.notifier)
                    .setIntervalMinutes(intervals[i]),
              ),
            ),
          ],
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: AppGlassCard(
        borderRadius: 16,
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.checkIntervalTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            buildRow(row1),
            const SizedBox(height: 8),
            buildRow(row2),
          ],
        ),
      ),
    );
  }
}

class _IntervalChip extends StatelessWidget {
  const _IntervalChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outline.withValues(alpha: 0.15),
              width: isSelected ? 1.5 : 1.0,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSelected) ...[
                Icon(Icons.check, size: 16, color: colorScheme.onPrimary),
                const SizedBox(width: 4),
              ],
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
