import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gamez/src/models/game_entities/game_entity.dart';
import 'package:gamez/src/resources/image_renderer.dart';

import '../../resources/vector.dart';

/// Circular sprite presentation.
abstract class CircularEntity extends GameEntity {
  double radius;

  /// Creates a new circle entity.
  CircularEntity(Vector position, this.radius,
      {ImageRenderer? image, Color? color})
      : super(position, Size(radius * 2, radius * 2),
            image: image, color: color);

  @override
  void render(Canvas canvas) {
    if (image != null) {
      image!.render(canvas, Offset(x - radius, y - radius), size);
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
