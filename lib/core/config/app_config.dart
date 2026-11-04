enum AppFlavor {
  dev,
  staging,
  prod;

  static AppFlavor fromString(String value) {
    return switch (value.toLowerCase().trim()) {
      'dev' || 'development' => AppFlavor.dev,
      'staging' => AppFlavor.staging,
      'prod' || 'production' => AppFlavor.prod,
      _ => AppFlavor.dev,
    };
  }
}

class AppConfig {
  AppConfig._();

  static const String _flavorStr = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'dev',
  );
  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Gotit',
  );
  static const String applicationId = String.fromEnvironment(
    'APPLICATION_ID',
    defaultValue: 'com.clark.gotit',
  );
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: '',
  );
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );
  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: '',
  );
  static const int connectTimeoutSeconds = int.fromEnvironment(
    'CONNECT_TIMEOUT_SECONDS',
    defaultValue: 30,
  );
  static const int receiveTimeoutSeconds = int.fromEnvironment(
    'RECEIVE_TIMEOUT_SECONDS',
    defaultValue: 30,
  );
  static const bool enableLogging = bool.fromEnvironment(
    'ENABLE_LOGGING',
    defaultValue: true,
  );
  static const String minSupportedVersion = String.fromEnvironment(
    'MIN_SUPPORTED_VERSION',
    defaultValue: '0.1.0',
  );
  static const bool maintenanceMode = bool.fromEnvironment(
    'MAINTENANCE_MODE',
    defaultValue: false,
  );
  static const String forceUpdateUrl = String.fromEnvironment(
    'FORCE_UPDATE_URL',
    defaultValue: '',
  );
  static const int remoteConfigTimeoutSeconds = int.fromEnvironment(
    'REMOTE_CONFIG_TIMEOUT_SECONDS',
    defaultValue: 3,
  );

  static final AppFlavor flavor = AppFlavor.fromString(_flavorStr);

  static bool get isDev => flavor == AppFlavor.dev;
  static bool get isStaging => flavor == AppFlavor.staging;
  static bool get isProd => flavor == AppFlavor.prod;

  static Duration get connectTimeout =>
      const Duration(seconds: connectTimeoutSeconds);
  static Duration get receiveTimeout =>
      const Duration(seconds: receiveTimeoutSeconds);
  static Duration get remoteConfigTimeout =>
      const Duration(seconds: remoteConfigTimeoutSeconds);
}
