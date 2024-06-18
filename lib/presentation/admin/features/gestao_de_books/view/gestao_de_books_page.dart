import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/cubit/list_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/widgets/gestao_de_books_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class GestaoDeBooksPage extends StatelessWidget {
  const GestaoDeBooksPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const GestaoDeBooksPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBooksCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestão de livros'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            const Gutter(),
          ],
        ),
        body: const GestaoDeBooksView(),
      ),
    );
  }
}

class GestaoDeBooksView extends StatelessWidget {
  const GestaoDeBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GestaoDeBooksBody();
  }
}
