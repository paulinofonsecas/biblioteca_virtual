import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/compra_livro/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/client/features/compra_livro/widgets/compra_livro_body.dart';

/// {@template compra_livro_page}
/// A description for CompraLivroPage
/// {@endtemplate}
class CompraLivroPage extends StatelessWidget {
  /// {@macro compra_livro_page}
  const CompraLivroPage({super.key});

  /// The static route for CompraLivroPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CompraLivroPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompraLivroBloc(),
      child: const Scaffold(
        body: CompraLivroView(),
      ),
    );
  }    
}

/// {@template compra_livro_view}
/// Displays the Body of CompraLivroView
/// {@endtemplate}
class CompraLivroView extends StatelessWidget {
  /// {@macro compra_livro_view}
  const CompraLivroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CompraLivroBody();
  }
}
