part of 'search_list_books_cubit.dart';

sealed class SearchListBooksState extends Equatable {
  const SearchListBooksState();

  @override
  List<Object> get props => [];
}

final class SearchListBooksInitial extends SearchListBooksState {}

class SearchListBooksLoading extends SearchListBooksState {}

final class SearchListBooksDeleteLoading extends SearchListBooksState {}

final class SearchListBooksLoaded extends SearchListBooksState {
  const SearchListBooksLoaded(this.books);

  final List<BookModel> books;

  @override
  List<Object> get props => [books];
}

final class SearchListBooksError extends SearchListBooksState {
  const SearchListBooksError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
