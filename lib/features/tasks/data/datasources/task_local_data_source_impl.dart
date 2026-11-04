import 'package:drift/drift.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/features/tasks/data/datasources/task_local_data_source.dart';
import 'package:gotit/features/tasks/data/models/checklist_item_model.dart';
import 'package:gotit/features/tasks/data/models/context_model.dart';
import 'package:gotit/features/tasks/data/models/reminder_model.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TaskLocalDataSource)
class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final AppDatabase _db;

  TaskLocalDataSourceImpl(this._db);

  @override
  Stream<List<TaskModel>> watchTodayTasks() {
    final query = _db.select(_db.tasksTable)
      ..where((t) => t.isDeleted.equals(false) & t.status.equals('open'));

    return query.watch().asyncMap((tasks) async {
      final now = DateTime.now();
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

      final eligibleTasks = tasks.where((t) {
        if (t.dueDate == null) return false;
        final due = t.dueDate!;

        // Overdue
        if (due.isBefore(startOfToday)) return true;

        // Due Today
        if (!due.isBefore(startOfToday) && !due.isAfter(endOfToday)) {
          return true;
        }

        // Start Today: future due date where (due - effort) <= endOfToday
        if (t.effortMinutes != null && t.effortMinutes! > 0) {
          final startTime = due.subtract(Duration(minutes: t.effortMinutes!));
          if (!startTime.isAfter(endOfToday)) return true;
        }

        return false;
      }).toList();

      final taskModels = <TaskModel>[];
      for (final t in eligibleTasks) {
        final checklistRows =
            await (_db.select(_db.checklistItemsTable)
                  ..where((c) => c.taskId.equals(t.id))
                  ..orderBy([(c) => OrderingTerm.asc(c.sortOrder)]))
                .get();

        taskModels.add(_mapTaskDataToModel(t, checklistRows));
      }

      // Sort: Overdue first, Due Today second, Start Today third.
      // Within each section: all-day first (alphabetical), then timed chronologically.
      taskModels.sort((a, b) {
        final aSec = _todaySectionOrder(a, startOfToday, endOfToday);
        final bSec = _todaySectionOrder(b, startOfToday, endOfToday);
        if (aSec != bSec) return aSec.compareTo(bSec);

        // Within same section:
        if (a.isAllDay != b.isAllDay) {
          return a.isAllDay ? -1 : 1;
        }
        if (a.isAllDay) {
          return a.title.toLowerCase().compareTo(b.title.toLowerCase());
        }
        return (a.dueDate ?? DateTime(0)).compareTo(b.dueDate ?? DateTime(0));
      });

      return taskModels;
    });
  }

  int _todaySectionOrder(
    TaskModel task,
    DateTime startOfToday,
    DateTime endOfToday,
  ) {
    final due = task.dueDate;
    if (due == null) return 3;
    if (due.isBefore(startOfToday)) return 0; // Overdue
    if (!due.isBefore(startOfToday) && !due.isAfter(endOfToday)) {
      return 1; // Due Today
    }
    return 2; // Start Today
  }

  @override
  Stream<List<TaskModel>> watchTasks({TaskStatus? status, String? contextId}) {
    final query = _db.select(_db.tasksTable)
      ..where((t) => t.isDeleted.equals(false));

    if (status != null) {
      query.where((t) => t.status.equals(status.name));
    }
    if (contextId != null) {
      query.where((t) => t.contextId.equals(contextId));
    }

    query.orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    return query.watch().asyncMap((tasks) async {
      final taskModels = <TaskModel>[];
      for (final t in tasks) {
        final checklistRows =
            await (_db.select(_db.checklistItemsTable)
                  ..where((c) => c.taskId.equals(t.id))
                  ..orderBy([(c) => OrderingTerm.asc(c.sortOrder)]))
                .get();

        taskModels.add(_mapTaskDataToModel(t, checklistRows));
      }
      return taskModels;
    });
  }

  @override
  Future<TaskModel> getTaskById(String id) async {
    final taskData =
        await (_db.select(_db.tasksTable)
              ..where((t) => t.id.equals(id) & t.isDeleted.equals(false)))
            .getSingleOrNull();

    if (taskData == null) {
      throw StateError('Task with id $id not found');
    }

    final checklistRows =
        await (_db.select(_db.checklistItemsTable)
              ..where((c) => c.taskId.equals(id))
              ..orderBy([(c) => OrderingTerm.asc(c.sortOrder)]))
            .get();

    return _mapTaskDataToModel(taskData, checklistRows);
  }

  @override
  Future<TaskModel> insertTask(TaskModel task) async {
    return _db.transaction(() async {
      await _db
          .into(_db.tasksTable)
          .insert(
            TasksTableCompanion.insert(
              id: task.id,
              title: task.title.trim(),
              status: Value(task.status.name),
              dueDate: Value(task.dueDate),
              isAllDay: Value(task.isAllDay),
              contextId: Value(task.contextId),
              notes: Value(task.notes),
              effortMinutes: Value(task.effortMinutes),
              sourceExcerpt: Value(task.sourceExcerpt),
              isDeleted: Value(task.isDeleted),
              isReminderEnabled: Value(task.isReminderEnabled),
              reminderLeadMinutes: Value(task.reminderLeadMinutes),
              allDayReminderTime: Value(task.allDayReminderTime),
              createdAt: Value(task.createdAt),
              updatedAt: Value(task.updatedAt),
            ),
          );

      for (var i = 0; i < task.checklist.length; i++) {
        final item = task.checklist[i];
        await _db
            .into(_db.checklistItemsTable)
            .insert(
              ChecklistItemsTableCompanion.insert(
                id: item.id,
                taskId: task.id,
                content: item.content,
                isCompleted: Value(item.isCompleted),
                sortOrder: Value(i),
                createdAt: Value(item.createdAt),
                updatedAt: Value(item.updatedAt),
              ),
            );
      }

      return getTaskById(task.id);
    });
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) async {
    return _db.transaction(() async {
      final now = DateTime.now();
      final updated =
          await (_db.update(
            _db.tasksTable,
          )..where((t) => t.id.equals(task.id))).write(
            TasksTableCompanion(
              title: Value(task.title.trim()),
              status: Value(task.status.name),
              dueDate: Value(task.dueDate),
              isAllDay: Value(task.isAllDay),
              contextId: Value(task.contextId),
              notes: Value(task.notes),
              effortMinutes: Value(task.effortMinutes),
              sourceExcerpt: Value(task.sourceExcerpt),
              isDeleted: Value(task.isDeleted),
              isReminderEnabled: Value(task.isReminderEnabled),
              reminderLeadMinutes: Value(task.reminderLeadMinutes),
              allDayReminderTime: Value(task.allDayReminderTime),
              updatedAt: Value(now),
            ),
          );

      if (updated == 0) {
        throw StateError('Task with id ${task.id} not found for update');
      }

      // Reconcile checklist items
      await (_db.delete(
        _db.checklistItemsTable,
      )..where((c) => c.taskId.equals(task.id))).go();

      for (var i = 0; i < task.checklist.length; i++) {
        final item = task.checklist[i];
        await _db
            .into(_db.checklistItemsTable)
            .insert(
              ChecklistItemsTableCompanion.insert(
                id: item.id,
                taskId: task.id,
                content: item.content,
                isCompleted: Value(item.isCompleted),
                sortOrder: Value(i),
                createdAt: Value(item.createdAt),
                updatedAt: Value(now),
              ),
            );
      }

      return getTaskById(task.id);
    });
  }

  @override
  Future<TaskModel> toggleTaskStatus(String id) async {
    final current = await getTaskById(id);
    final newStatus = current.status == TaskStatus.open
        ? TaskStatus.completed
        : TaskStatus.open;

    await (_db.update(_db.tasksTable)..where((t) => t.id.equals(id))).write(
      TasksTableCompanion(
        status: Value(newStatus.name),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return getTaskById(id);
  }

  @override
  Future<void> softDeleteTask(String id) async {
    final updated =
        await (_db.update(_db.tasksTable)..where((t) => t.id.equals(id))).write(
          TasksTableCompanion(
            isDeleted: const Value(true),
            updatedAt: Value(DateTime.now()),
          ),
        );

    if (updated == 0) {
      throw StateError('Task with id $id not found for deletion');
    }
  }

  @override
  Future<ChecklistItemModel> toggleChecklistItem({
    required String taskId,
    required String itemId,
  }) async {
    final item =
        await (_db.select(_db.checklistItemsTable)
              ..where((c) => c.id.equals(itemId) & c.taskId.equals(taskId)))
            .getSingleOrNull();

    if (item == null) {
      throw StateError('Checklist item $itemId not found for task $taskId');
    }

    final newCompleted = !item.isCompleted;
    final now = DateTime.now();

    await (_db.update(
      _db.checklistItemsTable,
    )..where((c) => c.id.equals(itemId))).write(
      ChecklistItemsTableCompanion(
        isCompleted: Value(newCompleted),
        updatedAt: Value(now),
      ),
    );

    // Touch parent task to notify watchers and update timestamp
    await (_db.update(_db.tasksTable)..where((t) => t.id.equals(taskId))).write(
      TasksTableCompanion(updatedAt: Value(now)),
    );

    return ChecklistItemModel(
      id: item.id,
      taskId: item.taskId,
      content: item.content,
      isCompleted: newCompleted,
      sortOrder: item.sortOrder,
      createdAt: item.createdAt,
      updatedAt: now,
    );
  }

  @override
  Stream<List<ContextModel>> watchContexts() {
    return _db.select(_db.contextsTable).watch().map((rows) {
      return rows
          .map(
            (r) => ContextModel(
              id: r.id,
              name: r.name,
              icon: r.icon,
              colorValue: r.colorValue,
              isDefault: r.isDefault,
              createdAt: r.createdAt,
              updatedAt: r.updatedAt,
            ),
          )
          .toList();
    });
  }

  @override
  Future<ContextModel> insertContext(ContextModel context) async {
    // Case-insensitive duplicate check (Clarification Q5)
    final trimmedName = context.name.trim();
    final existing =
        await (_db.select(_db.contextsTable)
              ..where((c) => c.name.lower().equals(trimmedName.toLowerCase())))
            .getSingleOrNull();

    if (existing != null) {
      throw StateError('Context already exists');
    }

    await _db
        .into(_db.contextsTable)
        .insert(
          ContextsTableCompanion.insert(
            id: context.id,
            name: trimmedName,
            icon: Value(context.icon),
            colorValue: Value(context.colorValue),
            isDefault: Value(context.isDefault),
            createdAt: Value(context.createdAt),
            updatedAt: Value(context.updatedAt),
          ),
        );

    final inserted = await (_db.select(
      _db.contextsTable,
    )..where((c) => c.id.equals(context.id))).getSingle();

    return ContextModel(
      id: inserted.id,
      name: inserted.name,
      icon: inserted.icon,
      colorValue: inserted.colorValue,
      isDefault: inserted.isDefault,
      createdAt: inserted.createdAt,
      updatedAt: inserted.updatedAt,
    );
  }

  @override
  Future<void> deleteContext(String id) async {
    return _db.transaction(() async {
      final existing = await (_db.select(
        _db.contextsTable,
      )..where((c) => c.id.equals(id))).getSingleOrNull();

      if (existing == null) {
        throw StateError('Context with id $id not found');
      }

      if (existing.isDefault) {
        throw StateError('Default contexts cannot be deleted');
      }

      // Safe unassign: set contextId to null on associated tasks (Clarification Q3)
      await (_db.update(_db.tasksTable)..where((t) => t.contextId.equals(id)))
          .write(const TasksTableCompanion(contextId: Value(null)));

      await (_db.delete(_db.contextsTable)..where((c) => c.id.equals(id))).go();
    });
  }

  TaskModel _mapTaskDataToModel(
    TasksTableData task,
    List<ChecklistItemsTableData> checklist,
  ) {
    return TaskModel(
      id: task.id,
      title: task.title,
      status: task.status == 'completed'
          ? TaskStatus.completed
          : TaskStatus.open,
      dueDate: task.dueDate,
      isAllDay: task.isAllDay,
      contextId: task.contextId,
      notes: task.notes,
      effortMinutes: task.effortMinutes,
      sourceExcerpt: task.sourceExcerpt,
      isDeleted: task.isDeleted,
      isReminderEnabled: task.isReminderEnabled,
      reminderLeadMinutes: task.reminderLeadMinutes,
      allDayReminderTime: task.allDayReminderTime,
      checklist: checklist
          .map(
            (c) => ChecklistItemModel(
              id: c.id,
              taskId: c.taskId,
              content: c.content,
              isCompleted: c.isCompleted,
              sortOrder: c.sortOrder,
              createdAt: c.createdAt,
              updatedAt: c.updatedAt,
            ),
          )
          .toList(),
      createdAt: task.createdAt,
      updatedAt: task.updatedAt,
    );
  }

  @override
  Future<void> insertReminder({
    required String id,
    required String taskId,
    required String type,
    required DateTime scheduledTime,
    required int leadTimeMinutes,
    required int notificationId,
  }) async {
    final now = DateTime.now();
    await _db.into(_db.remindersTable).insertOnConflictUpdate(
          RemindersTableCompanion.insert(
            id: id,
            taskId: taskId,
            type: type,
            scheduledTime: scheduledTime,
            leadTimeMinutes: Value(leadTimeMinutes),
            status: const Value('pending'),
            notificationId: notificationId,
            createdAt: Value(now),
            updatedAt: Value(now),
          ),
        );
  }

  @override
  Future<List<ReminderModel>> getRemindersForTask(String taskId) async {
    final rows = await (_db.select(_db.remindersTable)
          ..where((r) => r.taskId.equals(taskId)))
        .get();

    return rows
        .map(
          (r) => ReminderModel(
            id: r.id,
            taskId: r.taskId,
            type: r.type == 'start_working'
                ? ReminderType.startWorking
                : ReminderType.due,
            scheduledTime: r.scheduledTime,
            leadTimeMinutes: r.leadTimeMinutes,
            status: switch (r.status) {
              'fired' => ReminderStatus.fired,
              'cancelled' => ReminderStatus.cancelled,
              'dismissed' => ReminderStatus.dismissed,
              _ => ReminderStatus.pending,
            },
            notificationId: r.notificationId,
            createdAt: r.createdAt,
            updatedAt: r.updatedAt,
          ),
        )
        .toList();
  }

  @override
  Future<void> updateReminderStatus(String id, String status) async {
    await (_db.update(_db.remindersTable)..where((r) => r.id.equals(id))).write(
      RemindersTableCompanion(
        status: Value(status),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteRemindersForTask(String taskId) async {
    await (_db.delete(_db.remindersTable)
          ..where((r) => r.taskId.equals(taskId)))
        .go();
  }
}
