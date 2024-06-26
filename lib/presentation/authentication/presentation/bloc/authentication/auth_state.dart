part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class EmailIsSentState extends AuthState {}

class EmailIsVerifiedState extends AuthState {}

class SignedInPageState extends AuthState {}

class VerifyEmailPageState extends AuthState {}

class LoggedOutState extends AuthState {}

class SignedInState extends AuthState {
  SignedInState({required this.userCredential});

  final MyUser? userCredential;

  @override
  List<Object> get props => userCredential != null ?  [] : [userCredential!];
}

class SignedUpState extends AuthState {}

class GoogleSignInState extends AuthState {}

class ErrorAuthState extends AuthState {
  ErrorAuthState({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
