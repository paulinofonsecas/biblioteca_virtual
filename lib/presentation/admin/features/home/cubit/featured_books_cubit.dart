import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit() : super(FeaturedBooksInitial()) {
    booksUC = getIt<IBooksUseCases>();
  }

  late final IBooksUseCases booksUC;

  void getFeaturedBooks() {
    emit(FeaturedBooksLoading());

    unawaited(
      booksUC
          .getBooks()
          .then((list) => emit(FeaturedBooksLoaded(list)))
          .onError((error, stackTrace) {
        emit(
          FeaturedBooksError(error.toString()),
        );
      }),
    );
  }
}
