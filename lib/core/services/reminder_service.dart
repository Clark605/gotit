import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gotit/core/services/notification_action_handler.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/core/storage/prefs_service.dart';
import 'package:gotit/core/utils/app_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

abstract class NotificationActionIds {
  static const String markDone = 'action_mark_done';
  static const String snooze15m = 'action_snooze_15m';
  static const String channelReminders = 'gotit_reminders_channel';
  static const String channelMissed = 'gotit_missed_reminders_channel';
  static const int missedSummaryNotificationId = 999999;
}

class TaskReminderSchedule {
  final String taskId;
  final String title;
  final DateTime? dueDate;
  final bool isAllDay;
  final bool isReminderEnabled;
  final int? reminderLeadMinutes;
  final String? allDayReminderTime;
  final int? effortMinutes;

  const TaskReminderSchedule({
    required this.taskId,
    required this.title,
    this.dueDate,
    this.isAllDay = false,
    this.isReminderEnabled = false,
    this.reminderLeadMinutes,
    this.allDayReminderTime,
    this.effortMinutes,
  });
}

abstract class IReminderService {
  Future<void> initialize();
  Future<bool> hasNotificationPermission();
  Future<bool> requestNotificationPermission();
  Future<bool> hasExactAlarmPermission();
  Future<void> requestExactAlarmPermission();
  Future<void> syncReminderSchedule(TaskReminderSchedule schedule);
  Future<void> cancelForTask(String taskId);
  Future<void> snoozeReminder(String taskId, {int minutes = 15});
  Future<void> restoreAndReconcileSchedule();
}

@LazySingleton(as: IReminderService)
class ReminderServiceImpl implements IReminderService {
  final AppDatabase _database;
  final PrefsService _prefs;
  final FlutterLocalNotificationsPlugin _notificationsPlugin;
  final void Function(String? payload)? _onNotificationTap;

  bool _isInitialized = false;

  ReminderServiceImpl(
    this._database,
    this._prefs,
  )   : _notificationsPlugin = FlutterLocalNotificationsPlugin(),
        _onNotificationTap = null;

  @visibleForTesting
  ReminderServiceImpl.forTesting(
    this._database,
    this._prefs, {
    FlutterLocalNotificationsPlugin? notificationsPlugin,
    void Function(String? payload)? onNotificationTap,
  })  : _notificationsPlugin =
            notificationsPlugin ?? FlutterLocalNotificationsPlugin(),
        _onNotificationTap = onNotificationTap;

  static int getDueNotificationId(String taskId) =>
      (taskId.hashCode ^ 0x1000) & 0x7FFFFFFF;

  static int getStartWorkingNotificationId(String taskId) =>
      (taskId.hashCode ^ 0x2000) & 0x7FFFFFFF;

  static int getSnoozeNotificationId(String taskId) =>
      (taskId.hashCode ^ 0x3000) & 0x7FFFFFFF;

  @override
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      tz.initializeTimeZones();
      try {
        final localName = DateTime.now().timeZoneName;
        tz.setLocalLocation(tz.getLocation(localName));
      } catch (_) {
        // Fallback to UTC or existing tz.local
      }

