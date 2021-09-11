# GamEZ

_By Ayman Adil (Last source code update: 07/08/2021)_

A small Flutter game engine.

# Utilisation

## Initialisation

Inside `pubspec.yaml` add the package as follows:

```yaml
...
dependencies:
  gamez: ^0.0.1
...
```

## Create the game model

The game model is responsible for the logical part of the game, such as adding/removing entities and managing gestures.

```dart
class MyGameProvider extends Game {
  // ... Implement override methods ...
}
```

Then you can create a new character `MyCharacter`:

```dart
class MyCharacter extends GameEntity {
  MyCharacter(Vector position, Size size) : super(position, size);
  // ... Implement override methods ...
}
```

To add it to the game you have to call `MyGameProvider::entities.add(MyCharacter)`

If you want to add an entity without gestures, you can extend it from `RenderElement`:

```dart
class MyElement extends RenderElement {
  MyElement(Vector position, Size size) : super(position, size);
  // ... Implement override methods ...
}
```

## Create the game screen

In order to render and detect gestures you have to create a game screen:

```dart
class MyGame extends GameScreen {
  MyGame() : super(game: MyGameProvider());
}
```

You can also add a widget to the game screen by calling `MyGame::addChild(MyWidget)`

## Other resources

Some useful resources are provided:

- `Sprite`: Image loader and renderer.
- `FileManager`: Synchronous file Manager.
- `Vector`: 2D vector with various operations.

# Example

You can find [here](https://github.com/adilayman/pawns_game) a Flutter game using this engine.

# Possible future improvements

For "completion", some planned features:

- Detection of all gestures.
- More basic components.
- Audio support.

All contributions are warmly welcomed.

