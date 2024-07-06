import 'dart:async';

import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_author_use_cases.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/cubit/list_authors_state.dart';
import 'package:bloc/bloc.dart';

class ListAuthorsCubit extends Cubit<ListAuthorsState> {
  ListAuthorsCubit() : super(ListAuthorsInitial()) {
    _authorsUseCases = getIt<IAuthorsUseCases>();
  }

  late final IAuthorsUseCases _authorsUseCases;

  void loadAuthorList() {
    emit(ListAuthorsLoading());

    unawaited(
      _authorsUseCases
          .getAuthors()
          .then((authors) => emit(ListAuthorsLoaded(authors)))
          .onError((error, stackTrace) {
        emit(
          ListAuthorsError(error.toString()),
        );
      }),
    );
  }

  void deleteAuthor(String id) {}
}
