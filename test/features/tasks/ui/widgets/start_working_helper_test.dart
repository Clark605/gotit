import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/core/theme/app_theme.dart';
import 'package:gotit/features/tasks/cubit/task_form_cubit.dart';
import 'package:gotit/features/tasks/data/datasources/task_local_data_source_impl.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:gotit/features/tasks/ui/widgets/task_form_sheet.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';
import 'package:intl/intl.dart';

Widget _buildHelperTestApp({
  required TaskFormCubit cubit,
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
    home: Scaffold(
      body: BlocProvider.value(
        value: cubit,
        child: const TaskFormSheet(),
      ),
    ),
  );
}

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

  group('StartWorkingHelperCard Widget Tests', () {
    testWidgets(
        'renders helper card with accurate calculated time when effort and future timed due date are present',
        (tester) async {
      final now = DateTime.now();
      final futureDue = DateTime(now.year, now.month, now.day + 1, 16, 0); // Tomorrow at 4:00 PM
      const effort = 45; // 45m lead -> 3:15 PM

      cubit.updateDueDate(futureDue, isAllDay: false);
      cubit.updateEffortMinutes(effort);
      cubit.toggleReminder(true);

      await tester.pumpWidget(_buildHelperTestApp(cubit: cubit));
      await tester.pumpAndSettle();

      final expectedTime = DateFormat('h:mm a').format(
        futureDue.subtract(const Duration(minutes: effort)),
      );

      expect(find.byIcon(Icons.access_time_filled), findsOneWidget);
      expect(find.textContaining(expectedTime), findsOneWidget);
      expect(find.textContaining('45m'), findsOneWidget);
    });

    testWidgets('hides helper card when task is all-day', (tester) async {
      final futureDue = DateTime.now().add(const Duration(hours: 4));
      cubit.updateDueDate(futureDue, isAllDay: true);
      cubit.updateEffortMinutes(30);
      cubit.toggleReminder(true);

      await tester.pumpWidget(_buildHelperTestApp(cubit: cubit));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.access_time_filled), findsNothing);
    });

    testWidgets('hides helper card when reminder is disabled',
        (tester) async {
      final futureDue = DateTime.now().add(const Duration(hours: 4));
      cubit.updateDueDate(futureDue, isAllDay: false);
      cubit.updateEffortMinutes(30);
      cubit.toggleReminder(false);

      await tester.pumpWidget(_buildHelperTestApp(cubit: cubit));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.access_time_filled), findsNothing);
    });
  });
}
