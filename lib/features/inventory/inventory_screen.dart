import 'package:flutter/material.dart';

import 'models/inventory_item.dart';
import 'widgets/inventory_category_chip.dart';
import 'widgets/inventory_details.dart';
import 'widgets/inventory_item_tile.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  static const Color backgroundColor = Color(0xFF1B1A17);
  static const Color panelColor = Color(0xFF31291E);
  static const Color textColor = Color(0xFFF7F1E3);
  static const Color accentColor = Color(0xFFD4A44A);

  final TextEditingController _searchController = TextEditingController();

  String _category = 'All';

  final List<InventoryItem> _items = const [
    InventoryItem(
      id: 'lavender',
      name: 'Lavender',
      category: 'Herbs',
      description: 'A fragrant herb used in beginner potions.',
      icon: '🌿',
      quantity: 12,
      sellValue: 2,
    ),
    InventoryItem(
      id: 'mint',
      name: 'Mint',
      category: 'Herbs',
      description: 'Restores a small amount of energy.',
      icon: '🍃',
      quantity: 8,
      sellValue: 1,
    ),
    InventoryItem(
      id: 'mushroom',
      name: 'Red Mushroom',
      category: 'Mushrooms',
      description: 'Common ingredient for healing brews.',
      icon: '🍄',
      quantity: 5,
      sellValue: 4,
    ),
    InventoryItem(
      id: 'crystal',
      name: 'Crystal Dust',
      category: 'Minerals',
      description: 'Rare magical crystal powder.',
      icon: '💎',
      quantity: 3,
      sellValue: 15,
      rarity: ItemRarity.rare,
    ),
  ];

  InventoryItem? _selected;

  @override
  void initState() {
    super.initState();
    _selected = _items.first;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<InventoryItem> get _filteredItems {
    final query = _searchController.text.toLowerCase();

    return _items.where((item) {
      final categoryMatch =
          _category == 'All' || item.category == _category;

      final searchMatch =
      item.name.toLowerCase().contains(query);

      return categoryMatch && searchMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final desktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Inventory'),
        centerTitle: true,
        backgroundColor: panelColor,
        foregroundColor: textColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: desktop
              ? _desktopLayout()
              : _mobileLayout(),
        ),
      ),
    );
  }

  Widget _desktopLayout() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _inventoryPanel(),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: InventoryDetails(
            item: _selected,
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout() {
    return Column(
      children: [
        Expanded(
          child: _inventoryPanel(),
        ),
      ],
    );
  }

  Widget _inventoryPanel() {
    return Container(
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: accentColor,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            style: const TextStyle(color: textColor),
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.black26,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _chip('All', Icons.apps),
                _chip('Herbs', Icons.eco),
                _chip('Mushrooms', Icons.forest),
                _chip('Minerals', Icons.diamond),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InventoryItemTile(
                    item: item,
                    selected: item == _selected,
                    onTap: () {
                      setState(() {
                        _selected = item;
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

  Widget _chip(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InventoryCategoryChip(
        label: label,
        icon: icon,
        selected: _category == label,
        onTap: () {
          setState(() {
            _category = label;
          });
        },
      ),
    );
  }
}