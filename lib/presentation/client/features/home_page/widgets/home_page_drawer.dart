import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/presentation/authentication/presentation/bloc/authentication/auth_bloc.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/user_info.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/view/lista_leituras_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text('Biblioteca Virtual'),
            ),
          ),
          const ListTile(
            onTap: ListaLeiturasPage.toScreen,
            title: Text('Lista de leitura'),
            trailing: Icon(Icons.book),
          ),
          const Spacer(),
          const UserInfo(),
          const Divider(
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            onTap: () {
              getIt<AuthBloc>().add(LogOutEvent());
            },
            title: const Text('Terminar sessão'),
            trailing: const Icon(Icons.logout),
          ),
          const Gutter(),
        ],
      ),
    );
  }
}
