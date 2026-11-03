import 'package:flutter/material.dart';

/// Semantic corner radius tokens defined in DESIGN.md.
class AppRadius {
  AppRadius._();

  // Raw values (DESIGN.md)
  static const double xsValue = 4.0;
  static const double smValue = 6.0;
  static const double mdValue = 8.0;
  static const double lgValue = 12.0;
  static const double xlValue = 20.0;
  static const double fullValue = 9999.0;

  // Radius objects
  static const Radius xsRadius = Radius.circular(xsValue);
  static const Radius smRadius = Radius.circular(smValue);
  static const Radius mdRadius = Radius.circular(mdValue);
  static const Radius lgRadius = Radius.circular(lgValue);
  static const Radius xlRadius = Radius.circular(xlValue);
  static const Radius fullRadius = Radius.circular(fullValue);

  // BorderRadius objects
  static const BorderRadius xs = BorderRadius.all(xsRadius);
  static const BorderRadius sm = BorderRadius.all(smRadius);
  static const BorderRadius md = BorderRadius.all(mdRadius);
  static const BorderRadius lg = BorderRadius.all(lgRadius);
  static const BorderRadius xl = BorderRadius.all(xlRadius);
  static const BorderRadius full = BorderRadius.all(fullRadius);

  // Directional / Vertical corner radii
  static const BorderRadius topSm = BorderRadius.vertical(top: smRadius);
  static const BorderRadius topMd = BorderRadius.vertical(top: mdRadius);
  static const BorderRadius topLg = BorderRadius.vertical(top: lgRadius);
  static const BorderRadius topXl = BorderRadius.vertical(top: xlRadius);
  static const BorderRadius bottomMd = BorderRadius.vertical(bottom: mdRadius);
  static const BorderRadius bottomLg = BorderRadius.vertical(bottom: lgRadius);
}
