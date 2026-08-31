import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_haptics.dart';

enum AppToastType {
  success,
  error,
  warning,
  info,
}

/// Высококлассный плавающий Toast / In-App Banner HUD в стиле Dynamic Island / visionOS.
/// Отображается поверх интерфейса с оптическим размытием, тактильной отдачей и смахиванием свайпом.
class AppToast {
  static OverlayEntry? _currentEntry;
  static Timer? _dismissTimer;

  /// Отображает Toast-уведомление поверх текущего экрана
  static void show(
    BuildContext context, {
    required String message,
    String? title,
    AppToastType type = AppToastType.info,
    Duration duration = const Duration(milliseconds: 3200),
    VoidCallback? onTap,
  }) {
    // Скрываем предыдущий тост, если он активен
    hide();

    // Запускаем тактильную отдачу
    switch (type) {
      case AppToastType.success:
        AppHaptics.success();
        break;
      case AppToastType.error:
        AppHaptics.error();
        break;
      case AppToastType.warning:
        AppHaptics.warning();
        break;
      case AppToastType.info:
        AppHaptics.light();
        break;
    }

    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;

    final entry = OverlayEntry(
      builder: (context) => _ToastWidget(
        message: message,
        title: title,
        type: type,
        duration: duration,
        onTap: onTap,
        onDismissed: () => hide(),
      ),
    );

    _currentEntry = entry;
    overlay.insert(entry);

    _dismissTimer = Timer(duration + const Duration(milliseconds: 400), () {
      hide();
    });
  }

  /// Удобные методы для частых типов сообщений
  static void success(BuildContext context, String message, {String? title}) =>
      show(context, message: message, title: title, type: AppToastType.success);

  static void error(BuildContext context, String message, {String? title}) =>
      show(context, message: message, title: title, type: AppToastType.error);

  static void warning(BuildContext context, String message, {String? title}) =>
      show(context, message: message, title: title, type: AppToastType.warning);

  static void info(BuildContext context, String message, {String? title}) =>
      show(context, message: message, title: title, type: AppToastType.info);

  /// Принудительно скрыть текущий тост
  static void hide() {
    _dismissTimer?.cancel();
    _dismissTimer = null;
    _currentEntry?.remove();
    _currentEntry = null;
  }
}

class _ToastWidget extends StatefulWidget {
  const _ToastWidget({
    required this.message,
    required this.type,
    required this.duration,
    required this.onDismissed,
    this.title,
    this.onTap,
  });

  final String message;
  final String? title;
  final AppToastType type;
  final Duration duration;
  final VoidCallback? onTap;
  final VoidCallback onDismissed;

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _scaleAnimation;
  Timer? _autoDismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
      reverseDuration: const Duration(milliseconds: 280),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.6),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeInCubic,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeInCubic,
    ));

    _controller.forward();

    // Запускаем обратную анимацию перед удалением
    _autoDismissTimer = Timer(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) {
          if (mounted) widget.onDismissed();
        });
      }
    });
  }

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    _autoDismissTimer = null;
    _controller.dispose();
    super.dispose();
  }

  void _dismissWithAnimation() {
    _autoDismissTimer?.cancel();
    _autoDismissTimer = null;
    _controller.reverse().then((_) {
      if (mounted) widget.onDismissed();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorScheme = theme.colorScheme;
    final mediaQuery = MediaQuery.of(context);

    // Определение акцентных цветов и иконки по типу
    final (Color accentColor, IconData iconData) = switch (widget.type) {
      AppToastType.success => (
          const Color(0xFF10B981),
          Icons.check_circle_rounded
        ),
      AppToastType.error => (
          colorScheme.error,
          Icons.error_outline_rounded
        ),
      AppToastType.warning => (
          const Color(0xFFF59E0B),
          Icons.warning_amber_rounded
        ),
      AppToastType.info => (
          colorScheme.primary,
          Icons.info_outline_rounded
        ),
    };

    final glassColor = isDark
        ? const Color(0xFF141720).withValues(alpha: 0.78)
        : Colors.white.withValues(alpha: 0.84);

    return Positioned(
      top: mediaQuery.padding.top + 10,
      left: 16,
      right: 16,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Dismissible(
              key: const Key('app_toast_dismissible'),
              direction: DismissDirection.up,
              onDismissed: (_) => widget.onDismissed(),
              child: GestureDetector(
                onTap: () {
                  widget.onTap?.call();
                  _dismissWithAnimation();
                },
                child: Material(
                  color: Colors.transparent,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 480),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(
                                alpha: isDark ? 0.45 : 0.12,
                              ),
                              blurRadius: 28,
                              offset: const Offset(0, 10),
                            ),
                            BoxShadow(
                              color: accentColor.withValues(
                                alpha: isDark ? 0.25 : 0.16,
                              ),
                              blurRadius: 20,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                            child: Container(
                              decoration: BoxDecoration(
                                color: glassColor,
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  color: isDark
                                      ? Colors.white.withValues(alpha: 0.22)
                                      : Colors.black.withValues(alpha: 0.08),
                                  width: 1.2,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  // Верхний спекулярный глянцевый блик Liquid Glass
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    height: 24,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(21),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.white.withValues(
                                              alpha: isDark ? 0.16 : 0.45,
                                            ),
                                            Colors.white.withValues(alpha: 0.0),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Основной контент
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 12,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 38,
                                          height: 38,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: accentColor.withValues(
                                              alpha: isDark ? 0.20 : 0.14,
                                            ),
                                            border: Border.all(
                                              color: accentColor.withValues(
                                                alpha: isDark ? 0.35 : 0.25,
                                              ),
                                              width: 1,
                                            ),
                                          ),
                                          child: Icon(
                                            iconData,
                                            color: accentColor,
                                            size: 20,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              if (widget.title != null) ...[
                                                Text(
                                                  widget.title!,
                                                  style: theme.textTheme.labelMedium
                                                      ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: isDark
                                                        ? Colors.white
                                                        : const Color(0xFF0F172A),
                                                  ),
                                                ),
                                                const SizedBox(height: 2),
                                              ],
                                              Text(
                                                widget.message,
                                                style: theme.textTheme.bodySmall
                                                    ?.copyWith(
                                                  color: isDark
                                                      ? Colors.white.withValues(
                                                          alpha: 0.92,
                                                        )
                                                      : const Color(0xFF334155),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(
                                          Icons.close_rounded,
                                          size: 16,
                                          color: isDark
                                              ? Colors.white.withValues(alpha: 0.45)
                                              : colorScheme.onSurfaceVariant
                                                  .withValues(alpha: 0.6),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
