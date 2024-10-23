import 'package:flutter/material.dart';
import 'package:bilioteca_virtual/presentation/admin/features/categorias_livro/bloc/bloc.dart';

/// {@template categorias_livro_body}
/// Body of the CategoriasLivroPage.
///
/// Add what it does
/// {@endtemplate}
class CategoriasLivroBody extends StatefulWidget {
  /// {@macro categorias_livro_body}
  const CategoriasLivroBody({super.key});

  @override
  State<CategoriasLivroBody> createState() => _CategoriasLivroBodyState();
}

class _CategoriasLivroBodyState extends State<CategoriasLivroBody> {
  @override
  void initState() {
    context.read<CategoriasLivroBloc>().add(const GetAllCategoriasLivroEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriasLivroBloc, CategoriasLivroState>(
      builder: (context, state) {
        if (state is GettingCategoriasLivro) {
          return const LinearProgressIndicator();
        }
        if (state is GettingCategoriasError) {
          return Center(child: Text(state.mensagem));
        }
        if (state is GettingCategoriasLivroSucess) {
          return SingleChildScrollView(
            child: Column(
              children: state.lista
                  .map((cada) => ListTile(
                        title: Text(cada.nome),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                          ),
                          onPressed: () {
                            
                          },
                        ),
                      ))
                  .toList(),
            ),
          );
        }
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
