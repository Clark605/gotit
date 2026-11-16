import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

enum PermissionBadgeStatus { active, inexact, restricted, disabled }

class PermissionStatusBadge extends StatelessWidget {
  final PermissionBadgeStatus status;
  final String? label;

  const PermissionStatusBadge({super.key, required this.status, this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    final (
      Color bg,
      Color text,
      IconData icon,
      String defaultLabel,
    ) = switch (status) {
      PermissionBadgeStatus.active => (
        isDark ? AppColors.darkTintMint : AppColors.tintMint,
        isDark ? AppColors.darkTintMintText : AppColors.tintMintText,
        Icons.check_circle_outline,
        l10n.diagnosticStatusActive,
      ),
      PermissionBadgeStatus.inexact => (
        isDark ? AppColors.darkTintYellow : AppColors.tintYellow,
        isDark ? AppColors.darkTintYellowText : AppColors.tintYellowText,
        Icons.access_time,
        l10n.diagnosticStatusInexact,
      ),
      PermissionBadgeStatus.restricted => (
        isDark ? AppColors.darkSurface : AppColors.surface,
        isDark ? AppColors.darkWarning : AppColors.warning,
        Icons.info_outline,
        l10n.diagnosticStatusRestricted,
      ),
      PermissionBadgeStatus.disabled => (
        isDark ? AppColors.darkSurface : AppColors.surface,
        isDark ? AppColors.darkSteel : AppColors.steel,
        Icons.cancel_outlined,
        l10n.diagnosticStatusDisabled,
      ),
    };

    final displayLabel = label ?? defaultLabel;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 3,
      ),
      decoration: BoxDecoration(color: bg, borderRadius: AppRadius.sm),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: text),
          const SizedBox(width: 4),
          Text(
            displayLabel,
            style: AppTypography.caption.copyWith(
              color: text,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
