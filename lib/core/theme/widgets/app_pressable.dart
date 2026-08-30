import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Виджет для создания упругого, физичного пружинящего эффекта нажатия (Spring / Bouncy feedback)
/// с встроенным тактильным виброоткликом (Haptic Feedback) в стиле iOS / visionOS.
class AppPressable extends StatefulWidget {
  const AppPressable({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.pressedScale = 0.97,
    this.pressedOpacity = 1.0,
    this.enableHaptic = true,
    this.hapticFeedbackType = HapticFeedbackType.selection,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.enabled = true,
    this.curve = Curves.easeOutCubic,
    this.reverseCurve = Curves.easeOutBack,
    this.duration = const Duration(milliseconds: 110),
    this.reverseDuration = const Duration(milliseconds: 220),
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double pressedScale;
  final double pressedOpacity;
  final bool enableHaptic;
  final HapticFeedbackType hapticFeedbackType;
  final HitTestBehavior hitTestBehavior;
  final bool enabled;
  final Curve curve;
  final Curve reverseCurve;
  final Duration duration;
  final Duration reverseDuration;

  @override
  State<AppPressable> createState() => _AppPressableState();
}

enum HapticFeedbackType {
  selection,
  light,
  medium,
  heavy,
}

class _AppPressableState extends State<AppPressable>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.pressedScale,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve,
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: widget.pressedOpacity,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AppPressable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pressedScale != widget.pressedScale ||
        oldWidget.pressedOpacity != widget.pressedOpacity ||
        oldWidget.duration != widget.duration ||
        oldWidget.reverseDuration != widget.reverseDuration) {
      _controller.duration = widget.duration;
      _controller.reverseDuration = widget.reverseDuration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _triggerHaptic() {
    if (!widget.enableHaptic) return;
    switch (widget.hapticFeedbackType) {
      case HapticFeedbackType.selection:
        HapticFeedback.selectionClick();
        break;
      case HapticFeedbackType.light:
        HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.medium:
        HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavy:
        HapticFeedback.heavyImpact();
        break;
    }
  }

  void _handlePointerDown(PointerDownEvent event) {
    if (!widget.enabled ||
        (widget.onTap == null && widget.onLongPress == null)) {
      return;
    }
    _triggerHaptic();
    _controller.forward();
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (!widget.enabled) return;
    _controller.reverse();
  }

  void _handlePointerCancel(PointerCancelEvent event) {
    if (!widget.enabled) return;
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final isInteractive =
        widget.enabled &&
        (widget.onTap != null || widget.onLongPress != null);

    if (!isInteractive) {
      return widget.child;
    }

    return Listener(
      behavior: widget.hitTestBehavior,
      onPointerDown: _handlePointerDown,
      onPointerUp: _handlePointerUp,
      onPointerCancel: _handlePointerCancel,
      child: GestureDetector(
        behavior: widget.hitTestBehavior,
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
