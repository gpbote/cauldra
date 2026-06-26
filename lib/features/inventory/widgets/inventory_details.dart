import 'package:flutter/material.dart';

import '../models/inventory_item.dart';

class InventoryDetails extends StatelessWidget {
  const InventoryDetails({
    super.key,
    required this.item,
  });

  final InventoryItem? item;

  static const Color panelColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: accentColor,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: item == null
          ? const Center(
        child: Text(
          'Select an item',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
          ),
        ),
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              item!.icon,
              style: const TextStyle(fontSize: 72),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            item!.name,
            style: const TextStyle(
              color: textColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item!.category,
            style: const TextStyle(
              color: accentColor,
              fontSize: 16,
            ),
          ),
          const Divider(
            height: 30,
            color: Colors.white24,
          ),
          const Text(
            'Description',
            style: TextStyle(
              color: accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item!.description,
            style: const TextStyle(
              color: textColor,
              height: 1.5,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Use'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.sell),
                  label: Text(
                    'Sell (${item!.sellValue}g)',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}