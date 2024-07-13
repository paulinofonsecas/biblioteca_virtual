import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/bloc/bloc.dart';
import 'package:flutter/material.dart';

/// {@template lista_leituras_body}
/// Body of the ListaLeiturasPage.
///
/// Add what it does
/// {@endtemplate}
class ListaLeiturasBody extends StatelessWidget {
  /// {@macro lista_leituras_body}
  const ListaLeiturasBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListaLeiturasBloc, ListaLeiturasState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
