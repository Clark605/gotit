import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';

/// 56dp square Floating Action Button with 12px rounded corners per DESIGN.md.
class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? tooltip;

  const AddButton({super.key, required this.onPressed, this.tooltip});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSpacing.fabSize,
      height: AppSpacing.fabSize,
      child: Material(
        color: AppColors.accent,
        borderRadius: AppRadius.lg,
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        shadowColor: AppColors.ink.withValues(alpha: 0.15),
        child: InkWell(
          onTap: onPressed,
          splashColor: AppColors.accentPressed,
          child: Tooltip(
            message: tooltip ?? 'Add Task',
            child: const Center(
              child: Icon(Icons.add, size: 28, color: AppColors.onAccent),
            ),
          ),
        ),
      ),
    );
  }
}
