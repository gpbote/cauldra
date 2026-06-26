import 'package:flutter/material.dart';

import 'player_name_screen.dart';

class CharacterSelectScreen extends StatelessWidget {
  const CharacterSelectScreen({super.key});

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
          'Choose Your Apprentice',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final desktop = constraints.maxWidth > 700;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32),
                child: desktop
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _characterCard(
                      context: context,
                      gender: 'Male',
                      icon: Icons.person,
                      description:
                      'A determined young alchemist eager to master forgotten recipes.',
                    ),
                    const SizedBox(width: 40),
                    _characterCard(
                      context: context,
                      gender: 'Female',
                      icon: Icons.person_2,
                      description:
                      'A brilliant apprentice destined to uncover the ancient secrets of alchemy.',
                    ),
                  ],
                )
                    : Column(
                  children: [
                    _characterCard(
                      context: context,
                      gender: 'Male',
                      icon: Icons.person,
                      description:
                      'A determined young alchemist eager to master forgotten recipes.',
                    ),
                    const SizedBox(height: 30),
                    _characterCard(
                      context: context,
                      gender: 'Female',
                      icon: Icons.person_2,
                      description:
                      'A brilliant apprentice destined to uncover the ancient secrets of alchemy.',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _characterCard({
    required BuildContext context,
    required String gender,
    required IconData icon,
    required String description,
  }) {
    return SizedBox(
      width: 320,
      child: Card(
        color: cardColor,
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: accentColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              Icon(
                icon,
                size: 120,
                color: accentColor,
              ),
              const SizedBox(height: 20),
              Text(
                '$gender Apprentice',
                style: const TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 54,
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
                    'SELECT',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
