import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'all_books_state.dart';

class AllBooksCubit extends Cubit<AllBooksState> {
  AllBooksCubit() : super(AllBooksInitial());

  void getAllBooks() {
    emit(AllBooksLoading());
    final booksUC = getIt<IBooksUseCases>();

    unawaited(
      booksUC
          .getBooks()
          .then((c) => emit(AllBooksLoaded(books: c)))
          .onError((error, stackTrace) {
        emit(
          AllBooksError(message: error.toString()),
        );
      }),
    );
  }
}
