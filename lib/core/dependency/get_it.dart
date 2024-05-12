import 'package:bilioteca_virtual/core/network/network_info.dart';
import 'package:bilioteca_virtual/presentation/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:bilioteca_virtual/presentation/authentication/data/repositories/auth_repository_impl.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/repositories/authentication_repository.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/check_verification_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/first_page_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/google_auth_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/logout_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/sign_in_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/verifiy_email_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt
    ..registerSingleton<FirebaseAuth>(FirebaseAuth.instance)

// Usecases

    ..registerLazySingleton(() => SignInUseCase(getIt()))
    ..registerLazySingleton(() => SignUpUseCase(getIt()))
    ..registerLazySingleton(() => FirstPageUseCase(getIt()))
    ..registerLazySingleton(() => VerifyEmailUseCase(getIt()))
    ..registerLazySingleton(() => CheckVerificationUseCase(getIt()))
    ..registerLazySingleton(() => LogOutUseCase(getIt()))
    ..registerLazySingleton(() => GoogleAuthUseCase(getIt()))

// Bloc

    ..registerLazySingleton(
      () => AuthBloc(
        signInUseCase: getIt(),
        signUpUseCase: getIt(),
        firstPage: getIt(),
        verifyEmailUseCase: getIt(),
        checkVerificationUseCase: getIt(),
        logOutUseCase: getIt(),
        googleAuthUseCase: getIt(),
      ),
    )

// Repository
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImp(
        networkInfo: getIt(),
        authRemoteDataSource: getIt(),
      ),
    )

// Datasources
    ..registerLazySingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl.new)

//! Core
    ..registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new);

//! External
  // ..registerLazySingleton(InternetConnection.new);
}
