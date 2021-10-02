import 'dart:math';

import 'package:flutter/material.dart';

import '../../resources/vector.dart';
import '../game_entities/game_entity.dart';

/// Circular sprite presentation.
abstract class CircularSprite extends GameEntity {
  double radius;

  /// Creates a new circle entity.
  CircularSprite(Vector position, this.radius)
      : super(position, Size(radius * 2, radius * 2));

  @override
  void render(Canvas canvas) {
    if (sprite != null) {
      sprite!.render(canvas, Offset(x - radius, y - radius), size);
    } else {
      final paint = Paint()..color = color!;
      canvas.drawCircle(position.toOffset, radius, paint);
    }
  }

  @override
  bool contains(Offset position) {
    double dx = x - position.dx;
    double dy = y - position.dy;
    return sqrt(dx * dx + dy * dy) <= radius;
  }
}
