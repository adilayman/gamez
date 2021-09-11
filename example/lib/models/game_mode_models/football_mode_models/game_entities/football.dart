import 'dart:ui';

import 'package:gamez/gamez.dart';


class Football extends CircularSprite {
  Football(Vector position, Sprite sprite) : super(position, 15) {
    super.sprite = sprite;
  }

  @override
  void update(double dt) {
    if (currentSpeed <= 0) velocity = Vector(0, 0);

    position.x += dt * velocity.x;
    position.y += dt * velocity.y;

    currentSpeed -= dt * speed;
  }

  @override
  void onLongPressEnd(Offset position) {}

  @override
  void onLongPressMoveUpdate(Offset position) {}

  @override
  void onLongPressStart(Offset position) {}

  @override
  void reset() => velocity = Vector(0, 0);
}
