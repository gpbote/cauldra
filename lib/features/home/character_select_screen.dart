import 'package:flutter/material.dart';

import '../../shared/widgets/game_panel.dart';
import 'player_name_screen.dart';

class CharacterSelectScreen extends StatelessWidget {
  const CharacterSelectScreen({super.key});

  static const Color background = Color(0xFF1B1A17);
  static const Color gold = Color(0xFFD4A44A);
  static const Color text = Color(0xFFF7F1E3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  const Text(
                    "CAULDRA",
                    style: TextStyle(
                      color: gold,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Choose Your Apprentice",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: _card(
                            context,
                            gender: "Male",
                            icon: Icons.person,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _card(
                            context,
                            gender: "Female",
                            icon: Icons.person_2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _card(
      BuildContext context, {
        required String gender,
        required IconData icon,
      }) {
    return GamePanel(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 120,
            color: gold,
          ),
          const SizedBox(height: 20),
          Text(
            gender,
            style: const TextStyle(
              color: text,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: 180,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlayerNameScreen(
                      gender: gender,
                    ),
                  ),
                );
              },
              child: const Text(
                "SELECT",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}