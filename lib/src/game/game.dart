import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gamez/src/game_entities/game_entity.dart';
import 'package:gamez/src/gestures/gestures.dart';

import 'game_loop.dart';

/// Abstract representation of a game.
abstract class Game extends ChangeNotifier implements GesturesDetector {
  Size _size = Size.zero;

  late GameLoop _gameLoop;
  List<GameEntity> entities = [];

  bool gameOver = false;

  late BuildContext context;

  /// Creates a new game.
  Game() {
    _gameLoop = GameLoop(update);
    _gameLoop.start();
    _size = MediaQueryData.fromWindow(window).size;
  }

  /// Updates the game entities at each frame.
  void update(double dt) {
    for (GameEntity entity in entities) {
      entity.update(dt);
    }
    notifyListeners(); // notify to update the rendering
  }

  /// Renders the game.
  void render(Canvas canvas, Size size) {
    for (GameEntity entity in entities) {
      entity.render(canvas);
    }
  }

  /// Adds a new entity.
  void addEntity(GameEntity entity) => entities.add(entity);

  /// Resets the game state.
  void reset() {}

  @override
  void onLongPressMoveUpdate(Offset position) {
    for (var entity in entities) {
      if (entity is LongPressDetector) {
        var gestureEntity = entity as LongPressDetector;
        gestureEntity.onLongPressMoveUpdate(position);
      }
    }
  }

  @override
  void onLongPressStart(Offset position) {
    for (GameEntity entity in entities) {
      if (entity is LongPressDetector) {
        var gestureEntity = entity as LongPressDetector;
        gestureEntity.onLongPressStart(position);
      }
    }
  }

  @override
  void onLongPressEnd(Offset position) {
    for (GameEntity entity in entities) {
      if (entity is LongPressDetector) {
        var gestureEntity = entity as LongPressDetector;
        gestureEntity.onLongPressEnd(position);
      }
    }
  }

  @override
  void onDoubleTapDown(Offset position) {
    for (GameEntity entity in entities) {
      if (entity is TapDetector) {
        var gestureEntity = entity as TapDetector;
        gestureEntity.onDoubleTapDown(position);
      }
    }
  }

  @override
  void onTapDown(Offset position) {
    for (GameEntity entity in entities) {
      if (entity is TapDetector) {
        var gestureEntity = entity as TapDetector;
        gestureEntity.onTapDown(position);
      }
    }
  }

  GameLoop get gameLoop => _gameLoop;

  Size get size => _size;
}
