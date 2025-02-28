import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/preco.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/cubit/get_all_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/cubit/remover_book_on_lista_leituras_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/view/p_d_f_reader_page.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/in_line_book_medium_display.dart';
import 'package:flutter/material.dart';

/// {@template lista_leituras_body}
/// Body of the ListaLeiturasPage.
///
/// Add what it does
/// {@endtemplate}
class ListaLeiturasBody extends StatelessWidget {
  /// {@macro lista_leituras_body}
  const ListaLeiturasBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: BlocBuilder<GetAllBooksCubit, GetAllBooksState>(
        bloc: context.read<GetAllBooksCubit>()..getAllBooks(),
        builder: (context, state) {
          if (state is GetAllBooksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is GetAllBooksLoaded) {
            return _BuildLiview(
              books: state.books,
            );
          }

          if (state is GetAllBooksError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const Center(
            child: Text('Ocorreu um erro, tente mais tarde'),
          );
        },
      ),
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
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<GetAllBooksCubit>().getAllBooks();
      },
      child: BlocListener<RemoverBookOnListaLeiturasCubit,
          RemoverBookOnListaLeiturasState>(
        listener: (context, state) {
          if (state is RemoverBookOnListaLeiturasSuccess) {
            context.read<GetAllBooksCubit>().getAllBooks();
          }
        },
        child: Column(
          children: [
            ...books.map((book) {
              return InLineBookMediumDisplay(
                onTap: () {
                  PDFReaderPage.toScreen(book.id);
                },
                trailing: PopopMenu(
                  onSelected: (value) {
                    if (value == 1) {
                      context
                          .read<RemoverBookOnListaLeiturasCubit>()
                          .removeBook(book.id);
                    }
                  },
                ),
                book: BookModel(
                  id: book.id,
                  title: book.title,
                  authors: book.authors,
                  categorias: book.categorias,
                  capa: book.capa,
                  pdf: book.pdf,
                  preco: Preco.gratis(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class PopopMenu extends StatelessWidget {
  const PopopMenu({required this.onSelected, super.key});

  final void Function(int v) onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onSelected,
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 1,
            child: ListTile(
              title: Text('Remover da lista'),
              trailing: Icon(
                Icons.delete,
                color: Colors.red,
                size: 16,
              ),
            ),
          ),
        ];
      },
    );
  }
}
