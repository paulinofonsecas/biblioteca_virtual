// ignore_for_file: strict_raw_type

import 'dart:async';

import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class CheckVerificationUseCase {
  CheckVerificationUseCase(this.repository);
  final AuthenticationRepository repository;

  Future<Either<Failure, Unit>> call(Completer completer) {
    return repository.checkEmailVerification(completer);
  }
}
