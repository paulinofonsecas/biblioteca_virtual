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
    return BlocConsumer<ListBooksCubit, ListBooksState>(
      bloc: context.read<ListBooksCubit>()..loadBookList(),
      listener: (BuildContext context, ListBooksState state) {
        if (state is ListBooksError) {
          _showErrorMessage(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is ListBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ListBooksError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Ups, algo correu mal. Tente novamente'),
                const Gutter(),
                TextButton.icon(
                  onPressed: () {},
                  label: const Text('Recarregar a pagina'),
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
          );
        }

        if (state is ListBooksLoaded) {
          return _buildListBooks(state.books);
        }

        return const Placeholder();
      },
    );
  }

  void _showErrorMessage(BuildContext context, String message) {
    final controller = showBottomSheet(
      context: context,
      builder: (context) {
        return ListTile(
          title: const Text('Ocorreu um erro'),
          subtitle: Text(message),
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), controller.close);
  }

  ListView _buildListBooks(List<Book> books) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];

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
                onPressed: () {
                  context.read<ListBooksCubit>().deleteBook(book.id);
                },
                icon: BlocBuilder<ListBooksCubit, ListBooksState>(
                  builder: (context, state) {
                    if (state is ListBooksDeleteLoading) {
                      return const CircularProgressIndicator();
                    }

                    return const Icon(
                      Icons.delete,
                      color: Colors.red,
                    );
                  },
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
