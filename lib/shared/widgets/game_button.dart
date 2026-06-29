import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  const GameButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 180,
    this.height = 56,
    this.enabled = true,
  });

  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final bool enabled;

  static const Color gold = Color(0xFFD4A44A);
  static const Color dark = Color(0xFF31291E);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          elevation: 8,
          shadowColor: Colors.black54,
          backgroundColor: gold,
          foregroundColor: dark,
          disabledBackgroundColor: Colors.grey.shade700,
          disabledForegroundColor: Colors.white54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: Colors.white24,
              width: 1.5,
            ),
          ),
        ),
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}