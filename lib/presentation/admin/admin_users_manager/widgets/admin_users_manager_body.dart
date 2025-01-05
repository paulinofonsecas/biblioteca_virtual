import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/data/datasource/contracts/i_users_datasource.dart';
import 'package:flutter/material.dart';

/// {@template admin_users_manager_body}
/// Body of the AdminUsersManagerPage.
///
/// Add what it does
/// {@endtemplate}
class AdminUsersManagerBody extends StatelessWidget {
  /// {@macro admin_users_manager_body}
  const AdminUsersManagerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            getIt<IUsersDatasource>().getAdminUsers();
          },
          child: const Text(
            'Administradores',
          ),
        ),
        const Text('Usuarios'),
      ],
    );
  }
}
