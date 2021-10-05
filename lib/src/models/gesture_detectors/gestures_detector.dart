import 'package:gamez/src/models/gesture_detectors/long_press_detector.dart';
import 'package:gamez/src/models/gesture_detectors/tap_detector.dart';

abstract class GesturesDetector implements LongPressDetector, TapDetector {}
