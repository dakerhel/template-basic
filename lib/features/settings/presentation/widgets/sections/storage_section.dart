import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/core/theme/widgets/app_toast.dart';
import 'package:my_app/features/settings/presentation/controllers/storage_refresh_controller.dart';
import 'package:my_app/features/settings/presentation/widgets/common/settings_group_header.dart';
import 'package:my_app/features/update/data/storage_usage.dart';
import 'package:my_app/l10n/generated/app_localizations.dart';

class StorageSection extends ConsumerWidget {
  const StorageSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsGroupHeader(title: l10n.storageGroup),
        ListTile(
          leading: const Icon(Icons.storage_outlined),
          title: Text(l10n.storageGroup),
          subtitle: FutureBuilder<StorageUsage>(
            key: ValueKey(ref.watch(storageRefreshProvider)),
            future: computeUpdateArtifactsUsage(),
            builder: (context, snapshot) {
              final usage = snapshot.data;
              return Text(l10n.storageUsed(usage?.displayMb ?? '0.0'));
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: l10n.clearCacheAction,
            onPressed: () => _clearArtifacts(context, ref),
          ),
        ),
      ],
    );
  }

  Future<void> _clearArtifacts(BuildContext context, WidgetRef ref) async {
    await clearUpdateArtifacts();
    if (!context.mounted) return;
    AppToast.success(
      context,
      AppLocalizations.of(context)!.cacheCleared,
      title: AppLocalizations.of(context)!.storageGroup,
    );
    ref.read(storageRefreshProvider.notifier).bump();
  }
}
