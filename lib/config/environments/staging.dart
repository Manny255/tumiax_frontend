class StagingConfig {
  static const String apiBaseUrl = 'https://staging-api.tumiax.com/api/v1';
  static const String socketUrl = 'wss://staging-api.tumiax.com/ws';
  static const bool enableLogging = true;
  static const bool enableAnalytics = true;
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
}