      const androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const darwinSettings = DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );

      const initSettings = InitializationSettings(
        android: androidSettings,
        iOS: darwinSettings,
      );

      await _notificationsPlugin.initialize(
        initSettings,
        onDidReceiveNotificationResponse: (details) {
          if (details.payload != null && details.payload!.isNotEmpty) {
            _onNotificationTap?.call(details.payload);
          }
        },
        onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
      );

      await _createNotificationChannels();
      _isInitialized = true;
    } catch (e, st) {
      AppLogger.error('Failed to initialize ReminderService', e, st);
    }
  }

  Future<void> _createNotificationChannels() async {
    if (!kIsWeb && Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      const remindersChannel = AndroidNotificationChannel(
        NotificationActionIds.channelReminders,
        'Task Reminders',
        description:
            'Notifications for scheduled task deadlines and start-working alerts',
        importance: Importance.high,
        enableVibration: true,
        playSound: true,
      );

      const missedChannel = AndroidNotificationChannel(
        NotificationActionIds.channelMissed,
        'Missed Reminders',
        description:
            'Summary notifications for reminders that elapsed while the device was powered off',
        importance: Importance.defaultImportance,
        enableVibration: false,
      );

      await androidPlugin?.createNotificationChannel(remindersChannel);
      await androidPlugin?.createNotificationChannel(missedChannel);
    }
  }

  @override
  Future<bool> hasNotificationPermission() async {
    if (kIsWeb) return false;
    if (Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      return await androidPlugin?.areNotificationsEnabled() ?? false;
    }
    return true;
  }

  @override
  Future<bool> requestNotificationPermission() async {
    if (kIsWeb) return false;
    if (Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      return await androidPlugin?.requestNotificationsPermission() ?? false;
    }
    return true;
  }

  @override
  Future<bool> hasExactAlarmPermission() async {
    if (kIsWeb) return false;
    if (Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      return await androidPlugin?.canScheduleExactNotifications() ?? false;
    }
    return true;
  }

  @override
  Future<void> requestExactAlarmPermission() async {
    if (!kIsWeb && Platform.isAndroid) {
      final androidPlugin = _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      await androidPlugin?.requestExactAlarmsPermission();
    }
  }

  @override
  Future<void> syncReminderSchedule(TaskReminderSchedule schedule) async {
    // 1. Cancel any existing notifications and database reminders for this task
    await cancelForTask(schedule.taskId);

    if (!schedule.isReminderEnabled || schedule.dueDate == null) {
      return;
    }

    final now = DateTime.now();
    final canExact = await hasExactAlarmPermission();
    final scheduleMode = canExact
        ? AndroidScheduleMode.exactAllowWhileIdle
        : AndroidScheduleMode.inexactAllowWhileIdle;

    // 2. Calculate due reminder trigger time
    DateTime? dueTriggerTime;
    final leadMinutes = schedule.reminderLeadMinutes ??
        _prefs.getReminderDefaultLeadMinutes();

    if (schedule.isAllDay) {
      final allDayTime = schedule.allDayReminderTime ??
          _prefs.getReminderDefaultAllDayTime();
      final timeParts = allDayTime.split(':');
      final hour = int.tryParse(timeParts[0]) ?? 9;
      final minute =
          timeParts.length > 1 ? (int.tryParse(timeParts[1]) ?? 0) : 0;
      dueTriggerTime = DateTime(
        schedule.dueDate!.year,
        schedule.dueDate!.month,
        schedule.dueDate!.day,
        hour,
        minute,
      );
    } else {
      dueTriggerTime =
          schedule.dueDate!.subtract(Duration(minutes: leadMinutes));
    }

    // Schedule due reminder if in the future
    if (dueTriggerTime.isAfter(now)) {
      final dueNotificationId = getDueNotificationId(schedule.taskId);
      final details = _buildNotificationDetails(
        channelId: NotificationActionIds.channelReminders,
        channelName: 'Task Reminders',
        actions: _buildTrayActions(),
      );

      try {
        await _notificationsPlugin.zonedSchedule(
          dueNotificationId,
          'Task Due: ${schedule.title}',
          '${schedule.title} is due now',
          tz.TZDateTime.from(dueTriggerTime, tz.local),
          details,
          androidScheduleMode: scheduleMode,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          payload: schedule.taskId,
        );

        await _database.into(_database.remindersTable).insert(
              RemindersTableCompanion.insert(
                id: '${schedule.taskId}_due',
                taskId: schedule.taskId,
                type: 'due',
                scheduledTime: dueTriggerTime,
                leadTimeMinutes: Value(leadMinutes),
                status: const Value('pending'),
                notificationId: dueNotificationId,
                createdAt: Value(now),
                updatedAt: Value(now),
              ),
            );
      } catch (e, st) {
        AppLogger.error('Failed to schedule due reminder', e, st);
      }
    }

    // 3. Calculate start-working reminder (US2)
    final effort = schedule.effortMinutes ?? 0;
    if (effort > 0 && !schedule.isAllDay) {
      final startWorkingTriggerTime =
          schedule.dueDate!.subtract(Duration(minutes: effort));
      if (startWorkingTriggerTime.isAfter(now)) {
        final startWorkingNotificationId =
            getStartWorkingNotificationId(schedule.taskId);
        final details = _buildNotificationDetails(
          channelId: NotificationActionIds.channelReminders,
          channelName: 'Task Reminders',
          actions: _buildTrayActions(),
        );

        try {
          await _notificationsPlugin.zonedSchedule(
            startWorkingNotificationId,
            'Start Working: ${schedule.title}',
            'Time to start working on ${schedule.title} — due in ${effort}m',
            tz.TZDateTime.from(startWorkingTriggerTime, tz.local),
            details,
            androidScheduleMode: scheduleMode,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            payload: schedule.taskId,
          );

          await _database.into(_database.remindersTable).insert(
                RemindersTableCompanion.insert(
                  id: '${schedule.taskId}_start_working',
                  taskId: schedule.taskId,
                  type: 'start_working',
                  scheduledTime: startWorkingTriggerTime,
                  leadTimeMinutes: Value(effort),
                  status: const Value('pending'),
                  notificationId: startWorkingNotificationId,
                  createdAt: Value(now),
                  updatedAt: Value(now),
                ),
              );
        } catch (e, st) {
          AppLogger.error('Failed to schedule start-working reminder', e, st);
        }
      }
    }
  }

  @override
  Future<void> cancelForTask(String taskId) async {
    final dueId = getDueNotificationId(taskId);
    final startWorkingId = getStartWorkingNotificationId(taskId);
    final snoozeId = getSnoozeNotificationId(taskId);

    try {
      await _notificationsPlugin.cancel(dueId);
      await _notificationsPlugin.cancel(startWorkingId);
      await _notificationsPlugin.cancel(snoozeId);

      await (_database.delete(_database.remindersTable)
            ..where((r) => r.taskId.equals(taskId)))
          .go();
    } catch (e, st) {
      AppLogger.error('Failed to cancel reminders for task $taskId', e, st);
    }
  }

  @override
  Future<void> snoozeReminder(String taskId, {int minutes = 15}) async {
    final snoozeTime = DateTime.now().add(Duration(minutes: minutes));
    final snoozeId = getSnoozeNotificationId(taskId);

    final canExact = await hasExactAlarmPermission();
    final scheduleMode = canExact
        ? AndroidScheduleMode.exactAllowWhileIdle
        : AndroidScheduleMode.inexactAllowWhileIdle;

    final details = _buildNotificationDetails(
      channelId: NotificationActionIds.channelReminders,
      channelName: 'Task Reminders',
      actions: _buildTrayActions(),
    );

    // Look up task title from database if available
    final task = await (_database.select(_database.tasksTable)
          ..where((t) => t.id.equals(taskId)))
        .getSingleOrNull();

    final taskTitle = task?.title ?? 'Task';

    try {
      await _notificationsPlugin.zonedSchedule(
        snoozeId,
        'Snoozed: $taskTitle',
        '$taskTitle reminder (snoozed for ${minutes}m)',
        tz.TZDateTime.from(snoozeTime, tz.local),
        details,
        androidScheduleMode: scheduleMode,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: taskId,
      );
    } catch (e, st) {
      AppLogger.error('Failed to snooze reminder for task $taskId', e, st);
    }
  }

  @override
  Future<void> restoreAndReconcileSchedule() async {
    final now = DateTime.now();
    final cutoff24hAgo = now.subtract(const Duration(hours: 24));

    try {
      final pendingReminders = await (_database.select(_database.remindersTable)
            ..where((r) => r.status.equals('pending')))
          .get();

      int missedCount = 0;

      for (final reminder in pendingReminders) {
        if (reminder.scheduledTime.isAfter(now)) {
          // Future reminder: re-arm alarm
          final task = await (_database.select(_database.tasksTable)
                ..where((t) => t.id.equals(reminder.taskId)))
              .getSingleOrNull();

          if (task != null && !task.isDeleted && task.status == 'open') {
            final canExact = await hasExactAlarmPermission();
            final scheduleMode = canExact
                ? AndroidScheduleMode.exactAllowWhileIdle
                : AndroidScheduleMode.inexactAllowWhileIdle;

            final details = _buildNotificationDetails(
              channelId: NotificationActionIds.channelReminders,
              channelName: 'Task Reminders',
              actions: _buildTrayActions(),
            );

            await _notificationsPlugin.zonedSchedule(
              reminder.notificationId,
              reminder.type == 'start_working'
                  ? 'Start Working: ${task.title}'
                  : 'Task Due: ${task.title}',
              reminder.type == 'start_working'
                  ? 'Time to start working on ${task.title}'
                  : '${task.title} is due now',
              tz.TZDateTime.from(reminder.scheduledTime, tz.local),
              details,
              androidScheduleMode: scheduleMode,
              uiLocalNotificationDateInterpretation:
                  UILocalNotificationDateInterpretation.absoluteTime,
              payload: task.id,
            );
          }
        } else {
          // Scheduled time elapsed during device shutdown
          await (_database.update(_database.remindersTable)
                ..where((r) => r.id.equals(reminder.id)))
              .write(
            RemindersTableCompanion(
              status: const Value('fired'),
              updatedAt: Value(now),
            ),
          );

          if (reminder.scheduledTime.isAfter(cutoff24hAgo)) {
            missedCount++;
          }
        }
      }

      // If missed reminders occurred during shutdown, show consolidated summary notification
      if (missedCount > 0) {
        final summaryDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            NotificationActionIds.channelMissed,
            'Missed Reminders',
            channelDescription:
                'Summary notifications for reminders that elapsed while the device was powered off',
            importance: Importance.defaultImportance,
            priority: Priority.defaultPriority,
          ),
          iOS: const DarwinNotificationDetails(),
        );

        await _notificationsPlugin.show(
          NotificationActionIds.missedSummaryNotificationId,
          'Gotit',
          '$missedCount missed reminders while device was off',
          summaryDetails,
          payload: 'today',
        );
      }
    } catch (e, st) {
      AppLogger.error('Failed to restore and reconcile schedule', e, st);
    }
  }

  NotificationDetails _buildNotificationDetails({
    required String channelId,
    required String channelName,
    List<AndroidNotificationAction>? actions,
  }) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        channelName,
        importance: Importance.high,
        priority: Priority.high,
        actions: actions,
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
  }

  List<AndroidNotificationAction> _buildTrayActions() {
    return const [
      AndroidNotificationAction(
        NotificationActionIds.markDone,
        'Mark as Done',
        showsUserInterface: false,
        cancelNotification: true,
      ),
      AndroidNotificationAction(
        NotificationActionIds.snooze15m,
        'Snooze (15m)',
        showsUserInterface: false,
        cancelNotification: true,
      ),
    ];
  }
}
