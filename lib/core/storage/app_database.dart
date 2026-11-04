import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';

part 'app_database.g.dart';

class ContextsTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().customConstraint('NOT NULL COLLATE NOCASE')();
  TextColumn get icon => text().nullable()();
  IntColumn get colorValue => integer().nullable()();
  BoolColumn get isDefault => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
    {name},
  ];
}

@TableIndex(
  name: 'tasks_status_deleted_due_idx',
  columns: {#status, #isDeleted, #dueDate},
)
@TableIndex(
  name: 'tasks_context_deleted_idx',
  columns: {#contextId, #isDeleted},
)
class TasksTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get status => text().withDefault(const Constant('open'))();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get isAllDay => boolean().withDefault(const Constant(false))();
  TextColumn get contextId => text().nullable().references(
    ContextsTable,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get notes => text().withDefault(const Constant(''))();
  IntColumn get effortMinutes => integer().nullable()();
  TextColumn get sourceExcerpt => text().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  // Phase 2 additions:
  BoolColumn get isReminderEnabled =>
      boolean().withDefault(const Constant(false))();
  IntColumn get reminderLeadMinutes => integer().nullable()();
  TextColumn get allDayReminderTime => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@TableIndex(name: 'checklist_task_order_idx', columns: {#taskId, #sortOrder})
class ChecklistItemsTable extends Table {
  TextColumn get id => text()();
  TextColumn get taskId =>
      text().references(TasksTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get content => text()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@TableIndex(name: 'reminders_task_idx', columns: {#taskId})
@TableIndex(
  name: 'reminders_status_time_idx',
  columns: {#status, #scheduledTime},
)
class RemindersTable extends Table {
  TextColumn get id => text()();
  TextColumn get taskId =>
      text().references(TasksTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get type => text()(); // 'due' or 'start_working'
  DateTimeColumn get scheduledTime => dateTime()();
  IntColumn get leadTimeMinutes => integer().withDefault(const Constant(0))();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  IntColumn get notificationId => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@lazySingleton
@DriftDatabase(
  tables: [ContextsTable, TasksTable, ChecklistItemsTable, RemindersTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 2;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'gotit_database');
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      final now = DateTime.now();
      await into(contextsTable).insert(
        ContextsTableCompanion.insert(
          id: 'context-work',
          name: 'Work',
          isDefault: const Value(true),
          createdAt: Value(now),
          updatedAt: Value(now),
        ),
      );
      await into(contextsTable).insert(
        ContextsTableCompanion.insert(
          id: 'context-home',
          name: 'Home',
          isDefault: const Value(true),
          createdAt: Value(now),
          updatedAt: Value(now),
        ),
      );
      await into(contextsTable).insert(
        ContextsTableCompanion.insert(
          id: 'context-personal',
          name: 'Personal',
          isDefault: const Value(true),
          createdAt: Value(now),
          updatedAt: Value(now),
        ),
      );
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(remindersTable);
        await m.addColumn(tasksTable, tasksTable.isReminderEnabled);
        await m.addColumn(tasksTable, tasksTable.reminderLeadMinutes);
        await m.addColumn(tasksTable, tasksTable.allDayReminderTime);
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
