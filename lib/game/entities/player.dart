import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends PositionComponent {
  static const double playerSize = 64;
  static const double moveSpeed = 220;

  final Vector2 direction = Vector2.zero();

  Player({
    Vector2? position,
  }) : super(
    position: position ?? Vector2(640, 360),
    size: Vector2.all(playerSize),
    anchor: Anchor.center,
  );

  @override
  void update(double dt) {
    super.update(dt);

    if (direction.length2 > 0) {
      direction.normalize();
      position += direction * moveSpeed * dt;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final robe = Paint()
      ..color = const Color(0xFF3E6B48);

    final hood = Paint()
      ..color = const Color(0xFF274430);

    final belt = Paint()
      ..color = const Color(0xFFD4A44A);

    final skin = Paint()
      ..color = const Color(0xFFF2D3B1);

    final shadow = Paint()
      ..color = Colors.black26;

    // Shadow
    canvas.drawOval(
      Rect.fromCenter(
        center: const Offset(32, 58),
        width: 28,
        height: 10,
      ),
      shadow,
    );

    // Robe
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(12, 18, 40, 42),
        const Radius.circular(10),
      ),
      robe,
    );

    // Hood
    canvas.drawCircle(
      const Offset(32, 18),
      14,
      hood,
    );

    // Face
    canvas.drawCircle(
      const Offset(32, 22),
      8,
      skin,
    );

    // Belt
    canvas.drawRect(
      const Rect.fromLTWH(12, 36, 40, 4),
      belt,
    );
  }
}