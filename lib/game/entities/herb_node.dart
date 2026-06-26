import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class HerbNode extends PositionComponent {
  static const double nodeSize = 48;

  HerbNode({
    Vector2? position,
  }) : super(
    position: position ?? Vector2.zero(),
    size: Vector2.all(nodeSize),
    anchor: Anchor.center,
  );

  bool collected = false;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    if (collected) {
      return;
    }

    final stem = Paint()
      ..color = const Color(0xFF3E6B48);

    final leaf = Paint()
      ..color = const Color(0xFF65A765);

    final flower = Paint()
      ..color = const Color(0xFFD4A44A);

    // Stem
    canvas.drawRect(
      const Rect.fromLTWH(22, 18, 4, 22),
      stem,
    );

    // Leaves
    canvas.drawOval(
      const Rect.fromLTWH(10, 18, 16, 10),
      leaf,
    );

    canvas.drawOval(
      const Rect.fromLTWH(22, 12, 16, 10),
      leaf,
    );

    canvas.drawOval(
      const Rect.fromLTWH(18, 26, 18, 10),
      leaf,
    );

    // Flower
    canvas.drawCircle(
      const Offset(24, 10),
      5,
      flower,
    );
  }
}