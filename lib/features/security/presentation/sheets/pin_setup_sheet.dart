import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/widgets/app_glass.dart';
import '../controllers/security_controller.dart';

class PinSetupSheet extends ConsumerStatefulWidget {
  const PinSetupSheet({super.key, this.isChanging = false});

  final bool isChanging;

  static Future<bool?> show(BuildContext context, {bool isChanging = false}) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => PinSetupSheet(isChanging: isChanging),
    );
  }

  @override
  ConsumerState<PinSetupSheet> createState() => _PinSetupSheetState();
}

class _PinSetupSheetState extends ConsumerState<PinSetupSheet>
    with SingleTickerProviderStateMixin {
  int _step = 1; // 1 = enter pin, 2 = confirm pin
  String _firstPin = '';
  String _currentPin = '';
  String? _errorMessage;

  late final AnimationController _shakeController;
  late final Animation<double> _shakeAnimation;

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
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _onDigit(String digit) {
    if (_currentPin.length >= 4) return;
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
    if (_currentPin.isEmpty) return;
    HapticFeedback.selectionClick();
    setState(() {
      _currentPin = _currentPin.substring(0, _currentPin.length - 1);
      _errorMessage = null;
    });
  }

  Future<void> _handleComplete() async {
    if (_step == 1) {
      // Переход ко второму шагу подтверждения
      await Future<void>.delayed(const Duration(milliseconds: 150));
      setState(() {
        _firstPin = _currentPin;
        _currentPin = '';
        _step = 2;
      });
    } else {
      // Проверка совпадения
      if (_currentPin == _firstPin) {
        await ref.read(securityControllerProvider.notifier).setPin(_currentPin);
        if (mounted) {
          Navigator.of(context).pop(true);
        }
      } else {
        HapticFeedback.vibrate();
        await _shakeController.forward(from: 0.0);
        setState(() {
          _errorMessage = 'PIN-коды не совпадают. Попробуйте снова';
          _currentPin = '';
          _firstPin = '';
          _step = 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final title = _step == 1
        ? (widget.isChanging ? 'Новый PIN-код' : 'Создайте PIN-код')
        : 'Подтвердите PIN-код';

    final subtitle =
        _errorMessage ??
        (_step == 1
            ? 'Введите 4 цифры для защиты приложения'
            : 'Повторите введенный ранее PIN-код');

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
                  _step == 1 ? Icons.pin_outlined : Icons.lock_clock_outlined,
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
              _DialpadGrid(onDigit: _onDigit, onBackspace: _onBackspace),
            ],
          ),
        ),
      ),
    );
  }
}

class _DialpadGrid extends StatelessWidget {
  const _DialpadGrid({required this.onDigit, required this.onBackspace});

  final ValueChanged<String> onDigit;
  final VoidCallback onBackspace;

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
                onTap: onBackspace,
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
            onTap: onTap,
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
