// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/preco.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/view/admin_view_book_page.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/cubit/discovery_book_cubit.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/in_line_book_medium_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoveryBooksWidget extends StatelessWidget {
  const DiscoveryBooksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoveryBookCubit, DiscoveryBookState>(
      bloc: context.read<DiscoveryBookCubit>()..getDiscoveryBooks(),
      builder: (context, state) {
        if (state is DiscoveryBookLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is DiscoveryBookLoaded) {
          return _BuildLiview(
            books: state.books,
          );
        }

        if (state is DiscoveryBookError) {
          return Center(
            child: Text(state.message),
          );
        }

        return const Center(
          child: Text('Ocorreu um erro, tente mais tarde'),
        );
      },
    );
  }
}

class _BuildLiview extends StatelessWidget {
  const _BuildLiview({
    required this.books,
  });

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...books.map((book) {
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
              preco: Preco.gratis(),
            ),
          );
        }),
      ],
    );
  }
}
