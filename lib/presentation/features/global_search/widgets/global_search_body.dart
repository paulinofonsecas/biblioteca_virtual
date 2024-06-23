import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/presentation/features/global_search/cubit/search_list_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/global_search/widgets/empty_list_books.dart';
import 'package:bilioteca_virtual/presentation/features/global_search/widgets/searched_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchable_listview/searchable_listview.dart';

class GlobalSearchBody extends StatelessWidget {
  const GlobalSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: BlocBuilder<SearchListBooksCubit, SearchListBooksState>(
        bloc: context.read<SearchListBooksCubit>()..loadBookList(),
        builder: (context, state) {
          if (state is SearchListBooksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SearchListBooksError) {
            return const Center(
              child: Text('Ups, algo deu errado'),
            );
          }

          if (state is SearchListBooksLoaded) {
            return SearchableList<Book>(
              initialList: state.books,
              itemBuilder: (Book user) => SearchedItem(book: user),
              filter: (String value) => state.books
                  .where(
                    (element) => element.title
                        .toLowerCase()
                        .contains(value.toLowerCase()),
                  )
                  .toList(),
              emptyWidget: const EmptyListBooks(),
              inputDecoration: const InputDecoration(
                hintText: 'Pesquisar livros',
                fillColor: Colors.white,
              ),
            );
          }

          return const Placeholder();
        },
      ),
    );
  }
}
