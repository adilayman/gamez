import 'dart:ui';

import 'package:flutter/material.dart';

import '../../resources/image_renderer.dart';
import '../../resources/vector.dart';

/// Abstract representation of a render element.
abstract class GameEntity {
  Vector velocity = Vector(0, 0);
  late Vector position;
  late Size size;

  ImageRenderer? image;
  Color? color;

  GameEntity(this.position, this.size, {this.image, this.color});

  /// Renders the game entity.
  void render(Canvas canvas);

  /// Updates the game entity at each frame.
  void update(double dt);

  /// Resets the state.
  void reset();

  /// Checks if [position] is in the render element.
  bool contains(Offset position);

  set x(double value) => position.x = value;

  set y(double value) => position.y = value;

  double get x => position.x;

  double get y => position.y;
}
