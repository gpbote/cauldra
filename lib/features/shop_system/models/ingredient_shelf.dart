import '../../../core/models/item.dart';

class IngredientShelf {
  final String id;
  final String name;
  final Item item;

  final int maxStock;
  final Duration refillTime;

  int currentStock;

  IngredientShelf({
    required this.id,
    required this.name,
    required this.item,
    required this.maxStock,
    required this.refillTime,
    this.currentStock = 0,
  });

  bool get canTake => currentStock > 0;

  void takeOne() {
    if (currentStock > 0) {
      currentStock--;
    }
  }

  void refill() {
    currentStock = maxStock;
  }
}