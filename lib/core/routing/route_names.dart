// lib/core/routing/route_names.dart
class RouteNames {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String verifyEmail = '/verify-email';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';
  static const String dashboard = '/dashboard';

  // Assets
  static const String assets = '/assets';
  static const String assetDetail = '/assets/:id';
  static const String addAsset = '/assets/add';
  static const String editAsset = '/assets/:id/edit';

  // Asset Documents
  static const String assetDocuments = '/assets/:id/documents';
  static const String assetDocumentView = '/assets/:id/documents/:docId';

  // Asset Valuation
  static const String assetValuation = '/assets/:id/valuation';

    // Insurance
  static const String insurance = '/insurance';
  static const String addInsurance = '/insurance/add';
  static const String insuranceDetail = '/insurance/:id';


  static const String credit = '/credit';
  static const String wallet = '/wallet';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String kyc = '/kyc';
  static const String pay = '/pay';
  static const String addPayoutMethod = '/payout-method';
  static const String managePayoutMethods = '/manage-payout-methods';
  static const String transefer = '/transefer';
  static const String notifications = '/notifications';
  static const String kycVerification = '/kyc-verification';
  static const String transactions = '/transactions';
  static const String changePassword = '/change-password';
  static const String pinSetup = '/pin-setup';
}
