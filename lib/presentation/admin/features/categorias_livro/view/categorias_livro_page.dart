import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/dialogo_add_categoria/dialogo_pagamento.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/widgets/categorias_livro_body.dart';
import 'package:flutter/material.dart';

/// {@template categorias_livro_page}
/// A description for CategoriasLivroPage
/// {@endtemplate}
class CategoriasLivroPage extends StatelessWidget {
  /// {@macro categorias_livro_page}
  const CategoriasLivroPage({super.key});

  /// The static route for CategoriasLivroPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const CategoriasLivroPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriasLivroBloc(),
        )
      ],
      child: Builder(
        builder: (context2) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Categorias de livros'),
            ),
            body: const CategoriasLivroView(),
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  mostrarDialogoAddPagamento(
                      accaoAoConfirmar: (categoria) {
                        context2
                            .read<CategoriasLivroBloc>()
                            .add(AdiconarCategoriaLivroEvent(item: categoria));
                      },
                      context: context);
                }),
          );
        },
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
