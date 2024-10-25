// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/preco.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/view/admin_view_book_page.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/cubit/discovery_book_cubit.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/all_books/categories/categories_cubit.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/all_books/categories/widget/item_categoria/item_categoria.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/all_books/categories/widget/item_categoria/item_categoria_cubit.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/all_books/categories/widget/loading_categories.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/in_line_book_medium_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoveryBooksWidget extends StatefulWidget {
  const DiscoveryBooksWidget({super.key});

  @override
  State<DiscoveryBooksWidget> createState() => _DiscoveryBooksWidgetState();
}

class _DiscoveryBooksWidgetState extends State<DiscoveryBooksWidget> {
  @override
  void initState() {
    context.read<CategoriesCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is GettingCategories) {
              return const Padding(
                padding: EdgeInsets.only(left: 8, bottom: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: LoadingCategoriesWidget(),
                ),
              );
            }

            if (state is GettingCategoriesSucess) {
              if (state.lista.isEmpty) {
                return const Text('Os livros não estão Categorizados');
              }
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.lista
                      .map(
                        (cada) => Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 10),
                          child: BlocProvider(
                            create: (context) => ItemCategoriaCubit(),
                            child: ItemCategoria(
                              categoria: cada,
                              aoClicarItem: (valor) {},
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            }

            if (state is GettingCategoriesError) {
              return Text(state.mensagem);
            }
            return const Text('Ocorreu algum erro');
          },
        ),
        BlocBuilder<DiscoveryBookCubit, DiscoveryBookState>(
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
        ),
      ],
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
              categorias: book.categorias,
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
