import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageInitial()) {
    on<CustomHomePageEvent>(_onCustomHomePageEvent);
  }

  FutureOr<void> _onCustomHomePageEvent(
    CustomHomePageEvent event,
    Emitter<HomePageState> emit,
  ) {
    // TODO: Add Logic
  }
}
