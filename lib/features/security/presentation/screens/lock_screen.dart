import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/widgets/app_glass.dart';
import '../controllers/security_controller.dart';

class LockScreen extends ConsumerStatefulWidget {
  const LockScreen({super.key});

  @override
  ConsumerState<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends ConsumerState<LockScreen>
    with SingleTickerProviderStateMixin {
  String _enteredPin = '';
  late final AnimationController _shakeController;
  late final Animation<double> _shakeAnimation;
  bool _isVerifying = false;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _triggerBiometricsIfAllowed();
    });
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  Future<void> _triggerBiometricsIfAllowed() async {
    final security = ref.read(securityControllerProvider);
    if (security.settings.isBiometricsEnabled &&
        security.canUseBiometrics &&
        !security.lockout.isBiometricsLockedOut &&
        !security.lockout.isLockedOut) {
      await ref
          .read(securityControllerProvider.notifier)
          .unlockWithBiometrics(reason: 'Подтвердите личность для входа');
    }
  }

  void _onDigitPressed(String digit) {
    final security = ref.read(securityControllerProvider);
    if (_isVerifying ||
        security.lockout.isLockedOut ||
        _enteredPin.length >= 4) {
      return;
    }
    HapticFeedback.selectionClick();
    setState(() {
      _enteredPin += digit;
    });

    if (_enteredPin.length == 4) {
      _verifyPin();
    }
  }

  void _onBackspacePressed() {
    final security = ref.read(securityControllerProvider);
    if (_isVerifying || security.lockout.isLockedOut || _enteredPin.isEmpty) {
      return;
    }
    HapticFeedback.selectionClick();
    setState(() {
      _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
    });
  }

  Future<void> _verifyPin() async {
    setState(() => _isVerifying = true);
    final isValid = await ref
        .read(securityControllerProvider.notifier)
        .verifyAndUnlock(_enteredPin);

    if (!mounted) return;

    if (!isValid) {
      HapticFeedback.vibrate();
      await _shakeController.forward(from: 0.0);
      setState(() {
        _enteredPin = '';
        _isVerifying = false;
      });
    } else {
      setState(() => _isVerifying = false);
    }
  }

  String _formatLockoutTimer(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final security = ref.watch(securityControllerProvider);
    final lockout = security.lockout;
    final isRu = Localizations.localeOf(context).languageCode == 'ru';

    // Определение заголовка и подзаголовка
    final String titleText;
    final String subtitleText;
    final Color subtitleColor;

    if (lockout.isLockedOut) {
      titleText = isRu ? 'Ввод заблокирован' : 'Entry Locked';
      subtitleText = isRu
          ? 'Попробуйте снова через ${_formatLockoutTimer(lockout.remainingSeconds)}'
          : 'Try again in ${_formatLockoutTimer(lockout.remainingSeconds)}';
      subtitleColor = colorScheme.error;
    } else if (lockout.isBiometricsLockedOut) {
      titleText = isRu ? 'Введите PIN-код' : 'Enter PIN Code';
      subtitleText = isRu
          ? 'Биометрия отключена после 3 ошибок. Введите PIN (осталось: ${lockout.attemptsUntilNextLockout})'
          : 'Biometrics disabled after 3 errors. Enter PIN (${lockout.attemptsUntilNextLockout} left)';
      subtitleColor = colorScheme.error;
    } else if (lockout.failedAttempts > 0) {
      titleText = isRu ? 'Введите PIN-код' : 'Enter PIN Code';
      subtitleText = isRu
          ? 'Неверный PIN. Осталось попыток: ${lockout.attemptsUntilNextLockout}'
          : 'Incorrect PIN. Attempts remaining: ${lockout.attemptsUntilNextLockout}';
      subtitleColor = colorScheme.error;
    } else {
      titleText = isRu ? 'Введите PIN-код' : 'Enter PIN Code';
      subtitleText = isRu
          ? 'Для доступа к приложению'
          : 'To access the application';
      subtitleColor = colorScheme.onSurfaceVariant;
    }

    final isDialpadEnabled = !lockout.isLockedOut && !_isVerifying;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        // Блокируем pop подлежащего Navigator при заблокированном приложении
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 380),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),

                  // Иконка замка или таймера блокировки
                  AppGlassCard(
                    borderRadius: 24,
                    padding: const EdgeInsets.all(20),
                    child: Icon(
                      lockout.isLockedOut
                          ? Icons.hourglass_top_rounded
                          : Icons.lock_rounded,
                      size: 44,
                      color: lockout.isLockedOut
                          ? colorScheme.error
                          : colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Заголовок
                  Text(
                    titleText,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Подзаголовок с таймером или предупреждением
                  Text(
                    subtitleText,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: subtitleColor,
                      fontWeight:
                          lockout.isLockedOut || lockout.failedAttempts > 0
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Точки PIN-кода с анимацией тряски при ошибке
                  AnimatedBuilder(
                    animation: _shakeAnimation,
                    builder: (context, child) {
                      final offset = sin(_shakeAnimation.value * pi * 4) * 12;
                      return Transform.translate(
                        offset: Offset(offset, 0),
                        child: child,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        final isFilled = index < _enteredPin.length;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isFilled
                                ? (lockout.isLockedOut
                                      ? colorScheme.error
                                      : colorScheme.primary)
                                : colorScheme.surfaceContainerHighest,
                            border: Border.all(
                              color: isFilled
                                  ? (lockout.isLockedOut
                                        ? colorScheme.error
                                        : colorScheme.primary)
                                  : colorScheme.outline.withValues(alpha: 0.3),
                              width: 2,
                            ),
                            boxShadow: isFilled
                                ? [
                                    BoxShadow(
                                      color:
                                          (lockout.isLockedOut
                                                  ? colorScheme.error
                                                  : colorScheme.primary)
                                              .withValues(alpha: 0.4),
                                      blurRadius: 8,
                                    ),
                                  ]
                                : null,
                          ),
                        );
                      }),
                    ),
                  ),

                  const Spacer(),

                  // Цифровая клавиатура 3x4
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 250),
                    opacity: isDialpadEnabled ? 1.0 : 0.35,
                    child: _NumericDialpad(
                      isEnabled: isDialpadEnabled,
                      onDigit: _onDigitPressed,
                      onBackspace: _onBackspacePressed,
                      onBiometric:
                          security.settings.isBiometricsEnabled &&
                              security.canUseBiometrics &&
                              !lockout.isBiometricsLockedOut &&
                              !lockout.isLockedOut
                          ? _triggerBiometricsIfAllowed
                          : null,
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}

