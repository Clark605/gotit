import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotit/core/routes/app_navigator.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/features/tasks/cubit/task_form_cubit.dart';
import 'package:gotit/features/tasks/cubit/tasks_cubit.dart';
import 'package:gotit/features/tasks/cubit/tasks_state.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/ui/widgets/context_tag.dart';
import 'package:gotit/features/tasks/ui/widgets/snackbar_with_undo.dart';
import 'package:gotit/features/tasks/ui/widgets/task_form_sheet.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';
import 'package:intl/intl.dart';

/// Task detail screen showing full task metadata, checklist, and edit/delete actions.
class TaskDetailScreen extends StatelessWidget {
  final String taskId;

  const TaskDetailScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);
    final bg = isDark ? AppColors.darkCanvas : AppColors.canvas;

    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        final task =
            state.allTasks.where((t) => t.id == taskId).firstOrNull ??
            state.todayTasks.where((t) => t.id == taskId).firstOrNull;

        if (task == null) {
          return Scaffold(
            backgroundColor: bg,
            appBar: AppBar(backgroundColor: bg, elevation: 0),
            body: Center(
              child: Text(
                l10n.errorNotFound,
                style: AppTypography.body.copyWith(
                  color: isDark ? AppColors.darkSteel : AppColors.steel,
                ),
              ),
            ),
          );
        }

        final contextModel = state.contexts
            .where((c) => c.id == task.contextId)
            .firstOrNull;

        final isCompleted = task.status == TaskStatus.completed;

        return Scaffold(
          backgroundColor: bg,
          appBar: AppBar(
            backgroundColor: bg,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => AppNavigator.pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                tooltip: l10n.editTaskTitle,
                onPressed: () => _openEditSheet(context, task, state),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: AppColors.error),
                tooltip: l10n.delete,
                onPressed: () => _confirmDelete(context, task, l10n),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Context Tag
                if (contextModel != null) ...[
                  ContextTag(
                    name: contextModel.name,
                    colorValue: contextModel.colorValue,
                  ),
                  AppSpacing.gapHSm,
                ],

                // Task Title
                Text(
                  task.title,
                  style: AppTypography.title.copyWith(
                    color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                AppSpacing.gapHMd,

                // Status Toggle Bar
                _buildStatusToggleBar(context, task, isCompleted, isDark, l10n),
                AppSpacing.gapHMd,

                // Schedule & Effort Card
                if (task.dueDate != null || task.effortMinutes != null)
                  _buildScheduleEffortCard(task, isDark, l10n),

                // Notes Card
                if (task.notes.isNotEmpty) ...[
                  AppSpacing.gapHMd,
                  _buildNotesCard(task.notes, isDark, l10n),
                ],

                // Checklist Section
                if (task.checklist.isNotEmpty) ...[
                  AppSpacing.gapHLg,
                  _buildChecklistSection(context, task, isDark, l10n),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusToggleBar(
    BuildContext context,
    TaskModel task,
    bool isCompleted,
    bool isDark,
    AppLocalizations? l10n,
  ) {
    return InkWell(
      onTap: () => context.read<TasksCubit>().toggleTaskStatus(task.id),
      borderRadius: AppRadius.md,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.surface,
          borderRadius: AppRadius.md,
          border: Border.all(
            color: isDark ? AppColors.darkHairline : AppColors.hairline,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: AppSpacing.checkboxSize,
              height: AppSpacing.checkboxSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted
                    ? (isDark ? AppColors.darkAccent : AppColors.accent)
                    : Colors.transparent,
                border: Border.all(
                  color: isCompleted
                      ? (isDark ? AppColors.darkAccent : AppColors.accent)
                      : (isDark
                            ? AppColors.darkHairlineStrong
                            : AppColors.hairlineStrong),
                  width: 1.5,
                ),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            AppSpacing.gapWSm,
            Text(
              isCompleted
                  ? (l10n?.completedStatus ?? 'Completed')
                  : (l10n?.activeStatus ?? 'Active'),
              style: AppTypography.bodyMedium.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleEffortCard(
    TaskModel task,
    bool isDark,
    AppLocalizations? l10n,
  ) {
    final metaColor = isDark ? AppColors.darkSteel : AppColors.steel;
    final cardBg = isDark ? AppColors.darkSurface : AppColors.surface;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: AppRadius.md,
        border: Border.all(
          color: isDark ? AppColors.darkHairline : AppColors.hairline,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (task.dueDate != null) ...[
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: metaColor),
                AppSpacing.gapWXs,
                Text(
                  task.isAllDay
                      ? DateFormat('EEEE, MMMM d').format(task.dueDate!)
                      : DateFormat(
                          'EEEE, MMMM d, h:mm a',
                        ).format(task.dueDate!),
                  style: AppTypography.bodySm.copyWith(color: metaColor),
                ),
              ],
            ),
          ],
          if (task.effortMinutes != null && task.effortMinutes! > 0) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.timer_outlined, size: 16, color: metaColor),
                AppSpacing.gapWXs,
                Text(
                  l10n?.estimatedEffort(_formatEffort(task.effortMinutes!)) ??
                      'Estimated effort: ${_formatEffort(task.effortMinutes!)}',
                  style: AppTypography.bodySm.copyWith(color: metaColor),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNotesCard(String notes, bool isDark, AppLocalizations? l10n) {
    final cardBg = isDark ? AppColors.darkSurface : AppColors.surface;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: AppRadius.md,
        border: Border.all(
          color: isDark ? AppColors.darkHairline : AppColors.hairline,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n?.notesTitle ?? 'Notes',
            style: AppTypography.captionBold.copyWith(
              color: isDark ? AppColors.darkSteel : AppColors.steel,
            ),
          ),
          AppSpacing.gapHXs,
          Text(
            notes,
            style: AppTypography.body.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistSection(
    BuildContext context,
    TaskModel task,
    bool isDark,
    AppLocalizations? l10n,
  ) {
    final completedCount = task.checklist.where((c) => c.isCompleted).length;
    final totalCount = task.checklist.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n?.checklistTitle ?? 'Checklist',
              style: AppTypography.heading.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
              ),
            ),
            Text(
              l10n?.checklistProgress(completedCount, totalCount) ??
                  '$completedCount of $totalCount completed',
              style: AppTypography.caption.copyWith(
                color: isDark ? AppColors.darkSteel : AppColors.steel,
              ),
            ),
          ],
        ),
        AppSpacing.gapHSm,
        ...task.checklist.map((item) {
          return InkWell(
            onTap: () {
              context.read<TasksCubit>().toggleChecklistItem(
                taskId: task.id,
                itemId: item.id,
              );
            },
            child: Container(
              constraints: const BoxConstraints(
                minHeight: AppSpacing.touchTarget,
              ),
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: item.isCompleted
                          ? (isDark ? AppColors.darkAccent : AppColors.accent)
                          : Colors.transparent,
                      border: Border.all(
                        color: item.isCompleted
                            ? (isDark ? AppColors.darkAccent : AppColors.accent)
                            : (isDark
                                  ? AppColors.darkHairlineStrong
                                  : AppColors.hairlineStrong),
                        width: 1.5,
                      ),
                    ),
                    child: item.isCompleted
                        ? const Icon(Icons.check, size: 14, color: Colors.white)
                        : null,
                  ),
                  AppSpacing.gapWSm,
                  Expanded(
                    child: Text(
                      item.content,
                      style: AppTypography.body.copyWith(
                        color: item.isCompleted
                            ? (isDark ? AppColors.darkSteel : AppColors.steel)
                            : (isDark
                                  ? AppColors.darkTextPrimary
                                  : AppColors.ink),
                        decoration: item.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  void _openEditSheet(BuildContext context, TaskModel task, TasksState state) {
    final formCubit = context.read<TaskFormCubit>();
    formCubit.initializeForEdit(task);
    TaskFormSheet.show(context, cubit: formCubit, contexts: state.contexts);
  }

  void _confirmDelete(
    BuildContext context,
    TaskModel task,
    AppLocalizations? l10n,
  ) {
    showDialog<bool>(
      context: context,
      builder: (dlgContext) => AlertDialog(
        title: Text(l10n?.deleteTaskConfirmTitle ?? 'Delete this task?'),
        content: Text(
          l10n?.deleteTaskConfirmMessage ??
              'This will remove the task and its checklist items.',
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
        context.read<TasksCubit>().deleteTask(task.id);
        AppNavigator.pop();
        SnackbarWithUndo.show(
          context,
          message: l10n?.taskDeleted ?? 'Task deleted',
          undoLabel: l10n?.undo ?? 'Undo',
          onUndo: () {
            context.read<TasksCubit>().restoreTask(task);
          },
        );
      }
    });
  }

  String _formatEffort(int minutes) {
    if (minutes < 60) return '${minutes}m';
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    if (remainingMinutes == 0) return '${hours}h';
    return '${hours}h ${remainingMinutes}m';
  }
}
