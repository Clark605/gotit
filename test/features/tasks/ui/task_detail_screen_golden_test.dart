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
import 'package:gotit/features/tasks/data/models/checklist_item_model.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:gotit/features/tasks/ui/task_detail_screen.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

Widget _buildDetailScreenApp({
  required TasksCubit tasksCubit,
  required TaskFormCubit formCubit,
  required String taskId,
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
      child: TaskDetailScreen(taskId: taskId),
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

  group('TaskDetailScreen Golden & Visual Tests', () {
    testWidgets('renders detail screen in English Light mode', (tester) async {
      final now = DateTime.now();
      await repository.createTask(
        TaskModel(
          id: 't-detail-1',
          title: 'Review Project Spec',
          dueDate: now.add(const Duration(hours: 4)),
          notes: 'Make sure architecture conforms to rules',
          effortMinutes: 45,
          checklist: [
            ChecklistItemModel(
              id: 'c-1',
              taskId: 't-detail-1',
              content: 'Check imports',
              isCompleted: false,
              sortOrder: 0,
              createdAt: now,
              updatedAt: now,
            ),
          ],
          createdAt: now,
          updatedAt: now,
        ),
      );

      tasksCubit.initSubscriptions();

      await tester.pumpWidget(
        _buildDetailScreenApp(
          tasksCubit: tasksCubit,
          formCubit: formCubit,
          taskId: 't-detail-1',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Review Project Spec'), findsOneWidget);
      expect(find.text('Active'), findsOneWidget);
      expect(find.text('Check imports'), findsOneWidget);
      expect(find.text('Notes'), findsOneWidget);
      expect(
        find.text('Make sure architecture conforms to rules'),
        findsOneWidget,
      );
    });

    testWidgets('renders detail screen in Arabic RTL', (tester) async {
      final now = DateTime.now();
      await repository.createTask(
        TaskModel(
          id: 't-detail-ar',
          title: 'مراجعة التصميم',
          dueDate: now,
          notes: 'ملاحظات تفصيلية',
          createdAt: now,
          updatedAt: now,
        ),
      );

      tasksCubit.initSubscriptions();

      await tester.pumpWidget(
        _buildDetailScreenApp(
          tasksCubit: tasksCubit,
          formCubit: formCubit,
          taskId: 't-detail-ar',
          locale: const Locale('ar'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('مراجعة التصميم'), findsOneWidget);
      expect(find.text('النشطة'), findsOneWidget);
      expect(find.text('الملاحظات'), findsOneWidget);
      expect(find.text('ملاحظات تفصيلية'), findsOneWidget);
    });
  });
}
