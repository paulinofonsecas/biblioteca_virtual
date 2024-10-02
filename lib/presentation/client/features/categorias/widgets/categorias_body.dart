import 'package:bilioteca_virtual/domain/use_cases/categoria_use_case.dart';
import 'package:flutter/material.dart';

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
    return Center(
      child: TextButton(
        onPressed: () async {
        },
        child: const Text('Categorias'),
      ),
    );
  }
}
