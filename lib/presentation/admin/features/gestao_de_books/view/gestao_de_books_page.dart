import 'package:bilioteca_virtual/presentation/admin/features/add_new_book/view/add_new_book_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/widgets/gestao_de_books_body.dart';
import 'package:flutter/material.dart';

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
      create: (context) => GestaoDeBooksBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestão de Books'),
        ),
        body: const GestaoDeBooksView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(AddNewBookPage.route());
          },
          child: const Icon(Icons.add),
        ),
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
