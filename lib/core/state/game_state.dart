import 'package:flutter/foundation.dart';

import '../../features/workshop/models/ingredient_shelf.dart';

@immutable
class PlayerStats {
  final int gold;
  final int reputation;
  final int energy;
  final int happiness;
  final int day;

  const PlayerStats({
    this.gold = 100,
    this.reputation = 0,
    this.energy = 100,
    this.happiness = 100,
    this.day = 1,
  });

  PlayerStats copyWith({
    int? gold,
    int? reputation,
    int? energy,
    int? happiness,
    int? day,
  }) {
    return PlayerStats(
      gold: gold ?? this.gold,
      reputation: reputation ?? this.reputation,
      energy: energy ?? this.energy,
      happiness: happiness ?? this.happiness,
      day: day ?? this.day,
    );
  }
}

class GameState extends ChangeNotifier {
  PlayerStats _player = const PlayerStats();

  final Map<String, int> _inventory = {};

  final List<IngredientShelf> _shelves =
      IngredientShelf.starterShelves();

  PlayerStats get player => _player;

  Map<String, int> get inventory =>
      Map.unmodifiable(_inventory);

  List<IngredientShelf> get shelves =>
      List.unmodifiable(_shelves);

  void addIngredient(String id, {int amount = 1}) {
    _inventory[id] = (_inventory[id] ?? 0) + amount;
    notifyListeners();
  }

  int ingredientCount(String id) => _inventory[id] ?? 0;

  void updatePlayer(PlayerStats stats) {
    _player = stats;
    notifyListeners();
  }

  void collectShelf(int index) {
    if (!_shelves[index].isReady) return;

    addIngredient(_shelves[index].id);
    _shelves[index] = _shelves[index].collect();
    notifyListeners();
  }
}
