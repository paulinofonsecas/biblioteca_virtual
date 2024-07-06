import 'package:bilioteca_virtual/core/dependency/get_it.dart';
import 'package:bilioteca_virtual/domain/entities/book.dart';
import 'package:bilioteca_virtual/domain/use_cases/i_books_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_view_book_state.dart';

class AdminViewBookCubit extends Cubit<AdminViewBookState> {
  AdminViewBookCubit() : super(AdminViewBookInitial()) {
    _iBooksUseCases = getIt<IBooksUseCases>();
  }

  late final IBooksUseCases _iBooksUseCases;

  void getBookModel(String bookId) {
    emit(AdminViewBookLoading());

    _iBooksUseCases.getBookModel(bookId).then((book) {
      emit(AdminViewBookLoaded(book));
    }).onError((error, stackTrace) {
      emit(AdminViewBookError(error.toString()));
    });
  }
}
