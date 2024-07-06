import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'author_details_event.dart';
part 'author_details_state.dart';

class AuthorDetailsBloc extends Bloc<AuthorDetailsEvent, AuthorDetailsState> {
  AuthorDetailsBloc() : super(const AuthorDetailsInitial()) {
    on<CustomAuthorDetailsEvent>(_onCustomAuthorDetailsEvent);
  }

  FutureOr<void> _onCustomAuthorDetailsEvent(
    CustomAuthorDetailsEvent event,
    Emitter<AuthorDetailsState> emit,
  ) {
    // TODO: Add Logic
  }
}
