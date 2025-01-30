import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminDrawerWidget extends StatelessWidget {
  const AdminDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            accountName: Text(
              'Usuário Administrador',
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              'admin@admin.com',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Modular.to.pushNamed(
                '/admin/categorias-livro',
              );
            },
            title: const Text('Categorias de livros'),
            trailing: const Icon(FontAwesomeIcons.tags, size: 18),
          ),
          ListTile(
            onTap: () {
              Modular.to.pushNamed(
                '/admin/stats_and_reports',
              );
            },
            title: const Text('Estatísticas e relatórios'),
            trailing: const Icon(FontAwesomeIcons.chartPie, size: 18),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {
              getIt<AuthBloc>().add(LogOutEvent());
            },
            icon: const Icon(Icons.logout),
            label: const Text('Terminar sessão'),
          ),
          const GutterTiny(),
        ],
      ),
    );
  }
}
