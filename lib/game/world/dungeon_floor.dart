import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class DungeonFloor extends PositionComponent {
  final double width;
  final double height;
  final double tileSize;

  DungeonFloor({
    required this.width,
    required this.height,
    this.tileSize = 64,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    for (double y = 0; y < height; y += tileSize) {
      for (double x = 0; x < width; x += tileSize) {
        final bool alternate =
            ((x / tileSize).toInt() + (y / tileSize).toInt()).isEven;

        add(
          RectangleComponent(
            position: Vector2(x, y),
            size: Vector2.all(tileSize),
            paint: Paint()
              ..color = alternate
                  ? const Color(0xFF2A2926)
                  : const Color(0xFF242320),
          ),
        );
      }
    }

    add(
      RectangleComponent(
        position: Vector2.zero(),
        size: Vector2(width, height),
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8
          ..color = const Color(0xFF45403A),
      ),
    );
  }
}