import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/bloc/bloc.dart';

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
    return BlocBuilder<StatsAndReportsBloc, StatsAndReportsState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
