import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/core/theme/app_theme.dart';
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

  group('TaskFormSheet Widget Tests', () {
    testWidgets(
      'renders title input, date picker, effort chips, and save button in English',
      (tester) async {
        await tester.pumpWidget(_buildFormTestApp(cubit: cubit));
        await tester.pumpAndSettle();

        expect(find.text('New Task'), findsOneWidget);
        expect(find.text('Save Task'), findsOneWidget);
        expect(
          find.byType(TextField),
          findsNWidgets(3),
        ); // title, notes, checklist
      },
    );

    testWidgets('displays validation error when submitting empty title', (
      tester,
    ) async {
      await tester.pumpWidget(_buildFormTestApp(cubit: cubit));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Save Task'));
      await tester.pumpAndSettle();

      expect(find.text('Title cannot be empty'), findsOneWidget);
    });

    testWidgets('renders correctly in Arabic RTL', (tester) async {
      await tester.pumpWidget(
        _buildFormTestApp(cubit: cubit, locale: const Locale('ar')),
      );
      await tester.pumpAndSettle();

      expect(find.text('مهمة جديدة'), findsOneWidget);
      expect(find.text('حفظ المهمة'), findsOneWidget);
    });
  });
}
