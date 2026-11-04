import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotit/core/routes/app_navigator.dart';
import 'package:gotit/core/routes/route_names.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/core/utils/load_status.dart';
import 'package:gotit/features/tasks/cubit/task_form_cubit.dart';
import 'package:gotit/features/tasks/cubit/tasks_cubit.dart';
import 'package:gotit/features/tasks/cubit/tasks_state.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/ui/task_detail_args.dart';
import 'package:gotit/features/tasks/ui/widgets/add_button.dart';
import 'package:gotit/features/tasks/ui/widgets/bottom_nav_bar.dart';
import 'package:gotit/features/tasks/ui/widgets/empty_state_widget.dart';
import 'package:gotit/features/tasks/ui/widgets/task_card.dart';
import 'package:gotit/features/tasks/ui/widgets/task_form_sheet.dart';
import 'package:gotit/features/tasks/ui/widgets/today_section_header.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';
import 'package:intl/intl.dart';

/// Primary Today screen grouping tasks into Overdue, Due Today, and Start Today sections.
class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  Timer? _midnightTimer;
  DateTime _currentDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _scheduleMidnightRecalculation();
  }

  void _scheduleMidnightRecalculation() {
    _midnightTimer?.cancel();
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    final durationUntilMidnight =
        tomorrow.difference(now) + const Duration(seconds: 1);

    _midnightTimer = Timer(durationUntilMidnight, () {
      if (mounted) {
        setState(() {
          _currentDay = DateTime.now();
        });
        _scheduleMidnightRecalculation();
      }
    });
  }

  @override
  void dispose() {
    _midnightTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);
    final bg = isDark ? AppColors.darkCanvas : AppColors.canvas;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            if (state.status == LoadStatus.loading &&
                state.todayTasks.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.accent),
              );
            }

            final now = _currentDay;
            final startOfToday = DateTime(now.year, now.month, now.day);
            final endOfToday = DateTime(
              now.year,
              now.month,
              now.day,
              23,
              59,
              59,
              999,
            );

            // Group tasks
            final overdue = <TaskModel>[];
            final dueToday = <TaskModel>[];
            final startToday = <TaskModel>[];

            for (final task in state.todayTasks) {
              if (task.dueDate == null) continue;
              final due = task.dueDate!;

              if (due.isBefore(startOfToday)) {
                overdue.add(task);
              } else if (!due.isAfter(endOfToday)) {
                dueToday.add(task);
              } else if (task.effortMinutes != null &&
                  task.effortMinutes! > 0) {
                final startTime = due.subtract(
                  Duration(minutes: task.effortMinutes!),
                );
                if (!startTime.isAfter(endOfToday)) {
                  startToday.add(task);
                }
              }
            }

            // Sort Due Today: All-day first alphabetically, then timed chronologically
            dueToday.sort((a, b) {
              if (a.isAllDay && !b.isAllDay) return -1;
              if (!a.isAllDay && b.isAllDay) return 1;
              if (a.isAllDay && b.isAllDay) {
                return a.title.toLowerCase().compareTo(b.title.toLowerCase());
              }
              return (a.dueDate ?? now).compareTo(b.dueDate ?? now);
            });

            final isEmpty =
                overdue.isEmpty && dueToday.isEmpty && startToday.isEmpty;

            return CustomScrollView(
              slivers: [
                // Top App Bar / Date Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.md,
                      right: AppSpacing.md,
                      top: AppSpacing.lg,
                      bottom: AppSpacing.xs,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('EEEE, MMMM d').format(now),
                          style: AppTypography.captionBold.copyWith(
                            color: isDark
                                ? AppColors.darkSteel
                                : AppColors.steel,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.todayTitle,
                          style: AppTypography.screenTitle.copyWith(
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.ink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                if (isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: EmptyStateWidget(
                      icon: Icons.done_all_outlined,
                      title: l10n.allClearTitle,
                      subtitle: l10n.allClearSubtitle,
                      actionLabel: l10n.addTask,
                      onAction: () => _openTaskForm(context, state),
                    ),
                  )
                else ...[
                  // Overdue Section
                  if (overdue.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: TodaySectionHeader(
                        title: l10n.overdueSection,
                        count: overdue.length,
                        isOverdue: true,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final task = overdue[index];
                        return _buildTaskRow(context, state, task);
                      }, childCount: overdue.length),
                    ),
                  ],

                  // Due Today Section
                  if (dueToday.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: TodaySectionHeader(
                        title: l10n.dueTodaySection,
                        count: dueToday.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final task = dueToday[index];
                        return _buildTaskRow(context, state, task);
                      }, childCount: dueToday.length),
                    ),
                  ],

                  // Start Today Section
                  if (startToday.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: TodaySectionHeader(
                        title: l10n.startTodaySection,
                        count: startToday.length,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final task = startToday[index];
                        return _buildTaskRow(context, state, task);
                      }, childCount: startToday.length),
                    ),
                  ],

                  // Clearance for FAB & Nav Bar
                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppSpacing.fabClearance),
                  ),
                ],
              ],
            );
          },
        ),
      ),
      floatingActionButton: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          return AddButton(
            tooltip: l10n.addTask,
            onPressed: () => _openTaskForm(context, state),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentTab: BottomNavTab.today,
        onTabSelected: (tab) {
          if (tab == BottomNavTab.allTasks) {
            AppNavigator.pushReplacementNamed(RouteNames.allTasks);
          }
        },
      ),
    );
  }

  Widget _buildTaskRow(BuildContext context, TasksState state, TaskModel task) {
    final contextModel = state.contexts
        .where((c) => c.id == task.contextId)
        .firstOrNull;

    return TaskCard(
      task: task,
      contextName: contextModel?.name,
      contextColor: contextModel?.colorValue,
      onTap: () {
        AppNavigator.pushNamed(
          RouteNames.taskDetail,
          arguments: TaskDetailArgs(taskId: task.id),
        );
      },
      onToggle: () {
        context.read<TasksCubit>().toggleTaskStatus(task.id);
      },
    );
  }

  void _openTaskForm(BuildContext context, TasksState state) {
    final formCubit = context.read<TaskFormCubit>()..reset();
    TaskFormSheet.show(context, cubit: formCubit, contexts: state.contexts);
  }
}
