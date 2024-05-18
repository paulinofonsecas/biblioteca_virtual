import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/core/router/go_router.dart';
import 'package:bilioteca_virtual/l10n/l10n.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: Builder(
        builder: (context) {
          return GlobalLoaderOverlay(
            useDefaultLoading: false,
            overlayWidgetBuilder: (_) {
              //ignored progress for the moment
              return const Center(
                child: SpinKitFoldingCube(
                  color: Colors.red,
                ),
              );
            },
            child: MaterialApp.router(
              title: 'Biblioteca Virtual',
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light().copyWith(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
              ),
              routerConfig: router,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          );
        },
      ),
    );
  }
}
