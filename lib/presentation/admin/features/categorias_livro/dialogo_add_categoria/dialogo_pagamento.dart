import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/dialogo_add_categoria/bloc/dialogo_categoria_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> mostrarDialogoAddPagamento({
  required BuildContext context,
  required Function(Categoria categoria) accaoAoConfirmar,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (c) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => DialogoCategoriaBloc()),
        ],
        child: Builder(
          builder: (context) {
            return DialogoCategoria(
              bloc: context.read<DialogoCategoriaBloc>(),
              accaoAoConfirmar: accaoAoConfirmar,
            );
          },
        ),
      );
    },
  );
}

class DialogoCategoria extends StatelessWidget {
  DialogoCategoria({
    required this.bloc,
    required this.accaoAoConfirmar,
    super.key,
  });
  final Function(Categoria categoria) accaoAoConfirmar;
  final DialogoCategoriaBloc bloc;

  String nome = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adcionar'),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * .08,
        child: SingleChildScrollView(
          child: BlocBuilder<DialogoCategoriaBloc, DialogoCategoriaState>(
            bloc: bloc,
            builder: (context, state) {
              return Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      nome = value;
                    },
                    decoration:
                        const InputDecoration(labelText: 'Nome da Categoria'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (nome.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Preencha o campo'),
                ),
              );
              return;
            }
            Navigator.pop(context);
            accaoAoConfirmar(Categoria(id: geradorId.v4(), nome: nome));
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
