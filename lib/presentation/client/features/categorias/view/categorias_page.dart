import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/client/features/categorias/cubit/cubit.dart';
import 'package:bilioteca_virtual/presentation/client/features/categorias/widgets/categorias_body.dart';

/// {@template categorias_page}
/// A description for CategoriasPage
/// {@endtemplate}
class CategoriasPage extends StatelessWidget {
  /// {@macro categorias_page}
  const CategoriasPage({super.key});

  /// The static route for CategoriasPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CategoriasPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriasCubit(),
      child: const Scaffold(
        body: CategoriasView(),
      ),
    );
  }    
}

/// {@template categorias_view}
/// Displays the Body of CategoriasView
/// {@endtemplate}
class CategoriasView extends StatelessWidget {
  /// {@macro categorias_view}
  const CategoriasView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoriasBody();
  }
}
