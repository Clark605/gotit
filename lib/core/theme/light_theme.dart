import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_colors_extension.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';

ThemeData buildLightTheme([Locale? locale]) {
  const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.accent,
    onPrimary: AppColors.onAccent,
    primaryContainer: AppColors.accentSoft,
    onPrimaryContainer: AppColors.accentPressed,
    secondary: AppColors.slate,
    onSecondary: AppColors.canvas,
    secondaryContainer: AppColors.surface,
    onSecondaryContainer: AppColors.ink,
    tertiary: AppColors.warning,
    onTertiary: AppColors.canvas,
    error: AppColors.error,
    onError: AppColors.onAccent,
    surface: AppColors.surface,
    onSurface: AppColors.ink,
    onSurfaceVariant: AppColors.slate,
    outline: AppColors.hairlineStrong,
    outlineVariant: AppColors.hairline,
    surfaceContainerLowest: AppColors.canvas,
    surfaceContainerLow: AppColors.canvas,
    surfaceContainer: AppColors.surface,
    surfaceContainerHigh: AppColors.surfaceRaised,
    surfaceContainerHighest: AppColors.surfaceRaised,
  );

  final textTheme = AppTypography.getTextTheme(
    locale,
  ).apply(bodyColor: AppColors.ink, displayColor: AppColors.ink);

  return ThemeData(
    useMaterial3: true,
    extensions: const [AppColorsExtension.light],
    brightness: Brightness.light,
    fontFamily: AppTypography.fontFamily,
    fontFamilyFallback: AppTypography.fontFallbacks,
    scaffoldBackgroundColor: AppColors.canvas,
    colorScheme: colorScheme,
    textTheme: textTheme,
    dividerColor: AppColors.hairline,

    // Divider Theme (1px hairline per DESIGN.md)
    dividerTheme: const DividerThemeData(
      color: AppColors.hairline,
      thickness: 1,
      space: 1,
    ),

    // Card Theme (surface, hairline border, 12px radius, no shadow)
    cardTheme: const CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.lg,
        side: BorderSide(color: AppColors.hairline, width: 1),
      ),
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.canvas,
      foregroundColor: AppColors.ink,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: AppTypography.heading.copyWith(color: AppColors.ink),
      iconTheme: const IconThemeData(color: AppColors.ink),
    ),

    // Text Input Theme (surface-raised, 48px, 8px radius, strong hairline, 2px focus)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceRaised,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: 12,
      ),
      hintStyle: AppTypography.body.copyWith(color: AppColors.muted),
      errorStyle: AppTypography.caption.copyWith(color: AppColors.error),
      border: const OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: AppColors.hairlineStrong, width: 1),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: AppColors.hairlineStrong, width: 1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: AppColors.accent, width: 2),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
    ),

    // Button Themes (Primary 48px, 8px radius, accent fill, on-accent text)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.onAccent,
        disabledBackgroundColor: AppColors.hairline,
        disabledForegroundColor: AppColors.muted,
        elevation: 0,
        minimumSize: const Size(64, AppSpacing.buttonHeight),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.md),
        textStyle: AppTypography.button,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.onAccent,
        disabledBackgroundColor: AppColors.hairline,
        disabledForegroundColor: AppColors.muted,
        elevation: 0,
        minimumSize: const Size(64, AppSpacing.buttonHeight),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.md),
        textStyle: AppTypography.button,
      ),
    ),

    // Secondary Button (Outlined, 48px, 8px radius, strong hairline border)
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.ink,
        elevation: 0,
        minimumSize: const Size(64, AppSpacing.buttonHeight),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        side: const BorderSide(color: AppColors.hairlineStrong, width: 1),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.md),
        textStyle: AppTypography.button,
      ),
    ),

    // Ghost Button (TextButton, 48px, 6px radius, ink text)
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.ink,
        minimumSize: const Size(48, AppSpacing.buttonHeight),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.sm),
        textStyle: AppTypography.button,
      ),
    ),

    // Chips Theme (Pill, inactive hairline, active ink fill + canvas text)
    chipTheme: ChipThemeData(
      shape: const StadiumBorder(
        side: BorderSide(color: AppColors.hairline, width: 1),
      ),
      labelStyle: AppTypography.bodySm.copyWith(color: AppColors.steel),
      secondaryLabelStyle: AppTypography.bodySm.copyWith(
        color: AppColors.canvas,
      ),
      backgroundColor: Colors.transparent,
      selectedColor: AppColors.ink,
      checkmarkColor: AppColors.canvas,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),

    // FAB Theme (Add button: 56px, 12px radius, accent fill, on-accent icon)
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
      foregroundColor: AppColors.onAccent,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.lg),
      sizeConstraints: BoxConstraints.tightFor(
        width: AppSpacing.fabSize,
        height: AppSpacing.fabSize,
      ),
    ),

    // Bottom Navigation Themes (64px, canvas background, hairline top border)
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.canvas,
      height: AppSpacing.bottomNavHeight,
      elevation: 0,
      indicatorColor: AppColors.accentSoft,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppTypography.captionBold.copyWith(color: AppColors.ink);
        }
        return AppTypography.caption.copyWith(color: AppColors.steel);
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.ink, size: 24);
        }
        return const IconThemeData(color: AppColors.steel, size: 24);
      }),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.canvas,
      elevation: 0,
      selectedItemColor: AppColors.ink,
      unselectedItemColor: AppColors.steel,
      selectedLabelStyle: AppTypography.captionBold,
      unselectedLabelStyle: AppTypography.caption,
    ),

    // Bottom Sheet Theme (Surface-raised, 20px top corners, level-2 elevation)
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.surfaceRaised,
      modalBackgroundColor: AppColors.surfaceRaised,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.topXl),
      showDragHandle: true,
      dragHandleColor: AppColors.steel,
    ),

    // Snackbar Theme (Ink background, canvas text, 8px radius)
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.ink,
      contentTextStyle: AppTypography.bodySm.copyWith(color: AppColors.canvas),
      actionTextColor: AppColors.accentSoft,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.md),
      behavior: SnackBarBehavior.floating,
      elevation: 2,
    ),

    // Checkbox Theme (24px circular checkbox, accent fill, hairlineStrong border)
    checkboxTheme: CheckboxThemeData(
      shape: const CircleBorder(),
      side: const BorderSide(color: AppColors.hairlineStrong, width: 1.5),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.accent;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(AppColors.onAccent),
    ),

    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surfaceRaised,
      elevation: 4,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.lg),
      titleTextStyle: AppTypography.title.copyWith(color: AppColors.ink),
      contentTextStyle: AppTypography.body.copyWith(color: AppColors.charcoal),
    ),

    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