class _NumericDialpad extends StatelessWidget {
  const _NumericDialpad({
    required this.isEnabled,
    required this.onDigit,
    required this.onBackspace,
    this.onBiometric,
  });

  final bool isEnabled;
  final ValueChanged<String> onDigit;
  final VoidCallback onBackspace;
  final VoidCallback? onBiometric;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow(['1', '2', '3']),
        const SizedBox(height: 14),
        _buildRow(['4', '5', '6']),
        const SizedBox(height: 14),
        _buildRow(['7', '8', '9']),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Кнопка биометрии или пустое место
            if (onBiometric != null)
              _DialpadActionButton(
                icon: Icons.fingerprint_rounded,
                isEnabled: isEnabled,
                onTap: onBiometric!,
              )
            else
              const SizedBox(width: 72, height: 72),

            _DialpadNumberButton(
              digit: '0',
              isEnabled: isEnabled,
              onTap: () => onDigit('0'),
            ),

            // Кнопка Backspace
            _DialpadActionButton(
              icon: Icons.backspace_outlined,
              isEnabled: isEnabled,
              onTap: onBackspace,
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
        for (final digit in digits)
          _DialpadNumberButton(
            digit: digit,
            isEnabled: isEnabled,
            onTap: () => onDigit(digit),
          ),
      ],
    );
  }
}

class _DialpadNumberButton extends StatelessWidget {
  const _DialpadNumberButton({
    required this.digit,
    required this.isEnabled,
    required this.onTap,
  });

  final String digit;
  final bool isEnabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        customBorder: const CircleBorder(),
        child: Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.15),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            digit,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class _DialpadActionButton extends StatelessWidget {
  const _DialpadActionButton({
    required this.icon,
    required this.isEnabled,
    required this.onTap,
  });

  final IconData icon;
  final bool isEnabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 72,
          height: 72,
          child: Center(
            child: Icon(icon, size: 28, color: colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
