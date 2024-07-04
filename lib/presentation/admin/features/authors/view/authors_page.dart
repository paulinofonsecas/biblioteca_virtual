import 'package:bilioteca_virtual/presentation/admin/features/authors/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/cubit/list_authors_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/widgets/authors_body.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/global_search_authors_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

/// {@template authors_page}
/// A description for AuthorsPage
/// {@endtemplate}
class AuthorsPage extends StatelessWidget {
  /// {@macro authors_page}
  const AuthorsPage({super.key});

  /// The static route for AuthorsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AuthorsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListAuthorsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestão de Autores'),
          actions: const [
            GlobalSearchAuthorsWidget(),
            Gutter(),
          ],
        ),
        body: const AuthorsView(),
      ),
    );
  }
}

/// {@template authors_view}
/// Displays the Body of AuthorsView
/// {@endtemplate}
class AuthorsView extends StatelessWidget {
  /// {@macro authors_view}
  const AuthorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthorsBody();
  }
}
