import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit() : super(SearchBooksInitial());

  void onChangeWord(String word) {
    emit(SearchBooksWordChanged(word));
  }

  void searchBooks(String word) {}
}
