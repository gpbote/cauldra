import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'entities/herb_node.dart';
import 'entities/player.dart';
import 'world/dungeon_floor.dart';

class CauldraGame extends FlameGame with KeyboardEvents {
  static const Color gameBackgroundColor = Color(0xFF1B1A17);

  static const double worldWidth = 1280;
  static const double worldHeight = 720;

  late final World gameWorld;
  late final CameraComponent gameCamera;
  late final Player player;

  final List<HerbNode> herbNodes = [];

  @override
  Color backgroundColor() => gameBackgroundColor;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    gameWorld = World();

    gameCamera = CameraComponent.withFixedResolution(
      world: gameWorld,
      width: worldWidth,
      height: worldHeight,
    );

    gameCamera.viewfinder.anchor = Anchor.topLeft;

    add(gameWorld);
    add(gameCamera);

    await gameWorld.add(
      DungeonFloor(
        floorWidth: worldWidth,
        floorHeight: worldHeight,
      ),
    );

    await gameWorld.add(
      TextComponent(
        text: 'CAULDRA',
        position: Vector2(40, 40),
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Color(0xFFF7F1E3),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    await gameWorld.add(
      TextComponent(
        text: 'World Initialized',
        position: Vector2(40, 95),
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 20,
          ),
        ),
      ),
    );

    await gameWorld.add(
      TextComponent(
        text: 'Resolution: 1280 × 720',
        position: Vector2(40, 130),
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 18,
          ),
        ),
      ),
    );

    final herb1 = HerbNode(
      position: Vector2(320, 220),
    );

    final herb2 = HerbNode(
      position: Vector2(860, 260),
    );

    final herb3 = HerbNode(
      position: Vector2(560, 520),
    );

    herbNodes.addAll([
      herb1,
      herb2,
      herb3,
    ]);

    await gameWorld.add(herb1);
    await gameWorld.add(herb2);
    await gameWorld.add(herb3);

    player = Player(
      position: Vector2(
        worldWidth / 2,
        worldHeight / 2,
      ),
    );

    await gameWorld.add(player);

    gameCamera.follow(player);
  }

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event,
      Set<LogicalKeyboardKey> keysPressed,
      ) {
    player.direction.setZero();

    if (keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      player.direction.x = -1;
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      player.direction.x = 1;
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      player.direction.y = -1;
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyS) ||
        keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      player.direction.y = 1;
    }

    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.keyE) {
      for (final herb in herbNodes) {
        if (herb.canCollect &&
            herb.isPlayerInRange(player.position)) {
          herb.collect();
          break;
        }
      }
    }

    return KeyEventResult.handled;
  }
}