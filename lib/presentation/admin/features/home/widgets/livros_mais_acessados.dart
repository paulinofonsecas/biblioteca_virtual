import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/view/admin_view_book_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/home/cubit/featured_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/book_mini_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;

class LivrosMaisAcessadosWidget extends StatelessWidget {
  const LivrosMaisAcessadosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.width * .4,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        bloc: context.read<FeaturedBooksCubit>()..getFeaturedBooks(),
        builder: (context, state) {
          if (state is FeaturedBooksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is FeaturedBooksError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is FeaturedBooksLoaded) {
            return _BuildListOfFeaturedBooks(state.books);
          }

          return const Text('Erro ao listar os livros mais acessados');
        },
      ),
    );
  }
}

class _BuildListOfFeaturedBooks extends StatelessWidget {
  const _BuildListOfFeaturedBooks(this.books);

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];

        return BookMiniDisplay(
          onTap: () {
            AdminViewBookPage.toScreen(book.id);
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
