class InventoryItem {
  const InventoryItem({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.icon,
    this.quantity = 1,
    this.sellValue = 0,
    this.rarity = ItemRarity.common,
  });

  final String id;
  final String name;
  final String category;
  final String description;
  final String icon;
  final int quantity;
  final int sellValue;
  final ItemRarity rarity;

  InventoryItem copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    String? icon,
    int? quantity,
    int? sellValue,
    ItemRarity? rarity,
  }) {
    return InventoryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      quantity: quantity ?? this.quantity,
      sellValue: sellValue ?? this.sellValue,
      rarity: rarity ?? this.rarity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'icon': icon,
      'quantity': quantity,
      'sellValue': sellValue,
      'rarity': rarity.name,
    };
  }

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
      quantity: json['quantity'] ?? 1,
      sellValue: json['sellValue'] ?? 0,
      rarity: ItemRarity.values.firstWhere(
            (value) => value.name == json['rarity'],
        orElse: () => ItemRarity.common,
      ),
    );
  }
}

enum ItemRarity {
  common,
  uncommon,
  rare,
  epic,
  legendary,
}