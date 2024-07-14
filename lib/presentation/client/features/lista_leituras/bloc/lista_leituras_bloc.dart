import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_lista_de_leitura_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lista_leituras_event.dart';
part 'lista_leituras_state.dart';

class ListaLeiturasBloc extends Bloc<ListaLeiturasEvent, ListaLeiturasState> {
  ListaLeiturasBloc() : super(ListaLeiturasInitial()) {
    on<CustomListaLeiturasEvent>(_onCustomListaLeiturasEvent);
    on<AddBookToListaLeiturasEvent>(_onAddBookToListaLeiturasEvent);
  }

  FutureOr<void> _onCustomListaLeiturasEvent(
    CustomListaLeiturasEvent event,
    Emitter<ListaLeiturasState> emit,
  ) {}

  FutureOr<void> _onAddBookToListaLeiturasEvent(
    AddBookToListaLeiturasEvent event,
    Emitter<ListaLeiturasState> emit,
  ) async {
    emit(AddListaLeiturasLoading());
    final listaLeitura = getIt<IListaLeituraUseCases>();

    await listaLeitura.addBook(event.book).then((e) {
      if (e) {
        emit(const AddListaLeiturasSuccess());
      } else {
        emit(
          const AddListaLeiturasFailure(
            'Erro ao adicionar o livro na lista de leituras',
          ),
        );
      }

      return e;
    });
  }
}
