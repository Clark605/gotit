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
import 'package:gotit/features/tasks/ui/widgets/context_filter_bar.dart';
import 'package:gotit/features/tasks/ui/widgets/context_management_sheet.dart';
import 'package:gotit/features/tasks/ui/widgets/daily_progress_banner.dart';
import 'package:gotit/features/tasks/ui/widgets/empty_state_widget.dart';
import 'package:gotit/features/tasks/ui/widgets/status_segmented_button.dart';
import 'package:gotit/features/tasks/ui/widgets/task_card.dart';
import 'package:gotit/features/tasks/ui/widgets/task_form_sheet.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

/// All Tasks catalog screen with context chip filtering, status tabs, and daily progress.
class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

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
            final cubit = context.read<TasksCubit>();

            final completedCount = state.allTasks
                .where((t) => t.status == TaskStatus.completed)
                .length;
            final totalCount = state.allTasks.length;

            return CustomScrollView(
              slivers: [
                // Top App Bar Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.md,
                      right: AppSpacing.md,
                      top: AppSpacing.lg,
                      bottom: AppSpacing.xs,
                    ),
                    child: Text(
                      l10n.tasksTitle,
                      style: AppTypography.screenTitle.copyWith(
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.ink,
                      ),
                    ),
                  ),
                ),

                // Context Filter Bar
                SliverToBoxAdapter(
                  child: ContextFilterBar(
                    contexts: state.contexts,
                    selectedContextId: state.selectedContextId,
                    onSelectContext: cubit.setContextFilter,
                    onNewContextTap: () => ContextManagementSheet.show(context),
                  ),
                ),

                // Status Segmented Button (Active, Completed, All)
                SliverToBoxAdapter(
                  child: StatusSegmentedButton(
                    selectedStatus: state.selectedStatusFilter,
                    onStatusChanged: cubit.setStatusFilter,
                  ),
                ),

                // Daily Progress Banner
                if (totalCount > 0)
                  SliverToBoxAdapter(
                    child: DailyProgressBanner(
                      completed: completedCount,
                      total: totalCount,
                    ),
                  ),

                // Task List or Empty State
                if (state.status == LoadStatus.loading &&
                    state.allTasks.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator(color: AppColors.accent),
                    ),
                  )
                else if (state.allTasks.isEmpty)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: EmptyStateWidget(
                      icon: Icons.filter_list_off_outlined,
                      title: l10n.noTasksInContext,
                      actionLabel: l10n.addTask,
                      onAction: () => _openTaskForm(context, state),
                    ),
                  )
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final task = state.allTasks[index];
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
                          cubit.toggleTaskStatus(task.id);
                        },
                      );
                    }, childCount: state.allTasks.length),
                  ),

                // Clearance for FAB & Nav Bar
                const SliverToBoxAdapter(
                  child: SizedBox(height: AppSpacing.fabClearance),
                ),
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
        currentTab: BottomNavTab.allTasks,
        onTabSelected: (tab) {
          if (tab == BottomNavTab.today) {
            AppNavigator.pushReplacementNamed(RouteNames.today);
          }
        },
      ),
    );
  }

  void _openTaskForm(BuildContext context, TasksState state) {
    final formCubit = context.read<TaskFormCubit>()..reset();
    TaskFormSheet.show(context, cubit: formCubit, contexts: state.contexts);
  }
}
