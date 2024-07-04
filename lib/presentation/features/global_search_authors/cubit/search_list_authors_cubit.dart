import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_author_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_list_authors_state.dart';

class SearchListAuthorsCubit extends Cubit<SearchListAuthorsState> {
  SearchListAuthorsCubit() : super(SearchListAuthorsInitial());

  void loadAuthorList() {
    try {
      emit(SearchListAuthorsLoading());
      final authorsUC = getIt<IAuthorsUseCases>();

      unawaited(
        authorsUC
            .getAuthors()
            .then((authors) => emit(SearchListAuthorsLoaded(authors)))
            .onError((error, stackTrace) {
          emit(
            SearchListAuthorsError(error.toString()),
          );
        }),
      );
    } catch (e) {
      const SearchListAuthorsError('Ocorreu um erro ao adicionar o autor');
    }
  }

  Future<void> deleteAuthor(String id) async {
    try {
      emit(SearchListAuthorsDeleteLoading());
      final authorsUC = getIt<IAuthorsUseCases>();

      final result = await authorsUC.deleteAuthor(id);

      if (result) {
        loadAuthorList();
      } else {
        emit(const SearchListAuthorsError('Erro ao deletar o autor'));
      }
    } catch (e) {
      emit(const SearchListAuthorsError('Erro ao deletar o autor'));
    }
  }
}
