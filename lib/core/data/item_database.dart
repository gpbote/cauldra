import '../models/item.dart';

class ItemDatabase {
  ItemDatabase._();

  static const Item herb = Item(
    id: 'herb',
    name: 'Healing Herb',
    description: 'A common medicinal herb used in basic potions.',
    type: ItemType.herb,
    rarity: ItemRarity.common,
    icon: 'assets/items/herb.png',
    maxStack: 99,
    value: 4,
  );

  static const Item mushroom = Item(
    id: 'mushroom',
    name: 'Red Mushroom',
    description: 'A wild mushroom with mild magical properties.',
    type: ItemType.mushroom,
    rarity: ItemRarity.common,
    icon: 'assets/items/mushroom.png',
    maxStack: 99,
    value: 6,
  );

  static const Item wood = Item(
    id: 'wood',
    name: 'Oak Wood',
    description: 'Basic crafting material.',
    type: ItemType.wood,
    rarity: ItemRarity.common,
    icon: 'assets/items/wood.png',
    maxStack: 99,
    value: 3,
  );

  static const Item ore = Item(
    id: 'ore',
    name: 'Iron Ore',
    description: 'Can be refined into iron ingots.',
    type: ItemType.ore,
    rarity: ItemRarity.uncommon,
    icon: 'assets/items/ore.png',
    maxStack: 99,
    value: 12,
  );

  static const Item bottle = Item(
    id: 'bottle',
    name: 'Empty Bottle',
    description: 'Required for brewing potions.',
    type: ItemType.ingredient,
    rarity: ItemRarity.common,
    icon: 'assets/items/bottle.png',
    maxStack: 99,
    value: 2,
  );

  static const Item healingPotion = Item(
    id: 'healing_potion',
    name: 'Healing Potion',
    description: 'Restores a small amount of health.',
    type: ItemType.potion,
    rarity: ItemRarity.uncommon,
    icon: 'assets/items/healing_potion.png',
    maxStack: 20,
    value: 25,
  );

  static const Item manaPotion = Item(
    id: 'mana_potion',
    name: 'Mana Potion',
    description: 'Restores magical energy.',
    type: ItemType.potion,
    rarity: ItemRarity.uncommon,
    icon: 'assets/items/mana_potion.png',
    maxStack: 20,
    value: 28,
  );

  static const Item apprenticeMortar = Item(
    id: 'apprentice_mortar',
    name: 'Apprentice Mortar',
    description: 'A beginner alchemist tool.',
    type: ItemType.tool,
    rarity: ItemRarity.common,
    icon: 'assets/items/mortar.png',
    maxStack: 1,
    value: 80,
  );

  static const List<Item> allItems = [
    herb,
    mushroom,
    wood,
    ore,
    bottle,
    healingPotion,
    manaPotion,
    apprenticeMortar,
  ];

  static Item? getById(String id) {
    try {
      return allItems.firstWhere((item) => item.id == id);
    } catch (_) {
      return null;
    }
  }
}