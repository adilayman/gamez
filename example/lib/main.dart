import 'package:flutter/material.dart';
import 'package:gamez/gamez.dart';

/// This example is to demonstrate the methods of updating, rendering and
/// gestures.
///
/// It renders a circle that moves horizontally and bounces if it collides with
/// the edges of the screen.
/// Also, if you tap it, it will change its color.

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyGameWidget(),
      ),
    );

class MyCharacter extends CircularEntity implements TapDetector {
  final color1 = Colors.red;
  final color2 = Colors.green;

  MyCharacter(Vector position) : super(position, 50) {
    color = color1;
    velocity.x = 75;
  }

  @override
  void update(double dt) {
    position.x += velocity.x * dt;
  }

  @override
  void onTapDown(Offset position) {
    if (!contains(position)) return;
    color = color == color1 ? color2 : color1;
  }

  @override
  void onDoubleTapDown(Offset position) {}

  @override
  void reset() {}
}

class MyGame extends Game {
  late MyCharacter myCharacter;

  MyGame() {
    myCharacter = MyCharacter(Vector(size.width / 2, size.height / 2));
    addEntity(myCharacter);
  }

  @override
  void render(Canvas canvas, Size size) {
    // draw a background
    final paint = Paint()..color = Color.fromRGBO(100, 91, 125, 1);
    canvas.drawRect(Offset.zero & size, paint);

    // render all children.
    super.render(canvas, size);
  }

  @override
  void update(double dt) {
    super.update(dt);

    /// Bouncing
    if (myCharacter.x + myCharacter.radius > size.width ||
        myCharacter.x - myCharacter.radius < 0) {
      myCharacter.velocity.x *= -1;
    }
  }
}

// ignore: must_be_immutable
class MyGameWidget extends GameWidget {
  MyGameWidget() : super(game: MyGame());
}
