import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:sqlite3/sqlite3.dart';

void main() {
  group('AppDatabase schema migration (v1 -> v2)', () {
    test('upgrade from v1 to v2 preserves existing tasks and creates RemindersTable', () async {
      final rawDb = sqlite3.openInMemory();

      // 1. Initialize v1 schema in sqlite3 directly
      rawDb.execute('''
        CREATE TABLE contexts_table (
          id TEXT NOT NULL PRIMARY KEY,
          name TEXT NOT NULL COLLATE NOCASE,
          icon TEXT,
          color_value INTEGER,
          is_default INTEGER NOT NULL DEFAULT 0,
          created_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
          updated_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
          UNIQUE (name)
        );
      ''');

      rawDb.execute('''
        CREATE TABLE tasks_table (
          id TEXT NOT NULL PRIMARY KEY,
          title TEXT NOT NULL,
          status TEXT NOT NULL DEFAULT 'open',
          due_date INTEGER,
          is_all_day INTEGER NOT NULL DEFAULT 0,
          context_id TEXT REFERENCES contexts_table(id) ON DELETE SET NULL,
          notes TEXT NOT NULL DEFAULT '',
          effort_minutes INTEGER,
          source_excerpt TEXT,
          is_deleted INTEGER NOT NULL DEFAULT 0,
          created_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
          updated_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now'))
        );
      ''');

      rawDb.execute('''
        CREATE TABLE checklist_items_table (
          id TEXT NOT NULL PRIMARY KEY,
          task_id TEXT NOT NULL REFERENCES tasks_table(id) ON DELETE CASCADE,
          content TEXT NOT NULL,
          is_completed INTEGER NOT NULL DEFAULT 0,
          sort_order INTEGER NOT NULL DEFAULT 0,
          created_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now')),
          updated_at INTEGER NOT NULL DEFAULT (strftime('%s', 'now'))
        );
      ''');

      // Set user_version to 1
      rawDb.execute('PRAGMA user_version = 1;');

      // Insert a test task into v1 schema
      rawDb.execute('''
        INSERT INTO tasks_table (id, title, status, notes)
        VALUES ('task-v1-1', 'Existing V1 Task', 'open', 'Some notes');
      ''');

      // 2. Open via Drift AppDatabase with schemaVersion = 2
      final db = AppDatabase.forTesting(NativeDatabase.opened(rawDb));

      // 3. Verify existing task is preserved and new columns exist with defaults
      final task = await (db.select(db.tasksTable)
            ..where((t) => t.id.equals('task-v1-1')))
          .getSingle();

      expect(task.id, equals('task-v1-1'));
      expect(task.title, equals('Existing V1 Task'));
      expect(task.isReminderEnabled, isFalse);
      expect(task.reminderLeadMinutes, isNull);
      expect(task.allDayReminderTime, isNull);

      // 4. Verify RemindersTable is created and accepts rows
      final now = DateTime.now();
      await db.into(db.remindersTable).insert(
            RemindersTableCompanion.insert(
              id: 'rem-1',
              taskId: 'task-v1-1',
              type: 'due',
              scheduledTime: now.add(const Duration(hours: 1)),
              leadTimeMinutes: const Value(15),
              status: const Value('pending'),
              notificationId: 101,
              createdAt: Value(now),
              updatedAt: Value(now),
            ),
          );

      final reminders = await (db.select(db.remindersTable)
            ..where((r) => r.taskId.equals('task-v1-1')))
          .get();

      expect(reminders.length, equals(1));
      expect(reminders.first.id, equals('rem-1'));
      expect(reminders.first.notificationId, equals(101));
      expect(reminders.first.leadTimeMinutes, equals(15));
      expect(reminders.first.status, equals('pending'));

      await db.close();
    });
  });
}
