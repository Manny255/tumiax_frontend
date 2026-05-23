class ProductionConfig {
  // static const String apiBaseUrl = 'https://api.tumiax.com/api/v1';
  // static const String socketUrl = 'wss://api.tumiax.com/ws';
  static const String apiBaseUrl = 'https://tumiax.com/api/v1';
  static const String socketUrl = 'wss://tumiax.com/ws';
  static const bool enableLogging = false;
  static const bool enableAnalytics = true;
  static const int connectTimeout = 90000;
  static const int receiveTimeout = 90000;
}
