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

  group('TaskDetailRepository checklist & soft delete', () {
    test(
      'toggling checklist item does not affect parent task status (FR-005)',
      () async {
        final now = DateTime.now();
        final item1 = ChecklistItemModel(
          id: 'c-1',
          taskId: 't-1',
          content: 'Item 1',
          isCompleted: false,
          sortOrder: 0,
          createdAt: now,
          updatedAt: now,
        );

        final task = TaskModel(
          id: 't-1',
          title: 'Project roadmap',
          status: TaskStatus.open,
          checklist: [item1],
          createdAt: now,
          updatedAt: now,
        );

        await repository.createTask(task);

        // Toggle checklist item
        final updatedItem = await repository.toggleChecklistItem(
          taskId: 't-1',
          itemId: 'c-1',
        );
        expect(updatedItem.isCompleted, isTrue);

        // Parent task remains open
        final parentTask = await repository.getTaskById('t-1');
        expect(parentTask.status, TaskStatus.open);
        expect(parentTask.checklist.first.isCompleted, isTrue);
      },
    );

    test(
      'soft delete sets isDeleted=true and excludes task from streams (FR-007)',
      () async {
        final now = DateTime.now();
        final task = TaskModel(
          id: 't-del',
          title: 'To be deleted',
          dueDate: now,
          createdAt: now,
          updatedAt: now,
        );

        await repository.createTask(task);
        var allTasks = await repository.watchTasks().first;
        expect(allTasks.any((t) => t.id == 't-del'), isTrue);

        await repository.deleteTask('t-del');

        allTasks = await repository.watchTasks().first;
        expect(allTasks.any((t) => t.id == 't-del'), isFalse);
      },
    );
  });
}
