import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/widgets/stats_and_reports_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// {@template stats_and_reports_page}
/// A description for StatsAndReportsPage
/// {@endtemplate}
class StatsAndReportsPage extends StatelessWidget {
  /// {@macro stats_and_reports_page}
  const StatsAndReportsPage({super.key});

  /// The static route for StatsAndReportsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const StatsAndReportsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatsAndReportsBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Estatísticas e Relatórios'),
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.fileExport),
              onPressed: () {},
            ),
            const GutterSmall(),
          ],
        ),
        body: const StatsAndReportsView(),
      ),
    );
  }
}

/// {@template stats_and_reports_view}
/// Displays the Body of StatsAndReportsView
/// {@endtemplate}
class StatsAndReportsView extends StatelessWidget {
  /// {@macro stats_and_reports_view}
  const StatsAndReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const StatsAndReportsBody();
  }
}
