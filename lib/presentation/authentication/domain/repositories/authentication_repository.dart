// ignore_for_file: strict_raw_type

import 'dart:async';

import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/first_page_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/sign_in_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/sign_up_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserCredential>> signIn(SignInEntity signIn);
  Future<Either<Failure, UserCredential>> signUp(SignUpEntity signUp);
  Future<Either<Failure, UserCredential>> googleSignIn();
  FirstPageEntity firstPage();
  Future<Either<Failure, Unit>> verifyEmail();
  Future<Either<Failure, Unit>> checkEmailVerification(Completer completer);
  Future<Either<Failure, Unit>> logOut();
}
