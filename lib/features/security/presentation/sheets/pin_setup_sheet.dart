import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/widgets/app_glass.dart';
import '../../data/security_repository_impl.dart';
import '../controllers/security_controller.dart';

enum PinSheetMode {
  /// Первичное создание PIN-кода
  create,

  /// Изменение PIN-кода (требует ввода текущего PIN)
  change,

  /// Подтверждение текущего PIN-кода (например, для отключения защиты)
  verify,
}

class PinSetupSheet extends ConsumerStatefulWidget {
  const PinSetupSheet({
    super.key,
    this.mode = PinSheetMode.create,
    this.isChanging = false,
  });

  final PinSheetMode mode;
  final bool isChanging;

  static Future<bool?> show(
    BuildContext context, {
    PinSheetMode mode = PinSheetMode.create,
    bool isChanging = false,
  }) {
    final effectiveMode = isChanging ? PinSheetMode.change : mode;
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => PinSetupSheet(mode: effectiveMode),
    );
  }

  @override
  ConsumerState<PinSetupSheet> createState() => _PinSetupSheetState();
}

class _PinSetupSheetState extends ConsumerState<PinSetupSheet>
    with SingleTickerProviderStateMixin {
  int _step = 1; // 0 = enter current pin (change/verify), 1 = enter new pin, 2 = confirm new pin
  String _firstPin = '';
  String _currentPin = '';
  String? _errorMessage;
  bool _isProcessing = false;

  late final AnimationController _shakeController;
  late final Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    final effectiveMode = widget.isChanging
        ? PinSheetMode.change
        : widget.mode;
    _step = (effectiveMode == PinSheetMode.change ||
            effectiveMode == PinSheetMode.verify)
        ? 0
        : 1;

    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _onDigit(String digit) {
    final lockout = ref.read(securityControllerProvider).lockout;
    if (_isProcessing || lockout.isLockedOut || _currentPin.length >= 4) return;
    HapticFeedback.selectionClick();
    setState(() {
      _currentPin += digit;
      _errorMessage = null;
    });

    if (_currentPin.length == 4) {
      _handleComplete();
    }
  }

  void _onBackspace() {
    final lockout = ref.read(securityControllerProvider).lockout;
    if (_isProcessing || lockout.isLockedOut || _currentPin.isEmpty) return;
    HapticFeedback.selectionClick();
    setState(() {
      _currentPin = _currentPin.substring(0, _currentPin.length - 1);
      _errorMessage = null;
    });
  }

  Future<void> _handleComplete() async {
    final isRu = Localizations.localeOf(context).languageCode == 'ru';
    final effectiveMode = widget.isChanging
        ? PinSheetMode.change
        : widget.mode;

    setState(() => _isProcessing = true);

    try {
      if (_step == 0) {
        // Проверка текущего PIN-кода для смены или подтверждения отключения
        final isValid = await ref
            .read(securityRepositoryProvider)
            .verifyPin(_currentPin);
        if (isValid) {
          HapticFeedback.lightImpact();
          if (!mounted) return;
          if (effectiveMode == PinSheetMode.verify) {
            Navigator.of(context).pop(true);
          } else {
            // Переход к установке нового PIN-кода
            setState(() {
              _currentPin = '';
              _errorMessage = null;
              _step = 1;
            });
          }
        } else {
          final updatedLockout = await ref
              .read(securityRepositoryProvider)
              .recordFailedAttempt();
          HapticFeedback.vibrate();
          await _shakeController.forward(from: 0.0);
          if (!mounted) return;
          setState(() {
            _errorMessage = isRu
                ? (updatedLockout.isLockedOut
                    ? 'Ввод заблокирован на ${updatedLockout.remainingSeconds} сек.'
                    : 'Неверный текущий PIN-код (осталось: ${updatedLockout.attemptsUntilNextLockout})')
                : (updatedLockout.isLockedOut
                    ? 'Locked out for ${updatedLockout.remainingSeconds}s'
                    : 'Incorrect current PIN (${updatedLockout.attemptsUntilNextLockout} attempts left)');
            _currentPin = '';
          });
        }
      } else if (_step == 1) {
        // Переход ко второму шагу подтверждения нового PIN-кода
        await Future<void>.delayed(const Duration(milliseconds: 150));
        if (!mounted) return;
        setState(() {
          _firstPin = _currentPin;
          _currentPin = '';
          _errorMessage = null;
          _step = 2;
        });
      } else {
        // Проверка совпадения нового PIN-кода
        if (_currentPin == _firstPin) {
          await ref.read(securityControllerProvider.notifier).setPin(_currentPin);
          if (mounted) {
            Navigator.of(context).pop(true);
          }
        } else {
          HapticFeedback.vibrate();
          await _shakeController.forward(from: 0.0);
          if (!mounted) return;
          setState(() {
            _errorMessage = isRu
                ? 'PIN-коды не совпадают. Попробуйте снова'
                : 'PINs do not match. Please try again';
            _currentPin = '';
            _firstPin = '';
            _step = 1;
          });
        }
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRu = Localizations.localeOf(context).languageCode == 'ru';
    final effectiveMode = widget.isChanging
        ? PinSheetMode.change
        : widget.mode;
    final securityState = ref.watch(securityControllerProvider);
    final lockout = securityState.lockout;
    final isDialpadEnabled = !lockout.isLockedOut && !_isProcessing;

    final String title;
    final IconData icon;
    final String defaultSubtitle;

    if (_step == 0) {
      icon = effectiveMode == PinSheetMode.verify
          ? Icons.shield_outlined
          : Icons.lock_open_outlined;
      title = effectiveMode == PinSheetMode.verify
          ? (isRu ? 'Подтверждение PIN-кода' : 'Confirm Current PIN')
          : (isRu ? 'Текущий PIN-код' : 'Current PIN Code');
      defaultSubtitle = effectiveMode == PinSheetMode.verify
          ? (isRu
              ? 'Введите текущий PIN-код для подтверждения'
              : 'Enter current PIN to confirm')
          : (isRu
              ? 'Введите текущий PIN-код для подтверждения личности'
              : 'Enter current PIN to confirm your identity');
    } else if (_step == 1) {
      icon = Icons.pin_outlined;
      title = effectiveMode == PinSheetMode.change
          ? (isRu ? 'Новый PIN-код' : 'New PIN Code')
          : (isRu ? 'Создайте PIN-код' : 'Create PIN Code');
      defaultSubtitle = isRu
          ? 'Введите 4 цифры для защиты приложения'
          : 'Enter 4 digits to protect the app';
    } else {
      icon = Icons.lock_clock_outlined;
      title = isRu ? 'Подтвердите PIN-код' : 'Confirm PIN Code';
      defaultSubtitle = isRu
          ? 'Повторите введенный ранее PIN-код'
          : 'Repeat the PIN code you just entered';
    }

    final subtitle = _errorMessage ?? defaultSubtitle;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag Handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Иконка
              AppGlassCard(
                borderRadius: 20,
                padding: const EdgeInsets.all(16),
                child: Icon(
                  icon,
                  size: 32,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),

              // Заголовок
              Text(
                title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: _errorMessage != null
                      ? colorScheme.error
                      : colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Индикаторы точек
              AnimatedBuilder(
                animation: _shakeAnimation,
                builder: (context, child) {
                  final offset = sin(_shakeAnimation.value * pi * 4) * 10;
                  return Transform.translate(
                    offset: Offset(offset, 0),
                    child: child,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    final isFilled = index < _currentPin.length;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isFilled
                            ? colorScheme.primary
                            : colorScheme.surfaceContainerHighest,
                        border: Border.all(
                          color: isFilled
                              ? colorScheme.primary
                              : colorScheme.outline.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 28),

              // Клавиатура
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isDialpadEnabled ? 1.0 : 0.35,
                child: _DialpadGrid(
                  isEnabled: isDialpadEnabled,
                  onDigit: _onDigit,
                  onBackspace: _onBackspace,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DialpadGrid extends StatelessWidget {
  const _DialpadGrid({
    required this.onDigit,
    required this.onBackspace,
    this.isEnabled = true,
  });

  final ValueChanged<String> onDigit;
  final VoidCallback onBackspace;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow(['1', '2', '3']),
        const SizedBox(height: 10),
        _buildRow(['4', '5', '6']),
        const SizedBox(height: 10),
        _buildRow(['7', '8', '9']),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 64, height: 56),
            _buildButton('0', () => onDigit('0')),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: isEnabled ? onBackspace : null,
                borderRadius: BorderRadius.circular(16),
                child: const SizedBox(
                  width: 64,
                  height: 56,
                  child: Center(
                    child: Icon(Icons.backspace_outlined, size: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRow(List<String> digits) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (final digit in digits) _buildButton(digit, () => onDigit(digit)),
      ],
    );
  }

  Widget _buildButton(String digit, VoidCallback onTap) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isEnabled ? onTap : null,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 64,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.4,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                digit,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
