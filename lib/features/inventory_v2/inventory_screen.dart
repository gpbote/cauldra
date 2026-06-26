import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  static const Color backgroundColor = Color(0xFF1B1A17);
  static const Color panelColor = Color(0xFF31291E);
  static const Color textColor = Color(0xFFF7F1E3);
  static const Color accentColor = Color(0xFFD4A44A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: panelColor,
        foregroundColor: textColor,
        centerTitle: true,
        title: const Text('Inventory'),
      ),
      body: const Center(
        child: Text(
          'Inventory V2\nUnder Construction',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}