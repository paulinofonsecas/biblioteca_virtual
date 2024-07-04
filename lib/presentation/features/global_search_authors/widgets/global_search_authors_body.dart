import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/features/global_search_authors/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/features/global_search_authors/cubit/search_list_authors_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/global_search_authors/widgets/author_searched_item.dart';
import 'package:bilioteca_virtual/presentation/features/global_search_authors/widgets/empty_list_authors.dart';
import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';

/// {@template global_search_authors_body}
/// Body of the GlobalSearchAuthorsPage.
///
/// Add what it does
/// {@endtemplate}
class GlobalSearchAuthorsBody extends StatelessWidget {
  /// {@macro global_search_authors_body}
  const GlobalSearchAuthorsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: BlocBuilder<SearchListAuthorsCubit, SearchListAuthorsState>(
        bloc: context.read<SearchListAuthorsCubit>()..loadAuthorList(),
        builder: (context, state) {
          if (state is SearchListAuthorsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SearchListAuthorsError) {
            return const Center(
              child: Text('Ups, algo deu errado'),
            );
          }

          if (state is SearchListAuthorsLoaded) {
            return SearchableList<Author>(
              initialList: state.authors,
              itemBuilder: (Author author) => AuthorSearchedItem(
                author: author,
              ),
              filter: (String value) => state.authors
                  .where(
                    (element) => element.name
                        .toLowerCase()
                        .contains(value.toLowerCase()),
                  )
                  .toList(),
              emptyWidget: const EmptyListAuthors(),
              inputDecoration: const InputDecoration(
                hintText: 'Pesquisar autores',
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
