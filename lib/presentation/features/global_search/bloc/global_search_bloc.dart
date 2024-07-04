import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'global_search_event.dart';
part 'global_search_state.dart';

class GlobalSearchBloc extends Bloc<GlobalSearchEvent, GlobalSearchState> {
  GlobalSearchBloc() : super(const GlobalSearchInitial()) {
    on<CustomGlobalSearchEvent>(_onCustomGlobalSearchEvent);
  }

  FutureOr<void> _onCustomGlobalSearchEvent(
    CustomGlobalSearchEvent event,
    Emitter<GlobalSearchState> emit,
  ) {
    // TODO: Add Logic
  }
}
