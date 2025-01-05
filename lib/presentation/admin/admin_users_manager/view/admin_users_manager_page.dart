import 'package:bilioteca_virtual/presentation/admin/admin_users_manager/cubit/cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/admin_users_manager/widgets/admin_users_manager_body.dart';
import 'package:flutter/material.dart';

/// {@template admin_users_manager_page}
/// A description for AdminUsersManagerPage
/// {@endtemplate}
class AdminUsersManagerPage extends StatelessWidget {
  /// {@macro admin_users_manager_page}
  const AdminUsersManagerPage({super.key});

  /// The static route for AdminUsersManagerPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const AdminUsersManagerPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminUsersManagerCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestão de Usuários'),
        ),
        body: const AdminUsersManagerView(),
      ),
    );
  }
}

/// {@template admin_users_manager_view}
/// Displays the Body of AdminUsersManagerView
/// {@endtemplate}
class AdminUsersManagerView extends StatelessWidget {
  /// {@macro admin_users_manager_view}
  const AdminUsersManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminUsersManagerBody();
  }
}
