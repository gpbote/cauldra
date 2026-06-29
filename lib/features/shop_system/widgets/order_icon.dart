import 'package:flutter/material.dart';

enum OrderIconType {
  healingPotion,
  manaPotion,
  antidote,
  elixir,
}

class OrderIcon extends StatelessWidget {
  const OrderIcon({
    super.key,
    required this.type,
    this.size = 42,
  });

  final OrderIconType type;
  final double size;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case OrderIconType.healingPotion:
        return _buildPotion(
          liquidColor: const Color(0xFFE53935),
          symbol: Icons.favorite,
        );

      case OrderIconType.manaPotion:
        return _buildPotion(
          liquidColor: const Color(0xFF1E88E5),
          symbol: Icons.auto_awesome,
        );

      case OrderIconType.antidote:
        return _buildPotion(
          liquidColor: const Color(0xFF43A047),
          symbol: Icons.eco,
        );

      case OrderIconType.elixir:
        return _buildPotion(
          liquidColor: const Color(0xFF8E24AA),
          symbol: Icons.star,
        );
    }
  }

  Widget _buildPotion({
    required Color liquidColor,
    required IconData symbol,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Bottle
          Positioned(
            bottom: 0,
            child: Container(
              width: size * 0.60,
              height: size * 0.68,
              decoration: BoxDecoration(
                color: liquidColor,
                borderRadius: BorderRadius.circular(size * 0.18),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),

          // Neck
          Positioned(
            top: size * 0.12,
            child: Container(
              width: size * 0.18,
              height: size * 0.18,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),

          // Cork
          Positioned(
            top: 0,
            child: Container(
              width: size * 0.22,
              height: size * 0.10,
              decoration: BoxDecoration(
                color: const Color(0xFF8D6E63),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Glass Highlight
          Positioned(
            left: size * 0.22,
            top: size * 0.32,
            child: Container(
              width: 4,
              height: size * 0.22,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.60),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),

          // Potion Symbol
          Positioned(
            bottom: size * 0.14,
            child: Icon(
              symbol,
              color: Colors.white,
              size: size * 0.28,
            ),
          ),
        ],
      ),
    );
  }
}