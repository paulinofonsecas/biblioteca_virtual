import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/categorias/cubit/cubit.dart';

/// {@template categorias_body}
/// Body of the CategoriasPage.
///
/// Add what it does
/// {@endtemplate}
class CategoriasBody extends StatelessWidget {
  /// {@macro categorias_body}
  const CategoriasBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriasCubit, CategoriasState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
