// ignore_for_file: lines_longer_than_80_chars

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/cubit/list_authors_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/cubit/list_authors_state.dart';
import 'package:bilioteca_virtual/presentation/features/author_details/author_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthorsBody extends StatelessWidget {
  /// {@macro authors_body}
  const AuthorsBody({super.key});

  @override

  /// Builds a column widget that contains a global search authors widget and an expanded widget.
  ///
  /// The global search authors widget is a constant widget that allows the user to search for authors.
  ///
  /// The expanded widget contains a BlocBuilder widget that listens to the state changes of the ListAuthorsCubit.
  ///
  /// If the state is ListAuthorsLoading, a circular progress indicator is displayed in the center.
  ///
  /// If the state is ListAuthorsError, the error message is displayed in the center.
  ///
  /// If the state is ListAuthorsLoaded, the list of authors is built and displayed.
  ///
  /// If none of the above states are matched, a placeholder widget is displayed.
  ///
  /// Returns a column widget.
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const GlobalSearchAuthorsWidget(),
        Expanded(
          child: BlocBuilder<ListAuthorsCubit, ListAuthorsState>(
            bloc: BlocProvider.of<ListAuthorsCubit>(context)..loadAuthorList(),
            builder: (context, state) {
              if (state is ListAuthorsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ListAuthorsError) {
                return Center(
                  child: Text(state.message),
                );
              }

              if (state is ListAuthorsLoaded) {
                return _buildListAuthors(state.authors);
              }

              return const Placeholder();
            },
          ),
        ),
      ],
    );
  }

  ListView _buildListAuthors(List<Author> authors) {
    return ListView.builder(
      itemCount: authors.length,
      itemBuilder: (context, index) {
        final author = authors[index];

        return ListTile(
          onTap: () {
            Navigator.of(context).push(
              AuthorDetailsPage.route(
                author: author,
              ),
            );
          },
          title: Text(
            author.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  getIt.registerFactory(() => author);
                  Modular.to.pushNamed('/admin/edit-author', arguments: author);
                },
                icon: const Icon(Icons.edit),
              ),
              const GutterSmall(),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Deletar autor'),
                        content:
                            const Text('Desejas realmente deletar este autor?'),
                        actions: [
                          Theme(
                            data: ThemeData(
                              colorScheme: ColorScheme.fromSeed(
                                seedColor: Colors.red,
                              ),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                BlocProvider.of<ListAuthorsCubit>(context)
                                    .deleteAuthor(author.id, authors);
                              },
                              child: const Text('Sim'),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Não'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          leading: const Icon(Icons.person),
        );
      },
    );
  }
}
