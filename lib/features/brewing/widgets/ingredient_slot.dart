import 'package:flutter/material.dart';

import '../../inventory/models/inventory_item.dart';

class IngredientSlot extends StatelessWidget {
  const IngredientSlot({
    super.key,
    this.item,
    this.requiredQuantity = 0,
    this.selectedQuantity = 0,
    this.onTap,
  });

  final InventoryItem? item;
  final int requiredQuantity;
  final int selectedQuantity;
  final VoidCallback? onTap;

  static const Color panelColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  @override
  Widget build(BuildContext context) {
    final complete = selectedQuantity >= requiredQuantity &&
        requiredQuantity > 0;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 110,
        height: 130,
        decoration: BoxDecoration(
          color: panelColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: complete ? Colors.green : accentColor,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(12),
        child: item == null
            ? const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline,
              color: accentColor,
              size: 38,
            ),
            SizedBox(height: 10),
            Text(
              'Empty',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item!.icon,
              style: const TextStyle(fontSize: 42),
            ),
            const SizedBox(height: 10),
            Text(
              item!.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '$selectedQuantity / $requiredQuantity',
              style: TextStyle(
                color: complete
                    ? Colors.green
                    : Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}