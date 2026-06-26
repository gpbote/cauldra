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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FilledButton.icon(
        onPressed: enabled && !isBrewing ? onPressed : null,
        icon: isBrewing
            ? const SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : const Icon(Icons.science),
        label: Text(
          isBrewing ? 'Brewing...' : 'Brew Potion',
        ),
        style: FilledButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}