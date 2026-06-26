import 'package:flutter/material.dart';

import '../models/ingredient_shelf.dart';

class IngredientShelfWidget extends StatefulWidget {
  final IngredientShelf shelf;
  final VoidCallback? onTap;

  const IngredientShelfWidget({
    super.key,
    required this.shelf,
    this.onTap,
  });

  @override
  State<IngredientShelfWidget> createState() =>
      _IngredientShelfWidgetState();
}

class _IngredientShelfWidgetState extends State<IngredientShelfWidget> {
  static const Color panelColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  void _takeItem() {
    if (widget.shelf.canTake) {
      setState(() {
        widget.shelf.takeOne();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Collected ${widget.shelf.item.name}',
          ),
          duration: const Duration(milliseconds: 600),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _takeItem,
      child: Container(
        width: 150,
        height: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: panelColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.shelf.canTake
                ? accentColor
                : Colors.grey,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.shelf.item.icon,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 8),
            Text(
              widget.shelf.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Stock: ${widget.shelf.currentStock}',
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 6),
            Text(
              widget.shelf.canTake
                  ? 'Tap to collect'
                  : 'Empty',
              style: TextStyle(
                color: widget.shelf.canTake
                    ? accentColor
                    : Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}