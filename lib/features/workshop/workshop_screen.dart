import 'package:flutter/material.dart';

class WorkshopScreen extends StatelessWidget {
  const WorkshopScreen({super.key});

  static const Color backgroundColor = Color(0xFF1B1A17);
  static const Color cardColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Workshop',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _buildPlayerCard(),

            const SizedBox(height: 24),

            _buildMenuButton(
              icon: Icons.science,
              title: 'Craft Potions',
              subtitle: 'Brew powerful potions.',
              onTap: () {},
            ),

            _buildMenuButton(
              icon: Icons.inventory_2,
              title: 'Inventory',
              subtitle: 'View collected items.',
              onTap: () {},
            ),

            _buildMenuButton(
              icon: Icons.park,
              title: 'Gather Ingredients',
              subtitle: 'Collect herbs and materials.',
              onTap: () {},
            ),

            _buildMenuButton(
              icon: Icons.store,
              title: 'Shop',
              subtitle: 'Buy and sell supplies.',
              onTap: () {},
            ),

            _buildMenuButton(
              icon: Icons.menu_book,
              title: 'Recipe Book',
              subtitle: 'Discover potion recipes.',
              onTap: () {},
            ),

            _buildMenuButton(
              icon: Icons.upgrade,
              title: 'Upgrade Workshop',
              subtitle: 'Expand your alchemy lab.',
              onTap: () {},
            ),

            _buildMenuButton(
              icon: Icons.save,
              title: 'Save Game',
              subtitle: 'Save your current progress.',
              onTap: () {},
            ),

            _buildMenuButton(
              icon: Icons.nightlight_round,
              title: 'Sleep Until Tomorrow',
              subtitle: 'End the current day.',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerCard() {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Text(
              'Apprentice Alchemist',
              style: TextStyle(
                color: textColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _StatRow(
              label: 'Gold',
              value: '100',
            ),
            _StatRow(
              label: 'Day',
              value: '1',
            ),
            _StatRow(
              label: 'Energy',
              value: '100 / 100',
            ),
            _StatRow(
              label: 'Workshop',
              value: 'Level 1',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      color: cardColor,
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        leading: Icon(
          icon,
          color: accentColor,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: accentColor,
        ),
        onTap: onTap,
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: WorkshopScreen.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}