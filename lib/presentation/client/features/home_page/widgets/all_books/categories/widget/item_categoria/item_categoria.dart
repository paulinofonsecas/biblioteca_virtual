import 'package:bilioteca_virtual/core/util/messages.dart';
import 'package:bilioteca_virtual/domain/entities/categoria.dart';
import 'package:bilioteca_virtual/presentation/client/features/home_page/widgets/all_books/categories/widget/item_categoria/item_categoria_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCategoria extends StatefulWidget {
  const ItemCategoria(
      {super.key, required this.categoria, required this.aoClicarItem});
  final Categoria categoria;
  final Function(bool valor) aoClicarItem;

  @override
  State<ItemCategoria> createState() =>
      _ItemCategoriaState(categoria: categoria, aoClicarItem: aoClicarItem);
}

class _ItemCategoriaState extends State<ItemCategoria> {
  _ItemCategoriaState({required this.aoClicarItem, required this.categoria});

  final Categoria categoria;
  final Function(bool valor) aoClicarItem;
  bool marcado = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      context.read<ItemCategoriaCubit>().mudarValor(!marcado);
      marcado = !marcado;
      aoClicarItem(marcado);
    }, child: BlocBuilder<ItemCategoriaCubit, bool>(
      bloc: context.read<ItemCategoriaCubit>(),
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          height: 20,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            color: state == true
                ? const Color.fromARGB(255, 224, 223, 223)
                : null,
          ),
          child: Text(categoria.nome),
        );
      },
    ));
  }
}
