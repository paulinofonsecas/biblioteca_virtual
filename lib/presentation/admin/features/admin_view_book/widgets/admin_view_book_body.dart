// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/cubit/admin_view_book_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/book_info_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/build_comprar_livro.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/description_widget.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/more_from_autor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminViewBookBody extends StatelessWidget {
  const AdminViewBookBody({required this.bookId, super.key});

  final String bookId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminViewBookCubit, AdminViewBookState>(
      bloc: context.read<AdminViewBookCubit>()..getBook(bookId),
      builder: (context, state) {
        if (state is AdminViewBookLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is AdminViewBookError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is AdminViewBookLoaded) {
          return _BuildScreen(
            book: state.book,
          );
        }

        return const Center(
          child: Text('Erro'),
        );
      },
    );
  }
}

class _BuildScreen extends StatelessWidget {
  const _BuildScreen({required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookInfoWidget(book: book),
              BookDescriptionWidget(book: book),
              MoreFromAutorWidget(book: book),
            ],
          ),
        ),
        BuildComprarLivroButton(
          book: book,
        ),
      ],
    );
  }
}
