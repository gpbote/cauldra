import 'package:flutter/material.dart';

class WorkshopHud extends StatelessWidget {
  const WorkshopHud({
    super.key,
    required this.playerName,
    required this.level,
    required this.gold,
    required this.energy,
    required this.reputation,
    required this.day,
    required this.workshopLevel,
  });

  final String playerName;
  final int level;
  final int gold;
  final int energy;
  final int reputation;
  final int day;
  final int workshopLevel;

  static const Color panelColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: const BoxDecoration(
        color: panelColor,
        border: Border(
          bottom: BorderSide(
            color: accentColor,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundColor: accentColor,
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              '$playerName   •   Lv.$level',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          _stat(Icons.monetization_on, Colors.amber, gold.toString()),
          const SizedBox(width: 14),
          _stat(Icons.star, Colors.lightBlueAccent, reputation.toString()),
          const SizedBox(width: 14),
          _stat(Icons.bolt, Colors.orange, energy.toString()),
          const SizedBox(width: 14),
          _stat(Icons.calendar_month, accentColor, 'Day $day'),
          const SizedBox(width: 14),
          _stat(Icons.home_work, Colors.greenAccent,
              'Lv.$workshopLevel'),
        ],
      ),
    );
  }

  Widget _stat(
      IconData icon,
      Color color,
      String value,
      ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
          size: 22,
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}