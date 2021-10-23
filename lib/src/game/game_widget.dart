import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'game.dart';

// ignore: must_be_immutable
abstract class GameWidget extends StatelessWidget {
  Game game;
  List<Widget> children = [];

  GameWidget({Key? key, required this.game}) : super(key: key);

  /// Adds a new child to the game tree.
  void addChild(Widget child) => children.add(child);

  @override
  Widget build(BuildContext context) {
    game.context = context;
    return ChangeNotifierProvider(
      create: (context) => game,
      child: Consumer<Game>(
        builder: (context, game, _) {
          return Scaffold(
            body: GestureDetector(
              onDoubleTapDown: (details) =>
                  game.onDoubleTapDown(details.globalPosition),
              onLongPressMoveUpdate: (details) =>
                  game.onLongPressMoveUpdate(details.globalPosition),
              onLongPressStart: (details) =>
                  game.onLongPressStart(details.globalPosition),
              onLongPressEnd: (details) =>
                  game.onLongPressEnd(details.globalPosition),
              onTapDown: (details) => game.onTapDown(details.globalPosition),
              child: Stack(
                children: [
                  CustomPaint(
                    size: game.size,
                    painter: _GamePainter(game.render),
                  ),
                  ...children,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _GamePainter extends CustomPainter {
  final Function(Canvas canvas, Size size) _render;

  _GamePainter(this._render);

  @override
  void paint(Canvas canvas, Size size) {
    _render(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
