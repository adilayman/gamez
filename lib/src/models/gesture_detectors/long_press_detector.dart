import 'dart:ui';

abstract class LongPressDetector {
  void onLongPressMoveUpdate(Offset position);

  void onLongPressStart(Offset position);

  void onLongPressEnd(Offset position);
}
