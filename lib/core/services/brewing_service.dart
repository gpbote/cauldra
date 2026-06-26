import '../services/inventory_service.dart';
import '../../features/brewing_v2/models/recipe.dart';

class BrewingResult {
  final bool success;
  final String message;

  const BrewingResult({
    required this.success,
    required this.message,
  });
}

class BrewingService {
  BrewingService._();

  static final BrewingService instance = BrewingService._();

  final InventoryService _inventory = InventoryService.instance;

  bool canBrew(Recipe recipe) {
    for (final ingredient in recipe.ingredients.entries) {
      if (_inventory.quantityOf(ingredient.key) < ingredient.value) {
        return false;
      }
    }

    return true;
  }

  BrewingResult brew(Recipe recipe) {
    if (!canBrew(recipe)) {
      return const BrewingResult(
        success: false,
        message: 'Not enough ingredients.',
      );
    }

    for (final ingredient in recipe.ingredients.entries) {
      _inventory.removeItem(
        ingredient.key,
        quantity: ingredient.value,
      );
    }

    return BrewingResult(
      success: true,
      message: '${recipe.name} brewed successfully!',
    );
  }
}