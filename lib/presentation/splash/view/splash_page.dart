import 'package:bilioteca_virtual/presentation/splash/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/splash/widgets/splash_body.dart';
import 'package:flutter/material.dart';

/// {@template splash_page}
/// A description for SplashPage
/// {@endtemplate}
class SplashPage extends StatelessWidget {
  /// {@macro splash_page}
  const SplashPage({super.key});

  /// The static route for SplashPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: const Scaffold(
        body: SplashView(),
      ),
    );
  }
}

/// {@template splash_view}
/// Displays the Body of SplashView
/// {@endtemplate}
class SplashView extends StatefulWidget {
  /// {@macro splash_view}
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    context.read<SplashBloc>().add(const SplashStartedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashBody();
  }
}
