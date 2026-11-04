import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/features/tasks/data/datasources/task_local_data_source_impl.dart';
import 'package:gotit/features/tasks/data/models/checklist_item_model.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository_impl.dart';

void main() {
  late AppDatabase database;
  late TaskLocalDataSourceImpl dataSource;
  late TaskRepositoryImpl repository;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    dataSource = TaskLocalDataSourceImpl(database);
    repository = TaskRepositoryImpl(dataSource);
  });

  tearDown(() async {
    await database.close();
  });

  group('TaskRepository createTask', () {
    test('creates a task with checklist items and persists offline', () async {
      final now = DateTime.now();
      final checklistItem = ChecklistItemModel(
        id: 'chk-1',
        taskId: 'task-100',
        content: 'Buy milk',
        isCompleted: false,
        sortOrder: 0,
        createdAt: now,
        updatedAt: now,
      );

      final task = TaskModel(
        id: 'task-100',
        title: 'Grocery shopping',
        status: TaskStatus.open,
        dueDate: now.add(const Duration(hours: 2)),
        isAllDay: false,
        effortMinutes: 30,
        notes: 'Check organic section',
        checklist: [checklistItem],
        createdAt: now,
        updatedAt: now,
      );

      final created = await repository.createTask(task);
      expect(created.id, 'task-100');
      expect(created.title, 'Grocery shopping');
      expect(created.checklist.length, 1);
      expect(created.checklist.first.content, 'Buy milk');

      // Verify retrieval by ID
      final fetched = await repository.getTaskById('task-100');
      expect(fetched.title, 'Grocery shopping');
      expect(fetched.effortMinutes, 30);
      expect(fetched.checklist.length, 1);
      expect(fetched.checklist.first.id, 'chk-1');
      expect(fetched.checklist.first.isCompleted, isFalse);
    });
  });
}
