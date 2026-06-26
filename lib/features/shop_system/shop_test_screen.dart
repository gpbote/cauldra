import 'package:flutter/material.dart';

import 'models/ingredient_shelf.dart';
import 'widgets/ingredient_shelf_widget.dart';

// TEMP ITEM (we reuse existing Item model)
import '../../core/data/item_database.dart';

class ShopTestScreen extends StatelessWidget {
  const ShopTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shelves = [
      IngredientShelf(
        id: 'lavender',
        name: 'Lavender Shelf',
        item: ItemDatabase.herb,
        maxStock: 5,
        refillTime: const Duration(seconds: 10),
        currentStock: 5,
      ),
      IngredientShelf(
        id: 'mushroom',
        name: 'Mushroom Shelf',
        item: ItemDatabase.mushroom,
        maxStock: 3,
        refillTime: const Duration(seconds: 10),
        currentStock: 3,
      ),
      IngredientShelf(
        id: 'bottle',
        name: 'Bottle Shelf',
        item: ItemDatabase.bottle,
        maxStock: 4,
        refillTime: const Duration(seconds: 10),
        currentStock: 4,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1B1A17),
      appBar: AppBar(
        title: const Text('Shop Test'),
        backgroundColor: const Color(0xFF31291E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: shelves
              .map(
                (shelf) => IngredientShelfWidget(
              shelf: shelf,
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}