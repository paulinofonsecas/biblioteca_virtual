import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_list_books_state.dart';

class SearchListBooksCubit extends Cubit<SearchListBooksState> {
  SearchListBooksCubit() : super(SearchListBooksInitial());

  void loadBookList() {
    try {
      emit(SearchListBooksLoading());
      final booksUC = getIt<IBooksUseCases>();

      unawaited(
        booksUC
            .getBooks()
            .then((books) => emit(SearchListBooksLoaded(books)))
            .onError((error, stackTrace) {
          emit(
            SearchListBooksError(error.toString()),
          );
        }),
      );
    } catch (e) {
      const SearchListBooksError('Ocorreu um erro ao adicionar o livro');
    }
  }

  Future<void> deleteBook(String id) async {
    try {
      emit(SearchListBooksDeleteLoading());
      final booksUC = getIt<IBooksUseCases>();

      final result = await booksUC.deleteBook(id);

      if (result) {
        loadBookList();
      } else {
        emit(const SearchListBooksError('Erro ao deletar o livro'));
      }
    } catch (e) {
      emit(const SearchListBooksError('Erro ao deletar o livro'));
    }
  }
}
