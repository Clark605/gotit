import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/ui/widgets/context_tag.dart';
import 'package:intl/intl.dart';

/// TaskCard renders an individual task row with 48dp touch targets,
/// 24px circular checkbox, title, context tag, due time, reminder indicator, effort, and checklist progress.
class TaskCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onTap;
  final VoidCallback? onToggle;
  final String? contextName;
  final int? contextColor;

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.onToggle,
    this.contextName,
    this.contextColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isCompleted = task.status == TaskStatus.completed;

    final titleColor = isCompleted
        ? (isDark ? AppColors.darkSteel : AppColors.steel)
        : (isDark ? AppColors.darkTextPrimary : AppColors.ink);

    final metaColor = isDark ? AppColors.darkSteel : AppColors.steel;
    final hairlineColor = isDark ? AppColors.darkHairline : AppColors.hairline;

    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: AppSpacing.rowMinHeight),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: hairlineColor, width: 1.0)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular completion checkbox in >=48dp touch target
            SizedBox(
              width: AppSpacing.touchTarget,
              height: AppSpacing.touchTarget,
              child: Center(
                child: InkResponse(
                  onTap: onToggle,
                  radius: 24,
                  child: AnimatedContainer(
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
                ),
              ),
            ),
            AppSpacing.gapWXs,
            // Title and Metadata
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    task.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.bodyMedium.copyWith(
                      color: titleColor,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Metadata Badges (Context, Time, Reminder, Checklist, Effort)
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      if (contextName != null && contextName!.isNotEmpty)
                        ContextTag(
                          name: contextName!,
                          colorValue: contextColor,
                        ),
                      if (task.dueDate != null) ...[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.schedule, size: 12, color: metaColor),
                            const SizedBox(width: 3),
                            Text(
                              _formatDue(task.dueDate!, task.isAllDay),
                              style: AppTypography.caption.copyWith(
                                color: metaColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (task.isReminderEnabled) ...[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.notifications_active_outlined,
                              size: 12,
                              color: isDark
                                  ? AppColors.darkAccent
                                  : AppColors.accent,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              _formatReminderLead(task.reminderLeadMinutes),
                              style: AppTypography.caption.copyWith(
                                color: isDark
                                    ? AppColors.darkAccent
                                    : AppColors.accent,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (task.checklist.isNotEmpty) ...[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.checklist, size: 13, color: metaColor),
                            const SizedBox(width: 3),
                            Text(
                              '${task.checklist.where((c) => c.isCompleted).length}/${task.checklist.length}',
                              style: AppTypography.caption.copyWith(
                                color: metaColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (task.effortMinutes != null &&
                          task.effortMinutes! > 0) ...[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 12,
                              color: metaColor,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              _formatEffort(task.effortMinutes!),
                              style: AppTypography.caption.copyWith(
                                color: metaColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatReminderLead(int? minutes) {
    final mins = minutes ?? 15;
    if (mins == 0) return 'At due';
    if (mins < 60) return '${mins}m';
    if (mins < 1440) return '${mins ~/ 60}h';
    return '${mins ~/ 1440}d';
  }

  String _formatDue(DateTime due, bool isAllDay) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dueDate = DateTime(due.year, due.month, due.day);

    if (dueDate == today) {
      if (isAllDay) return 'Today';
      return DateFormat('h:mm a').format(due);
    }

    final tomorrow = today.add(const Duration(days: 1));
    if (dueDate == tomorrow) {
      if (isAllDay) return 'Tomorrow';
      return 'Tomorrow, ${DateFormat('h:mm a').format(due)}';
    }

    final yesterday = today.subtract(const Duration(days: 1));
    if (dueDate == yesterday) {
      if (isAllDay) return 'Yesterday';
      return 'Yesterday, ${DateFormat('h:mm a').format(due)}';
    }

    if (isAllDay) return DateFormat('MMM d').format(due);
    return DateFormat('MMM d, h:mm a').format(due);
  }

  String _formatEffort(int minutes) {
    if (minutes < 60) return '${minutes}m';
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    if (remainingMinutes == 0) return '${hours}h';
    return '${hours}h ${remainingMinutes}m';
  }
}
