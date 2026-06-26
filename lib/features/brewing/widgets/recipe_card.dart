import 'package:flutter/material.dart';

import '../models/recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.selected,
    required this.onTap,
  });

  final Recipe recipe;
  final bool selected;
  final VoidCallback onTap;

  static const Color panelColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? const Color(0xFF42331F) : panelColor,
      elevation: selected ? 6 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: selected ? accentColor : Colors.white24,
          width: selected ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recipe.name,
                style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                recipe.description,
                style: const TextStyle(
                  color: Colors.white70,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              const Divider(color: Colors.white24),
              const SizedBox(height: 8),
              const Text(
                'Ingredients',
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...recipe.ingredients.entries.map(
                    (ingredient) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.local_florist,
                        color: accentColor,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          ingredient.key,
                          style: const TextStyle(
                            color: textColor,
                          ),
                        ),
                      ),
                      Text(
                        '×${ingredient.value}',
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(
                    Icons.schedule,
                    color: accentColor,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${recipe.brewTime}s',
                    style: const TextStyle(
                      color: textColor,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.monetization_on,
                    color: Colors.amber,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${recipe.sellValue}g',
                    style: const TextStyle(
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}