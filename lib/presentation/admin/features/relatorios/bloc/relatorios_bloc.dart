import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'relatorios_event.dart';
part 'relatorios_state.dart';

class RelatoriosBloc extends Bloc<RelatoriosEvent, RelatoriosState> {
  RelatoriosBloc() : super(const RelatoriosInitial()) {
    on<CustomRelatoriosEvent>(_onCustomRelatoriosEvent);
  }

  FutureOr<void> _onCustomRelatoriosEvent(
    CustomRelatoriosEvent event,
    Emitter<RelatoriosState> emit,
  ) {
    // TODO: Add Logic
  }
}
