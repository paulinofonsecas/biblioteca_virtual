// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/admin_view_book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/home/cubit/all_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/in_line_book_medium_display.dart';
import 'package:flutter/material.dart';

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
    this.books = const <BookModel>[],
  });

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return SliverList.list(children: const []);
    }
    return SliverList.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];

        return InLineBookMediumDisplay(
          onTap: () {
            AdminViewBookPage.toScreen(book.id);
          },
          book: BookModel(
            id: book.id,
            title: book.title,
            authors: book.authors,
            capa: book.capa,
            pdf: book.pdf,
            preco: book.preco,
          ),
        );
      },
    );
  }
}
