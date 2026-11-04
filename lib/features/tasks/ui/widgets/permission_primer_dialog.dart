import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

class PermissionPrimerDialog extends StatelessWidget {
  const PermissionPrimerDialog({super.key});

  static Future<bool> show(BuildContext context) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const PermissionPrimerDialog(),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);
    final bg = isDark ? AppColors.darkSurfaceRaised : AppColors.surfaceRaised;

    return Container(
      decoration: BoxDecoration(color: bg, borderRadius: AppRadius.topXl),
      padding: const EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.md,
        bottom: AppSpacing.xl,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: AppSpacing.lg),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkHairlineStrong
                      : AppColors.hairlineStrong,
                  borderRadius: AppRadius.full,
                ),
              ),
            ),

            // Bell Icon Container
            Center(
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark
                      ? AppColors.darkAccentSoft
                      : AppColors.accentSoft,
                ),
                child: Icon(
                  Icons.notifications_active_outlined,
                  size: 32,
                  color: isDark ? AppColors.darkAccent : AppColors.accent,
                ),
              ),
            ),
            AppSpacing.gapHMd,

            // Title
            Text(
              l10n.permissionPrimerTitle,
              textAlign: TextAlign.center,
              style: AppTypography.title.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
              ),
            ),
            AppSpacing.gapHSm,

            // Subtitle / Body
            Text(
              l10n.permissionPrimerBody,
              textAlign: TextAlign.center,
              style: AppTypography.bodySm.copyWith(
                color: isDark ? AppColors.darkTextSecondary : AppColors.slate,
                height: 1.5,
              ),
            ),
            AppSpacing.gapHLg,

            // Key Benefits List
            _buildBenefitRow(
              icon: Icons.notifications_none_outlined,
              text: l10n.permissionPrimerNotificationItem,
              isDark: isDark,
            ),
            AppSpacing.gapHSm,
            _buildBenefitRow(
              icon: Icons.alarm_on_outlined,
              text: l10n.permissionPrimerAlarmItem,
              isDark: isDark,
            ),
            AppSpacing.gapHXl,

            // Enable Button (CTA)
            SizedBox(
              height: AppSpacing.buttonHeight,
              child: ElevatedButton(
                key: const Key('primer_enable_button'),
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? AppColors.darkAccent
                      : AppColors.accent,
                  foregroundColor: AppColors.onAccent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadius.md,
                  ),
                  elevation: 0,
                ),
                child: Text(
                  l10n.permissionPrimerEnableButton,
                  style: AppTypography.button.copyWith(
                    color: AppColors.onAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            AppSpacing.gapHSm,

            // Later Button
            SizedBox(
              height: AppSpacing.buttonHeight,
              child: TextButton(
                key: const Key('primer_later_button'),
                onPressed: () => Navigator.of(context).pop(false),
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadius.md,
                  ),
                ),
                child: Text(
                  l10n.permissionPrimerLaterButton,
                  style: AppTypography.button.copyWith(
                    color: isDark ? AppColors.darkSteel : AppColors.steel,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitRow({
    required IconData icon,
    required String text,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.surface,
        borderRadius: AppRadius.md,
        border: Border.all(
          color: isDark ? AppColors.darkHairline : AppColors.hairline,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: isDark ? AppColors.darkAccent : AppColors.accent,
          ),
          AppSpacing.gapWMd,
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodySm.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
