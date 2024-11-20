import 'package:bilioteca_virtual/app/app.dart';
import 'package:bilioteca_virtual/presentation/global_widgets/dialogo_carregando.dart';
import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/relatorios/bloc/bloc.dart';
import 'package:bilioteca_virtual/presentation/admin/features/relatorios/widgets/relatorios_body.dart';

/// {@template relatorios_page}
/// A description for RelatoriosPage
/// {@endtemplate}
class RelatoriosPage extends StatelessWidget {
  /// {@macro relatorios_page}
  const RelatoriosPage({super.key});

  /// The static route for RelatoriosPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const RelatoriosPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RelatoriosBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Relatórios'),
        ),
        body: const RelatoriosView(),
      ),
    );
  }
}

/// {@template relatorios_view}
/// Displays the Body of RelatoriosView
/// {@endtemplate}
class RelatoriosView extends StatelessWidget {
  /// {@macro relatorios_view}
  const RelatoriosView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RelatoriosBloc, RelatoriosState>(
      listener: (context, state) {
        if (state is GerandoRalatorio) {
          showDialog(
              context: context,
              builder: (context) {
                return const DialogoCarregando();
              });
        } else if (state is RalatorioGerado) {
          Navigator.pop(context);
        }
      },
      child: const RelatoriosBody(),
    );
  }
}
