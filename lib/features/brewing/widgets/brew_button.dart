import 'package:flutter/material.dart';

class BrewButton extends StatelessWidget {
  const BrewButton({
    super.key,
    required this.enabled,
    required this.onPressed,
    this.isBrewing = false,
  });

  final bool enabled;
  final bool isBrewing;
  final VoidCallback onPressed;

  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: FilledButton.icon(
        onPressed: enabled && !isBrewing ? onPressed : null,
        icon: isBrewing
            ? const SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: textColor,
          ),
        )
            : const Icon(Icons.science),
        label: Text(
          isBrewing ? 'Brewing...' : 'Brew Potion',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: FilledButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.black,
          disabledBackgroundColor: Colors.grey.shade700,
          disabledForegroundColor: Colors.white54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}