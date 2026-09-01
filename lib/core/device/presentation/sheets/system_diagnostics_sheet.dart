import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/widgets/app_button.dart';
import '../../../theme/widgets/app_toast.dart';

import '../../../theme/tokens/tokens.dart';
import '../../../theme/widgets/app_glass.dart';
import '../../extensions/device_context_ext.dart';
import '../../models/accessibility_info_model.dart';
import '../../models/app_info_model.dart';
import '../../models/device_info_model.dart';
import '../../models/network_status_model.dart';
import '../../models/screen_metrics_model.dart';
import '../../providers/device_providers.dart';

class SystemDiagnosticsSheet extends ConsumerWidget {
  const SystemDiagnosticsSheet({super.key});

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (_) => const SystemDiagnosticsSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRu = Localizations.localeOf(context).languageCode == 'ru';

    final deviceAsync = ref.watch(deviceInfoProvider);
    final appAsync = ref.watch(appInfoProvider);
    final networkAsync = ref.watch(networkStatusProvider);
    final screen = context.screenMetrics;
    final access = context.accessibilityInfo;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: AppRadius.sheet,
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Title
              Row(
                children: [
                  Icon(
                    Icons.developer_board_rounded,
                    color: colorScheme.primary,
                    size: 26,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      isRu ? 'Системная диагностика' : 'System Diagnostics',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Diagnostic Cards Scrollable List
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    // 1. Device Info Card
                    deviceAsync.when(
                      data: (device) => _DiagnosticGroup(
                        title: isRu ? 'Устройство и ОС' : 'Device & OS',
                        icon: Icons.smartphone_rounded,
                        items: [
                          _DiagItem(
                            isRu ? 'Модель' : 'Model',
                            device.displayName,
                          ),
                          _DiagItem(
                            isRu ? 'Платформа' : 'Platform',
                            device.platform,
                          ),
                          _DiagItem(
                            isRu ? 'Версия ОС' : 'OS Version',
                            device.osVersion,
                          ),
                          _DiagItem(
                            isRu ? 'Локаль системы' : 'System Locale',
                            device.locale,
                          ),
                          _DiagItem(
                            isRu ? 'Часовой пояс' : 'Timezone',
                            '${device.timeZone} (${device.timeZoneOffset})',
                          ),
                        ],
                      ),
                      loading: () => const SizedBox.shrink(),
                      error: (e, _) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 10),

                    // 2. App Info Card
                    appAsync.when(
                      data: (app) => _DiagnosticGroup(
                        title: isRu ? 'Сборка приложения' : 'App Build Info',
                        icon: Icons.apps_rounded,
                        items: [
                          _DiagItem(
                            isRu ? 'Версия' : 'Version',
                            app.fullVersion,
                          ),
                          _DiagItem(
                            isRu ? 'Окружение' : 'Environment',
                            app.environment,
                          ),
                          _DiagItem(
                            isRu ? 'Версия ядра' : 'Core Version',
                            app.coreVersion,
                          ),
                          _DiagItem(
                            isRu ? 'Package ID' : 'Package ID',
                            app.packageName,
                          ),
                        ],
                      ),
                      loading: () => const SizedBox.shrink(),
                      error: (e, _) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 10),

                    // 3. Screen Metrics Card
                    _DiagnosticGroup(
                      title: isRu ? 'Экран и дисплей' : 'Screen & Display',
                      icon: Icons.aspect_ratio_rounded,
                      items: [
                        _DiagItem(
                          isRu ? 'Разрешение' : 'Resolution',
                          screen.resolutionString,
                        ),
                        _DiagItem(
                          isRu ? 'Плотность (DPR)' : 'Pixel Ratio',
                          '${screen.pixelRatio}x',
                        ),
                        _DiagItem(
                          isRu ? 'Ориентация' : 'Orientation',
                          screen.isLandscape ? 'Landscape' : 'Portrait',
                        ),
                        _DiagItem(
                          isRu ? 'Тип устройства' : 'Device Class',
                          screen.isTablet ? 'Tablet' : 'Phone / Compact',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // 4. Accessibility & Network
                    _DiagnosticGroup(
                      title: isRu
                          ? 'Сеть и спец. возможности'
                          : 'Network & Accessibility',
                      icon: Icons.accessibility_new_rounded,
                      items: [
                        _DiagItem(
                          isRu ? 'Статус сети' : 'Network Status',
                          networkAsync.value?.isOnline == true
                              ? (isRu ? 'Online (Подключено)' : 'Online')
                              : (isRu ? 'Offline (Автономно)' : 'Offline'),
                        ),
                        _DiagItem(
                          isRu ? 'Спец. возможности' : 'Accessibility',
                          access.hasAccessibilityEnabled
                              ? 'Enabled'
                              : 'Default',
                        ),
                        _DiagItem(
                          isRu ? 'Масштаб текста' : 'Text Scale',
                          '${(access.textScaleFactor * 100).round()}%',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Copy full report button
              AppButton(
                label: isRu
                    ? 'Скопировать отчёт для поддержки'
                    : 'Copy Diagnostics Report',
                leadingIcon: const Icon(Icons.copy_all_rounded, size: 20),
                isFullWidth: true,
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  final report = _generateReport(
                    device: deviceAsync.value,
                    app: appAsync.value,
                    screen: screen,
                    access: access,
                    network: networkAsync.value,
                  );
                  Clipboard.setData(ClipboardData(text: report));
                  Navigator.of(context).pop();
                  AppToast.success(
                    context,
                    isRu
                        ? 'Отчёт диагностики скопирован в буфер обмена!'
                        : 'Diagnostics report copied to clipboard!',
                    title: isRu ? 'Диагностика' : 'Diagnostics',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _generateReport({
    DeviceInfoModel? device,
    AppInfoModel? app,
    required ScreenMetricsModel screen,
    required AccessibilityInfoModel access,
    NetworkStatusModel? network,
  }) {
    final buffer = StringBuffer();
    buffer.writeln('=== SYSTEM DIAGNOSTICS REPORT ===');
    buffer.writeln('Timestamp: ${DateTime.now().toIso8601String()}');
    buffer.writeln();
    buffer.writeln('[DEVICE]');
    buffer.writeln('Model: ${device?.displayName}');
    buffer.writeln('Platform: ${device?.platform}');
    buffer.writeln('OS Version: ${device?.osVersion}');
    buffer.writeln('Locale: ${device?.locale}');
    buffer.writeln('Timezone: ${device?.timeZone} (${device?.timeZoneOffset})');
    buffer.writeln();
    buffer.writeln('[APP]');
    buffer.writeln('Version: ${app?.fullVersion}');
    buffer.writeln('Environment: ${app?.environment}');
    buffer.writeln('Core Version: ${app?.coreVersion}');
    buffer.writeln('Package: ${app?.packageName}');
    buffer.writeln();
    buffer.writeln('[DISPLAY]');
    buffer.writeln('Resolution: ${screen.resolutionString}');
    buffer.writeln('Pixel Ratio: ${screen.pixelRatio}');
    buffer.writeln('Orientation: ${screen.orientation.name}');
    buffer.writeln('Tablet: ${screen.isTablet}');
    buffer.writeln();
    buffer.writeln('[NETWORK & ACCESSIBILITY]');
    buffer.writeln('Online: ${network?.isOnline}');
    buffer.writeln('Text Scale: ${access.textScaleFactor}');
    buffer.writeln('=================================');
    return buffer.toString();
  }
}

class _DiagnosticGroup extends StatelessWidget {
  const _DiagnosticGroup({
    required this.title,
    required this.icon,
    required this.items,
  });

  final String title;
  final IconData icon;
  final List<_DiagItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppGlassCard(
      borderRadius: 14,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.label,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      item.value,
                      textAlign: TextAlign.end,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DiagItem {
  const _DiagItem(this.label, this.value);
  final String label;
  final String value;
}
