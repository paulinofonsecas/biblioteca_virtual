import 'package:bilioteca_virtual/core/network/network_info.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_authors_datasource.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_categoria_datasource.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_lista_de_leitura_datasource.dart';
import 'package:bilioteca_virtual/data/datasource/remote/firebase/firebase_authors_datasource.dart';
import 'package:bilioteca_virtual/data/datasource/remote/firebase/firebase_categoria_datasource.dart';
import 'package:bilioteca_virtual/data/datasource/remote/firebase/firebase_lista_de_leitura_datasource.dart';
import 'package:bilioteca_virtual/data/datasource/remote/firebase/firebase_payment_datasource.dart';
import 'package:bilioteca_virtual/data/repositories/authors_repository.dart';
import 'package:bilioteca_virtual/data/repositories/books_repository.dart';
import 'package:bilioteca_virtual/data/repositories/categoria_repository.dart';
import 'package:bilioteca_virtual/data/repositories/lista_de_leitura_repository.dart';
import 'package:bilioteca_virtual/data/repositories/payment_repository.dart';
import 'package:bilioteca_virtual/domain/repositories/i_author_repository.dart';
import 'package:bilioteca_virtual/domain/repositories/i_books_repository.dart';
import 'package:bilioteca_virtual/domain/repositories/i_categoria_repository.dart';
import 'package:bilioteca_virtual/domain/repositories/i_lista_de_leitura_repository.dart';
import 'package:bilioteca_virtual/domain/repositories/i_payment_repository.dart';
import 'package:bilioteca_virtual/domain/use_cases/categoria_use_case.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_author_use_cases.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_lista_de_leitura_use_cases.dart';
import 'package:bilioteca_virtual/domain/use_cases/payment_use_cases.dart';
import 'package:bilioteca_virtual/presentation/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:bilioteca_virtual/presentation/authentication/data/repositories/auth_repository_impl.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/repositories/authentication_repository.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/auth_cache_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/first_page_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/logout_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/sign_in_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupCoreDependencies() async {
  getIt.pushNewScope(
    scopeName: 'core_dependencies',
    init: (g) {
      g
        ..registerLazySingleton<FlutterSecureStorage>(
          () => const FlutterSecureStorage(
            aOptions: AndroidOptions(
              encryptedSharedPreferences: true,
            ),
          ),
        )
        ..registerSingleton<FirebaseAuth>(FirebaseAuth.instance)
        ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
        ..registerSingleton<FirebaseStorage>(FirebaseStorage.instance)

        // outher
        ..registerLazySingleton(() => SignInUseCase(getIt()))
        ..registerLazySingleton(() => SignUpUseCase(getIt()))
        ..registerLazySingleton(() => FirstPageUseCase(getIt()))
        ..registerLazySingleton(() => LogOutUseCase(getIt()))
        ..registerLazySingleton(
          () => AuthBloc(
            signInUseCase: getIt(),
            signUpUseCase: getIt(),
            firstPage: getIt(),
            logOutUseCase: getIt(),
          ),
        )
        ..registerLazySingleton(() => AuthCacheUsecase(getIt()))

        // Datasources
        ..registerSingleton<AuthRemoteDataSource>(
          AuthRemoteDataSourceImpl(),
        )
        // Repository
        ..registerSingleton<NetworkInfo>(NetworkInfoImpl())
        ..registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImp(
            networkInfo: getIt(),
            authRemoteDataSource: getIt(),
          ),
        );
    },
  );
}

Future<void> setupDependencies() async {
  getIt.pushNewScope(
    scopeName: 'app_dependencies',
    init: (g) {
      g // Books dependancies
        ..registerLazySingleton<IBooksRepository>(BooksRepository.new)
        ..registerLazySingleton<IBooksUseCases>(() => BooksUseCases(getIt()))

        // Authors dependencies
        ..registerLazySingleton<IAuthorsDatasource>(
          FirebaseAuthorsDatasource.new,
        )
        ..registerLazySingleton<IAuthorsRepository>(
          () => AuthorsRepository(getIt()),
        )
        ..registerLazySingleton<IAuthorsUseCases>(
          () => AuthorsUseCases(getIt()),
        )

        // payment Clean Arch
        ..registerLazySingleton<IFirebasePaymentDatasource>(
          () => FirebasePaymentDatasourceImpl(getIt()),
        )
        ..registerLazySingleton<IPaymentRepository>(
          () => PaymentRepository(getIt()),
        )
        ..registerLazySingleton<IPaymentUseCases>(
          () => PaymentUseCases(getIt()),
        )

        // Lista de leituras Clean Arch
        ..registerLazySingleton<IListaLeituraDatasource>(
          () => FirebaseListaDeLeituraDatasource(getIt()),
        )
        ..registerLazySingleton<IListaLeituraRepository>(
          () => ListaLeituraRepository(getIt()),
          dispose: (param) {
            param.cleanCache();
          },
        )
        ..registerLazySingleton<IListaLeituraUseCases>(
          () => ListaLeituraUseCases(getIt()),
        )

        // Categorias
        ..registerLazySingleton<ICategoriaDatasource>(
          () => FirebaseCategoriaDatasource(firebaseFirestore: getIt()),
        )
        ..registerLazySingleton<ICategoriaRepository>(
          () => CategoriaRepository(datasource: getIt()),
        )
        ..registerLazySingleton<ICategoriaUseCase>(
          () => CategoriaUseCaseImpl(repository: getIt()),
        )

        // Bloc
        ..registerLazySingleton(ListaLeiturasBloc.new);
    },
  );
}
