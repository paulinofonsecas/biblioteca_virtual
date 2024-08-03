import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/my_user.dart';
import 'package:bilioteca_virtual/presentation/authentication/domain/entities/sign_in_entity.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:bilioteca_virtual/presentation/splash/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// {@template splash_body}
/// Body of the SplashPage.
///
/// Add what it does
/// {@endtemplate}
class SplashBody extends StatelessWidget {
  /// {@macro splash_body}
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignedInState) {
          final role = state.userCredential?.role;

          if (getIt.isRegistered<MyUser>()) {
            getIt.unregister<MyUser>();
          }
          getIt.registerLazySingleton<MyUser>(() => state.userCredential!);

          if (role == 'admin') {
            Modular.to.pushReplacementNamed('/admin');
          } else if (role == 'usuario') {
            Modular.to.pushReplacementNamed('/client');
          }
        }
      },
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoginSuccess) {
            BlocProvider.of<AuthBloc>(context).add(
              SignInEvent(
                signInEntity: SignInEntity(
                  email: state.userCredential.email,
                  password: state.userCredential.password,
                ),
              ),
            );
          }

          if (state is SplashLoginFailed) {
            Modular.to.pushReplacementNamed('/sign-in');
          }
        },
        builder: (context, state) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
