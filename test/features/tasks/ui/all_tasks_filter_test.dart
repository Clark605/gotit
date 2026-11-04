import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/core/theme/app_theme.dart';
import 'package:gotit/features/tasks/cubit/task_form_cubit.dart';
import 'package:gotit/features/tasks/cubit/tasks_cubit.dart';
import 'package:gotit/features/tasks/data/datasources/task_local_data_source_impl.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:gotit/features/tasks/ui/all_tasks_screen.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

Widget _buildAllTasksTestApp({
  required TasksCubit tasksCubit,
  required TaskFormCubit formCubit,
}) {
  return MaterialApp(
    theme: AppTheme.light(),
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [Locale('en'), Locale('ar')],
    home: MultiBlocProvider(
      providers: [
        BlocProvider.value(value: tasksCubit),
        BlocProvider.value(value: formCubit),
      ],
      child: const AllTasksScreen(),
    ),
  );
}

void main() {
  late AppDatabase database;
  late TaskLocalDataSourceImpl dataSource;
  late TaskRepositoryImpl repository;
  late TasksCubit tasksCubit;
  late TaskFormCubit formCubit;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    dataSource = TaskLocalDataSourceImpl(database);
    repository = TaskRepositoryImpl(dataSource);
    tasksCubit = TasksCubit(repository);
    formCubit = TaskFormCubit(repository);
  });

  tearDown(() async {
    await tasksCubit.close();
    await formCubit.close();
    await database.close();
  });

  group('AllTasksScreen Filter Tests', () {
    testWidgets('filters tasks by status (Active, Completed, All)', (
      tester,
    ) async {
      final now = DateTime.now();

      await repository.createTask(
        TaskModel(
          id: 't-act',
          title: 'Active Task',
          status: TaskStatus.open,
          createdAt: now,
          updatedAt: now,
        ),
      );

      await repository.createTask(
        TaskModel(
          id: 't-comp',
          title: 'Done Task',
          status: TaskStatus.completed,
          createdAt: now,
          updatedAt: now,
        ),
      );

      tasksCubit.initSubscriptions();

      await tester.pumpWidget(
        _buildAllTasksTestApp(tasksCubit: tasksCubit, formCubit: formCubit),
      );
      await tester.pumpAndSettle();

      // Initially status is null (All tasks)
      expect(find.text('Active Task'), findsOneWidget);
      expect(find.text('Done Task'), findsOneWidget);

      // Tap 'Active' tab
      await tester.tap(find.text('Active'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pumpAndSettle();

      expect(find.text('Active Task'), findsOneWidget);
      expect(find.text('Done Task'), findsNothing);

      // Tap 'Completed' tab
      await tester.tap(find.text('Completed'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pumpAndSettle();

      expect(find.text('Active Task'), findsNothing);
      expect(find.text('Done Task'), findsOneWidget);
    });
  });
}
