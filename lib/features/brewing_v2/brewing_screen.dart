import 'package:flutter/material.dart';

class BrewingScreen extends StatelessWidget {
  const BrewingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brewing V2'),
      ),
      body: const Center(
        child: Text(
          'Brewing V2\nUnder Construction',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}