import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/cubit/most_wanted_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/p_d_f_reader.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/book_mini_display.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TheMostWantedBooksWidget extends StatelessWidget {
  const TheMostWantedBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostWantedBooksCubit, MostWantedBooksState>(
      bloc: context.read<MostWantedBooksCubit>()..getMostWantedBooks(),
      builder: (context, state) {
        if (state is MostWantedBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is MostWantedBooksLoaded) {
          return _BooksListView(
            books: state.books,
          );
        }

        if (state is MostWantedBooksError) {
          return Center(
            child: Text(state.message),
          );
        }

        return const Center(
          child: Text('Erro'),
        );
      },
    );
  }
}

class _BooksListView extends StatelessWidget {
  const _BooksListView({
    required this.books,
  });

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .25,
      child: ListView.builder(
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final book = books[index];

          return BookMiniDisplay(
            book: book,
            onTap: () {
              context.go(
                Uri(
                  path: '/pdf-reader',
                  queryParameters: {
                    'bookId': book.id,
                    'parent': '/home-page',
                  },
                ).toString(),
              );
            },
          );
        },
      ),
    );
  }
}
