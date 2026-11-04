import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

/// Progress banner showing daily completion ratio and momentum indicator per DESIGN.md.
class DailyProgressBanner extends StatelessWidget {
  final int completed;
  final int total;

  const DailyProgressBanner({
    super.key,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    if (total == 0) return const SizedBox.shrink();

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);
    final percent = ((completed / total) * 100).round();
    final progress = (completed / total).clamp(0.0, 1.0);

    final bg = isDark ? AppColors.darkSurface : AppColors.surface;
    final hairlineColor = isDark ? AppColors.darkHairline : AppColors.hairline;
    final accentColor = isDark ? AppColors.darkAccent : AppColors.accent;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.md,
        border: Border.all(color: hairlineColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.dailyMomentum,
                style: AppTypography.captionBold.copyWith(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
                ),
              ),
              Text(
                '$percent%',
                style: AppTypography.captionBold.copyWith(color: accentColor),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: AppRadius.full,
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: isDark
                  ? AppColors.darkHairlineStrong
                  : AppColors.hairlineStrong,
              valueColor: AlwaysStoppedAnimation<Color>(accentColor),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l10n.completedRatio(completed, total, percent),
            style: AppTypography.caption.copyWith(
              color: isDark ? AppColors.darkSteel : AppColors.steel,
            ),
          ),
        ],
      ),
    );
  }
}
