import 'package:bilioteca_virtual/core/util/constants.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/cubit/home_categorias_list_cubit.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/categorias/categoria_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriasListWidget extends StatelessWidget {
  const CategoriasListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categorias = [
      'Teste',
      'Testando',
      'Infantil',
      'Literatura literatura literatura',
      'Ficção',
      'Romance',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Text(
            'Categorias',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        BlocBuilder<HomeCategoriasListCubit, HomeCategoriasListState>(
          bloc: context.read<HomeCategoriasListCubit>()..listarCategorias(),
          builder: (context, state) {
            if (state is HomeCategoriasListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is HomeCategoriasListFailure) {
              return const Text('Ocorreu um erro ao carregar categorias');
            }

            if (state is HomeCategoriasListSuccess) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.categorias
                      .map((element) => CategoriaItem(categoria: element))
                      .toList(),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
