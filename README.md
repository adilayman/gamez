# GamEZ

A small 2D game engine to easily create games in Flutter by providing different methods for rendering, gesture detection, etc.

## Utilization

### Create the game model

The game model is responsible for the logical part of the game, such as adding/removing entities and managing gestures.

```dart
class MyGame extends Game {
  // ... Implement override methods ...
}
```

Then you can create a new character `MyCharacter`

```dart
class MyCharacter extends GameEntity {
  MyCharacter(Vector position, Size size) : super(position, size);
  // ... Implement override methods ...
}
```

* To add it to the game you have to call `MyGame::entities.add(MyCharacter)`

By default, the game entity comes without a gesture detector. If you want to add a gesture, you have to implement the corresponding interface.

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

- The available gestures are:
  - LongPressDetector
  - TapDetector
  - GesturesDetector: for detecting all possible gestures.

### Create the game widget

In order to render and detect gestures you have to create a game widget:

```dart
class MyGameWidget extends GameWidget {
  MyGameWidget() : super(game: MyGame());
}
```

You can also add another widget to the game widget by calling `MyGame::addChild(MyWidget)`

## Other resources

Some useful resources are provided:

- `Sprite`: Image loader and renderer.
- `FileManager`: Synchronous file Manager.
- `Vector`: 2D vector with various operations.

## Example

- Pawns Game: https://github.com/adilayman/pawns_game

## Possible future improvements

For "completion", some planned features:

- Detection of all gestures.
- More basic components.
- Audio support.

All contributions are warmly welcomed.
