import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/bloc/bloc.dart';
import 'package:flutter/material.dart';

/// {@template gestao_de_books_body}
/// Body of the GestaoDeBooksPage.
///
/// Add what it does
/// {@endtemplate}
class GestaoDeBooksBody extends StatelessWidget {
  /// {@macro gestao_de_books_body}
  const GestaoDeBooksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GestaoDeBooksBloc, GestaoDeBooksState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
