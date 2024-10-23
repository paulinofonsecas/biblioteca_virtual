import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/widgets/categorias_livro_body.dart';

/// {@template categorias_livro_page}
/// A description for CategoriasLivroPage
/// {@endtemplate}
class CategoriasLivroPage extends StatelessWidget {
  /// {@macro categorias_livro_page}
  const CategoriasLivroPage({super.key});

  /// The static route for CategoriasLivroPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CategoriasLivroPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoriasLivroBloc(),)
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categorias de livros'),
        ),
        body: const CategoriasLivroView(),
      ),
    );
  }    
}

/// {@template categorias_livro_view}
/// Displays the Body of CategoriasLivroView
/// {@endtemplate}
class CategoriasLivroView extends StatelessWidget {
  /// {@macro categorias_livro_view}
  const CategoriasLivroView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoriasLivroBody();
  }
}
