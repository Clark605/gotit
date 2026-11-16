// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Gotit';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get retry => 'Retry';

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get continueLabel => 'Continue';

  @override
  String get done => 'Done';

  @override
  String get close => 'Close';

  @override
  String get search => 'Search';

  @override
  String get refresh => 'Refresh';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get warning => 'Warning';

  @override
  String get info => 'Info';

  @override
  String get loading => 'Loading...';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get themeSystem => 'System Default';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get appVersion => 'Version';

  @override
  String get about => 'About';

  @override
  String get logout => 'Log Out';

  @override
  String get noInternetTitle => 'No Connection';

  @override
  String get noInternetMessage =>
      'Please check your internet connection and try again.';

  @override
  String get offlineBannerText =>
      'You are currently offline. Some features may be unavailable.';

  @override
  String get backOnlineText => 'Connection restored.';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get updateRequiredTitle => 'Update Required';

  @override
  String get updateRequiredMessage =>
      'A new version of the application is available. Please update to continue.';

  @override
  String get updateNow => 'Update Now';

  @override
  String get copyUpdateLink => 'Copy Update Link';

  @override
  String get linkCopied => 'Link copied to clipboard.';

  @override
  String get maintenanceTitle => 'Under Maintenance';

  @override
  String get maintenanceMessage =>
      'The system is temporarily under maintenance. Please check back shortly.';

  @override
  String get errorNetwork =>
      'No internet connection. Please check your network and try again.';

  @override
  String get errorTimeout => 'The connection timed out. Please try again.';

  @override
  String get errorUnauthorized =>
      'Authentication required. Please log in again.';

  @override
  String get errorForbidden =>
      'You do not have permission to perform this action.';

  @override
  String get errorNotFound => 'The requested resource was not found.';

  @override
  String get errorConflict =>
      'A conflict occurred with the current state of the resource. Please refresh and try again.';

  @override
  String get errorValidation => 'The provided information is invalid.';

  @override
  String get errorServer => 'A server error occurred. Please try again later.';

  @override
  String get errorCancelled => 'The operation was cancelled.';

  @override
  String get errorUnknown => 'An unexpected error occurred. Please try again.';

  @override
  String get exampleTitle => 'Reference Items';

  @override
  String get exampleSubtitle => 'Clean architecture reference implementation';

  @override
  String get exampleEmptyTitle => 'No items found';

  @override
  String get exampleEmptyMessage =>
      'Pull to refresh to load items from the remote service.';

  @override
  String get exampleLoadMore => 'Loading more...';

  @override
  String exampleItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
    );
    return '$_temp0';
  }

  @override
  String get exampleCreateTitle => 'New Item';

  @override
  String get exampleItemTitleLabel => 'Title';

  @override
  String get exampleItemBodyLabel => 'Description';

  @override
  String get exampleItemCreated => 'Item created successfully';

  @override
  String get notFoundRouteTitle => 'Page Not Found';

  @override
  String get notFoundRouteMessage =>
      'The requested route does not exist or has been moved.';

  @override
  String get goToHome => 'Go to Home';

  @override
  String get onboardingTitle1 => 'Production-Grade Starter';

  @override
  String get onboardingDesc1 =>
      'Engineered with Flutter BLoC, Freezed, strict feature architecture and design tokens.';

  @override
  String get onboardingTitle2 => 'Full English & Arabic RTL';

  @override
  String get onboardingDesc2 =>
      'Seamless locale switching with IBM Plex Sans Arabic and Inter typography.';

  @override
  String get onboardingTitle3 => 'Ready to Ship Out of Box';

  @override
  String get onboardingDesc3 =>
      'Multi-flavor environments, guarded actions, CI/CD pipelines, and zero third-party accounts.';

  @override
  String get skip => 'Skip';

  @override
  String get getStarted => 'Get Started';

  @override
  String get todayNav => 'Today';

  @override
  String get tasksNav => 'Tasks';

  @override
  String get todayTitle => 'Today';

  @override
  String get overdueSection => 'Overdue';

  @override
  String get dueTodaySection => 'Due Today';

  @override
  String get startTodaySection => 'Start Today';

  @override
  String get allClearTitle => 'All clear for today';

  @override
  String get allClearSubtitle => 'Take a breath or plan ahead.';

  @override
  String get addTask => 'Add a task';

  @override
  String get tasksTitle => 'Tasks';

  @override
  String get activeStatus => 'Active';

  @override
  String get completedStatus => 'Completed';

  @override
  String get allStatus => 'All';

  @override
  String get allContexts => 'All';

  @override
  String get newContext => '+ New';

  @override
  String get dailyMomentum => 'Daily Momentum';

  @override
  String completedRatio(int completed, int total, int percent) {
    return '$completed of $total completed ($percent%)';
  }

  @override
  String get noTasksInContext => 'No tasks in this context.';

  @override
  String get taskDetailTitle => 'Task Detail';

  @override
  String get checklistTitle => 'Checklist';

  @override
  String checklistProgress(int completed, int total) {
    return '$completed of $total completed';
  }

  @override
  String estimatedEffort(String effort) {
    return 'Estimated effort: $effort';
  }

  @override
  String get notesTitle => 'Notes';

  @override
  String get deleteTaskConfirmTitle => 'Delete this task?';

  @override
  String get deleteTaskConfirmMessage =>
      'This will remove the task and its checklist items.';

  @override
  String get undo => 'Undo';

  @override
  String get taskDeleted => 'Task deleted';

  @override
  String get newTaskTitle => 'New Task';

  @override
  String get editTaskTitle => 'Edit Task';

  @override
  String get taskTitleLabel => 'Title';

  @override
  String get taskTitleHint => 'Task title';

  @override
  String get titleRequiredError => 'Title cannot be empty';

  @override
  String get scheduleLabel => 'Schedule';

  @override
  String get allDay => 'All-day';

  @override
  String get contextLabel => 'Context';

  @override
  String get effortEstimateLabel => 'Estimated Effort';

  @override
  String get notesHint => 'Add notes or details...';

  @override
  String get addChecklistItem => 'Add checklist item';

  @override
  String get saveTask => 'Save Task';

  @override
  String get manageContextsTitle => 'Manage Contexts';

  @override
  String get contextNameHint => 'Context name (e.g. Finance, Fitness)';

  @override
  String get addContext => 'Add Context';

  @override
  String get contextAlreadyExists => 'Context already exists';

  @override
  String deleteContextConfirmTitle(String name) {
    return 'Delete \"$name\"?';
  }

  @override
  String get deleteContextConfirmMessage =>
      'Tasks with this context will be kept and set to No Context.';

  @override
  String get noContext => 'No Context';

  @override
  String get defaultContext => 'Default';

  @override
  String get contextWork => 'Work';

  @override
  String get contextHome => 'Home';

  @override
  String get contextPersonal => 'Personal';

  @override
  String get remindersLabel => 'Reminders';

  @override
  String get enableReminder => 'Enable Reminder';

  @override
  String get remindMe => 'Remind me';

  @override
  String get reminderLeadAtDue => 'At due time';

  @override
  String get reminderLead5m => '5m before';

  @override
  String get reminderLead15m => '15m before';

  @override
  String get reminderLead30m => '30m before';

  @override
  String get reminderLead1h => '1h before';

  @override
  String get reminderLead1d => '1d before';

  @override
  String get allDayAlertTime => 'Alert Time';

  @override
  String get allDayAlertTimeHint => 'Select time for all-day reminder';

  @override
  String startWorkingNotice(String time, String lead) {
    return '🔔 Start-working reminder will sound at $time ($lead lead time)';
  }

  @override
  String startWorkingNotificationTitle(String title) {
    return 'Start Working: $title';
  }

  @override
  String startWorkingNotificationBody(String title, String effort) {
    return 'Time to start working on $title — due in $effort';
  }

  @override
  String dueNotificationTitle(String title) {
    return 'Task Due: $title';
  }

  @override
  String dueNotificationBody(String title) {
    return '$title is due now';
  }

  @override
  String get actionMarkDone => 'Mark as Done';

  @override
  String get actionSnooze15m => 'Snooze (15m)';

  @override
  String get missedRemindersTitle => 'Gotit';

  @override
  String missedRemindersBody(int count) {
    return '$count missed reminders while device was off';
  }

  @override
  String get permissionPrimerTitle => 'Stay On Top of Your Tasks';

  @override
  String get permissionPrimerBody =>
      'Gotit delivers precise, timely reminders so you never miss a deadline. To notify you even when the app is closed, Gotit needs permission to send notifications and schedule exact alarms.';

  @override
  String get permissionPrimerNotificationItem =>
      'Timely task notifications and lock screen quick actions';

  @override
  String get permissionPrimerAlarmItem =>
      'Exact timing for high-priority reminders';

  @override
  String get permissionPrimerEnableButton => 'Enable Reminders';

  @override
  String get permissionPrimerLaterButton => 'Maybe Later';

  @override
  String get inexactAlarmWarningTitle => 'Exact Alarms Disabled';

  @override
  String get inexactAlarmWarningBody =>
      'Reminders may vary by up to 10 minutes. Enable exact alarms for precise delivery.';

  @override
  String get inexactAlarmFixButton => 'Fix';

  @override
  String get troubleshootingTitle => 'Reminder Reliability';

  @override
  String get systemDiagnosticsTitle => 'System Diagnostics';

  @override
  String get diagnosticNotifications => 'Notifications';

  @override
  String get diagnosticExactAlarms => 'Exact Alarms';

  @override
  String get diagnosticBatteryOptimizations => 'Battery Saver';

  @override
  String get diagnosticStatusActive => 'Active';

  @override
  String get diagnosticStatusInexact => 'Inexact';

  @override
  String get diagnosticStatusRestricted => 'Restricted';

  @override
  String get diagnosticStatusDisabled => 'Disabled';

  @override
  String get oemGuidesTitle => 'Device-Specific Settings';

  @override
  String get oemGuidesSubtitle =>
      'Aggressive battery optimization may delay notifications when Gotit is closed.';

  @override
  String get oemXiaomiTitle => 'Xiaomi / HyperOS / MIUI';

  @override
  String get oemXiaomiGuide =>
      '1. Enable Autostart in Security > Manage apps > Gotit.\n2. Set Battery saver to No restrictions.\n3. Lock Gotit in Recent Apps.';

  @override
  String get oemSamsungTitle => 'Samsung (One UI)';

  @override
  String get oemSamsungGuide =>
      '1. Go to Settings > Apps > Gotit > Battery > Select \'Unrestricted\'.\n2. In Device care > Battery > Background usage limits, remove Gotit from \'Sleeping apps\'.';

  @override
  String get oemHuaweiTitle => 'Huawei (EMUI)';

  @override
  String get oemHuaweiGuide =>
      '1. Go to Settings > Battery > App launch > Gotit.\n2. Turn off \'Manage automatically\' and enable \'Auto-launch\', \'Secondary launch\', and \'Run in background\'.';

  @override
  String get oemOppoVivoTitle => 'OPPO / Vivo / OnePlus';

  @override
  String get oemOppoVivoGuide =>
      '1. Enable \'Allow background activity\' in Battery settings.\n2. In App info > Permissions, allow Autostart.';

  @override
  String get openBatterySettings => 'Open Battery Settings';

  @override
  String get openExactAlarmSettings => 'Open Exact Alarm Settings';

  @override
  String get dontKillMyAppLink => 'Learn more at dontkillmyapp.com';
}
