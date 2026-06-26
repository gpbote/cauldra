import 'package:flutter/material.dart';

import '../../core/managers/game_manager.dart';
import 'widgets/action_grid.dart';
import 'widgets/brew_status.dart';
import 'widgets/cauldron_widget.dart';
import 'widgets/workshop_hud.dart';

class WorkshopScreen extends StatelessWidget {
  const WorkshopScreen({super.key});

  static const Color backgroundColor = Color(0xFF1B1A17);

  @override
  Widget build(BuildContext context) {
    final player = GameManager.instance.player;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final desktop = constraints.maxWidth >= 900;

            return Column(
              children: [
                WorkshopHud(
                  playerName: player?.name ?? 'Unknown',
                  level: player?.level ?? 1,
                  gold: player?.gold ?? 0,
                  energy: player?.energy ?? 0,
                  reputation: player?.reputation ?? 0,
                  day: player?.currentDay ?? 1,
                  workshopLevel: player?.workshopLevel ?? 1,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: desktop
                        ? _desktopLayout(player)
                        : _mobileLayout(player),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _desktopLayout(player) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: CauldronWidget(),
                ),
              ),
              const SizedBox(height: 20),
              BrewStatus(
                recipeName: player == null || player.knownRecipes.isEmpty
                    ? 'None'
                    : player.knownRecipes.first,
                status: 'Ready to brew',
                progress: 0,
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        const Expanded(
          flex: 2,
          child: ActionGrid(),
        ),
      ],
    );
  }

  Widget _mobileLayout(player) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CauldronWidget(),
          const SizedBox(height: 20),
          BrewStatus(
            recipeName: player == null || player.knownRecipes.isEmpty
                ? 'None'
                : player.knownRecipes.first,
            status: 'Ready to brew',
            progress: 0,
          ),
          const SizedBox(height: 24),
          const ActionGrid(),
        ],
      ),
    );
  }
}