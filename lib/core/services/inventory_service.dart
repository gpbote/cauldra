import 'package:flutter/foundation.dart';

import '../models/inventory.dart';
import '../models/item.dart';

class InventoryService extends ChangeNotifier {
  InventoryService._();

  static final InventoryService instance = InventoryService._();

  final Inventory _inventory = Inventory();

  Inventory get inventory => _inventory;

  List<InventorySlot> get slots => _inventory.slots;

  int get totalItems => _inventory.totalItems;

  int get totalValue => _inventory.totalValue;

  bool contains(String itemId) {
    return _inventory.contains(itemId);
  }

  int quantityOf(String itemId) {
    return _inventory.getQuantity(itemId);
  }

  bool addItem(Item item, {int quantity = 1}) {
    final result = _inventory.addItem(
      item,
      quantity: quantity,
    );

    if (result) {
      notifyListeners();
    }

    return result;
  }

  bool removeItem(String itemId, {int quantity = 1}) {
    final result = _inventory.removeItem(
      itemId,
      quantity: quantity,
    );

    if (result) {
      notifyListeners();
    }

    return result;
  }

  void clear() {
    _inventory.clear();
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return _inventory.toJson();
  }

  void loadFromJson(Map<String, dynamic> json) {
    _inventory.clear();

    final loaded = Inventory.fromJson(json);

    for (final slot in loaded.slots) {
      _inventory.addItem(
        slot.item,
        quantity: slot.quantity,
      );
    }

    notifyListeners();
  }
}