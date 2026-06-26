import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class DungeonFloor extends PositionComponent {
  final double floorWidth;
  final double floorHeight;
  final double tileSize;

  DungeonFloor({
    required this.floorWidth,
    required this.floorHeight,
    this.tileSize = 64,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    for (double y = 0; y < floorHeight; y += tileSize) {
      for (double x = 0; x < floorWidth; x += tileSize) {
        final isDarkTile =
            ((x / tileSize).toInt() + (y / tileSize).toInt()).isEven;

        add(
          RectangleComponent(
            position: Vector2(x, y),
            size: Vector2.all(tileSize),
            paint: Paint()
              ..color = isDarkTile
                  ? const Color(0xFF2A2926)
                  : const Color(0xFF242320),
          ),
        );
      }
    }

    add(
      RectangleComponent(
        position: Vector2.zero(),
        size: Vector2(floorWidth, floorHeight),
        paint: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8
          ..color = const Color(0xFF45403A),
      ),
    );
  }
}