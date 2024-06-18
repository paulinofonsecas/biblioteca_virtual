import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/cubit/list_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class GestaoDeBooksBody extends StatelessWidget {
  const GestaoDeBooksBody({super.key});

  @override
  Widget build(BuildContext context) {
    final fakeBooks = List.generate(
      10,
      (index) => Book(
        id: index.toString(),
        title: 'Título do Livro $index',
        autor: 'Autor do Livro $index',
        editora: 'Editora do Livro $index',
        resumo: 'Resumo do Livro $index',
        capa: 'Capa do Livro $index',
        pdf: 'PDF do Livro $index',
      ),
    );

    return BlocBuilder<ListBooksCubit, ListBooksState>(
      bloc: context.read<ListBooksCubit>()..loadBookList(),
      builder: (context, state) {
        if (state is ListBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ListBooksError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is ListBooksLoaded) {
          return _buildListBooks(state.books);
        }

        return const Placeholder();
      },
    );
  }

  ListView _buildListBooks(List<Book> fakeBooks) {
    return ListView.builder(
      itemCount: fakeBooks.length,
      itemBuilder: (context, index) {
        final book = fakeBooks[index];

        return ListTile(
          title: Text(
            book.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(book.autor),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              const GutterSmall(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: book.capa,
              width: 60,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
