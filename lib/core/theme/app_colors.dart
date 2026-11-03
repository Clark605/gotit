import 'package:flutter/material.dart';

/// Semantic color palette defined in DESIGN.md for Gotit.
class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------------
  // Light Palette (DESIGN.md)
  // ---------------------------------------------------------------------------

  // Accent & Brand
  static const Color primary = Color(0xFF1F7A5C);
  static const Color accent = Color(0xFF1F7A5C);
  static const Color accentPressed = Color(0xFF17634A);
  static const Color accentSoft = Color(0xFFDDF0E7);
  static const Color onAccent = Color(0xFFFFFFFF);

  // Surfaces & Hairlines
  static const Color canvas = Color(0xFFFCFBF9);
  static const Color surface = Color(0xFFF6F4F1);
  static const Color surfaceRaised = Color(0xFFFFFFFF);
  static const Color hairline = Color(0xFFE7E3DD);
  static const Color hairlineStrong = Color(0xFFCFCAC2);

  // Text & Neutrals
  static const Color ink = Color(0xFF1F1E1B);
  static const Color charcoal = Color(0xFF3A3733);
  static const Color slate = Color(0xFF5F5B54);
  static const Color steel = Color(0xFF7D7972);
  static const Color muted = Color(0xFFB5B0A8);

  // Semantic
  static const Color warning = Color(0xFFB45309);
  static const Color error = Color(0xFFC92A2A);

  // Context Tints & Tag Text (Light)
  static const Color tintSky = Color(0xFFDDEBF7);
  static const Color tintSkyText = Color(0xFF1F4E79);
  static const Color tintMint = Color(0xFFDCF0E4);
  static const Color tintMintText = Color(0xFF1F6B45);
  static const Color tintLavender = Color(0xFFE8E2F4);
  static const Color tintLavenderText = Color(0xFF4B3A87);
  static const Color tintPeach = Color(0xFFFCE6D5);
  static const Color tintPeachText = Color(0xFF8A4B12);
  static const Color tintRose = Color(0xFFF9E0E8);
  static const Color tintRoseText = Color(0xFF8A2F52);
  static const Color tintYellow = Color(0xFFFAF0C8);
  static const Color tintYellowText = Color(0xFF6B5A12);

  // ---------------------------------------------------------------------------
  // Dark Palette (DESIGN.md Dark Theme Table & Pairings)
  // ---------------------------------------------------------------------------

  static const Color darkCanvas = Color(0xFF1C1B19);
  static const Color darkSurface = Color(0xFF262522);
  static const Color darkSurfaceRaised = Color(0xFF2D2C29);
  static const Color darkHairline = Color(0xFF3A3834);
  static const Color darkHairlineStrong = Color(0xFF4E4B46);

  static const Color darkTextPrimary = Color(0xFFF1EFEC); // ink equivalent
  static const Color darkTextSecondary = Color(0xFFB9B4AC); // slate equivalent
  static const Color darkCharcoal = Color(0xFFD8D4CD);
  static const Color darkSteel = Color(0xFF8E8A82);
  static const Color darkMuted = Color(0xFF6B6760);

  static const Color darkAccent = Color(0xFF4FBF98);
  static const Color darkAccentPressed = Color(0xFF3FA883);
  static const Color darkAccentSoft = Color(0xFF1A3B30);
  static const Color darkOnAccent = Color(
    0xFF10261E,
  ); // contrast-safe dark text

  static const Color darkWarning = Color(0xFFF0A15B);
  static const Color darkError = Color(0xFFF27B7B);

  // Dark Context Tints & Tag Text
  static const Color darkTintSky = Color(0xFF1C3044);
  static const Color darkTintSkyText = Color(0xFF88BAE8);
  static const Color darkTintMint = Color(0xFF1A3527);
  static const Color darkTintMintText = Color(0xFF7EDCA4);
  static const Color darkTintLavender = Color(0xFF2A2242);
  static const Color darkTintLavenderText = Color(0xFFB9A8E8);
  static const Color darkTintPeach = Color(0xFF3D2714);
  static const Color darkTintPeachText = Color(0xFFF5B27D);
  static const Color darkTintRose = Color(0xFF3D1B28);
  static const Color darkTintRoseText = Color(0xFFF094B4);
  static const Color darkTintYellow = Color(0xFF383112);
  static const Color darkTintYellowText = Color(0xFFF0DA71);

  // ---------------------------------------------------------------------------
  // General & Backward Compatibility Aliases
  // ---------------------------------------------------------------------------
  static const Color primarySeed = accent;
  static const Color secondarySeed = slate;
  static const Color success = accent;
  static const Color info = Color(0xFF1F4E79);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  static const Color lightBackground = canvas;
  static const Color lightSurface = surface;
  static const Color lightSurfaceContainer = surface;
  static const Color lightSurfaceHigh = surfaceRaised;
  static const Color lightBorder = hairline;
  static const Color lightTextPrimary = ink;
  static const Color lightTextSecondary = slate;
  static const Color lightTextTertiary = steel;

  static const Color darkBackground = darkCanvas;
  static const Color darkSurfaceContainer = darkSurface;
  static const Color darkSurfaceHigh = darkSurfaceRaised;
  static const Color darkBorder = darkHairline;
  static const Color darkTextTertiary = darkSteel;

  // Deterministic Avatar Palette
  static const List<Color> avatarPalette = [
    Color(0xFF1F7A5C), // Green Accent
    Color(0xFF1F4E79), // Sky
    Color(0xFF4B3A87), // Lavender
    Color(0xFF8A4B12), // Peach
    Color(0xFF8A2F52), // Rose
    Color(0xFF6B5A12), // Yellow
    Color(0xFF5F5B54), // Slate
    Color(0xFF3A3733), // Charcoal
  ];
}
