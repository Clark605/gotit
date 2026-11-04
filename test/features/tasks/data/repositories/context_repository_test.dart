import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/features/tasks/data/datasources/task_local_data_source_impl.dart';
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

  group('ContextRepository Tests', () {
    test('enforces case-insensitive uniqueness validation (FR-008)', () async {
      // Create 'Finance'
      await repository.createContext(name: 'Finance');

      // Attempt creating 'finance' in lowercase should throw StateError
      expect(
        () => repository.createContext(name: '  finance  '),
        throwsA(isA<StateError>()),
      );
    });

    test('protects default contexts from deletion (FR-008)', () async {
      final contexts = await repository.watchContexts().first;
      final defaultCtx = contexts.firstWhere((c) => c.isDefault);

      expect(
        () => repository.deleteContext(defaultCtx.id),
        throwsA(isA<StateError>()),
      );
    });

    test(
      'safe unassign on delete sets task contextId to null (FR-008, Clarification Q3)',
      () async {
        final custom = await repository.createContext(name: 'Fitness');
        final now = DateTime.now();

        final task = await repository.createTask(
          TaskModel(
            id: 'task-fit-1',
            title: 'Gym workout',
            contextId: custom.id,
            createdAt: now,
            updatedAt: now,
          ),
        );
        expect(task.contextId, custom.id);

        // Delete custom context
        await repository.deleteContext(custom.id);

        // Check that the task is preserved and contextId is null
        final preservedTask = await repository.getTaskById('task-fit-1');
        expect(preservedTask.contextId, isNull);
      },
    );
  });
}
