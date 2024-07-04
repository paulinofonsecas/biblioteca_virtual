import 'package:bilioteca_virtual/presentation/features/global_search_authors/cubit/search_list_authors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/features/global_search_authors/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/features/global_search_authors/widgets/global_search_authors_body.dart';

/// {@template global_search_authors_page}
/// A description for GlobalSearchAuthorsPage
/// {@endtemplate}
class GlobalSearchAuthorsPage extends StatelessWidget {
  /// {@macro global_search_authors_page}
  const GlobalSearchAuthorsPage({super.key});

  /// The static route for GlobalSearchAuthorsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const GlobalSearchAuthorsPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GlobalSearchAuthorsBloc(),
        ),
        BlocProvider(
          create: (context) => SearchListAuthorsCubit(),
        ),
      ],
      child: const Scaffold(
        body: GlobalSearchAuthorsView(),
      ),
    );
  }
}

/// {@template global_search_authors_view}
/// Displays the Body of GlobalSearchAuthorsView
/// {@endtemplate}
class GlobalSearchAuthorsView extends StatelessWidget {
  /// {@macro global_search_authors_view}
  const GlobalSearchAuthorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalSearchAuthorsBody();
  }
}
