import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotit/core/routes/route_names.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/core/utils/load_status.dart';
import 'package:gotit/core/widgets/reminder_lead_time_chips.dart';
import 'package:gotit/features/tasks/cubit/task_form_cubit.dart';
import 'package:gotit/features/tasks/cubit/task_form_state.dart';
import 'package:gotit/features/tasks/data/models/context_model.dart';
import 'package:gotit/features/tasks/ui/widgets/permission_primer_dialog.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';
import 'package:intl/intl.dart';

/// Modal bottom sheet for task creation and editing per DESIGN.md.
class TaskFormSheet extends StatefulWidget {
  final List<ContextModel> contexts;

  const TaskFormSheet({super.key, this.contexts = const []});

  static Future<bool?> show(
    BuildContext context, {
    required TaskFormCubit cubit,
    List<ContextModel> contexts = const [],
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: TaskFormSheet(contexts: contexts),
      ),
    );
  }

  @override
  State<TaskFormSheet> createState() => _TaskFormSheetState();
}

class _TaskFormSheetState extends State<TaskFormSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _notesController;
  late final TextEditingController _checklistController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<TaskFormCubit>();
    _titleController = TextEditingController(text: cubit.state.title);
    _notesController = TextEditingController(text: cubit.state.notes);
    _checklistController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    _checklistController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);
    final bg = isDark ? AppColors.darkSurfaceRaised : AppColors.surfaceRaised;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<TaskFormCubit, TaskFormState>(
      listener: (context, state) {
        if (state.status == LoadStatus.success) {
          Navigator.of(context).pop(true);
        }
      },
      builder: (context, state) {
        final cubit = context.read<TaskFormCubit>();

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
                // Sheet Title
                Text(
                  state.taskId != null
                      ? (l10n.editTaskTitle)
                      : (l10n.newTaskTitle),
                  style: AppTypography.title.copyWith(
                    color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
                  ),
                ),
                AppSpacing.gapHMd,
                // Title Input
                TextField(
                  key: const Key('task_title_input'),
                  controller: _titleController,
                  autofocus: state.taskId == null,
                  style: AppTypography.body.copyWith(
                    color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
                  ),
                  decoration: InputDecoration(
                    labelText: l10n.taskTitleLabel,
                    errorText: state.titleError,
                    border: const OutlineInputBorder(
                      borderRadius: AppRadius.md,
                    ),
                  ),
                  onChanged: cubit.updateTitle,
                ),
                AppSpacing.gapHSm,
                // Date & Time Picker Row
                _buildDateTimeRow(context, state, cubit, l10n, isDark),
                AppSpacing.gapHSm,
                // Context Selector
                if (widget.contexts.isNotEmpty) ...[
                  Text(
                    l10n.contextLabel,
                    style: AppTypography.captionBold.copyWith(
                      color: isDark ? AppColors.darkSteel : AppColors.steel,
                    ),
                  ),
                  const SizedBox(height: 6),
                  _buildContextChips(state, cubit, isDark),
                  AppSpacing.gapHSm,
                ],
                // Effort Estimate Chips
                Text(
                  l10n.effortEstimateLabel,
                  style: AppTypography.captionBold.copyWith(
                    color: isDark ? AppColors.darkSteel : AppColors.steel,
                  ),
                ),
                const SizedBox(height: 6),
                _buildEffortChips(state, cubit, isDark),
                AppSpacing.gapHMd,
                // Reminders Section (US1 & US2)
                ...[
                  _buildRemindersSection(context, state, cubit, l10n, isDark),
                  AppSpacing.gapHMd,
                ],
                // Checklist Items
                Text(
                  l10n.checklistTitle,
                  style: AppTypography.captionBold.copyWith(
                    color: isDark ? AppColors.darkSteel : AppColors.steel,
                  ),
                ),
                const SizedBox(height: 6),
                _buildChecklistSection(state, cubit, l10n, isDark),
                AppSpacing.gapHSm,
                // Notes Input
                TextField(
                  controller: _notesController,
                  maxLines: 2,
                  style: AppTypography.body.copyWith(
                    color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
                  ),
                  decoration: InputDecoration(
                    labelText: l10n.notesTitle,
                    border: const OutlineInputBorder(
                      borderRadius: AppRadius.md,
                    ),
                  ),
                  onChanged: cubit.updateNotes,
                ),
                AppSpacing.gapHLg,
                // Save Button
                SizedBox(
                  height: AppSpacing.buttonHeight,
                  child: ElevatedButton(
                    onPressed: state.status == LoadStatus.loading
                        ? null
                        : () => cubit.save(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: AppColors.onAccent,
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppRadius.md,
                      ),
                      elevation: 0,
                    ),
                    child: state.status == LoadStatus.loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            l10n.saveTask,
                            style: AppTypography.button.copyWith(
                              color: AppColors.onAccent,
                            ),
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

  Widget _buildRemindersSection(
    BuildContext context,
    TaskFormState state,
    TaskFormCubit cubit,
    AppLocalizations l10n,
    bool isDark,
  ) {
    final alertTimeStr = state.allDayReminderTime ?? '09:00';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Toggle Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  size: 18,
                  color: isDark ? AppColors.darkSteel : AppColors.steel,
                ),
                AppSpacing.gapWXs,
                Text(
                  l10n.remindersLabel,
                  style: AppTypography.captionBold.copyWith(
                    color: isDark ? AppColors.darkSteel : AppColors.steel,
                  ),
                ),
              ],
            ),
            Switch.adaptive(
              key: const Key('reminder_switch'),
              value: state.isReminderEnabled,
              activeTrackColor: AppColors.accent,
              onChanged: (enabled) async {
                if (enabled) {
                  final accepted = await PermissionPrimerDialog.show(context);
                  if (accepted) {
                    cubit.toggleReminder(true);
                  }
                } else {
                  cubit.toggleReminder(false);
                }
              },
            ),
          ],
        ),

        // Expanded Reminder Configuration
        if (state.isReminderEnabled) ...[
          const SizedBox(height: 6),
          // Inexact alarm warning banner (US4)
          _buildInexactAlarmBanner(context, l10n, isDark),
          const SizedBox(height: 6),
          if (state.isAllDay) ...[
            // All-day alert time selector
            InkWell(
              onTap: () async {
                final parts = alertTimeStr.split(':');
                final initialHour = int.tryParse(parts[0]) ?? 9;
                final initialMinute = parts.length > 1
                    ? (int.tryParse(parts[1]) ?? 0)
                    : 0;
                final picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(
                    hour: initialHour,
                    minute: initialMinute,
                  ),
                );
                if (picked != null) {
                  final formatted =
                      '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
                  cubit.setAllDayReminderTime(formatted);
                }
              },
              borderRadius: AppRadius.md,
              child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.allDayAlertTime,
                      style: AppTypography.bodySm.copyWith(
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.ink,
                      ),
                    ),
                    Text(
                      alertTimeStr,
                      style: AppTypography.bodySm.copyWith(
                        color: isDark ? AppColors.darkAccent : AppColors.accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            // Lead time chips
            ReminderLeadTimeChips(
              selectedMinutes: state.reminderLeadMinutes ?? 15,
              onSelected: cubit.setReminderLeadMinutes,
            ),
          ],

          // Start-working reminder dynamic helper notice (US2)
          if (state.effortMinutes != null &&
              state.effortMinutes! > 0 &&
              state.dueDate != null &&
              !state.isAllDay) ...[
            const SizedBox(height: 8),
            _buildStartWorkingNotice(state, l10n, isDark),
          ],
        ],
      ],
    );
  }

  Widget _buildStartWorkingNotice(
    TaskFormState state,
    AppLocalizations l10n,
    bool isDark,
  ) {
    final startWorkingTime = state.dueDate!.subtract(
      Duration(minutes: state.effortMinutes!),
    );
    final timeStr = DateFormat('h:mm a').format(startWorkingTime);
    final effortLabel = state.effortMinutes! < 60
        ? '${state.effortMinutes!}m'
        : '${state.effortMinutes! ~/ 60}h';

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
            Icons.access_time_filled,
            size: 16,
            color: isDark ? AppColors.darkAccent : AppColors.accent,
          ),
          AppSpacing.gapWXs,
          Expanded(
            child: Text(
              l10n.startWorkingNotice(timeStr, effortLabel),
              style: AppTypography.caption.copyWith(
                color: isDark ? AppColors.darkTextSecondary : AppColors.slate,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInexactAlarmBanner(
    BuildContext context,
    AppLocalizations l10n,
    bool isDark,
  ) {
    return Container(
      key: const Key('inexact_alarm_banner'),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkTintYellow : AppColors.tintYellow,
        borderRadius: AppRadius.md,
        border: Border.all(
          color: isDark
              ? AppColors.darkTintYellowText.withValues(alpha: 0.3)
              : AppColors.tintYellowText.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 18,
            color: isDark
                ? AppColors.darkTintYellowText
                : AppColors.tintYellowText,
          ),
          AppSpacing.gapWXs,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.inexactAlarmWarningTitle,
                  style: AppTypography.captionBold.copyWith(
                    color: isDark
                        ? AppColors.darkTintYellowText
                        : AppColors.tintYellowText,
                  ),
                ),
                Text(
                  l10n.inexactAlarmWarningBody,
                  style: AppTypography.caption.copyWith(
                    color: isDark
                        ? AppColors.darkTintYellowText
                        : AppColors.tintYellowText,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            key: const Key('inexact_alarm_fix_button'),
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamed(RouteNames.reminderTroubleshooting);
            },
            child: Text(
              l10n.inexactAlarmFixButton,
              style: AppTypography.captionBold.copyWith(
                color: isDark
                    ? AppColors.darkTintYellowText
                    : AppColors.tintYellowText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeRow(
    BuildContext context,
    TaskFormState state,
    TaskFormCubit cubit,
    AppLocalizations? l10n,
    bool isDark,
  ) {
    final dateStr = state.dueDate != null
        ? DateFormat('EEE, MMM d').format(state.dueDate!)
        : (l10n?.scheduleLabel ?? 'Set due date');

    final timeStr = state.dueDate != null && !state.isAllDay
        ? DateFormat('h:mm a').format(state.dueDate!)
        : null;

    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            icon: const Icon(Icons.calendar_today, size: 16),
            label: Text(timeStr != null ? '$dateStr, $timeStr' : dateStr),
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: state.dueDate ?? DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2035),
              );
              if (pickedDate != null) {
                if (!context.mounted) return;
                TimeOfDay? pickedTime;
                if (!state.isAllDay) {
                  pickedTime = await showTimePicker(
                    context: context,
                    initialTime: state.dueDate != null
                        ? TimeOfDay.fromDateTime(state.dueDate!)
                        : const TimeOfDay(hour: 9, minute: 0),
                  );
                }
                final combined = DateTime(
                  pickedDate.year,
                  pickedDate.month,
                  pickedDate.day,
                  pickedTime?.hour ?? 0,
                  pickedTime?.minute ?? 0,
                );
                cubit.updateDueDate(combined, isAllDay: state.isAllDay);
              }
            },
          ),
        ),
        AppSpacing.gapWXs,
        FilterChip(
          label: Text(l10n?.allDay ?? 'All-day'),
          selected: state.isAllDay,
          onSelected: (selected) {
            cubit.updateDueDate(state.dueDate, isAllDay: selected);
          },
        ),
      ],
    );
  }

  Widget _buildContextChips(
    TaskFormState state,
    TaskFormCubit cubit,
    bool isDark,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.contexts.map((ctx) {
          final isSelected = state.contextId == ctx.id;
          return Padding(
            padding: const EdgeInsets.only(right: 6),
            child: ChoiceChip(
              label: Text(ctx.name),
              selected: isSelected,
              onSelected: (selected) {
                cubit.updateContext(selected ? ctx.id : null);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEffortChips(
    TaskFormState state,
    TaskFormCubit cubit,
    bool isDark,
  ) {
    const options = [15, 30, 60, 120];
    return Row(
      children: options.map((minutes) {
        final isSelected = state.effortMinutes == minutes;
        final label = minutes < 60 ? '${minutes}m' : '${minutes ~/ 60}h';
        return Padding(
          padding: const EdgeInsets.only(right: 6),
          child: ChoiceChip(
            label: Text(label),
            selected: isSelected,
            onSelected: (selected) {
              cubit.updateEffortMinutes(selected ? minutes : null);
            },
          ),
        );
      }).toList(),
    );
  }

  Widget _buildChecklistSection(
    TaskFormState state,
    TaskFormCubit cubit,
    AppLocalizations? l10n,
    bool isDark,
  ) {
    return Column(
      children: [
        ...state.checklistDrafts.asMap().entries.map((entry) {
          final idx = entry.key;
          final item = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                const Icon(Icons.circle_outlined, size: 16),
                AppSpacing.gapWXs,
                Expanded(
                  child: Text(
                    item,
                    style: AppTypography.bodySm.copyWith(
                      color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 16),
                  onPressed: () => cubit.removeChecklistItem(idx),
                ),
              ],
            ),
          );
        }),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _checklistController,
                decoration: InputDecoration(
                  hintText: l10n?.addChecklistItem ?? 'Add checklist item',
                  isDense: true,
                  border: const OutlineInputBorder(borderRadius: AppRadius.md),
                ),
                onSubmitted: (val) {
                  if (val.trim().isNotEmpty) {
                    cubit.addChecklistItem(val.trim());
                    _checklistController.clear();
                  }
                },
              ),
            ),
            AppSpacing.gapWXs,
            IconButton(
              icon: const Icon(Icons.add_circle, color: AppColors.accent),
              onPressed: () {
                final val = _checklistController.text.trim();
                if (val.isNotEmpty) {
                  cubit.addChecklistItem(val);
                  _checklistController.clear();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
