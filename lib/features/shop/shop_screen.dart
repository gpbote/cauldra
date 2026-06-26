import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  static const Color backgroundColor = Color(0xFF1B1A17);
  static const Color panelColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: panelColor,
        foregroundColor: textColor,
        centerTitle: true,
        title: const Text('Alchemy Shop'),
      ),
      body: const Center(
        child: Text(
          'Alchemy Shop\nComing Soon',
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