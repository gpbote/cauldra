import 'item.dart';

class InventorySlot {
  final Item item;
  int quantity;

  InventorySlot({
    required this.item,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'item': item.toJson(),
      'quantity': quantity,
    };
  }

  factory InventorySlot.fromJson(Map<String, dynamic> json) {
    return InventorySlot(
      item: Item.fromJson(json['item'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
    );
  }
}

class Inventory {
  Inventory();

  final List<InventorySlot> _slots = [];

  List<InventorySlot> get slots => List.unmodifiable(_slots);

  bool addItem(Item item, {int quantity = 1}) {
    if (quantity <= 0) return false;

    if (item.isStackable) {
      for (final slot in _slots) {
        if (slot.item.id == item.id &&
            slot.quantity < item.maxStack) {
          final available = item.maxStack - slot.quantity;
          final amountToAdd =
          quantity > available ? available : quantity;

          slot.quantity += amountToAdd;
          quantity -= amountToAdd;

          if (quantity == 0) {
            return true;
          }
        }
      }
    }

    while (quantity > 0) {
      final stackAmount = item.isStackable
          ? (quantity > item.maxStack
          ? item.maxStack
          : quantity)
          : 1;

      _slots.add(
        InventorySlot(
          item: item,
          quantity: stackAmount,
        ),
      );

      quantity -= stackAmount;
    }

    return true;
  }

  bool removeItem(String itemId, {int quantity = 1}) {
    if (quantity <= 0) return false;

    for (int i = 0; i < _slots.length && quantity > 0; i++) {
      final slot = _slots[i];

      if (slot.item.id != itemId) {
        continue;
      }

      if (slot.quantity > quantity) {
        slot.quantity -= quantity;
        return true;
      }

      quantity -= slot.quantity;
      _slots.removeAt(i);
      i--;
    }

    return quantity == 0;
  }

  int getQuantity(String itemId) {
    int total = 0;

    for (final slot in _slots) {
      if (slot.item.id == itemId) {
        total += slot.quantity;
      }
    }

    return total;
  }

  bool contains(String itemId) {
    return getQuantity(itemId) > 0;
  }

  void clear() {
    _slots.clear();
  }

  int get totalItems {
    int total = 0;

    for (final slot in _slots) {
      total += slot.quantity;
    }

    return total;
  }

  int get totalValue {
    int total = 0;

    for (final slot in _slots) {
      total += slot.item.value * slot.quantity;
    }

    return total;
  }

  Map<String, dynamic> toJson() {
    return {
      'slots': _slots.map((slot) => slot.toJson()).toList(),
    };
  }

  factory Inventory.fromJson(Map<String, dynamic> json) {
    final inventory = Inventory();

    final slots = (json['slots'] as List<dynamic>? ?? []);

    for (final slot in slots) {
      inventory._slots.add(
        InventorySlot.fromJson(
          slot as Map<String, dynamic>,
        ),
      );
    }

    return inventory;
  }
}