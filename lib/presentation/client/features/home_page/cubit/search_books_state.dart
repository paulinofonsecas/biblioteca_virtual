part of 'search_books_cubit.dart';

sealed class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

final class SearchBooksInitial extends SearchBooksState {}

final class SearchBooksWordChanged extends SearchBooksState {
  const SearchBooksWordChanged(this.word);

  final String word;

  @override
  List<Object> get props => [word];
}
