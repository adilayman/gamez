# [Dart] Flutter Game Engine

_By Ayman Adil (Last source code update: 07/08/2021)_

A small Flutter game engine.

# Utilisation

## Initialisation

Firstly, you need to include in the `pubspec.yaml` of your application this:

```yaml
environment:
  sdk: ">=2.2.2 <3.0.0"
dependencies:
  provider: ^5.0.0
  path_provider: ^2.0.2
```

## Create the game model

The game model is responsible for the logical part of the game, such as adding/removing entities and managing gestures.

```dart
class MyGameProvider extends Game {
  // ... Implement override methods ...
}
```

Then we can create the character; `MyCharacter`:

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

You can also find other resources in the `resources` folder:

- `Sprite`: Image loader and renderer.
- `FileManager`: Synchronous file Manager.
- `Vector`: 2D vector with various operations.

# Example

You can find [here](https://github.com/adilayman/pawns_game) a Flutter game using this engine.

# Possible future improvements

This game engine was created during the development of [Pawns Game](https://github.com/adilayman/pawns_game). Thus, the majority of the features of this engine are designed for the development of this game.

For "completion", some planned features:

- Detection of all gestures.
- More basic components.
- Audio support.

All contributions are warmly welcomed.
