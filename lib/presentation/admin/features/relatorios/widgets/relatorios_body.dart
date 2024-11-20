import 'package:bilioteca_virtual/core/util/messages.dart';
import 'package:bilioteca_virtual/presentation/admin/features/relatorios/bloc/relatorios_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template relatorios_body}
/// Body of the RelatoriosPage.
///
/// Add what it does
/// {@endtemplate}
class RelatoriosBody extends StatelessWidget {
  /// {@macro relatorios_body}
  const RelatoriosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatoriosBloc, RelatoriosState>(
      builder: (context, state) {
        return Column(
          children: [
            InkWell(
              onTap: () {
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Text('Relatório de usuários'),
                        const Spacer(),
                        InkWell(child: const Icon(Icons.share), onTap: () {
                          context.read<RelatoriosBloc>().add(const GerarRelatorioUsuarioEvent());
                        },),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Text('Relatório de obras literárias'),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            context.read<RelatoriosBloc>().add(const GerarRelatorioObrasEvent());
                          },
                          child: const Icon(Icons.share)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text('Relatório de consultas de obras'),
                        Spacer(),
                        Icon(Icons.share),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text('Relatório geral do sistema'),
                        Spacer(),
                        Icon(Icons.share),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
