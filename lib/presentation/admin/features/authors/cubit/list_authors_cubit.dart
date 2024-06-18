import 'dart:async';

import 'package:bilioteca_virtual/domain/entities/author.dart';
import 'package:bilioteca_virtual/presentation/admin/features/authors/cubit/list_authors_state.dart';
import 'package:bloc/bloc.dart';

class ListAuthorsCubit extends Cubit<ListAuthorsState> {
  ListAuthorsCubit() : super(ListAuthorsInitial());

  void loadAuthorList() {
    emit(ListAuthorsLoading());
    // final AuthorsUC = getIt<IAuthorsUseCases>();
    emit(ListAuthorsLoaded([Author(id: '1', name: 'Paulino', photo: 'photo')]));
    // unawaited(
    //   AuthorsUC
    //       .getAuthors()
    //       .then((authors) => emit(ListAuthorsLoaded(authors)))
    //       .onError((error, stackTrace) {
    //     emit(
    //       ListAuthorsError(error.toString()),
    //     );
    //   }),
    // );
  }

  void deleteAuthor(String id) {}

}
