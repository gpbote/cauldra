import 'package:flutter/material.dart';

import '../../core/models/player_profile.dart';
import '../../core/services/save_service.dart';
import '../../shared/widgets/game_button.dart';
import '../../shared/widgets/game_header.dart';
import '../../shared/widgets/game_panel.dart';
import '../workshop/workshop_screen.dart';

class PlayerNameScreen extends StatefulWidget {
  final String gender;

  const PlayerNameScreen({
    super.key,
    required this.gender,
  });

  @override
  State<PlayerNameScreen> createState() => _PlayerNameScreenState();
}

class _PlayerNameScreenState extends State<PlayerNameScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    final name = _controller.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter your apprentice name.',
          ),
        ),
      );
      return;
    }

    final profile = PlayerProfile(
      name: name,
      gender: widget.gender,
      level: 1,
      experience: 0,
      gold: 100,
      reputation: 0,
      energy: 100,
      currentDay: 1,
      workshopLevel: 1,
      inventory: const [],
    );

    final saveService = SaveService();
    await saveService.savePlayer(profile);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const WorkshopScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1A17),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const GameHeader(
                    title: 'Cauldra',
                    subtitle: 'Name Your Apprentice',
                  ),

                  const SizedBox(height: 40),

                  GamePanel(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Every great alchemist begins with a name.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 28),

                        TextField(
                          controller: _controller,
                          autofocus: true,
                          maxLength: 20,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Enter Name',
                            hintStyle: const TextStyle(
                              color: Colors.white38,
                            ),
                            filled: true,
                            fillColor: const Color(0xFF241D15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Color(0xFFD4A44A),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Color(0xFFD4A44A),
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Color(0xFFD4A44A),
                                width: 3,
                              ),
                            ),
                          ),
                          onSubmitted: (_) => _continue(),
                        ),

                        const SizedBox(height: 30),

                        GameButton(
                          text: 'Continue',
                          width: 220,
                          onPressed: _continue,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'Gender: ${widget.gender}',
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
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
}