import 'package:flutter/material.dart';
import 'package:src/models/game_entities/game_entity.dart';
import 'package:src/providers/game.dart';
import 'package:src/resources/vector.dart';
import 'package:src/screens/game_screen.dart';

void main() => runApp(MyApp());

// This is a simple example of the game display using this game engine,
// for a concrete example, check https://github.com/adilayman/pawns_game

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyGame(),
    );
  }
}

// ignore: must_be_immutable
class MyGame extends GameScreen {
  MyGame() : super(game: MyGameProvider());
}

/// My game provider for handling the gestures, rendering, etc.
class MyGameProvider extends Game {
  @override
  void init(BuildContext context) {
    super.init(context);

    // add our character to the game entities.
    entities.add(
      MyCharacter(Vector(size.width / 2, size.height / 2), Size(25, 25)),
    );
  }
}

/// A simple rectangle character inside our game.
class MyCharacter extends GameEntity {
  MyCharacter(Vector position, Size size) : super(position, size);

  @override
  bool contains(Offset position) {
    throw UnimplementedError();
  }

  @override
  void onLongPressEnd(Offset position) {}

  @override
  void onLongPressMoveUpdate(Offset position) {}

  @override
  void onLongPressStart(Offset position) {}

  @override
  void render(Canvas canvas) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;
    print(position.toOffset);
    print(size);
    canvas.drawRect(position.toOffset & size, paint);
  }
}
