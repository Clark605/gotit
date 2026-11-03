import 'package:flutter/material.dart';

/// Semantic animation durations and motion curves defined in DESIGN.md.
class AppDurations {
  AppDurations._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(
    milliseconds: 200,
  ); // 150-200ms in DESIGN.md
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);

  // Dedicated motion tokens from DESIGN.md
  static const Duration checkDraw = Duration(milliseconds: 200);
  static const Duration rowCollapse = Duration(milliseconds: 200);

  // Curves (ease-out per DESIGN.md)
  static const Curve defaultCurve = Curves.easeOut;
  static const Curve enterCurve = Curves.easeOut;
  static const Curve exitCurve = Curves.easeIn;
}
