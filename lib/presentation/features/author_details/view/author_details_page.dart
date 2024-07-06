import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/features/author_details/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/features/author_details/widgets/author_details_body.dart';
import 'package:flutter/material.dart';

/// {@template author_details_page}
/// A description for AuthorDetailsPage
/// {@endtemplate}
class AuthorDetailsPage extends StatelessWidget {
  /// {@macro author_details_page}
  const AuthorDetailsPage({required this.author, super.key});

  final Author author;

  /// The static route for AuthorDetailsPage
  static Route<dynamic> route({required Author author}) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => AuthorDetailsPage(author: author),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (getIt.isRegistered<Author>()) {
      getIt.unregister<Author>();
    }

    getIt.registerSingleton<Author>(author);

    return BlocProvider(
      create: (context) => AuthorDetailsBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Autor'),
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: const AuthorDetailsView(),
      ),
    );
  }
}

/// {@template author_details_view}
/// Displays the Body of AuthorDetailsView
/// {@endtemplate}
class AuthorDetailsView extends StatelessWidget {
  /// {@macro author_details_view}
  const AuthorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthorDetailsBody();
  }
}
