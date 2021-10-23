# gamEZ

<p align="left">
A small game engine for 2D games in Flutter.
</p>

<p align="left">
  <a title="pub" href="https://pub.dev/packages/gamez" ><img src="https://img.shields.io/badge/pub.dev-0.0.3-blue?style=plastic" />
  <a title="license" href="https://github.com/adilayman/gamez/blob/main/LICENSE" ><img src="https://img.shields.io/github/license/adilayman/gamez?style=plastic" /></a>
  </a>
  <a title="pawns game" href="https://github.com/adilayman/pawns_game" ><img src="https://img.shields.io/badge/pawns%20game-example-purple?style=plastic" /></a>
  </a>
</p>

## Usage

### Create the game model

The game model is responsible for the logical part of the game, such as adding/removing entities and managing gestures.

```dart
class MyGame extends Game {
  // ... Implement override methods ...
}
```

To create a new character to your game, you have to extends it from `GameEntity`

```dart
class MyCharacter extends GameEntity {
  MyCharacter(Vector position, Size size) : super(position, size);
  // ... Implement override methods ...
}
```

To add it to your game, you have to call `MyGame::entities.add(MyCharacter)`

By default, a game entity comes without a gesture detector. If you want to add a gesture, you have to implement the corresponding interface.

```dart
class MyCharacter extends GameEntity implements TapDetector {
  MyCharacter(Vector position, Size size) : super(position, size);

  @override
  void onTapDown(Offset position) {
    // Do something...
  }

  @override
  void onDoubleTapDown(Offset position) {
    // Do something...
  }

  // ... Implement other override methods ...
}
```

The available gestures are:

* LongPressDetector
* TapDetector
* GesturesDetector: for detecting all possible gestures.

### Create the game widget

A model without a widget is not enough to display your game. For that, you have to create a widget that extends from `GameWidget` and add your model to it. MAGIC!

```dart
class MyGameWidget extends GameWidget {
  MyGameWidget() : super(game: MyGame());
}
```

You can also add another widget to your game widget by calling `MyGame::addChild(MyWidget)`

## Possible future improvements

For *completion*, some planned features:

* More basic components.
* Audio support.

All contributions are warmly welcomed.
