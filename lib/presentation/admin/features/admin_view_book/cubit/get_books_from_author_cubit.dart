import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_books_from_author_state.dart';

class GetBooksFromAuthorCubit extends Cubit<GetBooksFromAuthorState> {
  GetBooksFromAuthorCubit() : super(GetBooksFromAuthorInitial());

  Future<void> getBooksFromAuthor(String authorId) async {
    final iBooksUC = getIt<IBooksUseCases>();

    emit(GetBooksFromAuthorLoading());

    await iBooksUC.getBooksFromAuthor(authorId).then((books) {
      emit(GetBooksFromAuthorLoaded(books));
    }).onError((error, stackTrace) {
      emit(GetBooksFromAuthorError(error.toString()));
    });
  }
}
