import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'compra_livro_event.dart';
part 'compra_livro_state.dart';

class CompraLivroBloc extends Bloc<CompraLivroEvent, CompraLivroState> {
  CompraLivroBloc() : super(const CompraLivroInitial()) {
    on<CustomCompraLivroEvent>(_onCustomCompraLivroEvent);
  }

  FutureOr<void> _onCustomCompraLivroEvent(
    CustomCompraLivroEvent event,
    Emitter<CompraLivroState> emit,
  ) {
    // TODO: Add Logic
  }
}
