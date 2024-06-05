import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:flutter/material.dart';

/// {@template profile_body}
/// Body of the ProfilePage.
///
/// Add what it does
/// {@endtemplate}
class ProfileBody extends StatelessWidget {
  /// {@macro profile_body}
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {
          getIt<AuthBloc>().add(LogOutEvent());
        },
        icon: const Icon(Icons.logout),
        label: const Text('Terminar sessão'),
      ),
    );
  }
}
