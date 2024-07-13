import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/widgets/lista_leituras_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// {@template lista_leituras_page}
/// A description for ListaLeiturasPage
/// {@endtemplate}
class ListaLeiturasPage extends StatelessWidget {
  /// {@macro lista_leituras_page}
  const ListaLeiturasPage({super.key});

  static void toScreen(String bookId) {
    Modular.to.pushNamed(
      '/lista-leitura',
    );
  }

  /// The static route for ListaLeiturasPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ListaLeiturasPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListaLeiturasBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de litura'),
        ),
        body: const ListaLeiturasView(),
      ),
    );
  }
}

/// {@template lista_leituras_view}
/// Displays the Body of ListaLeiturasView
/// {@endtemplate}
class ListaLeiturasView extends StatelessWidget {
  /// {@macro lista_leituras_view}
  const ListaLeiturasView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListaLeiturasBody();
  }
}
