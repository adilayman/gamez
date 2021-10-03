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

class MyCharacter extends CircularSprite {
  final color1 = Colors.red;
  final color2 = Colors.green;

  MyCharacter(Vector position) : super(position, 50) {
    color = color1;
    velocity.x = 75;
  }

  @override
  void onTapDown(Offset position) {
    color = color == color1 ? color2 : color1;
  }

  @override
  void update(double dt) {
    position.x += velocity.x * dt;
  }
}

class MyGame extends Game {
  MyCharacter? myCharacter;

  @override
  void init(BuildContext context) {
    super.init(context);

    // create a new entity of type MyCharacter and add it initialy at the center
    // of the screen.
    myCharacter = MyCharacter(Vector(size.width / 2, size.height / 2));
    addEntity(myCharacter!);
  }

  @override
  void render(Canvas canvas, Size size) {
    // draw a background
    final paint = Paint()..color = Color.fromRGBO(100, 91, 125, 1);
    canvas.drawRect(Offset.zero & size, paint);

    // render all children.
    super.render(canvas, size);
  }

  void _bounceMyCharacter(MyCharacter? mc) {
    if (mc == null) return;

    if (mc.x + mc.radius > size.width || mc.x - mc.radius < 0) {
      mc.velocity.x *= -1;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    /// Bouncing
    _bounceMyCharacter(myCharacter);
  }
}

// ignore: must_be_immutable
class MyGameWidget extends GameWidget {
  MyGameWidget() : super(game: MyGame());
}
