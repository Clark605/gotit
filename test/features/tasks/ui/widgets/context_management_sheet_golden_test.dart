import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/core/theme/app_theme.dart';
import 'package:gotit/features/tasks/cubit/tasks_cubit.dart';
import 'package:gotit/features/tasks/data/datasources/task_local_data_source_impl.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:gotit/features/tasks/ui/widgets/context_management_sheet.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

Widget _buildContextSheetTestApp({
  required TasksCubit tasksCubit,
  Locale locale = const Locale('en'),
}) {
  return MaterialApp(
    theme: AppTheme.light(),
    locale: locale,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [Locale('en'), Locale('ar')],
    home: Scaffold(
      body: BlocProvider.value(
        value: tasksCubit,
        child: const ContextManagementSheet(),
      ),
    ),
  );
}

void main() {
  late AppDatabase database;
  late TaskLocalDataSourceImpl dataSource;
  late TaskRepositoryImpl repository;
  late TasksCubit tasksCubit;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    dataSource = TaskLocalDataSourceImpl(database);
    repository = TaskRepositoryImpl(dataSource);
    tasksCubit = TasksCubit(repository);
  });

  tearDown(() async {
    await tasksCubit.close();
    await database.close();
  });

  group('ContextManagementSheet Widget Tests', () {
    testWidgets('renders default contexts with lock icon', (tester) async {
      tasksCubit.initSubscriptions();

      await tester.pumpWidget(
        _buildContextSheetTestApp(tasksCubit: tasksCubit),
      );
      await tester.pumpAndSettle();

      expect(find.text('Manage Contexts'), findsOneWidget);
      expect(find.text('Work'), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Personal'), findsOneWidget);
      expect(find.byIcon(Icons.lock_outline), findsNWidgets(3));
    });

    testWidgets('adds new custom context and renders with delete icon', (
      tester,
    ) async {
      tasksCubit.initSubscriptions();

      await tester.pumpWidget(
        _buildContextSheetTestApp(tasksCubit: tasksCubit),
      );
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'Finance');
      await tester.tap(find.text('Add Context'));
      await tester.pumpAndSettle();

      expect(find.text('Finance'), findsOneWidget);
      expect(find.byIcon(Icons.delete_outline), findsOneWidget);
    });

    testWidgets('renders in Arabic RTL', (tester) async {
      tasksCubit.initSubscriptions();

      await tester.pumpWidget(
        _buildContextSheetTestApp(
          tasksCubit: tasksCubit,
          locale: const Locale('ar'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('إدارة التصنيفات'), findsOneWidget);
      expect(find.text('إضافة تصنيف'), findsOneWidget);
    });
  });
}
