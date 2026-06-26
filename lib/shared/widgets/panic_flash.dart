import 'package:flutter/material.dart';

class PanicFlash extends StatefulWidget {
  final bool active;
  final Widget child;

  const PanicFlash({
    super.key,
    required this.active,
    required this.child,
  });

  @override
  State<PanicFlash> createState() => _PanicFlashState();
}

class _PanicFlashState extends State<PanicFlash>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        final opacity = widget.active
            ? (_controller.value * 0.3)
            : 0.0;

        return Stack(
          children: [
            child!,
            IgnorePointer(
              child: Container(
                color: Colors.red.withValues(alpha: opacity),
              ),
            ),
          ],
        );
      },
    );
  }
}