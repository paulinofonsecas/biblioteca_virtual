import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'discovery_book_state.dart';

class DiscoveryBookCubit extends Cubit<DiscoveryBookState> {
  DiscoveryBookCubit() : super(DiscoveryBookInitial()) {
    _booksUC = getIt<IBooksUseCases>();
  }

  late final IBooksUseCases _booksUC;

  void getDiscoveryBooks() {
    emit(DiscoveryBookLoading());

    unawaited(
      _booksUC
          .getBooks()
          .then((list) => emit(DiscoveryBookLoaded(list)))
          .onError((error, stackTrace) {
        emit(
          DiscoveryBookError(error.toString()),
        );
      }),
    );
  }
}
