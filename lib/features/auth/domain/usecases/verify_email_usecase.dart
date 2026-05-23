// lib/features/auth/domain/usecases/verify_email_usecase.dart
import '../../data/repositories/auth_repository.dart';
import '../../data/models/auth_response.dart';
import 'usecase.dart';

class VerifyEmailParams {
  final String email;
  final String code;

  VerifyEmailParams({required this.email, required this.code});
}

class VerifyEmailUsecase implements UseCase<AuthResponse, VerifyEmailParams> {
  final AuthRepository repository;

  VerifyEmailUsecase(this.repository);

  @override
  Future<AuthResponse> call(VerifyEmailParams params) async {
    final result = await repository.verifyEmail(params.email, params.code);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (authResponse) => authResponse,
    );
  }
}
