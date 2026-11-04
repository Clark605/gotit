import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/features/tasks/cubit/tasks_cubit.dart';
import 'package:gotit/features/tasks/data/datasources/task_local_data_source_impl.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository_impl.dart';

void main() {
  late AppDatabase database;
  late TaskLocalDataSourceImpl dataSource;
  late TaskRepositoryImpl repository;
  late TasksCubit cubit;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    dataSource = TaskLocalDataSourceImpl(database);
    repository = TaskRepositoryImpl(dataSource);
    cubit = TasksCubit(repository);
  });

  tearDown(() async {
    await cubit.close();
    await database.close();
  });

  group('TasksCubit Today View', () {
    test(
      'categorizes tasks into Overdue, Due Today, and Start Today',
      () async {
        final now = DateTime.now();
        final yesterday = now.subtract(const Duration(days: 1));
        final todayTimed = DateTime(now.year, now.month, now.day, 14, 0);
        final todayAllDay = DateTime(now.year, now.month, now.day);
        final tomorrowWithEffort = now.add(
          const Duration(days: 1),
        ); // effort: 2 days (2880 mins) -> start today

        // 1. Overdue task
        await repository.createTask(
          TaskModel(
            id: 't-overdue',
            title: 'Overdue assignment',
            dueDate: yesterday,
            isAllDay: false,
            createdAt: yesterday,
            updatedAt: yesterday,
          ),
        );

        // 2. Due Today all-day
        await repository.createTask(
          TaskModel(
            id: 't-today-allday',
            title: 'All day presentation',
            dueDate: todayAllDay,
            isAllDay: true,
            createdAt: now,
            updatedAt: now,
          ),
        );

        // 3. Due Today timed
        await repository.createTask(
          TaskModel(
            id: 't-today-timed',
            title: 'Team sync',
            dueDate: todayTimed,
            isAllDay: false,
            createdAt: now,
            updatedAt: now,
          ),
        );

        // 4. Start Today (due tomorrow, 2 days of effort)
        await repository.createTask(
          TaskModel(
            id: 't-start-today',
            title: 'Long preparation',
            dueDate: tomorrowWithEffort,
            isAllDay: false,
            effortMinutes: 2880,
            createdAt: now,
            updatedAt: now,
          ),
        );

        cubit.initSubscriptions();

        // Wait for stream emission
        await expectLater(
          cubit.stream.map((s) => s.todayTasks.length),
          emitsThrough(4),
        );

        final todayTasks = cubit.state.todayTasks;
        expect(todayTasks.any((t) => t.id == 't-overdue'), isTrue);
        expect(todayTasks.any((t) => t.id == 't-today-allday'), isTrue);
        expect(todayTasks.any((t) => t.id == 't-today-timed'), isTrue);
        expect(todayTasks.any((t) => t.id == 't-start-today'), isTrue);
      },
    );
  });
}
