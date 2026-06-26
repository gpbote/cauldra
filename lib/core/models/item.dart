enum ItemType {
  ingredient,
  herb,
  mushroom,
  ore,
  wood,
  potion,
  tool,
  equipment,
  quest,
  misc,
}

enum ItemRarity {
  common,
  uncommon,
  rare,
  epic,
  legendary,
}

class Item {
  final String id;
  final String name;
  final String description;
  final ItemType type;
  final ItemRarity rarity;

  /// Asset path
  final String icon;

  /// Maximum number per stack.
  /// Tools and equipment usually have a max stack of 1.
  final int maxStack;

  /// Sell price
  final int value;

  const Item({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.rarity,
    required this.icon,
    required this.maxStack,
    required this.value,
  });

  bool get isStackable => maxStack > 1;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': type.name,
      'rarity': rarity.name,
      'icon': icon,
      'maxStack': maxStack,
      'value': value,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      type: ItemType.values.firstWhere(
            (e) => e.name == json['type'],
      ),
      rarity: ItemRarity.values.firstWhere(
            (e) => e.name == json['rarity'],
      ),
      icon: json['icon'],
      maxStack: json['maxStack'],
      value: json['value'],
    );
  }

  Item copyWith({
    String? id,
    String? name,
    String? description,
    ItemType? type,
    ItemRarity? rarity,
    String? icon,
    int? maxStack,
    int? value,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      rarity: rarity ?? this.rarity,
      icon: icon ?? this.icon,
      maxStack: maxStack ?? this.maxStack,
      value: value ?? this.value,
    );
  }
}