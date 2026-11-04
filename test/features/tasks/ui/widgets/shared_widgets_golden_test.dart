import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/theme/app_theme.dart';
import 'package:gotit/features/tasks/data/models/checklist_item_model.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/ui/widgets/add_button.dart';
import 'package:gotit/features/tasks/ui/widgets/bottom_nav_bar.dart';
import 'package:gotit/features/tasks/ui/widgets/context_tag.dart';
import 'package:gotit/features/tasks/ui/widgets/empty_state_widget.dart';
import 'package:gotit/features/tasks/ui/widgets/task_card.dart';
import 'package:gotit/features/tasks/ui/widgets/today_section_header.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

Widget _buildTestApp({
  required Widget child,
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
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  group('Shared Widgets Tests', () {
    testWidgets('ContextTag renders with correct title and pastel background', (
      tester,
    ) async {
      await tester.pumpWidget(
        _buildTestApp(child: const ContextTag(name: 'Work')),
      );

      expect(find.text('Work'), findsOneWidget);
    });

    testWidgets('TodaySectionHeader displays regular and overdue styles', (
      tester,
    ) async {
      await tester.pumpWidget(
        _buildTestApp(
          child: const Column(
            children: [
              TodaySectionHeader(title: 'Due Today', count: 3),
              TodaySectionHeader(title: 'Overdue', count: 1, isOverdue: true),
            ],
          ),
        ),
      );

      expect(find.text('Due Today'), findsOneWidget);
      expect(find.text('(3)'), findsOneWidget);
      expect(find.text('Overdue'), findsOneWidget);
      expect(find.text('(1)'), findsOneWidget);
      expect(find.byIcon(Icons.warning_amber_rounded), findsOneWidget);
    });

    testWidgets(
      'TaskCard renders title, context, due date, effort, and checklist count',
      (tester) async {
        final now = DateTime.now();
        final task = TaskModel(
          id: 't-1',
          title: 'Submit tax return',
          status: TaskStatus.open,
          dueDate: now,
          isAllDay: false,
          effortMinutes: 45,
          checklist: [
            ChecklistItemModel(
              id: 'c-1',
              taskId: 't-1',
              content: 'Collect receipts',
              isCompleted: true,
              sortOrder: 0,
              createdAt: now,
              updatedAt: now,
            ),
            ChecklistItemModel(
              id: 'c-2',
              taskId: 't-1',
              content: 'Fill W2 form',
              isCompleted: false,
              sortOrder: 1,
              createdAt: now,
              updatedAt: now,
            ),
          ],
          createdAt: now,
          updatedAt: now,
        );

        bool toggled = false;
        bool tapped = false;

        await tester.pumpWidget(
          _buildTestApp(
            child: TaskCard(
              task: task,
              contextName: 'Finance',
              onToggle: () => toggled = true,
              onTap: () => tapped = true,
            ),
          ),
        );

        expect(find.text('Submit tax return'), findsOneWidget);
        expect(find.text('Finance'), findsOneWidget);
        expect(find.text('45m'), findsOneWidget);
        expect(find.text('1/2'), findsOneWidget);

        await tester.tap(find.byType(InkResponse).first);
        expect(toggled, isTrue);

        await tester.tap(find.text('Submit tax return'));
        expect(tapped, isTrue);
      },
    );

    testWidgets('AddButton triggers callback when pressed', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        _buildTestApp(child: AddButton(onPressed: () => pressed = true)),
      );

      await tester.tap(find.byType(AddButton));
      expect(pressed, isTrue);
    });

    testWidgets('BottomNavBar renders tabs and switches on tap', (
      tester,
    ) async {
      BottomNavTab selectedTab = BottomNavTab.today;
      await tester.pumpWidget(
        _buildTestApp(
          child: BottomNavBar(
            currentTab: selectedTab,
            onTabSelected: (tab) => selectedTab = tab,
          ),
        ),
      );

      expect(find.text('Today'), findsOneWidget);
      expect(find.text('Tasks'), findsOneWidget);

      await tester.tap(find.text('Tasks'));
      expect(selectedTab, BottomNavTab.allTasks);
    });

    testWidgets('EmptyStateWidget renders message and action button', (
      tester,
    ) async {
      bool actionTapped = false;
      await tester.pumpWidget(
        _buildTestApp(
          child: EmptyStateWidget(
            title: 'No tasks scheduled',
            subtitle: 'Enjoy your free day!',
            actionLabel: 'Add Task',
            onAction: () => actionTapped = true,
          ),
        ),
      );

      expect(find.text('No tasks scheduled'), findsOneWidget);
      expect(find.text('Enjoy your free day!'), findsOneWidget);
      expect(find.text('Add Task'), findsOneWidget);

      await tester.tap(find.text('Add Task'));
      expect(actionTapped, isTrue);
    });
  });
}
