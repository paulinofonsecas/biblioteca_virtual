import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:flutter/material.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              color: Colors.red,
            ),
          ),
          ListTile(
            onTap: () {
              getIt<AuthBloc>().add(LogOutEvent());
            },
            title: const Text('Terminar sessão'),
            trailing: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
