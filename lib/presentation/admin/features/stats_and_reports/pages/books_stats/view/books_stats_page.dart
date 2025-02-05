import 'package:bilioteca_virtual/presentation/admin/features/home/cubit/all_books_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/books_stats/cubit/cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/books_stats/widgets/books_stats_body.dart';
import 'package:flutter/material.dart';

/// {@template books_stats_page}
/// A description for BooksStatsPage
/// {@endtemplate}
class BooksStatsPage extends StatelessWidget {
  /// {@macro books_stats_page}
  const BooksStatsPage({super.key});

  /// The static route for BooksStatsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const BooksStatsPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BooksStatsCubit(),
        ),
        BlocProvider(
          create: (context) => AllBooksCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Relatório de Livros'),
        ),
        body: const BooksStatsView(),
      ),
    );
  }
}

/// {@template books_stats_view}
/// Displays the Body of BooksStatsView
/// {@endtemplate}
class BooksStatsView extends StatelessWidget {
  /// {@macro books_stats_view}
  const BooksStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BooksStatsBody();
  }
}
