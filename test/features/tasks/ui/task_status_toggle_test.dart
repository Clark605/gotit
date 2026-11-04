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

Widget _buildDetailTestApp({
  required TasksCubit tasksCubit,
  required TaskFormCubit formCubit,
  required String taskId,
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

  group('Task Status Toggle & Checklist Checkoff Widget Tests', () {
    testWidgets('toggles task status and checklist items', (tester) async {
      final now = DateTime.now();
      final item = ChecklistItemModel(
        id: 'chk-1',
        taskId: 't-1',
        content: 'Collect notes',
        isCompleted: false,
        sortOrder: 0,
        createdAt: now,
        updatedAt: now,
      );

      final task = TaskModel(
        id: 't-1',
        title: 'Weekly Standup Prep',
        status: TaskStatus.open,
        checklist: [item],
        createdAt: now,
        updatedAt: now,
      );

      await repository.createTask(task);
      tasksCubit.initSubscriptions();

      await tester.pumpWidget(
        _buildDetailTestApp(
          tasksCubit: tasksCubit,
          formCubit: formCubit,
          taskId: 't-1',
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Weekly Standup Prep'), findsOneWidget);
      expect(find.text('Active'), findsOneWidget);
      expect(find.text('Collect notes'), findsOneWidget);

      // Toggle checklist item
      await tester.tap(find.text('Collect notes'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pumpAndSettle();

      // Check that checklist progress updated
      expect(find.text('1 of 1 completed'), findsOneWidget);

      // Toggle main task status
      await tester.tap(find.text('Active'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pumpAndSettle();

      expect(find.text('Completed'), findsOneWidget);
    });
  });
}
