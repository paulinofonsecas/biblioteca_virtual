import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'authors_event.dart';
part 'authors_state.dart';

class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  AuthorsBloc() : super(const AuthorsInitial()) {
    on<CustomAuthorsEvent>(_onCustomAuthorsEvent);
  }

  FutureOr<void> _onCustomAuthorsEvent(
    CustomAuthorsEvent event,
    Emitter<AuthorsState> emit,
  ) {}
}
