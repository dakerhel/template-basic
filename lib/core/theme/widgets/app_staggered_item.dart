import 'package:flutter/material.dart';

/// Виджет для плавного каскадного появления элементов списка (Staggered Entrance Animation).
/// Элементы появляются один за другим со сдвигом снизу и плавным нарастанием прозрачности.
class AppStaggeredItem extends StatefulWidget {
  const AppStaggeredItem({
    super.key,
    required this.child,
    required this.index,
    this.baseDelay = const Duration(milliseconds: 40),
    this.duration = const Duration(milliseconds: 380),
    this.slideOffset = const Offset(0.0, 0.08),
    this.curve = Curves.easeOutCubic,
  });

  final Widget child;
  final int index;
  final Duration baseDelay;
  final Duration duration;
  final Offset slideOffset;
  final Curve curve;

  @override
  State<AppStaggeredItem> createState() => _AppStaggeredItemState();
}

class _AppStaggeredItemState extends State<AppStaggeredItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _slideAnimation = Tween<Offset>(
      begin: widget.slideOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    final delay = widget.baseDelay * widget.index;
    Future.delayed(delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}
