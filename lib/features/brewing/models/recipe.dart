class Recipe {
  const Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredients,
    required this.brewTime,
    required this.sellValue,
    this.unlocked = true,
  });

  final String id;
  final String name;
  final String description;

  /// Ingredient ID -> Quantity
  final Map<String, int> ingredients;

  /// Seconds
  final int brewTime;

  final int sellValue;

  final bool unlocked;

  Recipe copyWith({
    String? id,
    String? name,
    String? description,
    Map<String, int>? ingredients,
    int? brewTime,
    int? sellValue,
    bool? unlocked,
  }) {
    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      brewTime: brewTime ?? this.brewTime,
      sellValue: sellValue ?? this.sellValue,
      unlocked: unlocked ?? this.unlocked,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'ingredients': ingredients,
      'brewTime': brewTime,
      'sellValue': sellValue,
      'unlocked': unlocked,
    };
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      ingredients: Map<String, int>.from(
        json['ingredients'] ?? const {},
      ),
      brewTime: json['brewTime'] ?? 0,
      sellValue: json['sellValue'] ?? 0,
      unlocked: json['unlocked'] ?? true,
    );
  }
}