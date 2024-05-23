import 'package:bilioteca_virtual/presentation/admin/features/authors/bloc/bloc.dart';
import 'package:flutter/material.dart';

/// {@template authors_body}
/// Body of the AuthorsPage.
///
/// Add what it does
/// {@endtemplate}
class AuthorsBody extends StatelessWidget {
  /// {@macro authors_body}
  const AuthorsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorsBloc, AuthorsState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
