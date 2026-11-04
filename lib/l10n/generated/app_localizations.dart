import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Gotit'**
  String get appTitle;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get appVersion;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// No description provided for @noInternetTitle.
  ///
  /// In en, this message translates to:
  /// **'No Connection'**
  String get noInternetTitle;

  /// No description provided for @noInternetMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again.'**
  String get noInternetMessage;

  /// No description provided for @offlineBannerText.
  ///
  /// In en, this message translates to:
  /// **'You are currently offline. Some features may be unavailable.'**
  String get offlineBannerText;

  /// No description provided for @backOnlineText.
  ///
  /// In en, this message translates to:
  /// **'Connection restored.'**
  String get backOnlineText;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @updateRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Required'**
  String get updateRequiredTitle;

  /// No description provided for @updateRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'A new version of the application is available. Please update to continue.'**
  String get updateRequiredMessage;

  /// No description provided for @updateNow.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get updateNow;

  /// No description provided for @copyUpdateLink.
  ///
  /// In en, this message translates to:
  /// **'Copy Update Link'**
  String get copyUpdateLink;

  /// No description provided for @linkCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied to clipboard.'**
  String get linkCopied;

  /// No description provided for @maintenanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Under Maintenance'**
  String get maintenanceTitle;

  /// No description provided for @maintenanceMessage.
  ///
  /// In en, this message translates to:
  /// **'The system is temporarily under maintenance. Please check back shortly.'**
  String get maintenanceMessage;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please check your network and try again.'**
  String get errorNetwork;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'The connection timed out. Please try again.'**
  String get errorTimeout;

  /// No description provided for @errorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Authentication required. Please log in again.'**
  String get errorUnauthorized;

  /// No description provided for @errorForbidden.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to perform this action.'**
  String get errorForbidden;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'The requested resource was not found.'**
  String get errorNotFound;

  /// No description provided for @errorConflict.
  ///
  /// In en, this message translates to:
  /// **'A conflict occurred with the current state of the resource. Please refresh and try again.'**
  String get errorConflict;

  /// No description provided for @errorValidation.
  ///
  /// In en, this message translates to:
  /// **'The provided information is invalid.'**
  String get errorValidation;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'A server error occurred. Please try again later.'**
  String get errorServer;

  /// No description provided for @errorCancelled.
  ///
  /// In en, this message translates to:
  /// **'The operation was cancelled.'**
  String get errorCancelled;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get errorUnknown;

  /// No description provided for @exampleTitle.
  ///
  /// In en, this message translates to:
  /// **'Reference Items'**
  String get exampleTitle;

  /// No description provided for @exampleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Clean architecture reference implementation'**
  String get exampleSubtitle;

  /// No description provided for @exampleEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get exampleEmptyTitle;

  /// No description provided for @exampleEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Pull to refresh to load items from the remote service.'**
  String get exampleEmptyMessage;

  /// No description provided for @exampleLoadMore.
  ///
  /// In en, this message translates to:
  /// **'Loading more...'**
  String get exampleLoadMore;

  /// No description provided for @exampleItemCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No items} =1{1 item} other{{count} items}}'**
  String exampleItemCount(int count);

  /// No description provided for @exampleCreateTitle.
  ///
  /// In en, this message translates to:
  /// **'New Item'**
  String get exampleCreateTitle;

  /// No description provided for @exampleItemTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get exampleItemTitleLabel;

  /// No description provided for @exampleItemBodyLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get exampleItemBodyLabel;

  /// No description provided for @exampleItemCreated.
  ///
  /// In en, this message translates to:
  /// **'Item created successfully'**
  String get exampleItemCreated;

  /// No description provided for @notFoundRouteTitle.
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get notFoundRouteTitle;

  /// No description provided for @notFoundRouteMessage.
  ///
  /// In en, this message translates to:
  /// **'The requested route does not exist or has been moved.'**
  String get notFoundRouteMessage;

  /// No description provided for @goToHome.
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get goToHome;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Production-Grade Starter'**
  String get onboardingTitle1;

  /// No description provided for @onboardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Engineered with Flutter BLoC, Freezed, strict feature architecture and design tokens.'**
  String get onboardingDesc1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Full English & Arabic RTL'**
  String get onboardingTitle2;

  /// No description provided for @onboardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Seamless locale switching with IBM Plex Sans Arabic and Inter typography.'**
  String get onboardingDesc2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Ready to Ship Out of Box'**
  String get onboardingTitle3;

  /// No description provided for @onboardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'Multi-flavor environments, guarded actions, CI/CD pipelines, and zero third-party accounts.'**
  String get onboardingDesc3;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @todayNav.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayNav;

  /// No description provided for @tasksNav.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get tasksNav;

  /// No description provided for @todayTitle.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayTitle;

  /// No description provided for @overdueSection.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdueSection;

  /// No description provided for @dueTodaySection.
  ///
  /// In en, this message translates to:
  /// **'Due Today'**
  String get dueTodaySection;

  /// No description provided for @startTodaySection.
  ///
  /// In en, this message translates to:
  /// **'Start Today'**
  String get startTodaySection;

  /// No description provided for @allClearTitle.
  ///
  /// In en, this message translates to:
  /// **'All clear for today'**
  String get allClearTitle;

  /// No description provided for @allClearSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Take a breath or plan ahead.'**
  String get allClearSubtitle;

  /// No description provided for @addTask.
  ///
  /// In en, this message translates to:
  /// **'Add a task'**
  String get addTask;

  /// No description provided for @tasksTitle.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get tasksTitle;

  /// No description provided for @activeStatus.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeStatus;

  /// No description provided for @completedStatus.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completedStatus;

  /// No description provided for @allStatus.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allStatus;

  /// No description provided for @allContexts.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allContexts;

  /// No description provided for @newContext.
  ///
  /// In en, this message translates to:
  /// **'+ New'**
  String get newContext;

  /// No description provided for @dailyMomentum.
  ///
  /// In en, this message translates to:
  /// **'Daily Momentum'**
  String get dailyMomentum;

  /// No description provided for @completedRatio.
  ///
  /// In en, this message translates to:
  /// **'{completed} of {total} completed ({percent}%)'**
  String completedRatio(int completed, int total, int percent);

  /// No description provided for @noTasksInContext.
  ///
  /// In en, this message translates to:
  /// **'No tasks in this context.'**
  String get noTasksInContext;

  /// No description provided for @taskDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Task Detail'**
  String get taskDetailTitle;

  /// No description provided for @checklistTitle.
  ///
  /// In en, this message translates to:
  /// **'Checklist'**
  String get checklistTitle;

  /// No description provided for @checklistProgress.
  ///
  /// In en, this message translates to:
  /// **'{completed} of {total} completed'**
  String checklistProgress(int completed, int total);

  /// No description provided for @estimatedEffort.
  ///
  /// In en, this message translates to:
  /// **'Estimated effort: {effort}'**
  String estimatedEffort(String effort);

  /// No description provided for @notesTitle.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesTitle;

  /// No description provided for @deleteTaskConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this task?'**
  String get deleteTaskConfirmTitle;

  /// No description provided for @deleteTaskConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'This will remove the task and its checklist items.'**
  String get deleteTaskConfirmMessage;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @taskDeleted.
  ///
  /// In en, this message translates to:
  /// **'Task deleted'**
  String get taskDeleted;

  /// No description provided for @newTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'New Task'**
  String get newTaskTitle;

  /// No description provided for @editTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Task'**
  String get editTaskTitle;

  /// No description provided for @taskTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get taskTitleLabel;

  /// No description provided for @taskTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Task title'**
  String get taskTitleHint;

  /// No description provided for @titleRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Title cannot be empty'**
  String get titleRequiredError;

  /// No description provided for @scheduleLabel.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get scheduleLabel;

  /// No description provided for @allDay.
  ///
  /// In en, this message translates to:
  /// **'All-day'**
  String get allDay;

  /// No description provided for @contextLabel.
  ///
  /// In en, this message translates to:
  /// **'Context'**
  String get contextLabel;

  /// No description provided for @effortEstimateLabel.
  ///
  /// In en, this message translates to:
  /// **'Estimated Effort'**
  String get effortEstimateLabel;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Add notes or details...'**
  String get notesHint;

  /// No description provided for @addChecklistItem.
  ///
  /// In en, this message translates to:
  /// **'Add checklist item'**
  String get addChecklistItem;

  /// No description provided for @saveTask.
  ///
  /// In en, this message translates to:
  /// **'Save Task'**
  String get saveTask;

  /// No description provided for @manageContextsTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Contexts'**
  String get manageContextsTitle;

  /// No description provided for @contextNameHint.
  ///
  /// In en, this message translates to:
  /// **'Context name (e.g. Finance, Fitness)'**
  String get contextNameHint;

  /// No description provided for @addContext.
  ///
  /// In en, this message translates to:
  /// **'Add Context'**
  String get addContext;

  /// No description provided for @contextAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'Context already exists'**
  String get contextAlreadyExists;

  /// No description provided for @deleteContextConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"?'**
  String deleteContextConfirmTitle(String name);

  /// No description provided for @deleteContextConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Tasks with this context will be kept and set to No Context.'**
  String get deleteContextConfirmMessage;

  /// No description provided for @noContext.
  ///
  /// In en, this message translates to:
  /// **'No Context'**
  String get noContext;

  /// No description provided for @defaultContext.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultContext;

  /// No description provided for @contextWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get contextWork;

  /// No description provided for @contextHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get contextHome;

  /// No description provided for @contextPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get contextPersonal;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
