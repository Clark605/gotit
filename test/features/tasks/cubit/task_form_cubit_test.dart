import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/core/utils/load_status.dart';
import 'package:gotit/features/tasks/cubit/task_form_cubit.dart';
import 'package:gotit/features/tasks/data/datasources/task_local_data_source_impl.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository_impl.dart';

void main() {
  late AppDatabase database;
  late TaskLocalDataSourceImpl dataSource;
  late TaskRepositoryImpl repository;
  late TaskFormCubit cubit;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    dataSource = TaskLocalDataSourceImpl(database);
    repository = TaskRepositoryImpl(dataSource);
    cubit = TaskFormCubit(repository);
  });

  tearDown(() async {
    await cubit.close();
    await database.close();
  });

  group('TaskFormCubit', () {
    test('initial state has empty fields and LoadStatus.initial', () {
      expect(cubit.state.status, LoadStatus.initial);
      expect(cubit.state.title, '');
      expect(cubit.state.titleError, isNull);
      expect(cubit.state.checklistDrafts, isEmpty);
    });

    test('field updates mutate state appropriately', () {
      cubit.updateTitle('My task');
      expect(cubit.state.title, 'My task');

      final date = DateTime(2026, 12, 1);
      cubit.updateDueDate(date, isAllDay: true);
      expect(cubit.state.dueDate, date);
      expect(cubit.state.isAllDay, isTrue);

      cubit.updateContext('ctx-1');
      expect(cubit.state.contextId, 'ctx-1');

      cubit.updateEffortMinutes(45);
      expect(cubit.state.effortMinutes, 45);

      cubit.updateNotes('Some notes');
      expect(cubit.state.notes, 'Some notes');

      cubit.addChecklistItem('Step 1');
      cubit.addChecklistItem('Step 2');
      expect(cubit.state.checklistDrafts, ['Step 1', 'Step 2']);

      cubit.removeChecklistItem(0);
      expect(cubit.state.checklistDrafts, ['Step 2']);
    });

    test('save with empty title emits titleError and returns false', () async {
      cubit.updateTitle('   ');
      final result = await cubit.save();
      expect(result, isFalse);
      expect(cubit.state.titleError, 'Title cannot be empty');
      expect(cubit.state.status, LoadStatus.initial);
    });

    test(
      'save with valid title creates task and emits LoadStatus.success',
      () async {
        cubit.updateTitle('Finish presentation');
        cubit.addChecklistItem('Prepare slides');
        cubit.updateEffortMinutes(60);

        final result = await cubit.save();
        expect(result, isTrue);
        expect(cubit.state.status, LoadStatus.success);
        expect(cubit.state.failure, isNull);

        final tasks = await repository.watchTasks().first;
        expect(tasks.length, 1);
        expect(tasks.first.title, 'Finish presentation');
        expect(tasks.first.checklist.length, 1);
        expect(tasks.first.checklist.first.content, 'Prepare slides');
      },
    );
  });
}
