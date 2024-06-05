import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/my_user.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/sign_in_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase {
  SignInUseCase(this.repository);
  final AuthenticationRepository repository;

  Future<Either<Failure, MyUser>> call(SignInEntity signIn) async {
    return repository.signIn(signIn);
  }
}
