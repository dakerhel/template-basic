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

    // Автоматический запрос биометрии при появлении экрана
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _triggerBiometrics();
    });
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  Future<void> _triggerBiometrics() async {
    final security = ref.read(securityControllerProvider);
    if (security.settings.isBiometricsEnabled && security.canUseBiometrics) {
      await ref
          .read(securityControllerProvider.notifier)
          .unlockWithBiometrics(reason: 'Подтвердите личность для входа');
    }
  }

  void _onDigitPressed(String digit) {
    if (_isVerifying || _enteredPin.length >= 4) return;
    HapticFeedback.selectionClick();
    setState(() {
      _enteredPin += digit;
    });

    if (_enteredPin.length == 4) {
      _verifyPin();
    }
  }

  void _onBackspacePressed() {
    if (_isVerifying || _enteredPin.isEmpty) return;
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final security = ref.watch(securityControllerProvider);

    return Scaffold(
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

                  // Иконка замка с Liquid Glass эффектом
                  AppGlassCard(
                    borderRadius: 24,
                    padding: const EdgeInsets.all(20),
                    child: Icon(
                      Icons.lock_rounded,
                      size: 44,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Заголовок
                  Text(
                    'Введите PIN-код',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Для доступа к приложению',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
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
                                ? colorScheme.primary
                                : colorScheme.surfaceContainerHighest,
                            border: Border.all(
                              color: isFilled
                                  ? colorScheme.primary
                                  : colorScheme.outline.withValues(alpha: 0.3),
                              width: 2,
                            ),
                            boxShadow: isFilled
                                ? [
                                    BoxShadow(
                                      color: colorScheme.primary.withValues(
                                        alpha: 0.4,
                                      ),
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
                  _NumericDialpad(
                    onDigit: _onDigitPressed,
                    onBackspace: _onBackspacePressed,
                    onBiometric:
                        security.settings.isBiometricsEnabled &&
                            security.canUseBiometrics
                        ? _triggerBiometrics
                        : null,
                  ),

                  const SizedBox(height: 16),
                ],
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
    required this.onDigit,
    required this.onBackspace,
    this.onBiometric,
  });

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
                onTap: onBiometric!,
              )
            else
              const SizedBox(width: 72, height: 72),

            _DialpadNumberButton(digit: '0', onTap: () => onDigit('0')),

            // Кнопка Backspace
            _DialpadActionButton(
              icon: Icons.backspace_outlined,
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
          _DialpadNumberButton(digit: digit, onTap: () => onDigit(digit)),
      ],
    );
  }
}

class _DialpadNumberButton extends StatelessWidget {
  const _DialpadNumberButton({required this.digit, required this.onTap});

  final String digit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
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
  const _DialpadActionButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
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
