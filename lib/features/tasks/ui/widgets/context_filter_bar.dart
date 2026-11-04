import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/features/tasks/data/models/context_model.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

/// Horizontally scrollable chip row for context filtering per DESIGN.md.
class ContextFilterBar extends StatelessWidget {
  final List<ContextModel> contexts;
  final String? selectedContextId;
  final ValueChanged<String?> onSelectContext;
  final VoidCallback onNewContextTap;

  const ContextFilterBar({
    super.key,
    required this.contexts,
    required this.selectedContextId,
    required this.onSelectContext,
    required this.onNewContextTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      child: Row(
        children: [
          // "All" chip
          _buildChip(
            label: l10n.allContexts,
            isSelected: selectedContextId == null,
            isDark: isDark,
            onTap: () => onSelectContext(null),
          ),
          AppSpacing.gapWXs,
          // Context chips
          ...contexts.map((ctx) {
            final isSelected = selectedContextId == ctx.id;
            return Padding(
              padding: const EdgeInsets.only(right: AppSpacing.xs),
              child: _buildChip(
                label: ctx.name,
                isSelected: isSelected,
                isDark: isDark,
                onTap: () => onSelectContext(ctx.id),
              ),
            );
          }),
          // "+ New" chip
          ActionChip(
            label: Text(l10n.newContext),
            labelStyle: AppTypography.captionBold.copyWith(
              color: isDark ? AppColors.darkAccent : AppColors.accent,
            ),
            shape: const StadiumBorder(),
            backgroundColor: Colors.transparent,
            side: BorderSide(
              color: isDark
                  ? AppColors.darkHairlineStrong
                  : AppColors.hairlineStrong,
            ),
            onPressed: onNewContextTap,
          ),
        ],
      ),
    );
  }

  Widget _buildChip({
    required String label,
    required bool isSelected,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    final activeBg = isDark ? AppColors.darkTextPrimary : AppColors.ink;
    final activeText = isDark ? AppColors.darkCanvas : AppColors.canvas;
    final inactiveText = isDark ? AppColors.darkSteel : AppColors.steel;
    final borderColor = isDark ? AppColors.darkHairline : AppColors.hairline;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      labelStyle: AppTypography.captionBold.copyWith(
        color: isSelected ? activeText : inactiveText,
      ),
      selectedColor: activeBg,
      backgroundColor: Colors.transparent,
      side: BorderSide(color: isSelected ? activeBg : borderColor, width: 1.0),
      shape: const StadiumBorder(),
      showCheckmark: false,
    );
  }
}
