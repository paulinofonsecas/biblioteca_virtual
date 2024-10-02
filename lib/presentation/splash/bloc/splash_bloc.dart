import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/custom_firebase_user.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/auth_cache_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._authCacheUsecase) : super(const SplashInitial()) {
    on<CustomSplashEvent>(_onCustomSplashEvent);
    on<SplashStartedEvent>(_onSplashStartedEvent);
  }

  final AuthCacheUsecase _authCacheUsecase;

  FutureOr<void> _onCustomSplashEvent(
    CustomSplashEvent event,
    Emitter<SplashState> emit,
  ) {}

  FutureOr<void> _onSplashStartedEvent(
    SplashStartedEvent event,
    Emitter<SplashState> emit,
  ) async {
    // Check if app dependencies scope exists and drop it if it does
    if (getIt.hasScope('app_dependencies')) {
      await getIt.dropScope('app_dependencies');
    }

    // Setup app dependencies
    await setupDependencies();

    // Emit state to display loading indicator (e.g., CircularProgressIndicator)
    emit(const SplashTryLogin());

    // Attempt to retrieve logged-in user credentials
  final user = await _authCacheUsecase.getUser();
    if (user != null) {
      // User found, emit successful login state
      emit(SplashLoginSuccess(user));
    } else {
      // User not found, emit login failed state
      emit(const SplashLoginFailed());
    }
  }

}
