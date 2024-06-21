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
    try {
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
    } catch (e) {
      const ListBooksError('Ocorreu um erro ao adicionar o livro');
    }
  }

  Future<void> deleteBook(String id) async {
    try {
      emit(ListBooksDeleteLoading());
      final booksUC = getIt<IBooksUseCases>();

      final result = await booksUC.deleteBook(id);

      if (result) {
        loadBookList();
      } else {
        emit(const ListBooksError('Erro ao deletar o livro'));
      }
    } catch (e) {
      emit(const ListBooksError('Erro ao deletar o livro'));
    }
  }
}
