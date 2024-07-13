// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:async';

import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/preco.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/cubit/validar_compra_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/fazer_check_out_modal.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/bloc/lista_leituras_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BuildComprarLivroButton extends StatelessWidget {
  const BuildComprarLivroButton({
    required this.book,
    super.key,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: OutlinedButton.icon(
          icon: Icon(
            book.preco == Preco.gratis()
                ? FontAwesomeIcons.book
                : FontAwesomeIcons.shoppingBag,
            size: 18,
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(),
            ),
          ),
          onPressed: () async {
            if (book.preco == Preco.gratis()) {
              context
                  .read<ListaLeiturasBloc>()
                  .add(AddBookToListaLeiturasEvent(book));
              return;
            }

            unawaited(
              showCupertinoModalBottomSheet(
                context: context,
                isDismissible: false,
                useRootNavigator: true,
                builder: (c) => BlocProvider.value(
                  value: context.read<ValidarCompraCubit>(),
                  child: FazerCheckOutModal(
                    book: book,
                  ),
                ),
              ),
            );
          },
          label: book.preco == Preco.gratis()
              ? const Text('Adicionar a lista de leituras')
              : const Text('Comprar agora'),
        ),
      ),
    );
  }
}
