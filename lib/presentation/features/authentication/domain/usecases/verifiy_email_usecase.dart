import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/presentation/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class VerifyEmailUseCase {
  VerifyEmailUseCase(this.repository);
  final AuthenticationRepository repository;

  Future<Either<Failure, Unit>> call() async {
    return repository.verifyEmail();
  }
}
