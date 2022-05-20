# gamEZ

A small game engine for 2D games in Flutter.

[![Pub release](https://img.shields.io/badge/pub.dev-0.0.3-blue?style=flat-square)](https://pub.dev/packages/gamez) [![GitHub top language](https://img.shields.io/github/languages/top/adilayman/gamez.svg?style=flat-square)](https://github.com/adilayman/gamez) [![GitHub issues](https://img.shields.io/github/issues/adilayman/gamez?style=flat-square)](https://github.com/adilayman/gamez/issues) [![Pawns Game](https://img.shields.io/badge/Pawns%20game-Flutter-orange?style=flat-square)](https://github.com/Solido/awesome-flutter) [![License](https://img.shields.io/github/license/adilayman/gamez?style=flat-square)](https://github.com/adilayman/gamez/blob/main/LICENSE)

## Installation

```yaml
gamez: ^0.0.3
```

## Game creation

First, we have to create a **game model** which is responsible for the logical part of the game, such as adding/removing entities and managing gestures.

```dart
class MyGame extends Game {
  // ... Implement override methods ...
}
```

Then, we can create a new character to our game by extending `GameEntity`

```dart
class MyCharacter extends GameEntity {
  MyCharacter(Vector position, Size size) : super(position, size);
  // ... Implement override methods ...
}
```

This new entity, can be added to the game using `MyGame::entities.add(MyCharacter)`


By default, a game entity comes without a gesture detector. In order to detect a gesture for it, we can implement one or several interfaces of gesture detection:

* `LongPressDetector`
* `TapDetector`
* `GesturesDetector`: for detecting all possible gestures.

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

A model without a widget is not enough to display your game. For that, you have to create a widget that extends from `GameWidget` and add your model to it. MAGIC!

```dart
class MyGameWidget extends GameWidget {
  MyGameWidget() : super(game: MyGame());
}
```

You can also add another widget to your game widget by calling `MyGame::addChild(MyWidget)`

## Features

- [x] Some basic components
- [x] Image renderer
- [ ] Audio support
- [ ] Animations support
- [ ] Tests

## Contributions
All contributions are warmly welcomed.
