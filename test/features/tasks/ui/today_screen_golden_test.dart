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
import 'package:gotit/features/tasks/ui/today_screen.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

Widget _buildTodayTestApp({
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
      child: const TodayScreen(),
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

  group('TodayScreen Widget Tests', () {
    testWidgets('renders empty state when no tasks are scheduled', (
      tester,
    ) async {
      tasksCubit.initSubscriptions();
      await tester.pumpWidget(
        _buildTodayTestApp(tasksCubit: tasksCubit, formCubit: formCubit),
      );
      await tester.pumpAndSettle();

      expect(find.text('All clear for today'), findsOneWidget);
      expect(find.text('Add a task'), findsOneWidget);
    });

    testWidgets('renders Overdue and Due Today sections with tasks', (
      tester,
    ) async {
      final now = DateTime.now();
      final yesterday = now.subtract(const Duration(days: 1));

      await repository.createTask(
        TaskModel(
          id: 't-1',
          title: 'Submit quarterly report',
          dueDate: yesterday,
          createdAt: yesterday,
          updatedAt: yesterday,
        ),
      );

      await repository.createTask(
        TaskModel(
          id: 't-2',
          title: 'Design review',
          dueDate: now,
          isAllDay: true,
          createdAt: now,
          updatedAt: now,
        ),
      );

      tasksCubit.initSubscriptions();
      await tester.pumpWidget(
        _buildTodayTestApp(tasksCubit: tasksCubit, formCubit: formCubit),
      );
      await tester.pumpAndSettle();

      expect(find.text('Overdue'), findsOneWidget);
      expect(find.text('Due Today'), findsOneWidget);
      expect(find.text('Submit quarterly report'), findsOneWidget);
      expect(find.text('Design review'), findsOneWidget);
    });

    testWidgets('renders properly in Arabic RTL', (tester) async {
      tasksCubit.initSubscriptions();
      await tester.pumpWidget(
        _buildTodayTestApp(
          tasksCubit: tasksCubit,
          formCubit: formCubit,
          locale: const Locale('ar'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('اليوم'), findsWidgets);
      expect(find.text('لا توجد مهام متبقية لليوم'), findsOneWidget);
    });
  });
}
