import 'package:flutter/material.dart';

import '../../core/models/item.dart';

class ItemIcon extends StatelessWidget {
  const ItemIcon({
    super.key,
    required this.item,
    this.size = 32,
  });

  final Item item;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      _emoji(item.type),
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  String _emoji(ItemType type) {
    switch (type) {
      case ItemType.ingredient:
        return '🧴';

      case ItemType.herb:
        return '🌿';

      case ItemType.mushroom:
        return '🍄';

      case ItemType.ore:
        return '⛏️';

      case ItemType.wood:
        return '🪵';

      case ItemType.potion:
        return '🧪';

      case ItemType.tool:
        return '🛠️';

      case ItemType.equipment:
        return '🛡️';

      case ItemType.quest:
        return '📜';

      case ItemType.misc:
        return '📦';
    }
  }
}