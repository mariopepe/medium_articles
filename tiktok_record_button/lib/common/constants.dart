import 'dart:ui';

class AppConstants {
  static const Duration animationDuration = Duration(milliseconds: 750);

  /// Change these two values in couples to maintain the drawing characteristics
  static const double initialZoomInFactorRecordingBox = 0.9;
  static const double initialZoomOutFactorRecordingRing = 0.22;

  /// Edit this number from 0 to 1.
  /// 1 means that the initial animation is as fast as the rest of the animation
  /// 0.1 means that the initial animation is way faster than the rest
  static const double initialAnimationSpeedUp = 0.7;

  static const Color buttonColor = Color(0xAAFF0000);

  /// Edit this number from 0.5 to 0
  /// 0.5 means that the central box is a square with perfectly straight corners
  /// 0.1 means that the central box has rounded corner, almost like a circle
  static const double minBoxCornerRadiusFactor = 0.35;

  /// Edit this number from 3 to +inf
  /// 3 means the actual size of the box
  /// 7 means a box significantly smaller
  /// Note: if you need the box to be bigger but without overlapping with the
  /// ring, you will need to edit this value together with
  /// [initialZoomInFactorRecordingBox] and [initialZoomOutFactorRecordingRing]
  static const double boxSizeFactor = 3;

  /// Edit this number from 1 to 0
  /// 0.99 means a ring which is super thin.
  /// 0.1 means a ring very thick, so thick that will overlap with the
  /// central box.
  static const double initialRingThicknessFactor = 0.88;

  /// Edit this number from 0 to 1
  /// 0.1 means a ring that during animation changes its thickness only
  /// slightly
  /// 0.9 means a ring that has huge chnages in ring thickness during animation
  static const double ringAnimationRangeFactor = 0.09;
}
