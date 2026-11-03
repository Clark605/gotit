import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';

/// Semantic theme extension for Gotit tokens that do not map directly
/// to standard Material 3 [ColorScheme] roles.
@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  // Accent & Brand
  final Color accent;
  final Color accentPressed;
  final Color accentSoft;
  final Color onAccent;

  // Surfaces & Lines
  final Color canvas;
  final Color surface;
  final Color surfaceRaised;
  final Color hairline;
  final Color hairlineStrong;

  // Text & Neutrals
  final Color ink;
  final Color charcoal;
  final Color slate;
  final Color steel;
  final Color muted;

  // Semantic
  final Color warning;
  final Color error;

  // Context Tints & Tag Text
  final Color tintSky;
  final Color tintSkyText;
  final Color tintMint;
  final Color tintMintText;
  final Color tintLavender;
  final Color tintLavenderText;
  final Color tintPeach;
  final Color tintPeachText;
  final Color tintRose;
  final Color tintRoseText;
  final Color tintYellow;
  final Color tintYellowText;

  // Legacy/Compatibility fields
  final Color success;
  final Color info;
  final Color surfaceHigh;
  final Color border;

  const AppColorsExtension({
    required this.accent,
    required this.accentPressed,
    required this.accentSoft,
    required this.onAccent,
    required this.canvas,
    required this.surface,
    required this.surfaceRaised,
    required this.hairline,
    required this.hairlineStrong,
    required this.ink,
    required this.charcoal,
    required this.slate,
    required this.steel,
    required this.muted,
    required this.warning,
    required this.error,
    required this.tintSky,
    required this.tintSkyText,
    required this.tintMint,
    required this.tintMintText,
    required this.tintLavender,
    required this.tintLavenderText,
    required this.tintPeach,
    required this.tintPeachText,
    required this.tintRose,
    required this.tintRoseText,
    required this.tintYellow,
    required this.tintYellowText,
    required this.success,
    required this.info,
    required this.surfaceHigh,
    required this.border,
  });

  static const AppColorsExtension light = AppColorsExtension(
    accent: AppColors.accent,
    accentPressed: AppColors.accentPressed,
    accentSoft: AppColors.accentSoft,
    onAccent: AppColors.onAccent,
    canvas: AppColors.canvas,
    surface: AppColors.surface,
    surfaceRaised: AppColors.surfaceRaised,
    hairline: AppColors.hairline,
    hairlineStrong: AppColors.hairlineStrong,
    ink: AppColors.ink,
    charcoal: AppColors.charcoal,
    slate: AppColors.slate,
    steel: AppColors.steel,
    muted: AppColors.muted,
    warning: AppColors.warning,
    error: AppColors.error,
    tintSky: AppColors.tintSky,
    tintSkyText: AppColors.tintSkyText,
    tintMint: AppColors.tintMint,
    tintMintText: AppColors.tintMintText,
    tintLavender: AppColors.tintLavender,
    tintLavenderText: AppColors.tintLavenderText,
    tintPeach: AppColors.tintPeach,
    tintPeachText: AppColors.tintPeachText,
    tintRose: AppColors.tintRose,
    tintRoseText: AppColors.tintRoseText,
    tintYellow: AppColors.tintYellow,
    tintYellowText: AppColors.tintYellowText,
    success: AppColors.accent,
    info: AppColors.tintSkyText,
    surfaceHigh: AppColors.surfaceRaised,
    border: AppColors.hairline,
  );

  static const AppColorsExtension dark = AppColorsExtension(
    accent: AppColors.darkAccent,
    accentPressed: AppColors.darkAccentPressed,
    accentSoft: AppColors.darkAccentSoft,
    onAccent: AppColors.darkOnAccent,
    canvas: AppColors.darkCanvas,
    surface: AppColors.darkSurface,
    surfaceRaised: AppColors.darkSurfaceRaised,
    hairline: AppColors.darkHairline,
    hairlineStrong: AppColors.darkHairlineStrong,
    ink: AppColors.darkTextPrimary,
    charcoal: AppColors.darkCharcoal,
    slate: AppColors.darkTextSecondary,
    steel: AppColors.darkSteel,
    muted: AppColors.darkMuted,
    warning: AppColors.darkWarning,
    error: AppColors.darkError,
    tintSky: AppColors.darkTintSky,
    tintSkyText: AppColors.darkTintSkyText,
    tintMint: AppColors.darkTintMint,
    tintMintText: AppColors.darkTintMintText,
    tintLavender: AppColors.darkTintLavender,
    tintLavenderText: AppColors.darkTintLavenderText,
    tintPeach: AppColors.darkTintPeach,
    tintPeachText: AppColors.darkTintPeachText,
    tintRose: AppColors.darkTintRose,
    tintRoseText: AppColors.darkTintRoseText,
    tintYellow: AppColors.darkTintYellow,
    tintYellowText: AppColors.darkTintYellowText,
    success: AppColors.darkAccent,
    info: AppColors.darkTintSkyText,
    surfaceHigh: AppColors.darkSurfaceRaised,
    border: AppColors.darkHairline,
  );

  @override
  AppColorsExtension copyWith({
    Color? accent,
    Color? accentPressed,
    Color? accentSoft,
    Color? onAccent,
    Color? canvas,
    Color? surface,
    Color? surfaceRaised,
    Color? hairline,
    Color? hairlineStrong,
    Color? ink,
    Color? charcoal,
    Color? slate,
    Color? steel,
    Color? muted,
    Color? warning,
    Color? error,
    Color? tintSky,
    Color? tintSkyText,
    Color? tintMint,
    Color? tintMintText,
    Color? tintLavender,
    Color? tintLavenderText,
    Color? tintPeach,
    Color? tintPeachText,
    Color? tintRose,
    Color? tintRoseText,
    Color? tintYellow,
    Color? tintYellowText,
    Color? success,
    Color? info,
    Color? surfaceHigh,
    Color? border,
  }) {
    return AppColorsExtension(
      accent: accent ?? this.accent,
      accentPressed: accentPressed ?? this.accentPressed,
      accentSoft: accentSoft ?? this.accentSoft,
      onAccent: onAccent ?? this.onAccent,
      canvas: canvas ?? this.canvas,
      surface: surface ?? this.surface,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      hairline: hairline ?? this.hairline,
      hairlineStrong: hairlineStrong ?? this.hairlineStrong,
      ink: ink ?? this.ink,
      charcoal: charcoal ?? this.charcoal,
      slate: slate ?? this.slate,
      steel: steel ?? this.steel,
      muted: muted ?? this.muted,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      tintSky: tintSky ?? this.tintSky,
      tintSkyText: tintSkyText ?? this.tintSkyText,
      tintMint: tintMint ?? this.tintMint,
      tintMintText: tintMintText ?? this.tintMintText,
      tintLavender: tintLavender ?? this.tintLavender,
      tintLavenderText: tintLavenderText ?? this.tintLavenderText,
      tintPeach: tintPeach ?? this.tintPeach,
      tintPeachText: tintPeachText ?? this.tintPeachText,
      tintRose: tintRose ?? this.tintRose,
      tintRoseText: tintRoseText ?? this.tintRoseText,
      tintYellow: tintYellow ?? this.tintYellow,
      tintYellowText: tintYellowText ?? this.tintYellowText,
      success: success ?? this.success,
      info: info ?? this.info,
      surfaceHigh: surfaceHigh ?? this.surfaceHigh,
      border: border ?? this.border,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      accent: Color.lerp(accent, other.accent, t) ?? accent,
      accentPressed:
          Color.lerp(accentPressed, other.accentPressed, t) ?? accentPressed,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t) ?? accentSoft,
      onAccent: Color.lerp(onAccent, other.onAccent, t) ?? onAccent,
      canvas: Color.lerp(canvas, other.canvas, t) ?? canvas,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      surfaceRaised:
          Color.lerp(surfaceRaised, other.surfaceRaised, t) ?? surfaceRaised,
      hairline: Color.lerp(hairline, other.hairline, t) ?? hairline,
      hairlineStrong:
          Color.lerp(hairlineStrong, other.hairlineStrong, t) ?? hairlineStrong,
      ink: Color.lerp(ink, other.ink, t) ?? ink,
      charcoal: Color.lerp(charcoal, other.charcoal, t) ?? charcoal,
      slate: Color.lerp(slate, other.slate, t) ?? slate,
      steel: Color.lerp(steel, other.steel, t) ?? steel,
      muted: Color.lerp(muted, other.muted, t) ?? muted,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      error: Color.lerp(error, other.error, t) ?? error,
      tintSky: Color.lerp(tintSky, other.tintSky, t) ?? tintSky,
      tintSkyText: Color.lerp(tintSkyText, other.tintSkyText, t) ?? tintSkyText,
      tintMint: Color.lerp(tintMint, other.tintMint, t) ?? tintMint,
      tintMintText:
          Color.lerp(tintMintText, other.tintMintText, t) ?? tintMintText,
      tintLavender:
          Color.lerp(tintLavender, other.tintLavender, t) ?? tintLavender,
      tintLavenderText:
          Color.lerp(tintLavenderText, other.tintLavenderText, t) ??
          tintLavenderText,
      tintPeach: Color.lerp(tintPeach, other.tintPeach, t) ?? tintPeach,
      tintPeachText:
          Color.lerp(tintPeachText, other.tintPeachText, t) ?? tintPeachText,
      tintRose: Color.lerp(tintRose, other.tintRose, t) ?? tintRose,
      tintRoseText:
          Color.lerp(tintRoseText, other.tintRoseText, t) ?? tintRoseText,
      tintYellow: Color.lerp(tintYellow, other.tintYellow, t) ?? tintYellow,
      tintYellowText:
          Color.lerp(tintYellowText, other.tintYellowText, t) ?? tintYellowText,
      success: Color.lerp(success, other.success, t) ?? success,
      info: Color.lerp(info, other.info, t) ?? info,
      surfaceHigh: Color.lerp(surfaceHigh, other.surfaceHigh, t) ?? surfaceHigh,
      border: Color.lerp(border, other.border, t) ?? border,
    );
  }
}

extension AppColorsExtensionContext on BuildContext {
  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>() ??
      AppColorsExtension.light;
}
