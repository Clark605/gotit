import 'package:flutter/material.dart';

/// Semantic layout spacing and dimensional tokens defined in DESIGN.md.
class AppSpacing {
  AppSpacing._();

  static const double zero = 0.0;
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double sm = 12.0;
  static const double md = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;

  // Specific semantic dimensions from DESIGN.md
  static const double screenGutter = 16.0;
  static const double touchTarget = 48.0;
  static const double minTouchTarget =
      touchTarget; // >= 48dp per constitution & DESIGN.md
  static const double rowMinHeight = 56.0;
  static const double checkboxSize = 24.0;
  static const double chipHeight = 36.0;
  static const double inputHeight = 48.0;
  static const double buttonHeight = 48.0;
  static const double fabSize = 56.0;
  static const double bottomNavHeight = 64.0;

  // Additional convenience & legacy tokens
  static const double xxxl = 40.0;
  static const double huge = 48.0;
  static const double fabClearance = 80.0;

  // Horizontal gaps
  static const SizedBox gapWXxs = SizedBox(width: xxs);
  static const SizedBox gapWXs = SizedBox(width: xs);
  static const SizedBox gapWSm = SizedBox(width: sm);
  static const SizedBox gapWMd = SizedBox(width: md);
  static const SizedBox gapWLg = SizedBox(width: lg);
  static const SizedBox gapWXl = SizedBox(width: xl);
  static const SizedBox gapWXxl = SizedBox(width: xxl);
  static const SizedBox gapWXxxl = SizedBox(width: xxxl);

  // Vertical gaps
  static const SizedBox gapHXxs = SizedBox(height: xxs);
  static const SizedBox gapHXs = SizedBox(height: xs);
  static const SizedBox gapHSm = SizedBox(height: sm);
  static const SizedBox gapHMd = SizedBox(height: md);
  static const SizedBox gapHLg = SizedBox(height: lg);
  static const SizedBox gapHXl = SizedBox(height: xl);
  static const SizedBox gapHXxl = SizedBox(height: xxl);
  static const SizedBox gapHXxxl = SizedBox(height: xxxl);

  // Insets
  static const EdgeInsets edgeInsetsAllXs = EdgeInsets.all(xs);
  static const EdgeInsets edgeInsetsAllSm = EdgeInsets.all(sm);
  static const EdgeInsets edgeInsetsAllMd = EdgeInsets.all(md);
  static const EdgeInsets edgeInsetsAllLg = EdgeInsets.all(lg);
  static const EdgeInsets edgeInsetsAllXl = EdgeInsets.all(xl);
  static const EdgeInsets edgeInsetsAllXxl = EdgeInsets.all(xxl);

  // Screen gutter margin (16px per DESIGN.md & AGENTS.md)
  static const EdgeInsets edgeInsetsPage = EdgeInsets.symmetric(
    horizontal: screenGutter,
    vertical: screenGutter,
  );
  static const EdgeInsets edgeInsetsScreenGutter = EdgeInsets.symmetric(
    horizontal: screenGutter,
  );
  static const EdgeInsets edgeInsetsHLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets edgeInsetsHXl = EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets edgeInsetsHXxl = EdgeInsets.symmetric(
    horizontal: xxl,
  );
  static const EdgeInsets edgeInsetsVXs = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets edgeInsetsVSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets edgeInsetsVMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets edgeInsetsVLg = EdgeInsets.symmetric(vertical: lg);
}
