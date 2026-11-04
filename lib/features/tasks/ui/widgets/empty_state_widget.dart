import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';

/// Minimalist empty state display with line icon, title, description,
/// and optional primary action button per DESIGN.md.
class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyStateWidget({
    super.key,
    this.icon = Icons.check_circle_outline,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDark ? AppColors.darkCharcoal : AppColors.charcoal;
    final subtitleColor = isDark
        ? AppColors.darkTextSecondary
        : AppColors.slate;
    final iconColor = isDark ? AppColors.darkSteel : AppColors.steel;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: iconColor),
            AppSpacing.gapHMd,
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTypography.heading.copyWith(color: titleColor),
            ),
            if (subtitle != null) ...[
              AppSpacing.gapHXs,
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: AppTypography.body.copyWith(color: subtitleColor),
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              AppSpacing.gapHLg,
              ElevatedButton(
                onPressed: onAction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: AppColors.onAccent,
                  minimumSize: const Size(120, AppSpacing.buttonHeight),
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadius.md,
                  ),
                  elevation: 0,
                ),
                child: Text(
                  actionLabel!,
                  style: AppTypography.button.copyWith(
                    color: AppColors.onAccent,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
