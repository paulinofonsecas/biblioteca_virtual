// ignore_for_file: strict_raw_type

import 'dart:async';

import 'package:bilioteca_virtual/core/error/failures.dart';
import 'package:bilioteca_virtual/core/strings/failures.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/my_user.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/sign_in_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/sign_up_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/check_verification_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/first_page_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/google_auth_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/logout_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/sign_in_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/usecases/verifiy_email_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.firstPage,
    required this.logOutUseCase,
  }) : super(AuthInitial()) {
    on<CheckLoggingInEvent>(onCheckLoggingInEvent);
    on<SignInEvent>(onSignInEvent);
    on<SignUpEvent>(onSignUpEvent);
    on<LogOutEvent>(onLogOutEvent);
    on<ErrorAuthEvent>(onErrorAuthEvent);
  }

  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final FirstPageUseCase firstPage;
  final LogOutUseCase logOutUseCase;

  Completer<void> completer = Completer<void>();

  void onCheckLoggingInEvent(
    CheckLoggingInEvent event,
    Emitter<AuthState> emit,
  ) {
    final theFirstPage = firstPage();
    if (theFirstPage.isLoggedIn) {
      emit(SignedInPageState());
    } else if (theFirstPage.isVerifyingEmail) {
      emit(VerifyEmailPageState());
    }
  }

  Future<void> onSignInEvent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final failureOrUserCredential = await signInUseCase(event.signInEntity);
    failureOrUserCredential.fold(
      (l) {
        emit(ErrorAuthState(message: 'Erro desconheicdo.'));
      },
      (r) {
        emit(SignedInState(userCredential: r));
      },
    );
  }

  Future<void> onSignUpEvent(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoadingState());
    final failureOrUserCredential = await signUpUseCase(event.signUpEntity);
    emit(eitherToState(failureOrUserCredential, SignedUpState()));
  }

  Future<void> onLogOutEvent(
    LogOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final failureOrLogOut = await logOutUseCase();
    emit(eitherToState(failureOrLogOut, LoggedOutState()));
    await Modular.to.pushNamed('/sign-in');
  }

  Future<void> onErrorAuthEvent(
    ErrorAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(ErrorAuthState(message: 'Erro desconhecido.'));
  }

  AuthState eitherToState(Either either, AuthState state) {
    return either.fold(
      (failure) => ErrorAuthState(
        // ! fix this
        message: _mapFailureToMessage(failure as Failure),
      ),
      (_) => state,
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case WeekPassFailure:
        return WEEK_PASS_FAILURE_MESSAGE;
      case ExistedAccountFailure:
        return EXISTED_ACCOUNT_FAILURE_MESSAGE;
      case NoUserFailure:
        return NO_USER_FAILURE_MESSAGE;
      case TooManyRequestsFailure:
        return TOO_MANY_REQUESTS_FAILURE_MESSAGE;
      case WrongPasswordFailure:
        return WRONG_PASSWORD_FAILURE_MESSAGE;
      case UnmatchedPassFailure:
        return UNMATCHED_PASSWORD_FAILURE_MESSAGE;
      case NotLoggedInFailure:
        return '';
      default:
        return 'Erro desconhecido, por favor, tente novamente.';
    }
  }
}
