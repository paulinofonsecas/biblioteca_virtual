// ignore_for_file: strict_raw_type

import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/error/exceptions.dart';
import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/core/network/network_info.dart';
import 'package:bilioteca_virtual/presentation/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:bilioteca_virtual/presentation/authentication/data/models/first_page_model.dart';
import 'package:bilioteca_virtual/presentation/authentication/data/models/sign_in_model.dart';
import 'package:bilioteca_virtual/presentation/authentication/data/models/sign_up_model.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/custom_firebase_user.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/my_user.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/sign_in_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/sign_up_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/repositories/authentication_repository.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/auth_cache_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  AuthenticationRepositoryImp({
    required this.networkInfo,
    required this.authRemoteDataSource,
  }) {
    authCache = getIt<AuthCacheUsecase>();
  }

  late final AuthCacheUsecase authCache;
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, MyUser>> signIn(SignInEntity signIn) async {
    if (await networkInfo.isConnected) {
      try {
        final signInModel =
            SignInModel(email: signIn.email, password: signIn.password);
        final userCredential = await authRemoteDataSource.signIn(signInModel);

        await authCache.saveUser(
          CustomFirebaseUser(
            uid: userCredential.credential.user!.uid,
            email: userCredential.credential.user!.email!,
            password: signIn.password,
            role: userCredential.role,
          ),
        );

        return Right(userCredential);
      } on ExistedAccountException {
        return Left(ExistedAccountFailure());
      } on WrongPasswordException {
        return Left(WrongPasswordFailure());
      } on ServerException {
        return Left(ServerFailure());
      } catch (e) {
        print('Ocorreu um grande erro');
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signUp(SignUpEntity signUp) async {
    if (!await networkInfo.isConnected) {
      return Left(OfflineFailure());
    } else if (signUp.password != signUp.repeatedPassword) {
      return Left(UnmatchedPassFailure());
    } else {
      try {
        final signUpModel = SignUpModel(
          name: signUp.name,
          email: signUp.email,
          password: signUp.password,
          repeatedPassword: signUp.repeatedPassword,
        );
        final userCredential = await authRemoteDataSource.signUp(signUpModel);
        return Right(userCredential);
      } on WeekPassException {
        return Left(WeekPassFailure());
      } on ExistedAccountException {
        return Left(ExistedAccountFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  FirstPageModel firstPage() {
    final userCredential = FirebaseAuth.instance.currentUser;
    if (userCredential != null && userCredential.emailVerified) {
      return const FirstPageModel(isVerifyingEmail: false, isLoggedIn: true);
    } else if (userCredential != null) {
      return const FirstPageModel(isVerifyingEmail: true, isLoggedIn: false);
    } else {
      return const FirstPageModel(isVerifyingEmail: false, isLoggedIn: false);
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyEmail() async {
    if (await networkInfo.isConnected) {
      try {
        await authRemoteDataSource.verifyEmail();
        return const Right(unit);
      } on TooManyRequestsException {
        return Left(TooManyRequestsFailure());
      } on ServerException {
        return Left(ServerFailure());
      } on NoUserException {
        return Left(NoUserFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<void> waitForVerifiedUser(Completer completer) async {
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   FirebaseAuth.instance.currentUser?.reload();
    //   if (FirebaseAuth.instance.currentUser!.emailVerified) {
    //     completer.complete();
    //     timer.cancel();
    //   }
    // });
    // await completer.future;
  }

  @override
  Future<Either<Failure, Unit>> checkEmailVerification(
    Completer completer,
  ) async {
    try {
      await waitForVerifiedUser(completer).timeout(const Duration(days: 30));
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    if (await networkInfo.isConnected) {
      try {
        await authCache.deleteUser();
        await FirebaseAuth.instance.signOut();
        return const Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> googleSignIn() async {
    if (!await networkInfo.isConnected) {
      return Left(OfflineFailure());
    } else {
      try {
        final userCredential =
            await authRemoteDataSource.googleAuthentication();
        return Right(userCredential);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
