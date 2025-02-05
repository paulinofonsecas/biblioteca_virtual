import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/users_stats/cubit/all_users_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/users_stats/cubit/cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/stats_and_reports/pages/users_stats/widgets/users_stats_body.dart';
import 'package:flutter/material.dart';

/// {@template users_stats_page}
/// A description for UsersStatsPage
/// {@endtemplate}
class UsersStatsPage extends StatelessWidget {
  /// {@macro users_stats_page}
  const UsersStatsPage({super.key});

  /// The static route for UsersStatsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const UsersStatsPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsersStatsCubit(),
        ),
        BlocProvider(
          create: (context) => AllUsersCubit(getIt()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Estadísticas de usuarios'),
        ),
        body: const UsersStatsView(),
      ),
    );
  }
}

/// {@template users_stats_view}
/// Displays the Body of UsersStatsView
/// {@endtemplate}
class UsersStatsView extends StatelessWidget {
  /// {@macro users_stats_view}
  const UsersStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const UsersStatsBody();
  }
}
