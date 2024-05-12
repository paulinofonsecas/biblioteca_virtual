import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/sign_up_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpUseCase {
  SignUpUseCase(this.repository);
  final AuthenticationRepository repository;

  Future<Either<Failure, UserCredential>> call(SignUpEntity signup) async {
    return repository.signUp(signup);
  }
}
