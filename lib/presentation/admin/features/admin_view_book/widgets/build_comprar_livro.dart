// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/entities/preco.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/cubit/validar_compra_cubit.dart';
import 'package:bilioteca_virtual/presentation/admin/features/admin_view_book/widgets/fazer_check_out_modal.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/bloc/lista_leituras_bloc.dart';
import 'package:bilioteca_virtual/presentation/client/features/lista_leituras/cubit/esta_na_lista_de_leitura_cubit.dart';
import 'package:bilioteca_virtual/presentation/features/p_d_f_reader/view/p_d_f_reader_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:no_screenshot/no_screenshot.dart';

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
        child: BlocConsumer<ListaLeiturasBloc, ListaLeiturasState>(
          listener: (context, state) {
            if (state is AddListaLeiturasSuccess) {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(
              //     backgroundColor: Colors.green,
              //     content: Text('Livro adicionado a lista de leitura'),
              //   ),
              // );
            }

            if (state is AddListaLeiturasFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          bloc: getIt<ListaLeiturasBloc>(),
          builder: (t, state) {
            if (state is AddListaLeiturasLoading) {
              return const CircularProgressIndicator();
            }

            return BlocBuilder<EstaNaListaDeLeituraCubit,
                EstaNaListaDeLeituraState>(
              bloc: context.read<EstaNaListaDeLeituraCubit>()
                ..estaNaListaDeLeituras(book.id),
              builder: (context, estaNaListaState) {
                if (estaNaListaState is EstaNaListaDeLeituraLoading) {
                  return const CircularProgressIndicator();
                }

                return OutlinedButton.icon(
                  icon: Icon(
                    book.preco == Preco.gratis()
                        ? FontAwesomeIcons.book
                        : FontAwesomeIcons.shoppingBag,
                    size: 18,
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      side: BorderSide(),
                    ),
                  ),
                  onPressed: () async {
                    if (_isInListaLeitura(estaNaListaState)) {
                      await NoScreenshot.instance.screenshotOff();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Capturas de tela desabilitadas'),
                        ),
                      );
                      PDFReaderPage.toScreen(book.id);
                      return;
                    }

                    if (book.preco == Preco.gratis()) {
                      getIt<ListaLeiturasBloc>()
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
                  label: _isInListaLeitura(estaNaListaState)
                      ? const Text('Ler agora')
                      : book.preco == Preco.gratis()
                          ? const Text('Adicionar a lista de leituras')
                          : const Text('Comprar agora'),
                );
              },
            );
          },
        ),
      ),
    );
  }

  bool _isInListaLeitura(EstaNaListaDeLeituraState estaNaListaState) {
    if (estaNaListaState is EstaNaListaDeLeituraSuccess) {
      return estaNaListaState.estaNaLista;
    } else {
      return false;
    }
  }
}
