import 'dart:ui';

abstract class LongPressDetector {
  void onLongPressMoveUpdate(Offset position);

  void onLongPressStart(Offset position);

  void onLongPressEnd(Offset position);
}

abstract class TapDetector {
  void onDoubleTapDown(Offset position);

  void onTapDown(Offset position);
}

abstract class GesturesDetector implements LongPressDetector, TapDetector {}
