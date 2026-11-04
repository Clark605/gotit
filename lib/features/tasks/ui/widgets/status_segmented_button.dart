import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

/// Segmented pill control for switching between Active, Completed, and All tasks.
class StatusSegmentedButton extends StatelessWidget {
  final TaskStatus? selectedStatus;
  final ValueChanged<TaskStatus?> onStatusChanged;

  const StatusSegmentedButton({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    final bg = isDark ? AppColors.darkSurface : AppColors.surface;
    final activeBg = isDark
        ? AppColors.darkSurfaceRaised
        : AppColors.surfaceRaised;
    final activeText = isDark ? AppColors.darkTextPrimary : AppColors.ink;
    final inactiveText = isDark ? AppColors.darkSteel : AppColors.steel;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: bg, borderRadius: AppRadius.md),
      child: Row(
        children: [
          Expanded(
            child: _buildSegment(
              label: l10n.activeStatus,
              isSelected: selectedStatus == TaskStatus.open,
              activeBg: activeBg,
              activeText: activeText,
              inactiveText: inactiveText,
              onTap: () => onStatusChanged(TaskStatus.open),
            ),
          ),
          Expanded(
            child: _buildSegment(
              label: l10n.completedStatus,
              isSelected: selectedStatus == TaskStatus.completed,
              activeBg: activeBg,
              activeText: activeText,
              inactiveText: inactiveText,
              onTap: () => onStatusChanged(TaskStatus.completed),
            ),
          ),
          Expanded(
            child: _buildSegment(
              label: l10n.allStatus,
              isSelected: selectedStatus == null,
              activeBg: activeBg,
              activeText: activeText,
              inactiveText: inactiveText,
              onTap: () => onStatusChanged(null),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegment({
    required String label,
    required bool isSelected,
    required Color activeBg,
    required Color activeText,
    required Color inactiveText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? activeBg : Colors.transparent,
          borderRadius: AppRadius.sm,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: AppTypography.captionBold.copyWith(
            color: isSelected ? activeText : inactiveText,
          ),
        ),
      ),
    );
  }
}
