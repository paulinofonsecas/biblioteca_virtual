import 'package:bilioteca_virtual/presentation/features/global_search/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/features/global_search/cubit/search_list_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/global_search/widgets/global_search_body.dart';
import 'package:flutter/material.dart';

/// {@template global_search_page}
/// A description for GlobalSearchPage
/// {@endtemplate}
class GlobalSearchPage extends StatelessWidget {
  /// {@macro global_search_page}
  const GlobalSearchPage({super.key});

  /// The static route for GlobalSearchPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const GlobalSearchPage(),
      fullscreenDialog: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GlobalSearchBloc(),
        ),
        BlocProvider(
          create: (context) => SearchListBooksCubit(),
        ),
      ],
      child: const Scaffold(
        body: GlobalSearchView(),
      ),
    );
  }
}

/// {@template global_search_view}
/// Displays the Body of GlobalSearchView
/// {@endtemplate}
class GlobalSearchView extends StatelessWidget {
  /// {@macro global_search_view}
  const GlobalSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalSearchBody();
  }
}
