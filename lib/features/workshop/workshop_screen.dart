import 'package:flutter/material.dart';

class WorkshopScreen extends StatelessWidget {
  const WorkshopScreen({super.key});

  static const Color backgroundColor = Color(0xFF1B1A17);
  static const Color panelColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth >= 900) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 240,
                            child: _leftPanel(),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _centerWorkshop(),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 240,
                            child: _rightPanel(),
                          ),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        Expanded(
                          child: _centerWorkshop(),
                        ),
                        const SizedBox(height: 20),
                        _rightPanel(),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: panelColor,
        border: Border(
          bottom: BorderSide(
            color: accentColor,
            width: 2,
          ),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.auto_awesome,
            color: accentColor,
          ),
          SizedBox(width: 12),
          Text(
            "CAULDRA WORKSHOP",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Spacer(),
          Icon(Icons.monetization_on, color: Colors.amber),
          SizedBox(width: 6),
          Text(
            "100",
            style: TextStyle(color: textColor),
          ),
          SizedBox(width: 20),
          Icon(Icons.bolt, color: Colors.orange),
          SizedBox(width: 6),
          Text(
            "100",
            style: TextStyle(color: textColor),
          ),
          SizedBox(width: 20),
          Icon(Icons.calendar_month, color: accentColor),
          SizedBox(width: 6),
          Text(
            "Day 1",
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }

  Widget _leftPanel() {
    return _panel(
      title: "Apprentice",
      icon: Icons.person,
      children: const [
        Text(
          "Level 1",
          style: TextStyle(color: Colors.white70),
        ),
        SizedBox(height: 10),
        Text(
          "Workshop Lv.1",
          style: TextStyle(color: Colors.white70),
        ),
        SizedBox(height: 10),
        Text(
          "Reputation 0",
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _centerWorkshop() {
    return Container(
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: accentColor,
          width: 2,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black38,
                border: Border.all(
                  color: accentColor,
                  width: 4,
                ),
              ),
              child: const Icon(
                Icons.local_fire_department,
                color: accentColor,
                size: 120,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Ancient Brewing Cauldron",
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Soon you'll brew magical potions here.",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rightPanel() {
    return _panel(
      title: "Workshop",
      icon: Icons.cabin,
      children: [
        _menuButton(Icons.backpack, "Inventory"),
        const SizedBox(height: 12),
        _menuButton(Icons.menu_book, "Recipe Book"),
        const SizedBox(height: 12),
        _menuButton(Icons.people, "Customers"),
        const SizedBox(height: 12),
        _menuButton(Icons.store, "Shop"),
        const SizedBox(height: 12),
        _menuButton(Icons.settings, "Settings"),
      ],
    );
  }

  Widget _panel({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: accentColor,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(
            icon,
            color: accentColor,
            size: 42,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(color: Colors.white24),
          ...children,
        ],
      ),
    );
  }

  Widget _menuButton(IconData icon, String label) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}