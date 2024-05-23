import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'most_wanted_books_state.dart';

class MostWantedBooksCubit extends Cubit<MostWantedBooksState> {
  MostWantedBooksCubit() : super(MostWantedBooksInitial());

  Future<void> getMostWantedBooks() async {
    emit(MostWantedBooksLoading());
    final booksUC = getIt<IBooksUseCases>();

    unawaited(
      booksUC
          .getBooks()
          .then((c) => emit(MostWantedBooksLoaded(books: c)))
          .onError((error, stackTrace) {
        emit(
          MostWantedBooksError(message: error.toString()),
        );
      }),
    );
  }
}
