// lib/features/insurance/data/exceptions/insurance_exceptions.dart

class InsuranceValidationException implements Exception {
  final String message;
  final Map<String, dynamic> errors;

  InsuranceValidationException({required this.message, required this.errors});

  @override
  String toString() => message;
}
