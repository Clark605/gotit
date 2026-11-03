import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_colors_extension.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';

ThemeData buildDarkTheme([Locale? locale]) {
  const colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.darkAccent,
    onPrimary: AppColors.darkOnAccent, // #10261E contrast safe on #4FBF98
    primaryContainer: AppColors.darkAccentSoft,
    onPrimaryContainer: AppColors.darkAccent,
    secondary: AppColors.darkTextSecondary,
    onSecondary: AppColors.darkCanvas,
    secondaryContainer: AppColors.darkSurface,
    onSecondaryContainer: AppColors.darkTextPrimary,
    tertiary: AppColors.darkWarning,
    onTertiary: AppColors.darkCanvas,
    error: AppColors.darkError,
    onError: AppColors.darkOnAccent,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkTextPrimary,
    onSurfaceVariant: AppColors.darkTextSecondary,
    outline: AppColors.darkHairlineStrong,
    outlineVariant: AppColors.darkHairline,
    surfaceContainerLowest: AppColors.darkCanvas,
    surfaceContainerLow: AppColors.darkCanvas,
    surfaceContainer: AppColors.darkSurface,
    surfaceContainerHigh: AppColors.darkSurfaceRaised,
    surfaceContainerHighest: AppColors.darkSurfaceRaised,
  );

  final textTheme = AppTypography.getTextTheme(locale).apply(
    bodyColor: AppColors.darkTextPrimary,
    displayColor: AppColors.darkTextPrimary,
  );

  return ThemeData(
    useMaterial3: true,
    extensions: const [AppColorsExtension.dark],
    brightness: Brightness.dark,
    fontFamily: AppTypography.fontFamily,
    fontFamilyFallback: AppTypography.fontFallbacks,
    scaffoldBackgroundColor: AppColors.darkCanvas,
    colorScheme: colorScheme,
    textTheme: textTheme,
    dividerColor: AppColors.darkHairline,

    // Divider Theme (1px hairline)
    dividerTheme: const DividerThemeData(
      color: AppColors.darkHairline,
      thickness: 1,
      space: 1,
    ),

    // Card Theme (darkSurface, darkHairline border, 12px radius, no shadow)
    cardTheme: const CardThemeData(
      color: AppColors.darkSurface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.lg,
        side: BorderSide(color: AppColors.darkHairline, width: 1),
      ),
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkCanvas,
      foregroundColor: AppColors.darkTextPrimary,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: AppTypography.heading.copyWith(
        color: AppColors.darkTextPrimary,
      ),
      iconTheme: const IconThemeData(color: AppColors.darkTextPrimary),
    ),

    // Text Input Theme (darkSurfaceRaised, strong hairline, 2px focus)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurfaceRaised,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: 12,
      ),
      hintStyle: AppTypography.body.copyWith(color: AppColors.darkMuted),
      errorStyle: AppTypography.caption.copyWith(color: AppColors.darkError),
      border: const OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: AppColors.darkHairlineStrong, width: 1),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: AppColors.darkHairlineStrong, width: 1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: AppColors.darkAccent, width: 2),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: AppColors.darkError, width: 2),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: AppRadius.md,
        borderSide: BorderSide(color: AppColors.darkError, width: 2),
      ),
    ),

    // Button Themes (Primary 48px, 8px radius, darkAccent fill, darkOnAccent text)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkAccent,
        foregroundColor: AppColors.darkOnAccent,
        disabledBackgroundColor: AppColors.darkHairline,
        disabledForegroundColor: AppColors.darkMuted,
        elevation: 0,
        minimumSize: const Size(64, AppSpacing.buttonHeight),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.md),
        textStyle: AppTypography.button,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.darkAccent,
        foregroundColor: AppColors.darkOnAccent,
        disabledBackgroundColor: AppColors.darkHairline,
        disabledForegroundColor: AppColors.darkMuted,
        elevation: 0,
        minimumSize: const Size(64, AppSpacing.buttonHeight),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.md),
        textStyle: AppTypography.button,
      ),
    ),

    // Secondary Button (Outlined, 48px, 8px radius, darkHairlineStrong border)
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkTextPrimary,
        elevation: 0,
        minimumSize: const Size(64, AppSpacing.buttonHeight),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        side: const BorderSide(color: AppColors.darkHairlineStrong, width: 1),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.md),
        textStyle: AppTypography.button,
      ),
    ),

    // Ghost Button (TextButton, 48px, 6px radius, darkTextPrimary text)
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkTextPrimary,
        minimumSize: const Size(48, AppSpacing.buttonHeight),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.sm),
        textStyle: AppTypography.button,
      ),
    ),

    // Chips Theme (Pill, inactive darkHairline, active darkTextPrimary fill + darkCanvas text)
    chipTheme: ChipThemeData(
      shape: const StadiumBorder(
        side: BorderSide(color: AppColors.darkHairline, width: 1),
      ),
      labelStyle: AppTypography.bodySm.copyWith(color: AppColors.darkSteel),
      secondaryLabelStyle: AppTypography.bodySm.copyWith(
        color: AppColors.darkCanvas,
      ),
      backgroundColor: Colors.transparent,
      selectedColor: AppColors.darkTextPrimary,
      checkmarkColor: AppColors.darkCanvas,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),

    // FAB Theme (Add button: 56px, 12px radius, darkAccent fill, darkOnAccent icon)
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkAccent,
      foregroundColor: AppColors.darkOnAccent,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.lg),
      sizeConstraints: BoxConstraints.tightFor(
        width: AppSpacing.fabSize,
        height: AppSpacing.fabSize,
      ),
    ),

    // Bottom Navigation Themes (64px, darkCanvas background, darkHairline top border)
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.darkCanvas,
      height: AppSpacing.bottomNavHeight,
      elevation: 0,
      indicatorColor: AppColors.darkAccentSoft,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppTypography.captionBold.copyWith(
            color: AppColors.darkTextPrimary,
          );
        }
        return AppTypography.caption.copyWith(color: AppColors.darkSteel);
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(
            color: AppColors.darkTextPrimary,
            size: 24,
          );
        }
        return const IconThemeData(color: AppColors.darkSteel, size: 24);
      }),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkCanvas,
      elevation: 0,
      selectedItemColor: AppColors.darkTextPrimary,
      unselectedItemColor: AppColors.darkSteel,
      selectedLabelStyle: AppTypography.captionBold,
      unselectedLabelStyle: AppTypography.caption,
    ),

    // Bottom Sheet Theme (DarkSurfaceRaised, 20px top corners, level-2 elevation)
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.darkSurfaceRaised,
      modalBackgroundColor: AppColors.darkSurfaceRaised,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.topXl),
      showDragHandle: true,
      dragHandleColor: AppColors.darkSteel,
    ),

    // Snackbar Theme (DarkTextPrimary background, darkCanvas text, 8px radius)
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.darkTextPrimary,
      contentTextStyle: AppTypography.bodySm.copyWith(
        color: AppColors.darkCanvas,
      ),
      actionTextColor: AppColors.darkAccent,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.md),
      behavior: SnackBarBehavior.floating,
      elevation: 2,
    ),

    // Checkbox Theme (24px circular checkbox, darkAccent fill, darkHairlineStrong border)
    checkboxTheme: CheckboxThemeData(
      shape: const CircleBorder(),
      side: const BorderSide(color: AppColors.darkHairlineStrong, width: 1.5),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.darkAccent;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(AppColors.darkOnAccent),
    ),

    // Dialog Theme
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkSurfaceRaised,
      elevation: 4,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.lg),
      titleTextStyle: AppTypography.title.copyWith(
        color: AppColors.darkTextPrimary,
      ),
      contentTextStyle: AppTypography.body.copyWith(
        color: AppColors.darkCharcoal,
      ),
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
