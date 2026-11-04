import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/core/theme/app_theme.dart';
import 'package:gotit/core/widgets/reminder_lead_time_chips.dart';
import 'package:gotit/features/tasks/cubit/task_form_cubit.dart';
import 'package:gotit/features/tasks/data/datasources/task_local_data_source_impl.dart';
import 'package:gotit/features/tasks/data/models/context_model.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:gotit/features/tasks/ui/widgets/task_form_sheet.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

Widget _buildFormTestApp({
  required TaskFormCubit cubit,
  List<ContextModel> contexts = const [],
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
        child: TaskFormSheet(contexts: contexts),
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

  group('TaskFormSheet Reminders Section', () {
    testWidgets('renders reminder toggle switch initially off',
        (tester) async {
      await tester.pumpWidget(_buildFormTestApp(cubit: cubit));
      await tester.pumpAndSettle();

      final reminderSwitch = find.byKey(const Key('reminder_switch'));
      expect(reminderSwitch, findsOneWidget);

      final switchWidget = tester.widget<Switch>(reminderSwitch);
      expect(switchWidget.value, isFalse);
      expect(find.byType(ReminderLeadTimeChips), findsNothing);
    });

    testWidgets(
        'toggling reminder on reveals lead time chips and updates cubit',
        (tester) async {
      await tester.pumpWidget(_buildFormTestApp(cubit: cubit));
      await tester.pumpAndSettle();

      final reminderSwitch = find.byKey(const Key('reminder_switch'));
      await tester.tap(reminderSwitch);
      await tester.pumpAndSettle();

      expect(cubit.state.isReminderEnabled, isTrue);
      expect(find.byType(ReminderLeadTimeChips), findsOneWidget);

      // Tap 30m chip
      final chip30m = find.text('30m before');
      expect(chip30m, findsOneWidget);
      await tester.tap(chip30m);
      await tester.pumpAndSettle();

      expect(cubit.state.reminderLeadMinutes, equals(30));
    });

    testWidgets('renders all-day alert time when isAllDay is selected',
        (tester) async {
      cubit.updateDueDate(DateTime.now(), isAllDay: true);
      cubit.toggleReminder(true);

      await tester.pumpWidget(_buildFormTestApp(cubit: cubit));
      await tester.pumpAndSettle();

      expect(find.text('Alert Time'), findsOneWidget);
      expect(find.text('09:00'), findsOneWidget);
      expect(find.byType(ReminderLeadTimeChips), findsNothing);
    });

    testWidgets(
        'renders start-working notice when effort and future timed due date are set',
        (tester) async {
      final futureDue = DateTime.now().add(const Duration(hours: 3));
      cubit.updateDueDate(futureDue, isAllDay: false);
      cubit.updateEffortMinutes(45);
      cubit.toggleReminder(true);

      await tester.pumpWidget(_buildFormTestApp(cubit: cubit));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.access_time_filled), findsOneWidget);
    });
  });
}
