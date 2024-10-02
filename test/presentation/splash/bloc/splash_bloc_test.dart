import 'package:bilioteca_virtual/presentation/authentication/domain/entities/custom_firebase_user.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/auth_cache_usecase.dart';
import 'package:bilioteca_virtual/presentation/splash/bloc/splash_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockAuthCacheUsecase extends Mock implements AuthCacheUsecase {
  @override
  Future<CustomFirebaseUser?> getUser();
}

void main() {
  late MockAuthCacheUsecase mockAuthCacheUsecase;
  late SplashBloc splashBloc;

  setUp(() {
    mockAuthCacheUsecase = MockAuthCacheUsecase();
    splashBloc = SplashBloc(mockAuthCacheUsecase);
  });

  blocTest<SplashBloc, SplashState>(
    'emits [SplashTryLogin, SplashLoginSuccess] when user is found',
    build: () {
      when(() => mockAuthCacheUsecase.getUser()).thenAnswer(
        (_) async => CustomFirebaseUser(
            uid: 'uid', email: 'email', password: 'password', role: 'role',),
      ); // Replace User with your actual user model
      return splashBloc;
    },
    act: (bloc) => bloc.add(const SplashStartedEvent()),
    expect: () => [
      const SplashTryLogin(),
      isA<SplashLoginSuccess>(),
    ],
  );

  blocTest<SplashBloc, SplashState>(
    'emits [SplashTryLogin, SplashLoginFailed] when user is not found',
    build: () {
      when(() => mockAuthCacheUsecase.getUser()).thenAnswer((_) async => null);
      return splashBloc;
    },
    act: (bloc) => bloc.add(const SplashStartedEvent()),
    expect: () => [
      const SplashTryLogin(),
      const SplashLoginFailed(),
    ],
  );
}
