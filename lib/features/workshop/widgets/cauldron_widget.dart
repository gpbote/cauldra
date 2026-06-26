import 'dart:math' as math;

import 'package:flutter/material.dart';

class CauldronWidget extends StatefulWidget {
  const CauldronWidget({super.key});

  @override
  State<CauldronWidget> createState() => _CauldronWidgetState();
}

class _CauldronWidgetState extends State<CauldronWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const Color panelColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double size =
        (constraints.maxWidth * 0.42).clamp(220.0, 360.0);

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final double glow = 8 + (_controller.value * 14);
            final double lift =
                math.sin(_controller.value * math.pi) * 8;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(0, -lift),
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: panelColor,
                      border: Border.all(
                        color: accentColor,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.orange.withValues(alpha: 0.35),
                          blurRadius: glow,
                          spreadRadius: glow / 3,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.local_fire_department,
                      color: accentColor,
                      size: 140,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Ancient Brewing Cauldron",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Ready to brew your first potion.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: 360,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: panelColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: accentColor,
                    ),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "Current Brew",
                        style: TextStyle(
                          color: accentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "None",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Ready to brew",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}