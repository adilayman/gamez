import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gamez/gamez.dart';

/// Abstract representation of a game.
abstract class Game extends ChangeNotifier {
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

  /// Handles a given gesture.
  void handleGesture(Offset position, Gesture gesture) {
    for (GameEntity entity in entities) {
      entity.handleGesture(position, gesture);
    }
  }

  /// Resets the game state.
  void reset() {}

  GameLoop get gameLoop => _gameLoop;

  Size get size => _size;
}
