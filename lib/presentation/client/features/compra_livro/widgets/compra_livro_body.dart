import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/compra_livro/bloc/bloc.dart';

/// {@template compra_livro_body}
/// Body of the CompraLivroPage.
///
/// Add what it does
/// {@endtemplate}
class CompraLivroBody extends StatelessWidget {
  /// {@macro compra_livro_body}
  const CompraLivroBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompraLivroBloc, CompraLivroState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
