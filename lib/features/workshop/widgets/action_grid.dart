import 'package:flutter/material.dart';

import '../../inventory/inventory_screen.dart';
import 'action_tile.dart';

class ActionGrid extends StatelessWidget {
  const ActionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      (
      Icons.backpack_outlined,
      'Inventory',
      ),
      (
      Icons.science_outlined,
      'Brew',
      ),
      (
      Icons.menu_book_outlined,
      'Recipe Book',
      ),
      (
      Icons.people_outline,
      'Customers',
      ),
      (
      Icons.storefront_outlined,
      'Shop',
      ),
      (
      Icons.book_outlined,
      'Journal',
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: actions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        final action = actions[index];

        return ActionTile(
          icon: action.$1,
          label: action.$2,
          onTap: () {
            switch (action.$2) {
              case 'Inventory':
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const InventoryScreen(),
                  ),
                );
                break;

              default:
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${action.$2} coming soon'),
                  ),
                );
            }
          },
        );
      },
    );
  }
}