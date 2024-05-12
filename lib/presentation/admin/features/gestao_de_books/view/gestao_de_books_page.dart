import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/widgets/gestao_de_books_body.dart';

/// {@template gestao_de_books_page}
/// A description for GestaoDeBooksPage
/// {@endtemplate}
class GestaoDeBooksPage extends StatelessWidget {
  /// {@macro gestao_de_books_page}
  const GestaoDeBooksPage({super.key});

  /// The static route for GestaoDeBooksPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const GestaoDeBooksPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GestaoDeBooksBloc(),
      child: const Scaffold(
        body: GestaoDeBooksView(),
      ),
    );
  }    
}

/// {@template gestao_de_books_view}
/// Displays the Body of GestaoDeBooksView
/// {@endtemplate}
class GestaoDeBooksView extends StatelessWidget {
  /// {@macro gestao_de_books_view}
  const GestaoDeBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GestaoDeBooksBody();
  }
}
