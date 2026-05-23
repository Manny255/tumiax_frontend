import 'environments/development.dart';
import 'environments/production.dart';
import 'environments/staging.dart';

enum Environment { development, staging, production }

class AppConfig {
  static late Environment environment;
  static late String apiBaseUrl;
  static late String socketUrl;
  static late bool enableLogging;
  static late bool enableAnalytics;
  static late int connectTimeout;
  static late int receiveTimeout;

  static void initialize(Environment env) {
    environment = env;

    switch (env) {
      case Environment.development:
        apiBaseUrl = DevelopmentConfig.apiBaseUrl;
        socketUrl = DevelopmentConfig.socketUrl;
        enableLogging = DevelopmentConfig.enableLogging;
        enableAnalytics = DevelopmentConfig.enableAnalytics;
        connectTimeout = DevelopmentConfig.connectTimeout;
        receiveTimeout = DevelopmentConfig.receiveTimeout;
        break;
      case Environment.staging:
        apiBaseUrl = StagingConfig.apiBaseUrl;
        socketUrl = StagingConfig.socketUrl;
        enableLogging = StagingConfig.enableLogging;
        enableAnalytics = StagingConfig.enableAnalytics;
        connectTimeout = StagingConfig.connectTimeout;
        receiveTimeout = StagingConfig.receiveTimeout;
        break;
      case Environment.production:
        apiBaseUrl = ProductionConfig.apiBaseUrl;
        socketUrl = ProductionConfig.socketUrl;
        enableLogging = ProductionConfig.enableLogging;
        enableAnalytics = ProductionConfig.enableAnalytics;
        connectTimeout = ProductionConfig.connectTimeout;
        receiveTimeout = ProductionConfig.receiveTimeout;
        break;
    }
  }

  static bool get isDevelopment => environment == Environment.development;
  static bool get isStaging => environment == Environment.staging;
  static bool get isProduction => environment == Environment.production;
}
