import 'package:flutter/material.dart';

import 'widgets/action_grid.dart';
import 'widgets/brew_status.dart';
import 'widgets/cauldron_widget.dart';
import 'widgets/workshop_hud.dart';

class WorkshopScreen extends StatelessWidget {
  const WorkshopScreen({super.key});

  static const Color backgroundColor = Color(0xFF1B1A17);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool desktop = constraints.maxWidth >= 900;

            return Column(
              children: [
                const WorkshopHud(
                  playerName: "Apprentice",
                  level: 1,
                  gold: 100,
                  energy: 100,
                  reputation: 0,
                  day: 1,
                  workshopLevel: 1,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: desktop
                        ? _desktopLayout()
                        : _mobileLayout(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _desktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: const [
              Expanded(
                child: Center(
                  child: CauldronWidget(),
                ),
              ),
              SizedBox(height: 20),
              BrewStatus(),
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

  Widget _mobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: const [
          CauldronWidget(),
          SizedBox(height: 20),
          BrewStatus(),
          SizedBox(height: 24),
          ActionGrid(),
        ],
      ),
    );
  }
}