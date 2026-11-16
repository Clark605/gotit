class StorageKeys {
  StorageKeys._();

  // Shared preferences keys
  static const String themeMode = 'app_theme_mode';
  static const String locale = 'app_locale';
  static const String hasSeenOnboarding = 'has_seen_onboarding';

  // Reminder preferences keys
  static const String reminderDefaultLeadMinutes =
      'pref_reminder_default_lead_minutes';
  static const String reminderDefaultAllDayTime =
      'pref_reminder_default_all_day_time';
  static const String exactAlarmFallbackAcknowledged =
      'pref_exact_alarm_fallback_acknowledged';

  // Secure storage keys
  static const String accessToken = 'secure_access_token';
  static const String refreshToken = 'secure_refresh_token';
  static const String userId = 'secure_user_id';
}
