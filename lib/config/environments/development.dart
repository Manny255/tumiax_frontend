class DevelopmentConfig {
  static const String apiBaseUrl = 'http://10.104.206.244:8000/api/v1';
  static const String socketUrl = 'ws://10.104.206.244:8000/ws';
  static const bool enableLogging = true;
  static const bool enableAnalytics = false;
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
}
