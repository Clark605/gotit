import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';

/// Section header for the Today screen with title and count badge.
/// Overdue variant highlights with amber warning tokens.
class TodaySectionHeader extends StatelessWidget {
  final String title;
  final int count;
  final bool isOverdue;

  const TodaySectionHeader({
    super.key,
    required this.title,
    required this.count,
    this.isOverdue = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final titleColor = isOverdue
        ? (isDark ? AppColors.darkWarning : AppColors.warning)
        : (isDark ? AppColors.darkCharcoal : AppColors.charcoal);

    final countColor = isOverdue
        ? (isDark ? AppColors.darkWarning : AppColors.warning)
        : (isDark ? AppColors.darkSteel : AppColors.steel);

    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.md,
        right: AppSpacing.md,
        top: AppSpacing.lg,
        bottom: AppSpacing.xs,
      ),
      child: Row(
        children: [
          if (isOverdue) ...[
            Icon(Icons.warning_amber_rounded, size: 18, color: titleColor),
            AppSpacing.gapWXs,
          ],
          Text(
            title,
            style: AppTypography.heading.copyWith(
              color: titleColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppSpacing.gapWXs,
          Text(
            '($count)',
            style: AppTypography.captionBold.copyWith(color: countColor),
          ),
        ],
      ),
    );
  }
}
