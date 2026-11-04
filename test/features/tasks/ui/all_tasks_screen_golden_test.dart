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

Widget _buildAllTasksScreenApp({
  required TasksCubit tasksCubit,
  required TaskFormCubit formCubit,
  ThemeData? theme,
  Locale locale = const Locale('en'),
}) {
  return MaterialApp(
    theme: theme ?? AppTheme.light(),
    locale: locale,
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

  group('AllTasksScreen Golden Tests', () {
    testWidgets('renders all tasks screen with tasks in English Light mode', (
      tester,
    ) async {
      final now = DateTime.now();

      await repository.createTask(
        TaskModel(
          id: 't-1',
          title: 'Review proposal',
          status: TaskStatus.open,
          createdAt: now,
          updatedAt: now,
        ),
      );

      tasksCubit.initSubscriptions();

      await tester.pumpWidget(
        _buildAllTasksScreenApp(tasksCubit: tasksCubit, formCubit: formCubit),
      );
      await tester.pumpAndSettle();

      expect(find.text('Tasks'), findsNWidgets(2)); // Title and bottom nav
      expect(find.text('Review proposal'), findsOneWidget);
      expect(find.text('Active'), findsOneWidget);
      expect(find.text('Completed'), findsOneWidget);
    });

    testWidgets('renders in Arabic RTL properly', (tester) async {
      tasksCubit.initSubscriptions();

      await tester.pumpWidget(
        _buildAllTasksScreenApp(
          tasksCubit: tasksCubit,
          formCubit: formCubit,
          locale: const Locale('ar'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('المهام'), findsNWidgets(2));
      expect(find.text('النشطة'), findsOneWidget);
      expect(find.text('المكتملة'), findsOneWidget);
    });
  });
}
