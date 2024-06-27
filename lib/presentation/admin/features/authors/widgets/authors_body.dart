import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/cubit/list_authors_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/cubit/list_authors_state.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/banner_example_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class AuthorsBody extends StatelessWidget {
  /// {@macro authors_body}
  const AuthorsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BannerExample(),
        Expanded(
          child: BlocBuilder<ListAuthorsCubit, ListAuthorsState>(
            bloc: context.read<ListAuthorsCubit>()..loadAuthorList(),
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
          title: Text(
            author.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              const GutterSmall(),
              IconButton(
                onPressed: () {
                  context.read<ListAuthorsCubit>().deleteAuthor(author.id);
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
