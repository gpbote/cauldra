import '../../features/brewing/models/recipe.dart';
import '../../features/inventory/models/inventory_item.dart';

class BrewingResult {
  final bool success;
  final String message;

  BrewingResult({
    required this.success,
    required this.message,
  });
}

class BrewingService {
  BrewingService._();

  static final BrewingService instance = BrewingService._();

  bool canBrew({
    required Recipe recipe,
    required List<InventoryItem> inventory,
  }) {
    for (final entry in recipe.ingredients.entries) {
      final item = inventory.firstWhere(
            (e) => e.name == entry.key,
        orElse: () => InventoryItem(
          id: '',
          name: '',
          category: '',
          description: '',
          icon: '',
          quantity: 0,
        ),
      );

      if (item.quantity < entry.value) {
        return false;
      }
    }
    return true;
  }

  List<InventoryItem> consumeIngredients({
    required Recipe recipe,
    required List<InventoryItem> inventory,
  }) {
    return inventory.map((item) {
      final requiredQty = recipe.ingredients[item.name];

      if (requiredQty == null) return item;

      return item.copyWith(
        quantity: item.quantity - requiredQty,
      );
    }).toList();
  }

  BrewingResult brew({
    required Recipe recipe,
    required List<InventoryItem> inventory,
  }) {
    final canBrewNow = canBrew(
      recipe: recipe,
      inventory: inventory,
    );

    if (!canBrewNow) {
      return BrewingResult(
        success: false,
        message: 'Not enough ingredients',
      );
    }

    return BrewingResult(
      success: true,
      message: '${recipe.name} brewed successfully!',
    );
  }
}