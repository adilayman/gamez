import 'package:flutter/material.dart';
import 'package:gamez/gamez.dart';

import '../models/game/game_loop.dart';
import '../models/game/game_gesture.dart';
import '../models/game_entities/game_entity.dart';

/// Abstract representation of a game.
abstract class Game extends ChangeNotifier implements GameGesture {
  Size _size = Size.zero;

  late GameLoop _gameLoop;
  List<RenderElement> entities = [];

  late BuildContext _context;

  bool gameOver = false;

  bool _isInit = false;

  /// Creates a new game.
  Game() {
    _gameLoop = GameLoop(update);
    _gameLoop.start();
  }

  /// Init the game given the [context].
  void init(BuildContext context) {
    _context = context;
    _size = MediaQuery.of(context).size;
    _isInit = true;
  }

  /// Updates the game entities at each frame.
  void update(double dt) {
    for (RenderElement entity in entities) {
      entity.update(dt);
    }
    notifyListeners(); // notify to update the rendering
  }

  /// Renders the game.
  void render(Canvas canvas, Size size) {
    for (RenderElement entity in entities) {
      entity.render(canvas);
    }
  }

  /// Adds a new entity.
  void addEntity(GameEntity entity) => entities.add(entity);

  /// Resets the game state.
  void reset() {}

  @override
  void onLongPressMoveUpdate(Offset position) {
    for (RenderElement entity in entities) {
      if (entity is GameEntity && entity.contains(position)) {
        entity.onLongPressMoveUpdate(position);
      }
    }
  }

  @override
  void onLongPressStart(Offset position) {
    for (RenderElement entity in entities) {
      if (entity is GameEntity && entity.contains(position)) {
        entity.onLongPressStart(position);
      }
    }
  }

  @override
  void onLongPressEnd(Offset position) {
    for (RenderElement entity in entities) {
      if (entity is GameEntity && entity.contains(position)) {
        entity.onLongPressEnd(position);
      }
    }
  }

  @override
  void onDoubleTapDown(Offset position) {
    for (RenderElement entity in entities) {
      if (entity is GameEntity && entity.contains(position)) {
        entity.onDoubleTapDown(position);
      }
    }
  }

  @override
  void onTapDown(Offset position) {
    for (RenderElement entity in entities) {
      if (entity is GameEntity && entity.contains(position)) {
        entity.onTapDown(position);
      }
    }
  }

  GameLoop get gameLoop => _gameLoop;

  Size get size => _size;

  BuildContext get context => _context;

  bool get isInit => _isInit;
}
