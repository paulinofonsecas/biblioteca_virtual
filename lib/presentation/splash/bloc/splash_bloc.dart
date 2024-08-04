import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/custom_firebase_user.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/auth_cache_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashInitial()) {
    on<CustomSplashEvent>(_onCustomSplashEvent);
    on<SplashStartedEvent>(_onSplashStartedEvent);

    _authCacheUsecase = getIt<AuthCacheUsecase>();
  }

  late final AuthCacheUsecase _authCacheUsecase;

  FutureOr<void> _onCustomSplashEvent(
    CustomSplashEvent event,
    Emitter<SplashState> emit,
  ) {}

  FutureOr<void> _onSplashStartedEvent(
    SplashStartedEvent event,
    Emitter<SplashState> emit,
  ) async {
    // remove as dependencias do usuario da memória!
    if (getIt.hasScope('app_dependencies')) {
      await getIt.dropScope('app_dependencies');
    }

    // Injeta as dependencias do usuario na memoria
    await setupDependencies();

    // emite o estado para a tela no sentido de mostrar o CircleProgressIndic...
    emit(const SplashTryLogin());

    // recupera as credencias do usuario logado e em seguia informa se há uma
    // conta de usuario afim de fazer login automaticamente
    final user = await _authCacheUsecase.getUser();
    if (user != null) {
      emit(SplashLoginSuccess(user));
    } else {
      emit(const SplashLoginFailed());
    }
  }
}
