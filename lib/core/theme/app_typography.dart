import 'package:flutter/material.dart';

/// Semantic typography tokens defined in DESIGN.md.
///
/// Uses IBM Plex Sans Arabic for both Latin and Arabic scripts to ensure
/// visual consistency in mixed-language tasks and preserve cursive joining.
class AppTypography {
  AppTypography._();

  static const String fontFamily = 'IBM Plex Sans Arabic';
  static const List<String> fontFallbacks = ['IBMPlexSansArabic', 'Inter'];

  // Backward compatibility aliases
  static const String latinFontFamily = fontFamily;
  static const String arabicFontFamily = fontFamily;

  // ---------------------------------------------------------------------------
  // DESIGN.md Typography Scale
  // ---------------------------------------------------------------------------

  /// screen-title: 28px, 600, line-height 1.25 ("Today", "Tasks")
  static const TextStyle screenTitle = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFallbacks,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: 0.0,
  );

  /// title: 22px, 600, line-height 1.30 (Task detail title, sheet titles)
  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFallbacks,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.30,
    letterSpacing: 0.0,
  );

  /// heading: 18px, 600, line-height 1.40 (Group titles)
  static const TextStyle heading = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFallbacks,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.40,
    letterSpacing: 0.0,
  );

  /// body: 16px, 400, line-height 1.60 (Notes, checklist items, inputs)
  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFallbacks,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.60,
    letterSpacing: 0.0,
  );

  /// body-medium: 16px, 500, line-height 1.60 (Task titles in rows)
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFallbacks,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.60,
    letterSpacing: 0.0,
  );

  /// body-sm: 14px, 400, line-height 1.55 (Due dates, helper text)
  static const TextStyle bodySm = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFallbacks,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.55,
    letterSpacing: 0.0,
  );

  /// caption: 13px, 400, line-height 1.45 (Metadata)
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFallbacks,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.45,
    letterSpacing: 0.0,
  );

  /// caption-bold: 13px, 600, line-height 1.45 (Section headers, tags)
  static const TextStyle captionBold = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFallbacks,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.45,
    letterSpacing: 0.0,
  );

  /// button: 15px, 500, line-height 1.30 (Buttons)
  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontFamilyFallback: fontFallbacks,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 1.30,
    letterSpacing: 0.0,
  );

  // ---------------------------------------------------------------------------
  // Material 3 TextTheme Mapping
  // ---------------------------------------------------------------------------

  static TextTheme getTextTheme([Locale? locale]) {
    return const TextTheme(
      displayLarge: screenTitle,
      displayMedium: screenTitle,
      displaySmall: screenTitle,
      headlineLarge: screenTitle,
      headlineMedium: screenTitle, // 28px, 600
      headlineSmall: title, // 22px, 600
      titleLarge: title, // 22px, 600
      titleMedium: heading, // 18px, 600
      titleSmall: bodyMedium, // 16px, 500
      bodyLarge: body, // 16px, 400
      bodyMedium: bodySm, // 14px, 400
      bodySmall: caption, // 13px, 400
      labelLarge: button, // 15px, 500
      labelMedium: captionBold, // 13px, 600
      labelSmall: caption, // 13px, 400
    );
  }

  static String fontFamilyFor(Locale? locale) => fontFamily;
  static List<String> fallbackFor(Locale? locale) => fontFallbacks;
}
