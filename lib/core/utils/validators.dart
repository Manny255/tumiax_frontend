import '../../features/auth/domain/models/failure.dart';

class ValidationFailure extends Failure {
  final Map<String, dynamic>? errors;

  ValidationFailure(super.message, {this.errors});

  @override
  String toString() => '$message: $errors';
}
