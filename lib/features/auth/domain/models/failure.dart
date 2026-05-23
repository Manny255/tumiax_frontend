// lib/features/auth/domain/models/failure.dart
class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}
class KycRequiredFailure extends Failure {
  KycRequiredFailure([super.message = "KYC verification required"]);
}
