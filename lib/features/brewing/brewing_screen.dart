import 'package:flutter/material.dart';

import '../../core/managers/game_manager.dart';
import '../../core/services/brewing_service.dart';
import '../inventory/models/inventory_item.dart';
import '../workshop/widgets/cauldron_widget.dart';
import 'models/recipe.dart';
import 'widgets/brew_button.dart';
import 'widgets/ingredient_slot.dart';
import 'widgets/recipe_card.dart';

class BrewingScreen extends StatefulWidget {
  const BrewingScreen({super.key});

  @override
  State<BrewingScreen> createState() => _BrewingScreenState();
}

class _BrewingScreenState extends State<BrewingScreen> {
  static const Color backgroundColor = Color(0xFF1B1A17);
  static const Color panelColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  final List<Recipe> _recipes = [
    const Recipe(
      id: 'healing',
      name: 'Minor Healing Potion',
      description: 'Restores a small amount of health.',
      brewTime: 10,
      sellValue: 20,
      ingredients: {
        'Lavender': 2,
        'Red Mushroom': 1,
      },
    ),
    const Recipe(
      id: 'energy',
      name: 'Energy Potion',
      description: 'Restores stamina.',
      brewTime: 15,
      sellValue: 30,
      ingredients: {
        'Mint': 2,
        'Crystal Dust': 1,
      },
    ),
  ];

  List<InventoryItem> _inventory = List.of([
    const InventoryItem(
      id: 'lavender',
      name: 'Lavender',
      category: 'Herbs',
      description: 'A fragrant herb.',
      icon: '🌿',
      quantity: 12,
    ),
    const InventoryItem(
      id: 'mushroom',
      name: 'Red Mushroom',
      category: 'Mushrooms',
      description: 'Common mushroom.',
      icon: '🍄',
      quantity: 5,
    ),
    const InventoryItem(
      id: 'mint',
      name: 'Mint',
      category: 'Herbs',
      description: 'Refreshing herb.',
      icon: '🍃',
      quantity: 8,
    ),
    const InventoryItem(
      id: 'crystal',
      name: 'Crystal Dust',
      category: 'Minerals',
      description: 'Magical crystal powder.',
      icon: '💎',
      quantity: 3,
    ),
  ]);

  late Recipe _selectedRecipe;
  bool _brewing = false;

  @override
  void initState() {
    super.initState();
    _selectedRecipe = _recipes.first;
  }

  @override
  Widget build(BuildContext context) {
    final desktop = MediaQuery.of(context).size.width >= 1000;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Brewing'),
        centerTitle: true,
        backgroundColor: panelColor,
        foregroundColor: textColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: desktop ? _desktopLayout() : _mobileLayout(),
        ),
      ),
    );
  }

  Widget _desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 340,
          child: Column(
            children: [
              Expanded(child: _recipeList()),
            ],
          ),
        ),
        const SizedBox(width: 20),
        const Expanded(
          flex: 2,
          child: Center(child: CauldronWidget()),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 340,
          child: Column(
            children: [
              Expanded(child: _ingredientPanel()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CauldronWidget(),
          const SizedBox(height: 24),
          _recipeList(),
          const SizedBox(height: 24),
          _ingredientPanel(),
        ],
      ),
    );
  }

  Widget _recipeList() {
    return Container(
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accentColor, width: 2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Recipes',
            style: TextStyle(
              color: accentColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: _recipes.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final recipe = _recipes[index];

                return SizedBox(
                  height: 220,
                  child: RecipeCard(
                    recipe: recipe,
                    selected: recipe == _selectedRecipe,
                    onTap: () {
                      setState(() {
                        _selectedRecipe = recipe;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _ingredientPanel() {
    final ingredients = _selectedRecipe.ingredients.entries.toList();

    return Container(
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accentColor, width: 2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Ingredients',
            style: TextStyle(
              color: accentColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: ingredients.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final ingredient = ingredients[index];

                final item = _inventory.firstWhere(
                      (e) => e.name == ingredient.key,
                );

                return IngredientSlot(
                  item: item,
                  requiredQuantity: ingredient.value,
                  selectedQuantity: item.quantity,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          BrewButton(
            enabled: !_brewing,
            isBrewing: _brewing,
            onPressed: () async {
              setState(() => _brewing = true);

              final result = BrewingService.instance.brew(
                recipe: _selectedRecipe,
                inventory: _inventory,
              );

              if (!result.success) {
                setState(() => _brewing = false);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(result.message)),
                );
                return;
              }

              await Future.delayed(
                Duration(seconds: _selectedRecipe.brewTime),
              );

              final updatedInventory =
              BrewingService.instance.consumeIngredients(
                recipe: _selectedRecipe,
                inventory: _inventory,
              );

              final potion = InventoryItem(
                id: _selectedRecipe.id,
                name: _selectedRecipe.name,
                category: 'Potions',
                description: _selectedRecipe.description,
                icon: '🧪',
                quantity: 1,
                sellValue: _selectedRecipe.sellValue,
              );

              final existingIndex = updatedInventory.indexWhere(
                    (i) => i.name == potion.name,
              );

              if (existingIndex >= 0) {
                final existing = updatedInventory[existingIndex];
                updatedInventory[existingIndex] =
                    existing.copyWith(quantity: existing.quantity + 1);
              } else {
                updatedInventory.add(potion);
              }

              final player = GameManager.instance.player;
              if (player != null) {
                GameManager.instance.updatePlayer(player);
              }

              setState(() {
                _inventory = updatedInventory;
                _brewing = false;
              });

              if (!mounted) return;

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(result.message)),
              );
            },
          ),
        ],
      ),
    );
  }
}