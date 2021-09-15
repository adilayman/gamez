import 'dart:ui';

import 'package:flutter/material.dart';

/// Game gesture interface.
abstract class GameGesture {
  void onDoubleTapDown(Offset position);
  void onLongPressMoveUpdate(Offset position);
  void onLongPressStart(Offset position);
  void onLongPressEnd(Offset position);
  void onTapDown(Offset position);
}
