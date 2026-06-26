import 'package:flutter/material.dart';

import '../services/brewing_controller.dart';
import '../services/brewing_result_store.dart';

class BrewingStationWidget extends StatefulWidget {
  const BrewingStationWidget({super.key});

  @override
  State<BrewingStationWidget> createState() =>
      _BrewingStationWidgetState();
}

class _BrewingStationWidgetState extends State<BrewingStationWidget> {
  final controller = BrewingController.instance;

  String? result;

  void _brew() {
    final brewedPotion = controller.brewPotion();

    setState(() {
      result = brewedPotion;
      BrewingResultStore.lastPotion = brewedPotion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF31291E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFD4A44A)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "⚗️ Brewing Station",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4A44A),
            ),
            onPressed: _brew,
            child: const Text("Brew Potion ⚗️"),
          ),

          const SizedBox(height: 10),

          if (result != null)
            Text(
              result!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
        ],
      ),
    );
  }
}