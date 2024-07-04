import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'global_search_authors_event.dart';
part 'global_search_authors_state.dart';

class GlobalSearchAuthorsBloc extends Bloc<GlobalSearchAuthorsEvent, GlobalSearchAuthorsState> {
  GlobalSearchAuthorsBloc() : super(const GlobalSearchAuthorsInitial()) {
    on<CustomGlobalSearchAuthorsEvent>(_onCustomGlobalSearchAuthorsEvent);
  }

  FutureOr<void> _onCustomGlobalSearchAuthorsEvent(
    CustomGlobalSearchAuthorsEvent event,
    Emitter<GlobalSearchAuthorsState> emit,
  ) {
    // TODO: Add Logic
  }
}
