import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'gestao_de_books_event.dart';
part 'gestao_de_books_state.dart';

class GestaoDeBooksBloc extends Bloc<GestaoDeBooksEvent, GestaoDeBooksState> {
  GestaoDeBooksBloc() : super(const GestaoDeBooksInitial()) {
    on<CustomGestaoDeBooksEvent>(_onCustomGestaoDeBooksEvent);
  }

  FutureOr<void> _onCustomGestaoDeBooksEvent(
    CustomGestaoDeBooksEvent event,
    Emitter<GestaoDeBooksState> emit,
  ) {
    // TODO: Add Logic
  }
}
