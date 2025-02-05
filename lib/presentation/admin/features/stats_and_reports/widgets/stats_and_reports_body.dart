import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/books_stats/view/books_stats_page.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/users_stats/users_stats.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// {@template stats_and_reports_body}
/// Body of the StatsAndReportsPage.
///
/// Add what it does
/// {@endtemplate}
class StatsAndReportsBody extends StatelessWidget {
  /// {@macro stats_and_reports_body}
  const StatsAndReportsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(context, BooksStatsPage.route());
          },
          leading: const Icon(FontAwesomeIcons.bookBookmark),
          title: const Text('Relatório de livros'),
          trailing: const Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context, UsersStatsPage.route());
          },
          leading: const Icon(FontAwesomeIcons.users),
          title: const Text('Relatório de usuarios'),
          trailing: const Icon(Icons.chevron_right),
        ),
        // const ListTile(
        //   leading: Icon(FontAwesomeIcons.userPen),
        //   title: Text('Relatório de autores'),
        //   trailing: Icon(Icons.chevron_right),
        // ),
      ],
    );
  }
}
