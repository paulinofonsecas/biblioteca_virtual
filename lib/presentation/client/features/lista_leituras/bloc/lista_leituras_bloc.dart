import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'lista_leituras_event.dart';
part 'lista_leituras_state.dart';

class ListaLeiturasBloc extends Bloc<ListaLeiturasEvent, ListaLeiturasState> {
  ListaLeiturasBloc() : super(const ListaLeiturasInitial()) {
    on<CustomListaLeiturasEvent>(_onCustomListaLeiturasEvent);
  }

  FutureOr<void> _onCustomListaLeiturasEvent(
    CustomListaLeiturasEvent event,
    Emitter<ListaLeiturasState> emit,
  ) {
    // TODO: Add Logic
  }
}
