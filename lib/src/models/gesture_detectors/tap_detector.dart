import 'dart:ui';

abstract class TapDetector {
  void onDoubleTapDown(Offset position);

  void onTapDown(Offset position);
}
