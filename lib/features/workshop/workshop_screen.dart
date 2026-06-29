import 'package:flutter/material.dart';

import '../../shared/widgets/game_header.dart';
import '../../shared/widgets/game_panel.dart';

class WorkshopScreen extends StatelessWidget {
  const WorkshopScreen({super.key});

  static const Color background = Color(0xFF1B1A17);
  static const Color gold = Color(0xFFD4A44A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const GameHeader(
                title: 'Workshop',
                subtitle: 'Day 1',
              ),
              const SizedBox(height: 20),
              GamePanel(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _HudStat('💰', '100'),
                    _HudStat('⭐', '0'),
                    _HudStat('⚡', '100'),
                    _HudStat('📅', '1'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Customers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _CustomerCard(emoji: '🧪', color: Colors.red),
                    SizedBox(width: 12),
                    _CustomerCard(emoji: '🧪', color: Colors.blue),
                    SizedBox(width: 12),
                    _CustomerCard(emoji: '🧪', color: Colors.purple),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GamePanel(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        'Ingredient Stations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          children: const [
                            _StationCard(emoji: '🌿', title: 'Herbs'),
                            _StationCard(emoji: '🍄', title: 'Mushrooms'),
                            _StationCard(emoji: '🌸', title: 'Flowers'),
                            _StationCard(emoji: '✨', title: 'Catalysts'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(child: _BottomButton(emoji: '🎒', label: 'Inventory')),
                  SizedBox(width: 12),
                  Expanded(child: _BottomButton(emoji: '📖', label: 'Recipes')),
                  SizedBox(width: 12),
                  Expanded(child: _BottomButton(emoji: '🛒', label: 'Shop')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HudStat extends StatelessWidget {
  final String emoji;
  final String value;

  const _HudStat(this.emoji, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 26)),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: WorkshopScreen.gold,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class _CustomerCard extends StatelessWidget {
  final String emoji;
  final Color color;

  const _CustomerCard({
    required this.emoji,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GamePanel(
      child: SizedBox(
        width: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 38)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.8,
              color: color,
              backgroundColor: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}

class _StationCard extends StatelessWidget {
  final String emoji;
  final String title;

  const _StationCard({
    required this.emoji,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GamePanel(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  final String emoji;
  final String label;

  const _BottomButton({
    required this.emoji,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF31291E),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: WorkshopScreen.gold,
              width: 2,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
