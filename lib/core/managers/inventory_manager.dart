import 'dart:collection';

/// Central inventory logic for Cauldra.
///
/// This class contains no Flutter UI code and can be reused by
/// Workshop, Brewing, Shop, Save, and Customer systems.
class InventoryManager {
  InventoryManager({this.capacity = 100});

  final int capacity;

  final Map<String, int> _items = {};

  UnmodifiableMapView<String, int> get items =>
      UnmodifiableMapView(_items);

  int get totalItems =>
      _items.values.fold(0, (sum, value) => sum + value);

  int count(String id) => _items[id] ?? 0;

  bool has(String id, {int amount = 1}) =>
      count(id) >= amount;

  bool get isFull => totalItems >= capacity;

  bool add(String id, {int amount = 1}) {
    if (amount <= 0) return false;
    if (totalItems + amount > capacity) return false;

    _items[id] = count(id) + amount;
    return true;
  }

  bool remove(String id, {int amount = 1}) {
    if (!has(id, amount: amount)) return false;

    final remaining = count(id) - amount;

    if (remaining <= 0) {
      _items.remove(id);
    } else {
      _items[id] = remaining;
    }

    return true;
  }

  void clear() => _items.clear();

  Map<String, int> toMap() => Map<String, int>.from(_items);

  void load(Map<String, int> data) {
    _items
      ..clear()
      ..addAll(data);
  }
}
