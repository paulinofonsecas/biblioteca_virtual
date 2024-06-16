import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_books_state.dart';

class ListBooksCubit extends Cubit<ListBooksState> {
  ListBooksCubit() : super(ListBooksInitial());

  void loadBookList() {
    emit(ListBooksLoading());
    final booksUC = getIt<IBooksUseCases>();

    unawaited(
      booksUC
          .getBooks()
          .then((books) => emit(ListBooksLoaded(books)))
          .onError((error, stackTrace) {
        emit(
          ListBooksError(error.toString()),
        );
      }),
    );
  }
}
