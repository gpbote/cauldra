# Cauldra Architecture v1.0 Blueprint

## Vision

Cauldra is a cozy alchemy workshop management game centered on the loop:

Collect → Prepare → Brew → Serve → Earn → Upgrade

## Core Design Principles

-   Single source of truth for game state.
-   Business logic separated from UI.
-   Small, focused classes.
-   Feature modules for screens/widgets.
-   Engine modules for gameplay systems.
-   Every milestone must pass `flutter analyze`.

## Proposed Folder Structure

``` text
lib/
├── app/
├── engine/
│   ├── models/
│   ├── managers/
│   ├── persistence/
│   ├── services/
│   └── state/
├── features/
│   ├── workshop/
│   ├── inventory/
│   ├── recipes/
│   ├── customers/
│   └── shop/
└── shared/
```

## Engine Responsibilities

### GameState

Coordinates managers and exposes state to the UI.

### InventoryManager

-   Add/remove ingredients
-   Capacity
-   Stack handling

### WorkshopManager

-   Shelf timers
-   Brewing stations
-   Workshop progression

### RecipeManager

-   Recipe validation
-   Brewing
-   Unlocks

### CustomerManager

-   Queue
-   Patience
-   Rewards
-   VIP logic

### EconomyManager

-   Gold
-   Tips
-   Expenses
-   End-of-day summary

### SaveManager

-   Save/load
-   Autosave
-   Version migration

## Player Progression

Resources: - Gold - Reputation - Happiness - Energy

Progression: - Workshop Level - Recipe Unlocks - Customer Unlocks -
Ingredient Unlocks

## Gameplay Loop

1.  Collect ingredients
2.  Prepare ingredients
3.  Brew potions
4.  Serve customers
5.  Earn rewards
6.  Upgrade workshop
7.  Advance to next day

## Milestones

### Engine

-   GameState
-   InventoryManager
-   WorkshopManager
-   RecipeManager
-   CustomerManager
-   EconomyManager
-   SaveManager

### Gameplay

-   Ingredient gathering
-   Brewing
-   Orders
-   Reputation
-   Economy

### Content

-   Apprentices
-   Rare ingredients
-   Events
-   Quests
-   Decorations
