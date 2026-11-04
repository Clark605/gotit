import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/services/reminder_service.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/features/tasks/data/datasources/task_local_data_source_impl.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository_impl.dart';

class _MockReminderService implements IReminderService {
  final List<String> cancelledTasks = [];
  final List<TaskReminderSchedule> syncedSchedules = [];
  final List<String> snoozedTasks = [];
  bool restoreCalled = false;

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> hasNotificationPermission() async => true;

  @override
  Future<bool> requestNotificationPermission() async => true;

  @override
  Future<bool> hasExactAlarmPermission() async => true;

  @override
  Future<void> requestExactAlarmPermission() async {}

  @override
  Future<void> syncReminderSchedule(TaskReminderSchedule schedule) async {
    syncedSchedules.add(schedule);
  }

  @override
  Future<void> cancelForTask(String taskId) async {
    cancelledTasks.add(taskId);
  }

  @override
  Future<void> snoozeReminder(String taskId, {int minutes = 15}) async {
    snoozedTasks.add(taskId);
  }

  @override
  Future<void> restoreAndReconcileSchedule() async {
    restoreCalled = true;
  }
}

void main() {
  late AppDatabase database;
  late TaskLocalDataSourceImpl dataSource;
  late _MockReminderService mockReminderService;
  late TaskRepositoryImpl repository;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    dataSource = TaskLocalDataSourceImpl(database);
    mockReminderService = _MockReminderService();
    repository = TaskRepositoryImpl(dataSource, mockReminderService);
  });

  tearDown(() async {
    await database.close();
  });

  group('TaskRepository Lifecycle Synchronization with ReminderService', () {
    test('createTask triggers syncReminderSchedule', () async {
      final now = DateTime.now();
      final task = TaskModel(
        id: 'task-rem-1',
        title: 'Call doctor',
        dueDate: now.add(const Duration(hours: 1)),
        isReminderEnabled: true,
        reminderLeadMinutes: 15,
        createdAt: now,
        updatedAt: now,
      );

      await repository.createTask(task);

      expect(mockReminderService.syncedSchedules.length, equals(1));
      expect(
        mockReminderService.syncedSchedules.first.taskId,
        equals('task-rem-1'),
      );
      expect(
        mockReminderService.syncedSchedules.first.isReminderEnabled,
        isTrue,
      );
    });

    test(
      'updateTask triggers syncReminderSchedule with updated values',
      () async {
        final now = DateTime.now();
        final task = TaskModel(
          id: 'task-rem-2',
          title: 'Team standup',
          dueDate: now.add(const Duration(hours: 2)),
          isReminderEnabled: true,
          reminderLeadMinutes: 5,
          createdAt: now,
          updatedAt: now,
        );

        await repository.createTask(task);
        mockReminderService.syncedSchedules.clear();

        final updatedTask = task.copyWith(
          title: 'Team standup rescheduled',
          dueDate: now.add(const Duration(hours: 4)),
        );

        await repository.updateTask(updatedTask);

        expect(mockReminderService.syncedSchedules.length, equals(1));
        expect(
          mockReminderService.syncedSchedules.first.title,
          equals('Team standup rescheduled'),
        );
      },
    );

    test('completing a task cancels pending reminders immediately', () async {
      final now = DateTime.now();
      final task = TaskModel(
        id: 'task-rem-3',
        title: 'Pay utility bills',
        status: TaskStatus.open,
        dueDate: now.add(const Duration(hours: 5)),
        isReminderEnabled: true,
        createdAt: now,
        updatedAt: now,
      );

      await repository.createTask(task);
      expect(mockReminderService.cancelledTasks, isEmpty);

      // Toggle status to completed
      final completed = await repository.toggleTaskStatus('task-rem-3');
      expect(completed.status, equals(TaskStatus.completed));
      expect(mockReminderService.cancelledTasks, contains('task-rem-3'));
    });

    test('reopening a completed task re-arms reminders', () async {
      final now = DateTime.now();
      final task = TaskModel(
        id: 'task-rem-4',
        title: 'Water plants',
        status: TaskStatus.open,
        dueDate: now.add(const Duration(hours: 6)),
        isReminderEnabled: true,
        createdAt: now,
        updatedAt: now,
      );

      await repository.createTask(task);
      await repository.toggleTaskStatus('task-rem-4'); // Complete

      mockReminderService.syncedSchedules.clear();

      // Toggle status back to open
      final reopened = await repository.toggleTaskStatus('task-rem-4');
      expect(reopened.status, equals(TaskStatus.open));
      expect(mockReminderService.syncedSchedules.length, equals(1));
      expect(
        mockReminderService.syncedSchedules.first.taskId,
        equals('task-rem-4'),
      );
    });

    test('deleting a task cancels pending reminders immediately', () async {
      final now = DateTime.now();
      final task = TaskModel(
        id: 'task-rem-5',
        title: 'Temporary errand',
        dueDate: now.add(const Duration(hours: 2)),
        isReminderEnabled: true,
        createdAt: now,
        updatedAt: now,
      );

      await repository.createTask(task);
      expect(mockReminderService.cancelledTasks, isEmpty);

      await repository.deleteTask('task-rem-5');
      expect(mockReminderService.cancelledTasks, contains('task-rem-5'));
    });
  });
}
