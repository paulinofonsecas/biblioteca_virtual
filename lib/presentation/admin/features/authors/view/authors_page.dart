import 'package:bilioteca_virtual/presentation/admin/features/authors/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/widgets/authors_body.dart';
import 'package:flutter/material.dart';

/// {@template authors_page}
/// A description for AuthorsPage
/// {@endtemplate}
class AuthorsPage extends StatelessWidget {
  /// {@macro authors_page}
  const AuthorsPage({super.key});

  /// The static route for AuthorsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AuthorsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorsBloc(),
      child: const Scaffold(
        body: AuthorsView(),
      ),
    );
  }
}

/// {@template authors_view}
/// Displays the Body of AuthorsView
/// {@endtemplate}
class AuthorsView extends StatelessWidget {
  /// {@macro authors_view}
  const AuthorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthorsBody();
  }
}
