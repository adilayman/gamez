# gamEZ

A small game engine for 2D games in Flutter.

[![Pub release](https://img.shields.io/badge/pub.dev-0.0.3-blue?style=flat-square)](https://pub.dev/packages/gamez) [![GitHub top language](https://img.shields.io/github/languages/top/adilayman/gamez.svg?style=flat-square)](https://github.com/adilayman/gamez) [![GitHub issues](https://img.shields.io/github/issues/adilayman/gamez?style=flat-square)](https://github.com/adilayman/gamez/issues) [![Pawns Game](https://img.shields.io/badge/Pawns%20game-Flutter-orange?style=flat-square)](https://github.com/adilayman/pawns_game) [![License](https://img.shields.io/github/license/adilayman/gamez?style=flat-square)](https://github.com/adilayman/gamez/blob/main/LICENSE)

## Installation

```yaml
gamez: ^0.0.3+1
```

## Game creation

The purpose of this engine is to separate the logical and view/widget parts to give you the freedom to customize them as you wish.

### Model creation

First, we have to create a game model which is responsible for the logical part of the game, such as adding/removing entities, managing gestures, etc.

```dart
class MyGame extends Game {
  // ... Implement override methods ...
}
```

Then, we create a new character to our game by extending `GameEntity`

```dart
class MyCharacter extends GameEntity {
  MyCharacter(Vector position, Size size) : super(position, size);
  // ... Implement override methods ...
}
```

This new entity, can be added to the game using `Game::addEntity(MyCharacter)`

In order to detect gestures use `GameEntity::handleGesture(position, gesture)`, where `gesture` can be one of the following:

```dart
Gesture.tapDown
Gesture.doubleTapDown
Gesture.longPressMoveUpdate
Gesture.longPressStart
Gesture.longPressEnd
```

### View creation

Second, we have to create a widget that extends from `GameWidget`, then add your model to it.

```dart
class MyGameWidget extends GameWidget {
  MyGameWidget() : super(game: MyGame());
}
```

You can also add another widget to your game widget by calling `GameWidget::addChild(MyWidget)`

## Concrete example

You can give a look at [**Pawns game**](https://github.com/adilayman/pawns_game), a 2D game, that uses this game engine.

## Features

* [x] Image renderer
* [ ] Audio support
* [ ] Animations support
* [ ] Tests

## Contributions

All contributions are warmly welcomed.
