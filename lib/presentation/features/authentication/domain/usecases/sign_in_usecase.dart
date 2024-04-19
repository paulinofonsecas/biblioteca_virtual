import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/presentation/features/authentication/domain/entities/sign_in_entity.dart';
import 'package:bilioteca_virtual/presentation/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInUseCase {
  SignInUseCase(this.repository);
  final AuthenticationRepository repository;

  Future<Either<Failure, UserCredential>> call(SignInEntity signIn) async {
    return repository.signIn(signIn);
  }
}
