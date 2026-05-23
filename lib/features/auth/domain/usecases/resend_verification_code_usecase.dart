import 'package:dartz/dartz.dart';
import '../../data/repositories/auth_repository.dart';
import '../models/failure.dart';
import 'usecase.dart';

class ResendCodeParams {
  final String email;

  ResendCodeParams({required this.email});
}

class ResendVerificationCodeUsecase implements UseCase<void, ResendCodeParams> {
  final AuthRepository repository;

  ResendVerificationCodeUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(ResendCodeParams params) {
    return repository.resendVerificationCode(params.email);
  }
}
