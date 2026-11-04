import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_typography.dart';

/// Shows a standardized snackbar with an Undo action button adhering to DESIGN.md.
class SnackbarWithUndo {
  SnackbarWithUndo._();

  static void show(
    BuildContext context, {
    required String message,
    required String undoLabel,
    required VoidCallback onUndo,
    Duration duration = const Duration(seconds: 4),
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.darkSurfaceRaised : AppColors.ink;
    final text = isDark ? AppColors.darkTextPrimary : AppColors.canvas;
    final actionColor = isDark ? AppColors.darkAccent : AppColors.accent;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTypography.bodySm.copyWith(color: text),
        ),
        backgroundColor: bg,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.md),
        duration: duration,
        action: SnackBarAction(
          label: undoLabel,
          textColor: actionColor,
          onPressed: onUndo,
        ),
      ),
    );
  }
}
