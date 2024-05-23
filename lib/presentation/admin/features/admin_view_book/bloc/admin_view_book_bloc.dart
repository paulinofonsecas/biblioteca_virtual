import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'admin_view_book_event.dart';
part 'admin_view_book_state.dart';

class AdminViewBookBloc extends Bloc<AdminViewBookEvent, AdminViewBookState> {
  AdminViewBookBloc() : super(const AdminViewBookInitial()) {
    on<CustomAdminViewBookEvent>(_onCustomAdminViewBookEvent);
  }

  FutureOr<void> _onCustomAdminViewBookEvent(
    CustomAdminViewBookEvent event,
    Emitter<AdminViewBookState> emit,
  ) {}
}
