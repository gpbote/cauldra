import 'package:flutter/foundation.dart';

import '../../../core/models/item.dart';

class BrewingController extends ChangeNotifier {
  BrewingController._();

  static final BrewingController instance = BrewingController._();

  final List<Item> _selectedIngredients = [];

  String? _selectedCatalyst;

  List<Item> get selectedIngredients => _selectedIngredients;
  String? get selectedCatalyst => _selectedCatalyst;

  void addIngredient(Item item) {
    _selectedIngredients.add(item);
    notifyListeners();
  }

  void removeIngredient(Item item) {
    _selectedIngredients.remove(item);
    notifyListeners();
  }

  void clear() {
    _selectedIngredients.clear();
    _selectedCatalyst = null;
    notifyListeners();
  }

  void selectCatalyst(String catalyst) {
    _selectedCatalyst = catalyst;
    notifyListeners();
  }

  String brewPotion() {
    if (_selectedIngredients.isEmpty || _selectedCatalyst == null) {
      return "Missing ingredients or catalyst";
    }

    final ingredientNames =
    _selectedIngredients.map((e) => e.name).toList();

    String result;

    switch (_selectedCatalyst) {
      case "Water":
        result = "Healing Potion";
        break;
      case "Fire":
        result = "Battle Elixir";
        break;
      case "Earth":
        result = "Defense Potion";
        break;
      case "Air":
        result = "Speed Potion";
        break;
      default:
        result = "Arcane Potion";
    }

    clear();
    return "Brewed: $result from $ingredientNames";
  }
}