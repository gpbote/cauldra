import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  static const Color backgroundColor = Color(0xFF1B1A17);
  static const Color panelColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Inventory'),
        centerTitle: true,
        backgroundColor: panelColor,
        foregroundColor: textColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final desktop = constraints.maxWidth >= 900;

              return desktop
                  ? const _DesktopInventory()
                  : const _MobileInventory();
            },
          ),
        ),
      ),
    );
  }
}

class _DesktopInventory extends StatelessWidget {
  const _DesktopInventory();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 2,
          child: Placeholder(),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Placeholder(),
        ),
      ],
    );
  }
}

class _MobileInventory extends StatelessWidget {
  const _MobileInventory();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: Placeholder(),
        ),
      ],
    );
  }
}