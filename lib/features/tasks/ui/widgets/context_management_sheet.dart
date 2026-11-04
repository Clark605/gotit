import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/features/tasks/cubit/tasks_cubit.dart';
import 'package:gotit/features/tasks/cubit/tasks_state.dart';
import 'package:gotit/features/tasks/data/models/context_model.dart';
import 'package:gotit/features/tasks/ui/widgets/context_tag.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

/// Bottom sheet for managing default and custom contexts per DESIGN.md.
class ContextManagementSheet extends StatefulWidget {
  const ContextManagementSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<TasksCubit>(),
        child: const ContextManagementSheet(),
      ),
    );
  }

  @override
  State<ContextManagementSheet> createState() => _ContextManagementSheetState();
}

class _ContextManagementSheetState extends State<ContextManagementSheet> {
  final _nameController = TextEditingController();
  int? _selectedColor;
  String? _errorMessage;

  static const _palette = [
    0xFFDDEBF7, // Sky
    0xFFDCF0E4, // Mint
    0xFFE8E2F4, // Lavender
    0xFFFCE6D5, // Peach
    0xFFF9E0E8, // Rose
    0xFFFAF0C8, // Yellow
  ];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);
    final bg = isDark ? AppColors.darkSurfaceRaised : AppColors.surfaceRaised;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(color: bg, borderRadius: AppRadius.topXl),
          padding: EdgeInsets.only(
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            top: AppSpacing.md,
            bottom: bottomInset + AppSpacing.lg,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Handle Drag Indicator
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.darkHairlineStrong
                          : AppColors.hairlineStrong,
                      borderRadius: AppRadius.full,
                    ),
                  ),
                ),
                Text(
                  l10n.manageContextsTitle,
                  style: AppTypography.title.copyWith(
                    color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
                  ),
                ),
                AppSpacing.gapHMd,

                // List of Existing Contexts
                ...state.contexts.map((ctx) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isDark
                              ? AppColors.darkHairline
                              : AppColors.hairline,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        ContextTag.fromModel(ctx),
                        const Spacer(),
                        if (ctx.isDefault)
                          Row(
                            children: [
                              Icon(
                                Icons.lock_outline,
                                size: 16,
                                color: isDark
                                    ? AppColors.darkSteel
                                    : AppColors.steel,
                              ),
                              AppSpacing.gapWXxs,
                              Text(
                                l10n.defaultContext,
                                style: AppTypography.caption.copyWith(
                                  color: isDark
                                      ? AppColors.darkSteel
                                      : AppColors.steel,
                                ),
                              ),
                            ],
                          )
                        else
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              size: 20,
                              color: AppColors.error,
                            ),
                            onPressed: () =>
                                _confirmDeleteContext(context, ctx, l10n),
                          ),
                      ],
                    ),
                  );
                }),

                AppSpacing.gapHLg,

                // Add Custom Context Form
                Text(
                  l10n.newContext,
                  style: AppTypography.captionBold.copyWith(
                    color: isDark ? AppColors.darkSteel : AppColors.steel,
                  ),
                ),
                AppSpacing.gapHXs,
                TextField(
                  controller: _nameController,
                  style: AppTypography.bodyMedium.copyWith(
                    color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
                  ),
                  decoration: InputDecoration(
                    hintText: l10n.contextNameHint,
                    errorText: _errorMessage,
                    isDense: true,
                    border: const OutlineInputBorder(
                      borderRadius: AppRadius.md,
                    ),
                  ),
                  onChanged: (_) {
                    if (_errorMessage != null) {
                      setState(() => _errorMessage = null);
                    }
                  },
                ),
                AppSpacing.gapHSm,

                // Color Swatches
                Row(
                  children: _palette.map((colorVal) {
                    final isSelected = _selectedColor == colorVal;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedColor = colorVal),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Color(colorVal),
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(
                                  color: isDark ? Colors.white : AppColors.ink,
                                  width: 2,
                                )
                              : null,
                        ),
                        child: isSelected
                            ? Icon(
                                Icons.check,
                                size: 16,
                                color: isDark ? Colors.white : AppColors.ink,
                              )
                            : null,
                      ),
                    );
                  }).toList(),
                ),

                AppSpacing.gapHLg,

                // Add Button
                ElevatedButton(
                  onPressed: () => _submitNewContext(state.contexts, l10n),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: AppColors.onAccent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: AppRadius.md,
                    ),
                    minimumSize: const Size(
                      double.infinity,
                      AppSpacing.buttonHeight,
                    ),
                  ),
                  child: Text(
                    l10n.addContext,
                    style: AppTypography.button.copyWith(
                      color: AppColors.onAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _submitNewContext(List<ContextModel> existing, AppLocalizations? l10n) {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final lower = name.toLowerCase();
    final duplicate = existing.any((c) => c.name.trim().toLowerCase() == lower);
    if (duplicate) {
      setState(() {
        _errorMessage = l10n?.contextAlreadyExists ?? 'Context already exists';
      });
      return;
    }

    context.read<TasksCubit>().addCustomContext(
      name: name,
      colorValue: _selectedColor,
    );
    _nameController.clear();
    setState(() {
      _selectedColor = null;
      _errorMessage = null;
    });
  }

  void _confirmDeleteContext(
    BuildContext context,
    ContextModel ctx,
    AppLocalizations? l10n,
  ) {
    showDialog<bool>(
      context: context,
      builder: (dlgContext) => AlertDialog(
        title: Text(
          l10n?.deleteContextConfirmTitle(ctx.name) ?? 'Delete "${ctx.name}"?',
        ),
        content: Text(
          l10n?.deleteContextConfirmMessage ??
              'Tasks with this context will be kept and set to No Context.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dlgContext).pop(false),
            child: Text(l10n?.cancel ?? 'Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(dlgContext).pop(true),
            child: Text(
              l10n?.delete ?? 'Delete',
              style: const TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true && context.mounted) {
        context.read<TasksCubit>().deleteCustomContext(ctx.id);
      }
    });
  }
}
