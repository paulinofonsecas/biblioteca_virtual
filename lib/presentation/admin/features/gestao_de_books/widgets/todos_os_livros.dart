// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/gestao_de_books/cubit/all_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/in_line_book_medium_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TodosOsLivrosWidget extends StatelessWidget {
  const TodosOsLivrosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBooksCubit, AllBooksState>(
      bloc: context.read<AllBooksCubit>()..getAllBooks(),
      builder: (context, state) {
        if (state is AllBooksLoading) {
          return const _BooksGridView();
        }

        if (state is AllBooksLoaded) {
          return _BooksGridView(
            books: state.books,
          );
        }

        if (state is AllBooksError) {
          return const _BooksGridView();
        }

        return const _BooksGridView();
      },
    );
  }
}

class _BooksGridView extends StatelessWidget {
  const _BooksGridView({
    this.books = const <Book>[],
  });

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return SliverList.list(children: const []);
    }
    return SliverList.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final book = books[index];

        return InLineBookMediumDisplay(
          onTap: () {
            context.go(
              Uri(
                path: '/admin/view-book',
                queryParameters: {'bookId': book.id},
              ).toString(),
            );
          },
          book: Book(
            id: book.id,
            title: book.title,
            autor: book.autor,
            capa: book.capa,
            pdf: book.pdf,
          ),
        );
      },
    );
  }
}
