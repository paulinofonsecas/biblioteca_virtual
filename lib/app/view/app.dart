import 'package:bilioteca_virtual/app/cubit/app_brightness_cubit.dart';
import 'package:bilioteca_virtual/app/view/themes/app_theme.dart';
import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/router/go_router.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => AppBrightnessCubit(),
        ),
      ],
      child: Builder(
        builder: (c) {
          late AppBrightnessState appBrightnessState;

          try {
            appBrightnessState =
                context.select<AppBrightnessCubit, AppBrightnessState>(
              (AppBrightnessCubit cubit) => cubit.state,
            );
          } catch (dynamic) {
            appBrightnessState = const AppBrightnessInitial(Brightness.light);
          }

          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LoggedOutState) {
                router.pushReplacement('/sign-in');
              }
            },
            child: GlobalLoaderOverlay(
              useDefaultLoading: false,
              overlayWidgetBuilder: (_) {
                return const Center(
                  child: SpinKitFoldingCube(
                    color: Colors.red,
                  ),
                );
              },
              child: MaterialApp.router(
                title: 'Biblioteca Virtual',
                debugShowCheckedModeBanner: false,
                theme: appTheme(appBrightnessState),
                routerConfig: Modular.routerConfig,
              ),
            ),
          );
        },
      ),
    );
  }
}
