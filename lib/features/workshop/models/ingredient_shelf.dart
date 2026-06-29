import 'package:flutter/foundation.dart';

@immutable
class IngredientShelf {
  final String id;
  final String name;
  final String emoji;
  final Duration restockDuration;
  final DateTime lastCollected;

  const IngredientShelf({
    required this.id,
    required this.name,
    required this.emoji,
    required this.restockDuration,
    required this.lastCollected,
  });

  bool get isReady =>
      DateTime.now().difference(lastCollected) >= restockDuration;

  Duration get remaining {
    final elapsed = DateTime.now().difference(lastCollected);
    if (elapsed >= restockDuration) return Duration.zero;
    return restockDuration - elapsed;
  }

  IngredientShelf collect() {
    return copyWith(lastCollected: DateTime.now());
  }

  IngredientShelf copyWith({
    String? id,
    String? name,
    String? emoji,
    Duration? restockDuration,
    DateTime? lastCollected,
  }) {
    return IngredientShelf(
      id: id ?? this.id,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      restockDuration: restockDuration ?? this.restockDuration,
      lastCollected: lastCollected ?? this.lastCollected,
    );
  }

  static List<IngredientShelf> starterShelves() {
    final now = DateTime.now().subtract(const Duration(minutes: 10));

    return [
      IngredientShelf(
        id: 'herbs',
        name: 'Herbs',
        emoji: '🌿',
        restockDuration: const Duration(seconds: 20),
        lastCollected: now,
      ),
      IngredientShelf(
        id: 'mushrooms',
        name: 'Mushrooms',
        emoji: '🍄',
        restockDuration: const Duration(seconds: 30),
        lastCollected: now,
      ),
      IngredientShelf(
        id: 'flowers',
        name: 'Flowers',
        emoji: '🌸',
        restockDuration: const Duration(seconds: 40),
        lastCollected: now,
      ),
      IngredientShelf(
        id: 'catalysts',
        name: 'Catalysts',
        emoji: '✨',
        restockDuration: const Duration(seconds: 60),
        lastCollected: now,
      ),
    ];
  }
}
